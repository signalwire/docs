/**
 * OpenAPI Spec Endpoint Extractor
 *
 * Parses an OpenAPI spec and outputs a JSON report of all endpoints with their
 * request bodies and responses, with all $ref references resolved inline.
 *
 * Usage:
 *   node scripts/extract-spec-endpoints.js --spec <path> [--output <path>] [--pretty]
 *
 * Options:
 *   --spec <path>     Path to OpenAPI spec (YAML or JSON) - required
 *   --output <path>   Output file path (optional, defaults to stdout)
 *   --pretty          Pretty-print JSON output
 *
 * Example:
 *   node scripts/extract-spec-endpoints.js --spec fern/apis/calling/openapi.yaml --pretty
 */

import SwaggerParser from '@apidevtools/swagger-parser';
import fs from 'fs';
import path from 'path';
import { Logger } from './utils/logger.js';

const log = new Logger();

// HTTP methods to extract (in order)
const HTTP_METHODS = ['get', 'post', 'put', 'patch', 'delete', 'head', 'options'];

/**
 * Parse command line arguments
 */
function parseArgs(args) {
  const result = {
    spec: null,
    output: null,
    pretty: false,
  };

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--spec' && args[i + 1]) {
      result.spec = args[++i];
    } else if (args[i] === '--output' && args[i + 1]) {
      result.output = args[++i];
    } else if (args[i] === '--pretty') {
      result.pretty = true;
    }
  }

  return result;
}

/**
 * Load and bundle an OpenAPI spec.
 * Uses bundle() instead of dereference() to avoid circular reference issues.
 * Internal $refs are kept as pointers, external refs are resolved.
 */
async function parseSpec(specPath) {
  const absolutePath = path.resolve(specPath);

  if (!fs.existsSync(absolutePath)) {
    throw new Error(`Spec file not found: ${absolutePath}`);
  }

  // Bundle resolves external refs but keeps internal $refs as pointers
  // This avoids circular reference issues with recursive schemas
  const api = await SwaggerParser.bundle(absolutePath);
  return api;
}

/**
 * Extract schema from a content object (handles different content types)
 */
function extractContentSchema(content) {
  if (!content) return null;

  // Prefer application/json, but fall back to others
  const contentTypes = ['application/json', 'application/xml', 'text/plain', '*/*'];

  for (const ct of contentTypes) {
    if (content[ct]?.schema) {
      return {
        contentType: ct,
        schema: content[ct].schema,
      };
    }
  }

  // Try first available content type
  const firstKey = Object.keys(content)[0];
  if (firstKey && content[firstKey]?.schema) {
    return {
      contentType: firstKey,
      schema: content[firstKey].schema,
    };
  }

  return null;
}

/**
 * Extract endpoint information from the spec
 */
function extractEndpoints(spec) {
  const endpoints = [];

  if (!spec.paths) {
    return endpoints;
  }

  // Sort paths for deterministic output
  const sortedPaths = Object.keys(spec.paths).sort();

  for (const pathStr of sortedPaths) {
    const pathItem = spec.paths[pathStr];

    for (const method of HTTP_METHODS) {
      const operation = pathItem[method];
      if (!operation) continue;

      const endpoint = {
        path: pathStr,
        method: method.toUpperCase(),
        operationId: operation.operationId || null,
        summary: operation.summary || null,
        description: operation.description || null,
        tags: operation.tags || [],
      };

      // Extract parameters (path, query, header)
      if (operation.parameters && operation.parameters.length > 0) {
        endpoint.parameters = operation.parameters.map((param) => ({
          name: param.name,
          in: param.in,
          required: param.required || false,
          description: param.description || null,
          schema: param.schema || null,
        }));
      }

      // Extract request body
      if (operation.requestBody) {
        const contentInfo = extractContentSchema(operation.requestBody.content);
        endpoint.requestBody = {
          required: operation.requestBody.required || false,
          description: operation.requestBody.description || null,
          ...(contentInfo || {}),
        };
      }

      // Extract responses
      if (operation.responses) {
        endpoint.responses = {};

        for (const [statusCode, response] of Object.entries(operation.responses)) {
          const contentInfo = extractContentSchema(response.content);
          endpoint.responses[statusCode] = {
            description: response.description || null,
            ...(contentInfo || {}),
          };
        }
      }

      endpoints.push(endpoint);
    }
  }

  return endpoints;
}

/**
 * Write to stderr (for progress messages when stdout is used for JSON)
 */
function logToStderr(message) {
  process.stderr.write(message + '\n');
}

/**
 * Main entry point
 */
async function main() {
  const args = parseArgs(process.argv.slice(2));

  if (!args.spec) {
    log.error('Missing required --spec argument');
    log.info('Usage: node scripts/extract-spec-endpoints.js --spec <path> [--output <path>] [--pretty]');
    process.exit(1);
  }

  // When outputting to stdout, send progress to stderr so JSON is clean
  const logProgress = args.output ? (msg) => log.info(msg) : logToStderr;

  try {
    logProgress(`Parsing spec: ${args.spec}`);
    const spec = await parseSpec(args.spec);

    logProgress(`Extracting endpoints...`);
    const endpoints = extractEndpoints(spec);

    logProgress(`Found ${endpoints.length} endpoints`);

    const output = {
      specInfo: {
        title: spec.info?.title || null,
        version: spec.info?.version || null,
        description: spec.info?.description || null,
      },
      endpointCount: endpoints.length,
      endpoints,
      // Include schema definitions so AI can look up $ref pointers
      schemas: spec.components?.schemas || {},
    };

    const jsonOutput = args.pretty ? JSON.stringify(output, null, 2) : JSON.stringify(output);

    if (args.output) {
      fs.writeFileSync(args.output, jsonOutput);
      log.success(`Output written to: ${args.output}`);
    } else {
      // Write to stdout (clean JSON only)
      console.log(jsonOutput);
    }
  } catch (err) {
    log.error(`Failed to process spec: ${err.message}`);
    process.exit(1);
  }
}

main();
