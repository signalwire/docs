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

    // Generate the report table
    let reportContent = "# OpenAPI Specification Analysis\n\n";
    reportContent += "| Spec | Docs | Completeness | SDK Gen | Security | Overall | Warnings | Errors | Report |\n";
    reportContent += "|------|------|--------------|---------|----------|---------|----------|---------|---------|\n";

    // Process each spec with delay between requests
    for (const spec of matrix) {
      const relativePath = path.relative(process.cwd(), spec.path);
      log(`\n🔄 Processing spec: ${relativePath}`);
      
      try {
        const results = await evaluateSpec(spec.path, apiKey);
        reportContent += `| [\`${relativePath}\`](${spec.path}) | ${results.docsScore}/100 | ${results.completenessScore}/100 | ${results.sdkScore}/100 | ${results.securityScore}/100 | ${results.overallScore}/100 | ${results.warnings} | ${results.errors} | [View](${results.reportUrl}) |\n`;
      } catch (error) {
        log(`   ❌ Failed to process spec: ${relativePath}`);
        reportContent += `| [\`${relativePath}\`](${spec.path}) | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | Failed to process |\n`;
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