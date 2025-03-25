import { openapiPlugin } from '../config/pluginsConfig/docusaurus-plugin-openapi-docs';
import type { PluginOptions } from 'docusaurus-plugin-openapi-docs/src/types';
import axios, { AxiosError } from 'axios';
import * as fs from 'fs';
import * as path from 'path';
import FormData from 'form-data';

interface MatrixEntry {
  name: string;
  path: string;
}

type Matrix = MatrixEntry[];

interface RateMyOpenAPIResponse {
  results: {
    simpleReport: {
      docsScore: number;
      completenessScore: number;
      sdkGenerationScore: number;
      securityScore: number;
      score: number;
    };
    fullReport: {
      issues: Array<{
        severity: number;
      }>;
    };
  };
  reportUrl: string;
}

interface SpecScore {
  docsScore: number;
  completenessScore: number;
  sdkScore: number;
  securityScore: number;
  overallScore: number;
  warnings: number;
  errors: number;
  reportUrl: string;
}

// Helper function to sleep
const sleep = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

// Helper function to get retry delay from headers or use exponential backoff
const getRetryDelay = (error: AxiosError): number => {
  const retryAfter = error.response?.headers['retry-after'];
  if (retryAfter) {
    return parseInt(retryAfter) * 1000; // Convert to milliseconds
  }
  return 5000; // Default 5 second delay
};

// Helper function for logging to stderr
const log = (...args: any[]) => console.error(...args);

// Helper function to format score comparison with logging
const formatScoreComparison = (newScore: number, oldScore?: number): string => {
  if (oldScore === undefined) {
    log('   ℹ️ No old score available for comparison');
    return `${newScore}/100`;
  }
  const diff = newScore - oldScore;
  log(`   📊 Score comparison: new=${newScore}, old=${oldScore}, diff=${diff.toFixed(1)}`);
  if (diff > 0) return `${newScore}/100 (+${diff.toFixed(1)}) 🟢`;
  if (diff < 0) return `${newScore}/100 (${diff.toFixed(1)}) 🔴`;
  return `${newScore}/100 (=) ⚪`;
};

// Helper function to format issue count comparison with logging
const formatIssueComparison = (newCount: number, oldCount?: number): string => {
  if (oldCount === undefined) {
    log('   ℹ️ No old issue count available for comparison');
    return `${newCount}`;
  }
  const diff = newCount - oldCount;
  log(`   📊 Issue comparison: new=${newCount}, old=${oldCount}, diff=${diff}`);
  // Note: For issues, fewer is better, so we invert the colors
  if (diff > 0) return `${newCount} (+${diff}) 🔴`;
  if (diff < 0) return `${newCount} (${diff}) 🟢`;
  return `${newCount} (=) ⚪`;
};

async function evaluateSpec(specPath: string, apiKey: string, retries = 3): Promise<{
  docsScore: number;
  completenessScore: number;
  sdkScore: number;
  securityScore: number;
  overallScore: number;
  warnings: number;
  errors: number;
  reportUrl: string;
}> {
  log(`\n📤 Making API request for spec: ${path.basename(specPath)}`);
  log(`   Attempt ${4 - retries}/3`);
  
  const form = new FormData();
  form.append('apiFile', fs.createReadStream(specPath));

  try {
    log('   Sending request to RateMyOpenAPI...');
    const response = await axios.post<RateMyOpenAPIResponse>(
      'https://api.ratemyopenapi.com/sync-report',
      form,
      {
        headers: {
          'Authorization': `Bearer ${apiKey}`,
          ...form.getHeaders(),
        },
      }
    );

    log('   ✅ Received response from API');
    const { results, reportUrl } = response.data;
    const { simpleReport, fullReport } = results;
    
    log(`   📊 Scores:
      - Docs: ${simpleReport.docsScore}/100
      - Completeness: ${simpleReport.completenessScore}/100
      - SDK Generation: ${simpleReport.sdkGenerationScore}/100
      - Security: ${simpleReport.securityScore}/100
      - Overall: ${simpleReport.score}/100
      - Warnings: ${fullReport.issues.filter((issue: { severity: number }) => issue.severity === 2).length}
      - Errors: ${fullReport.issues.filter((issue: { severity: number }) => issue.severity === 1).length}
    `);
    
    return {
      docsScore: simpleReport.docsScore,
      completenessScore: simpleReport.completenessScore,
      sdkScore: simpleReport.sdkGenerationScore,
      securityScore: simpleReport.securityScore,
      overallScore: simpleReport.score,
      warnings: fullReport.issues.filter((issue: { severity: number }) => issue.severity === 2).length,
      errors: fullReport.issues.filter((issue: { severity: number }) => issue.severity === 1).length,
      reportUrl,
    };
  } catch (error) {
    if (axios.isAxiosError(error)) {
      const axiosError = error as AxiosError;
      
      // Handle rate limiting
      if (axiosError.response?.status === 429 && retries > 0) {
        const delay = getRetryDelay(axiosError);
        log(`   ⚠️ Rate limited (429). Waiting ${delay/1000} seconds before retry...`);
        await sleep(delay);
        return evaluateSpec(specPath, apiKey, retries - 1);
      }
      
      // Handle other errors
      log(`   ❌ API Error:
        Status: ${axiosError.response?.status}
        Message: ${axiosError.response?.data || axiosError.message}
        Headers: ${JSON.stringify(axiosError.response?.headers, null, 2)}
      `);
      throw axiosError;
    }
    throw error;
  }
}

async function getFileFromMainBranch(filePath: string, repo: string): Promise<string | null> {
  const url = `https://raw.githubusercontent.com/${repo}/main/${filePath}`;
  log(`   🔍 Fetching main branch content from: ${url}`);
  
  try {
    const response = await axios.get(url);
    log('   ✅ Successfully fetched main branch content');
    return response.data;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      // 404 means file doesn't exist in main branch - this is normal for new files
      if (error.response?.status === 404) {
        log(`   ℹ️ File does not exist in main branch: ${filePath}`);
        return null;
      }
      log(`   ❌ HTTP Error ${error.response?.status}: ${error.response?.statusText}`);
    }
    log(`   ⚠️ Could not fetch file from main branch: ${error}`);
    return null;
  }
}

async function evaluateSpecFromMainBranch(specPath: string, apiKey: string, repo: string): Promise<SpecScore | null> {
  try {
    log('\n   📥 Getting main branch version...');
    
    // Get content from main branch using GitHub raw URL
    const mainContent = await getFileFromMainBranch(specPath, repo);
    
    // If we couldn't get main content, return null
    if (!mainContent) {
      log('   ℹ️ No main branch content available');
      return null;
    }
    
    // Save current file content to compare
    const currentContent = fs.readFileSync(specPath, 'utf8');
    
    // Even if content is identical, we still want to evaluate for comparison
    if (currentContent === mainContent) {
      log('   ℹ️ File content unchanged from main branch, evaluating for comparison');
    } else {
      log('   📝 Content differs from main branch, evaluating...');
    }
    
    // Write main branch content to temp file
    const tempPath = `${specPath}.main`;
    fs.writeFileSync(tempPath, mainContent);
    log(`   ✅ Wrote main branch content to temp file: ${tempPath}`);
    
    try {
      // Evaluate the main branch version
      log('   🔍 Evaluating main branch version...');
      const score = await evaluateSpec(tempPath, apiKey);
      log('   ✅ Successfully evaluated main branch version');
      log(`   📊 Main branch scores:
        - Docs: ${score.docsScore}/100
        - Completeness: ${score.completenessScore}/100
        - SDK Generation: ${score.sdkScore}/100
        - Security: ${score.securityScore}/100
        - Overall: ${score.overallScore}/100
        - Warnings: ${score.warnings}
        - Errors: ${score.errors}
      `);
      return score;
    } finally {
      // Clean up temp file
      fs.unlinkSync(tempPath);
      log('   🧹 Cleaned up temp file');
    }
  } catch (error) {
    log(`   ⚠️ Could not evaluate main branch version: ${error}`);
    return null;
  }
}

async function main() {
  try {
    log('🔍 Reading plugin configuration...');
    const pluginConfig = (openapiPlugin as unknown as [string, PluginOptions])[1].config;
    
    if (!pluginConfig || typeof pluginConfig !== 'object') {
      log('❌ Invalid plugin configuration');
      process.exit(1);
    }

    const matrix: Matrix = Object.entries(pluginConfig).map(([name, config]) => ({
      name,
      path: config.specPath
    }));

    if (!Array.isArray(matrix) || matrix.length === 0) {
      log('❌ No OpenAPI specs found in configuration');
      process.exit(1);
    }

    log(`📋 Found ${matrix.length} OpenAPI specs to process`);

    const apiKey = process.env.RATEMYOPENAPI_KEY;
    if (!apiKey) {
      log('❌ RATEMYOPENAPI_KEY environment variable is required');
      process.exit(1);
    }

    // Get PR info from GitHub environment
    const prNumber = process.env.GITHUB_EVENT_NUMBER || '';
    const repo = process.env.GITHUB_REPOSITORY || '';
    const sha = process.env.GITHUB_SHA || '';

    if (!repo) {
      log('❌ GITHUB_REPOSITORY environment variable is required');
      process.exit(1);
    }

    // Generate the report table
    let reportContent = "# OpenAPI Specification Analysis\n\n";
    reportContent += "Changes are compared to the `main` branch:\n";
    reportContent += "- 🟢 Improvements (higher scores or fewer issues)\n";
    reportContent += "- 🔴 Regressions (lower scores or more issues)\n";
    reportContent += "- ⚪ No changes\n\n";
    reportContent += "| Spec | Docs | Completeness | SDK Gen | Security | Overall | Warnings | Errors | Report |\n";
    reportContent += "|------|------|--------------|---------|----------|---------|----------|---------|---------|\n";

    // Process each spec with delay between requests
    for (const spec of matrix) {
      const relativePath = path.relative(process.cwd(), spec.path);
      log(`\n🔄 Processing spec: ${relativePath}`);
      
      try {
        // Get scores for current version
        log('\n   📊 Evaluating current version...');
        const currentScore = await evaluateSpec(spec.path, apiKey);
        log(`   📊 Current version scores:
          - Docs: ${currentScore.docsScore}/100
          - Completeness: ${currentScore.completenessScore}/100
          - SDK Generation: ${currentScore.sdkScore}/100
          - Security: ${currentScore.securityScore}/100
          - Overall: ${currentScore.overallScore}/100
          - Warnings: ${currentScore.warnings}
          - Errors: ${currentScore.errors}
        `);
        
        // Get scores from main branch
        const mainScore = await evaluateSpecFromMainBranch(spec.path, apiKey, repo);
        log(`   📊 Main branch scores: ${mainScore ? 'found' : 'not found'}`);

        // Log comparison details
        log('\n   📈 Generating comparisons:');
        
        // Construct GitHub blob URL
        const fileUrl = sha ? 
          `https://github.com/${repo}/blob/${sha}/${relativePath}` :
          relativePath;

        reportContent += `| [\`${relativePath}\`](${fileUrl}) | ` +
          `${formatScoreComparison(currentScore.docsScore, mainScore?.docsScore)} | ` +
          `${formatScoreComparison(currentScore.completenessScore, mainScore?.completenessScore)} | ` +
          `${formatScoreComparison(currentScore.sdkScore, mainScore?.sdkScore)} | ` +
          `${formatScoreComparison(currentScore.securityScore, mainScore?.securityScore)} | ` +
          `${formatScoreComparison(currentScore.overallScore, mainScore?.overallScore)} | ` +
          `${formatIssueComparison(currentScore.warnings, mainScore?.warnings)} | ` +
          `${formatIssueComparison(currentScore.errors, mainScore?.errors)} | ` +
          `[View](${currentScore.reportUrl}) |\n`;

        log('   ✅ Comparison complete');
      } catch (error) {
        log(`   ❌ Failed to process spec: ${relativePath}`);
        log(`   Error details: ${error}`);
        reportContent += `| [\`${relativePath}\`](${relativePath}) | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | Failed to process |\n`;
      }
      
      // Add delay between requests to avoid rate limiting
      if (matrix.indexOf(spec) < matrix.length - 1) {
        log('   ⏳ Waiting 2 seconds before next request...');
        await sleep(2000);
      }
    }

    // Only output the report to stdout
    console.log(reportContent);
  } catch (error) {
    log('❌ Error generating report:', error);
    process.exit(1);
  }
}

main(); 