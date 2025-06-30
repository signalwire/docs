#!/usr/bin/env node

const http = require('http');
const https = require('https');
const fs = require('fs');
const path = require('path');
const { URL } = require('url');

// Base URL for the Docker instance
const BASE_URL = 'http://localhost';

// Connection pool settings
const httpAgent = new http.Agent({
    keepAlive: true,  // Reuse connections
    keepAliveMsecs: 1000,
    maxSockets: 20,   // Increase concurrent connections
    maxFreeSockets: 10,
    timeout: 5000
});

const httpsAgent = new https.Agent({
    keepAlive: true,  // Reuse connections
    keepAliveMsecs: 1000,
    maxSockets: 20,   // Increase concurrent connections
    maxFreeSockets: 10,
    timeout: 5000
});

function makeRequest(url, maxRedirects = 10) {
    return new Promise((resolve, reject) => {
        const urlObj = new URL(url);
        const client = urlObj.protocol === 'https:' ? https : http;
        const agent = urlObj.protocol === 'https:' ? httpsAgent : httpAgent;
        
        let redirectCount = 0;
        let currentUrl = url;
        
        function doRequest(requestUrl) {
            const requestUrlObj = new URL(requestUrl);
            const requestClient = requestUrlObj.protocol === 'https:' ? https : http;
            const requestAgent = requestUrlObj.protocol === 'https:' ? httpsAgent : httpAgent;
            
            const options = {
                hostname: requestUrlObj.hostname,
                port: requestUrlObj.port,
                path: requestUrlObj.pathname + requestUrlObj.search,
                method: 'GET',
                agent: requestAgent,
                headers: {
                    'User-Agent': 'Node.js Redirect Tester',
                    'Connection': 'close'
                },
                timeout: 5000
            };
            
            const req = requestClient.request(options, (res) => {
                // Always consume the response to free up the connection
                res.resume();
                
                // Handle redirects
                if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
                    if (redirectCount >= maxRedirects) {
                        res.destroy();
                        reject(new Error('Too many redirects'));
                        return;
                    }
                    
                    redirectCount++;
                    const redirectUrl = new URL(res.headers.location, requestUrl).href;
                    
                    res.on('end', () => {
                        // Follow redirect immediately
                        doRequest(redirectUrl);
                    });
                    return;
                }
                
                res.on('end', () => {
                    resolve({
                        statusCode: res.statusCode,
                        finalUrl: requestUrl,
                        headers: res.headers
                    });
                });
                
                res.on('error', (err) => {
                    reject(err);
                });
            });
            
            req.on('error', reject);
            req.on('timeout', () => {
                req.destroy();
                reject(new Error('Request timeout'));
            });
            
            req.end();
        }
        
        doRequest(currentUrl);
    });
}

function parseRedirectsMap(filePath) {
    try {
        const content = fs.readFileSync(filePath, 'utf8');
        const lines = content.split('\n');
        const redirects = [];
        const regexRedirects = [];
        
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i].trim();
            
            // Skip empty lines
            if (!line) continue;
            
            // Skip comments
            if (line.startsWith('#')) continue;
            
            // Skip regex patterns (lines starting with ~ or ^)
            if (line.startsWith('~') || line.startsWith('^')) continue;
            
            // Parse redirect rules
            // Format: /from/path /to/path;
            const parts = line.split(/\s+/);
            if (parts.length >= 2) {
                let fromPath = parts[0];
                let toPath = parts[1];
                
                // Remove trailing semicolon if present
                if (toPath.endsWith(';')) {
                    toPath = toPath.slice(0, -1);
                }
                
                // Check if this is a regex pattern (contains regex metacharacters)
                const isRegex = /[\(\)\$\*\+\?\[\]\{\}\|\\]/.test(fromPath) || /\$\d/.test(toPath);
                
                if (isRegex) {
                    // Store regex redirects separately
                    regexRedirects.push({
                        fromPattern: fromPath,
                        toPattern: toPath,
                        line: line
                    });
                } else if (fromPath.startsWith('/') && toPath.startsWith('/')) {
                    // Regular redirects
                    redirects.push([fromPath, toPath]);
                }
            }
        }
        
        return { redirects, regexRedirects };
    } catch (error) {
        console.error('Error reading redirects.map file:', error.message);
        return { redirects: [], regexRedirects: [] };
    }
}

async function testRedirect(fromPath, expectedTo) {
    try {
        const response = await makeRequest(`${BASE_URL}${fromPath}`);
        
        const finalUrl = response.finalUrl;
        const statusCode = response.statusCode;
        const finalPath = finalUrl.replace(BASE_URL, '');

        // Normalize paths for comparison - handle nginx trailing slash behavior
        let matches = false;
        if (finalPath === expectedTo) {
            matches = true;
        } else if (!expectedTo.endsWith('/') && finalPath === `${expectedTo}/`) {
            // nginx added trailing slash to directory-like URL
            matches = true;
        } else if (expectedTo.endsWith('/') && finalPath === expectedTo.slice(0, -1)) {
            // nginx removed trailing slash (less common)
            matches = true;
        }

        return {
            fromPath,
            expectedTo,
            finalPath,
            statusCode,
            success: statusCode === 200,  // Success = any 200 response
            is404: statusCode === 404,
            redirectWorked: matches,
            pathMismatch: !matches && statusCode === 200  // Working but different path
        };
    } catch (error) {
        return {
            fromPath,
            expectedTo,
            finalPath: null,
            statusCode: null,
            success: false,
            is404: false,
            redirectWorked: false,
            pathMismatch: false,
            error: error.message
        };
    }
}

async function testAllRedirects(redirectsMapPath = './provisioning/nginx/redirects.map', options = {}) {
    const { quiet = false, batchSize = 20, delayBetweenBatches = 1000, verbose = false } = options;
    
    if (!quiet) {
        console.log(`Reading redirects from: ${redirectsMapPath}`);
        console.log(`Using batch size: ${batchSize}, delay between batches: ${delayBetweenBatches}ms`);
    }
    
    const { redirects: redirectPairs, regexRedirects } = parseRedirectsMap(redirectsMapPath);
    
    if (redirectPairs.length === 0 && regexRedirects.length === 0) {
        if (!quiet) {
            console.error('No redirect rules found in redirects.map file');
        }
        return {
            total: 0,
            successful: 0,
            failed: 0,
            notFound: 0,
            successRate: 0,
            results: { all: [], successful: [], failed: [], notFound: [] },
            regexRedirects: []
        };
    }
    
    if (!quiet) {
        console.log(`Found ${redirectPairs.length} static redirect rules to test`);
        console.log(`Found ${regexRedirects.length} regex redirect patterns (not tested)`);
        console.log(`Testing redirects against ${BASE_URL}...`);
        console.log('='.repeat(80));
    }

    const results = [];
    const successful = [];
    const failed = [];
    const notFound = [];
    const pathMismatches = [];

    // Process in batches to avoid overwhelming the system
    for (let i = 0; i < redirectPairs.length; i += batchSize) {
        const batch = redirectPairs.slice(i, i + batchSize);
        const batchPromises = batch.map(async ([fromPath, expectedTo]) => {
            if (!quiet) {
                process.stdout.write(`Testing: ${fromPath.padEnd(50)} → ${expectedTo.padEnd(20)}`);
            }
            
            const result = await testRedirect(fromPath, expectedTo);
            
            if (result.success) {
                if (result.pathMismatch) {
                    if (!quiet) console.log(' ✓ (different path)');
                    pathMismatches.push(result);
                } else {
                    if (!quiet) console.log(' ✓');
                }
                successful.push(result);
            } else if (result.is404) {
                if (!quiet) console.log(' ⚠ (404)');
                notFound.push(result);
            } else {
                if (!quiet) console.log(' ✗');
                failed.push(result);
            }
            
            return result;
        });
        
        const batchResults = await Promise.all(batchPromises);
        results.push(...batchResults);
        
        // Wait between batches - DISABLED FOR TESTING
        if (i + batchSize < redirectPairs.length) {
            if (!quiet) {
                console.log(`Processed ${i + batchSize} of ${redirectPairs.length}`);
            }
            // await new Promise(resolve => setTimeout(resolve, delayBetweenBatches));
        }
    }

    const summary = {
        total: results.length,
        successful: successful.length,
        failed: failed.length,
        notFound: notFound.length,
        successRate: results.length > 0 ? Math.round((successful.length / results.length) * 100) : 0,
        results: {
            all: results,
            successful,
            failed,
            notFound,
            pathMismatches
        },
        regexRedirects
    };

    // Build summary text for both console and file
    let summaryText = '';
    summaryText += '\n' + '='.repeat(80) + '\n';
    summaryText += 'REDIRECT TEST SUMMARY\n';
    summaryText += '='.repeat(80) + '\n\n';
    summaryText += `✓ SUCCESSFUL REDIRECTS: ${summary.successful}\n`;
    summaryText += `  └─ Different path but working: ${pathMismatches.length}\n`;
    summaryText += `⚠ REDIRECTS TO 404 PAGES: ${summary.notFound}\n`;
    summaryText += `✗ FAILED REDIRECTS: ${summary.failed}\n\n`;
    summaryText += `Total redirects tested: ${summary.total}\n`;
    summaryText += `Success rate: ${summary.successRate}%\n\n`;

    if (summary.failed > 0) {
        summaryText += 'Failed redirects:\n';
        summary.results.failed.forEach(result => {
            summaryText += `  ✗ ${result.fromPath} → ${result.finalPath} (expected: ${result.expectedTo})\n`;
        });
        summaryText += '\n';
    }

    if (summary.notFound > 0) {
        summaryText += '404 redirects:\n';
        summary.results.notFound.forEach(result => {
            summaryText += `  ⚠ ${result.fromPath} → ${result.finalPath} (404)\n`;
        });
        summaryText += '\n';
    }

    if (pathMismatches.length > 0) {
        summaryText += 'Working redirects with different paths than expected:\n';
        pathMismatches.forEach(result => {
            summaryText += `  ⓘ ${result.fromPath} → ${result.finalPath} (expected: ${result.expectedTo})\n`;
        });
        summaryText += '\n';
    }

    if (summary.regexRedirects && summary.regexRedirects.length > 0) {
        summaryText += 'Regex-based redirects (not tested):\n';
        summary.regexRedirects.forEach(redirect => {
            summaryText += `  ⓘ ${redirect.fromPattern} → ${redirect.toPattern}\n`;
        });
        summaryText += '\n';
        summaryText += `Note: ${summary.regexRedirects.length} regex patterns were found but not tested.\n`;
        summaryText += 'These patterns use capture groups (e.g., $1) and cannot be tested without specific test cases.\n\n';
    }

    // Print summary to console
    if (!quiet) {
        console.log(summaryText);
    }

    // Save reports (only if verbose flag is set)
    if (verbose) {
        const timestamp = new Date().toISOString().slice(0, 19).replace(/[:.]/g, '-');
        const reportFile = `redirect-test-report-${timestamp}.json`;
        const summaryFile = `redirect-test-summary-${timestamp}.txt`;
        const reportPath = path.join(process.cwd(), reportFile);
        const summaryPath = path.join(process.cwd(), summaryFile);
        
        try {
            const reportData = {
                timestamp: new Date().toISOString(),
                baseUrl: BASE_URL,
                redirectsMapPath: redirectsMapPath,
                summary: {
                    total: summary.total,
                    successful: summary.successful,
                    failed: summary.failed,
                    notFound: summary.notFound,
                    successRate: summary.successRate
                },
                results: summary.results
            };
            
            // Save JSON report
            fs.writeFileSync(reportPath, JSON.stringify(reportData, null, 2));
            
            // Save text summary
            fs.writeFileSync(summaryPath, summaryText);
            
            if (!quiet) {
                console.log(`Detailed JSON report saved to: ${reportFile}`);
                console.log(`Summary text report saved to: ${summaryFile}`);
            }
            
        } catch (error) {
            if (!quiet) {
                console.error('Error saving report files:', error.message);
            }
        }
    }

    // Clean up agents
    httpAgent.destroy();
    httpsAgent.destroy();

    return summary;
}

// Export for use as module or run directly
if (require.main === module) {
    const args = process.argv.slice(2);
    let redirectsMapPath = './provisioning/nginx/redirects.map';
    let quiet = false;
    let batchSize = 20;  // Increased default batch size
    let delayBetweenBatches = 1000;
    let verbose = false;
    
    // Parse command line arguments
    for (let i = 0; i < args.length; i++) {
        const arg = args[i];
        if (arg === '--quiet' || arg === '-q') {
            quiet = true;
        } else if (arg === '--verbose' || arg === '-v') {
            verbose = true;
        } else if (arg === '--batch-size' && args[i + 1]) {
            batchSize = parseInt(args[i + 1], 10);
            i++;
        } else if (arg === '--delay' && args[i + 1]) {
            delayBetweenBatches = parseInt(args[i + 1], 10);
            i++;
        } else if (arg === '--help' || arg === '-h') {
            console.log(`
Usage: node test-redirects.js [options] [redirects-map-path]

Options:
  --quiet, -q         Run in quiet mode (minimal console output)
  --verbose, -v       Save detailed JSON and text report files
  --batch-size N      Number of concurrent requests (default: 20)
  --delay N           Delay between batches in ms (default: 1000)
  --help, -h          Show this help message

Arguments:
  redirects-map-path    Path to the redirects.map file (default: ./provisioning/nginx/redirects.map)

Examples:
  node test-redirects.js
  node test-redirects.js --quiet
  node test-redirects.js --verbose
  node test-redirects.js --batch-size 3 --delay 2000
  node test-redirects.js ./custom-redirects.map
            `);
            process.exit(0);
        } else if (!arg.startsWith('-')) {
            redirectsMapPath = arg;
        }
    }
    
    testAllRedirects(redirectsMapPath, { quiet, batchSize, delayBetweenBatches, verbose })
        .then(summary => {
            if (quiet) {
                // In quiet mode, just output basic summary
                console.log(`${summary.successful}/${summary.total} redirects successful (${summary.successRate}%)`);
                if (summary.failed > 0) {
                    console.log(`${summary.failed} failed redirects`);
                }
                if (summary.notFound > 0) {
                    console.log(`${summary.notFound} redirects lead to 404 pages`);
                }
            }
            process.exit(summary.failed > 0 ? 1 : 0);
        })
        .catch(error => {
            if (!quiet) {
                console.error('Error running redirect tests:', error);
            }
            process.exit(1);
        });
} else {
    module.exports = { testAllRedirects, testRedirect, parseRedirectsMap };
}