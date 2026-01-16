/**
 * OpenAPI Spec Comparison Tool
 *
 * Compares two OpenAPI spec extractions (from extract-spec-endpoints.js) to identify
 * discrepancies in endpoints, request bodies, responses, and parameters.
 *
 * Note: The extraction script uses swagger-parser's dereference() method to fully
 * resolve all $ref pointers at extraction time. This means the JSON files passed
 * to this script should have no $refs (except for circular refs which are left as-is).
 * The ref resolution functions below are kept for backwards compatibility and edge cases.
 *
 * Usage:
 *   node scripts/compare-spec-endpoints.js --original <path> --generated <path> [--output <path>] [--pretty]
 *
 * Options:
 *   --original <path>   Path to original spec extraction JSON - required
 *   --generated <path>  Path to generated spec extraction JSON - required
 *   --output <path>     Output file path for detailed report (optional)
 *   --pretty            Pretty-print JSON output
 *
 * Example:
 *   node scripts/compare-spec-endpoints.js --original /tmp/original.json --generated /tmp/generated.json --pretty
 */

import fs from 'fs';
import { Logger } from './utils/logger.js';

const log = new Logger();

/**
 * Parse command line arguments
 */
function parseArgs(args) {
  const result = {
    original: null,
    generated: null,
    output: null,
    pretty: false,
  };

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--original' && args[i + 1]) {
      result.original = args[++i];
    } else if (args[i] === '--generated' && args[i + 1]) {
      result.generated = args[++i];
    } else if (args[i] === '--output' && args[i + 1]) {
      result.output = args[++i];
    } else if (args[i] === '--pretty') {
      result.pretty = true;
    }
  }

  return result;
}

/**
 * Resolve a $ref pointer to its actual value in the spec.
 * Handles nested refs and circular ref detection.
 *
 * @param {object} obj - Object that may contain a $ref
 * @param {object} spec - Full spec object containing schemas
 * @param {Set} visited - Set of visited ref paths for circular detection
 * @returns {object} Resolved object or original if no ref
 */
function resolveRef(obj, spec, visited = new Set()) {
  if (!obj || typeof obj !== 'object') return obj;
  if (!obj.$ref) return obj;

  const refPath = obj.$ref;

  // Circular ref detection
  if (visited.has(refPath)) {
    return { _circular: refPath };
  }
  visited.add(refPath);

  // Parse the ref path (e.g., '#/components/schemas/Account')
  const parts = refPath.replace('#/', '').split('/');
  let resolved = spec;

  for (const part of parts) {
    resolved = resolved?.[part];
    if (!resolved) break;
  }

  if (!resolved) {
    return obj; // Return original if ref not found
  }

  // Recursively resolve if the resolved object also has a $ref
  return resolveRef(resolved, spec, new Set(visited));
}

/**
 * Resolve a schema, handling $ref, allOf, anyOf, oneOf compositions.
 * Returns the fully resolved schema with all properties merged.
 *
 * @param {object} schema - Schema object to resolve
 * @param {object} schemas - All schema definitions from the spec
 * @param {object} fullSpec - Full spec for resolving component refs
 * @param {Set} visited - Set of visited refs for circular detection
 * @returns {object} Resolved schema
 */
function resolveSchema(schema, schemas, fullSpec, visited = new Set()) {
  if (!schema) return schema;

  // Handle $ref
  if (schema.$ref) {
    const refName = schema.$ref;
    if (visited.has(refName)) {
      return { _circular: refName };
    }
    visited.add(refName);

    const resolved = resolveRef(schema, fullSpec, new Set(visited));
    if (resolved && resolved !== schema) {
      return resolveSchema(resolved, schemas, fullSpec, new Set(visited));
    }
    return schema;
  }

  // Handle allOf - merge all schemas
  if (schema.allOf) {
    let merged = {};
    for (const subSchema of schema.allOf) {
      const resolved = resolveSchema(subSchema, schemas, fullSpec, new Set(visited));
      merged = mergeSchemas(merged, resolved);
    }
    // Merge any sibling properties (like description) from the original schema
    const { allOf, ...rest } = schema;
    return mergeSchemas(merged, rest);
  }

  // Handle anyOf/oneOf - collect all possible properties but NOT required fields from variants
  // For oneOf (discriminated unions), each variant has its own required fields,
  // but only ONE variant's required fields apply at a time based on the discriminator.
  // We merge properties (so all possible fields are known) but exclude variant-specific
  // required fields to avoid false positives in comparison.
  if (schema.anyOf || schema.oneOf) {
    const variants = schema.anyOf || schema.oneOf;
    let merged = {};
    for (const subSchema of variants) {
      const resolved = resolveSchema(subSchema, schemas, fullSpec, new Set(visited));
      // Merge properties but exclude required fields from variants
      const { required, ...resolvedWithoutRequired } = resolved;
      merged = mergeSchemas(merged, resolvedWithoutRequired);
    }
    const { anyOf, oneOf, ...rest } = schema;
    return mergeSchemas(merged, rest);
  }

  return schema;
}

/**
 * Merge two schemas, combining properties and required arrays.
 */
function mergeSchemas(base, addition) {
  if (!addition) return base;
  if (!base) return addition;

  return {
    ...base,
    ...addition,
    properties: { ...base.properties, ...addition.properties },
    required: [...new Set([...(base.required || []), ...(addition.required || [])])],
  };
}

/**
 * Extract property names from a schema, resolving all refs.
 *
 * @param {object} schema - Schema to extract properties from
 * @param {object} schemas - All schema definitions
 * @param {object} fullSpec - Full spec for resolving refs
 * @param {Set} visited - Visited refs for circular detection
 * @returns {string[]} Array of property names
 */
function getSchemaProperties(schema, schemas, fullSpec, visited = new Set()) {
  if (!schema) return [];

  const resolved = resolveSchema(schema, schemas, fullSpec, visited);

  if (resolved._circular) {
    return [`[circular: ${resolved._circular}]`];
  }

  if (resolved.properties) {
    return Object.keys(resolved.properties);
  }

  if (resolved.items) {
    return getSchemaProperties(resolved.items, schemas, fullSpec, new Set(visited));
  }

  return [];
}

/**
 * Get required fields from a schema, resolving refs.
 */
function getRequiredFields(schema, schemas, fullSpec) {
  if (!schema) return [];

  const resolved = resolveSchema(schema, schemas, fullSpec, new Set());
  return resolved?.required || [];
}

/**
 * Resolve a parameter, handling $ref.
 */
function resolveParameter(param, fullSpec) {
  if (!param) return param;
  if (param.$ref) {
    return resolveRef(param, fullSpec, new Set());
  }
  return param;
}

/**
 * Get endpoint key for comparison
 */
function getEndpointKey(endpoint) {
  return `${endpoint.method} ${endpoint.path}`;
}

/**
 * Compare two specs and generate a report
 */
function compareSpecs(originalSpec, generatedSpec) {
  const issues = [];
  const warnings = [];
  const acceptable = [];

  // Build endpoint maps
  const originalEndpoints = new Map();
  const generatedEndpoints = new Map();

  // Create full spec objects for ref resolution
  const originalFullSpec = {
    components: {
      schemas: originalSpec.schemas || {},
      parameters: originalSpec.parameters || {},
    },
  };

  const generatedFullSpec = {
    components: {
      schemas: generatedSpec.schemas || {},
      parameters: generatedSpec.parameters || {},
    },
  };

  originalSpec.endpoints.forEach((ep) => {
    originalEndpoints.set(getEndpointKey(ep), ep);
  });

  generatedSpec.endpoints.forEach((ep) => {
    generatedEndpoints.set(getEndpointKey(ep), ep);
  });

  // Check for missing/extra endpoints
  const missingInGenerated = [];
  const extraInGenerated = [];

  originalEndpoints.forEach((ep, key) => {
    if (!generatedEndpoints.has(key)) {
      missingInGenerated.push(key);
    }
  });

  generatedEndpoints.forEach((ep, key) => {
    if (!originalEndpoints.has(key)) {
      extraInGenerated.push(key);
    }
  });

  if (missingInGenerated.length > 0) {
    issues.push({ type: 'MISSING_ENDPOINT', endpoints: missingInGenerated });
  }

  // Compare each endpoint
  const endpointResults = [];

  originalEndpoints.forEach((original, key) => {
    const generated = generatedEndpoints.get(key);
    if (!generated) return;

    const endpointIssues = [];
    const endpointWarnings = [];
    const endpointAcceptable = [];

    // Compare operationId
    if (original.operationId !== generated.operationId) {
      endpointIssues.push(`operationId: "${original.operationId}" vs "${generated.operationId}"`);
    }

    // Compare summary
    if (original.summary !== generated.summary) {
      endpointWarnings.push(`summary differs: "${original.summary}" vs "${generated.summary}"`);
    }

    // Compare tags
    const originalTags = (original.tags || []).sort().join(',');
    const generatedTags = (generated.tags || []).sort().join(',');
    if (originalTags !== generatedTags) {
      endpointWarnings.push(`tags: [${originalTags}] vs [${generatedTags}]`);
    }

    // Compare request body
    if (original.requestBody && generated.requestBody) {
      if (original.requestBody.contentType !== generated.requestBody.contentType) {
        endpointAcceptable.push(
          `requestBody contentType: "${original.requestBody.contentType}" vs "${generated.requestBody.contentType}" (expected change)`
        );
      }

      if (original.requestBody.required !== generated.requestBody.required) {
        endpointIssues.push(
          `requestBody.required: ${original.requestBody.required} vs ${generated.requestBody.required}`
        );
      }

      // Compare request body properties
      const origProps = getSchemaProperties(
        original.requestBody.schema,
        originalSpec.schemas,
        originalFullSpec
      );
      const genProps = getSchemaProperties(
        generated.requestBody.schema,
        generatedSpec.schemas,
        generatedFullSpec
      );

      const missingProps = origProps.filter((p) => !genProps.includes(p) && !p.startsWith('['));
      const extraProps = genProps.filter((p) => !origProps.includes(p) && !p.startsWith('['));

      if (missingProps.length > 0) {
        endpointIssues.push(`requestBody missing properties: ${missingProps.join(', ')}`);
      }
      if (extraProps.length > 0) {
        endpointWarnings.push(`requestBody extra properties: ${extraProps.join(', ')}`);
      }

      // Compare required fields
      const origRequired = getRequiredFields(
        original.requestBody.schema,
        originalSpec.schemas,
        originalFullSpec
      );
      const genRequired = getRequiredFields(
        generated.requestBody.schema,
        generatedSpec.schemas,
        generatedFullSpec
      );

      const missingRequired = origRequired.filter((r) => !genRequired.includes(r));
      const extraRequired = genRequired.filter((r) => !origRequired.includes(r));

      if (missingRequired.length > 0) {
        endpointIssues.push(`requestBody missing required: ${missingRequired.join(', ')}`);
      }
      if (extraRequired.length > 0) {
        endpointWarnings.push(`requestBody extra required: ${extraRequired.join(', ')}`);
      }
    } else if (original.requestBody && !generated.requestBody) {
      endpointIssues.push('requestBody missing in generated spec');
    } else if (!original.requestBody && generated.requestBody) {
      endpointWarnings.push('requestBody added in generated spec (not in original)');
    }

    // Compare responses
    const originalResponses = Object.keys(original.responses || {}).sort();
    const generatedResponses = Object.keys(generated.responses || {}).sort();

    const missingResponses = originalResponses.filter((r) => !generatedResponses.includes(r));
    const extraResponses = generatedResponses.filter((r) => !originalResponses.includes(r));

    if (missingResponses.length > 0) {
      endpointIssues.push(`missing response codes: ${missingResponses.join(', ')}`);
    }
    if (extraResponses.length > 0) {
      const realExtra = extraResponses.filter((r) => !['401', '404', '400'].includes(r));
      if (realExtra.length > 0) {
        endpointWarnings.push(`extra response codes: ${realExtra.join(', ')}`);
      } else {
        endpointAcceptable.push(`added error response codes: ${extraResponses.join(', ')}`);
      }
    }

    // Compare 200 response schema properties
    if (original.responses?.['200']?.schema && generated.responses?.['200']?.schema) {
      const origRespProps = getSchemaProperties(
        original.responses['200'].schema,
        originalSpec.schemas,
        originalFullSpec
      );
      const genRespProps = getSchemaProperties(
        generated.responses['200'].schema,
        generatedSpec.schemas,
        generatedFullSpec
      );

      const missingRespProps = origRespProps.filter(
        (p) => !genRespProps.includes(p) && !p.startsWith('[')
      );
      const extraRespProps = genRespProps.filter(
        (p) => !origRespProps.includes(p) && !p.startsWith('[')
      );

      if (missingRespProps.length > 0) {
        endpointIssues.push(`response missing properties: ${missingRespProps.join(', ')}`);
      }
      if (extraRespProps.length > 0) {
        endpointWarnings.push(`response extra properties: ${extraRespProps.join(', ')}`);
      }
    }

    // Compare parameters - resolve refs first
    const origParams = (original.parameters || [])
      .map((p) => resolveParameter(p, originalFullSpec))
      .filter((p) => p?.name)
      .map((p) => p.name)
      .sort();

    const genParams = (generated.parameters || [])
      .map((p) => resolveParameter(p, generatedFullSpec))
      .filter((p) => p?.name)
      .map((p) => p.name)
      .sort();

    const missingParams = origParams.filter((p) => !genParams.includes(p));
    const extraParams = genParams.filter((p) => !origParams.includes(p));

    if (missingParams.length > 0) {
      endpointIssues.push(`missing parameters: ${missingParams.join(', ')}`);
    }
    if (extraParams.length > 0) {
      endpointWarnings.push(`extra parameters: ${extraParams.join(', ')}`);
    }

    // Store results
    if (endpointIssues.length > 0 || endpointWarnings.length > 0 || endpointAcceptable.length > 0) {
      endpointResults.push({
        endpoint: key,
        issues: endpointIssues,
        warnings: endpointWarnings,
        acceptable: endpointAcceptable,
      });

      if (endpointIssues.length > 0) {
        issues.push({ endpoint: key, issues: endpointIssues });
      }
      if (endpointWarnings.length > 0) {
        warnings.push({ endpoint: key, warnings: endpointWarnings });
      }
      if (endpointAcceptable.length > 0) {
        acceptable.push({ endpoint: key, changes: endpointAcceptable });
      }
    }
  });

  return {
    summary: {
      originalTitle: originalSpec.specInfo?.title,
      generatedTitle: generatedSpec.specInfo?.title,
      originalEndpoints: originalSpec.endpointCount,
      generatedEndpoints: generatedSpec.endpointCount,
      missingEndpoints: missingInGenerated,
      extraEndpoints: extraInGenerated,
      issueCount: issues.length,
      warningCount: warnings.length,
      acceptableCount: acceptable.length,
    },
    endpointResults,
    issues,
    warnings,
    acceptable,
  };
}

/**
 * Print comparison report to console
 */
function printReport(report, originalSpec, generatedSpec) {
  console.log('='.repeat(80));
  console.log('SPEC COMPARISON REPORT');
  console.log('='.repeat(80));
  console.log(`\nOriginal spec: ${report.summary.originalTitle} (${report.summary.originalEndpoints} endpoints)`);
  console.log(`Generated spec: ${report.summary.generatedTitle} (${report.summary.generatedEndpoints} endpoints)`);

  console.log('\n' + '='.repeat(80));
  console.log('ENDPOINT COVERAGE');
  console.log('='.repeat(80));

  if (report.summary.missingEndpoints.length > 0) {
    console.log('\nMISSING in generated spec:');
    report.summary.missingEndpoints.forEach((k) => console.log(`  - ${k}`));
  } else {
    console.log('\nAll original endpoints present in generated spec');
  }

  if (report.summary.extraEndpoints.length > 0) {
    console.log('\nEXTRA in generated spec (not in original):');
    report.summary.extraEndpoints.forEach((k) => console.log(`  - ${k}`));
  }

  console.log('\n' + '='.repeat(80));
  console.log('ENDPOINT-BY-ENDPOINT COMPARISON');
  console.log('='.repeat(80));

  for (const result of report.endpointResults) {
    console.log(`\n${result.endpoint}`);
    if (result.issues.length > 0) {
      console.log('  ISSUES:');
      result.issues.forEach((i) => console.log(`    - ${i}`));
    }
    if (result.warnings.length > 0) {
      console.log('  WARNINGS:');
      result.warnings.forEach((w) => console.log(`    - ${w}`));
    }
    if (result.acceptable.length > 0) {
      console.log('  ACCEPTABLE CHANGES:');
      result.acceptable.forEach((a) => console.log(`    - ${a}`));
    }
  }

  console.log('\n' + '='.repeat(80));
  console.log('SUMMARY');
  console.log('='.repeat(80));
  console.log(`\nTotal endpoints compared: ${report.summary.originalEndpoints}`);
  console.log(`Endpoints with ISSUES: ${report.summary.issueCount}`);
  console.log(`Endpoints with WARNINGS: ${report.summary.warningCount}`);
  console.log(`Endpoints with acceptable changes: ${report.summary.acceptableCount}`);

  if (report.summary.issueCount === 0) {
    console.log('\n*** NO CRITICAL ISSUES FOUND ***');
  } else {
    console.log('\n*** CRITICAL ISSUES REQUIRE ATTENTION ***');
  }
}

/**
 * Main entry point
 */
async function main() {
  const args = parseArgs(process.argv.slice(2));

  if (!args.original || !args.generated) {
    log.error('Missing required arguments');
    log.info('Usage: node scripts/compare-spec-endpoints.js --original <path> --generated <path> [--output <path>] [--pretty]');
    process.exit(1);
  }

  try {
    log.info(`Loading original spec: ${args.original}`);
    const originalSpec = JSON.parse(fs.readFileSync(args.original, 'utf8'));

    log.info(`Loading generated spec: ${args.generated}`);
    const generatedSpec = JSON.parse(fs.readFileSync(args.generated, 'utf8'));

    log.info('Comparing specs...');
    const report = compareSpecs(originalSpec, generatedSpec);

    // Print to console
    printReport(report, originalSpec, generatedSpec);

    // Write detailed report to file if requested
    if (args.output) {
      const jsonOutput = args.pretty ? JSON.stringify(report, null, 2) : JSON.stringify(report);
      fs.writeFileSync(args.output, jsonOutput);
      log.success(`Detailed report written to: ${args.output}`);
    }
  } catch (err) {
    log.error(`Failed to compare specs: ${err.message}`);
    process.exit(1);
  }
}

main();
