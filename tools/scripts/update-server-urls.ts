import * as fs from 'fs';
import * as path from 'path';
import { parse, stringify } from 'yaml';

// Use require for the plugin config to avoid TypeScript trying to compile it
const { openapiPlugin } = require('../website/config/pluginsConfig/docusaurus-plugin-openapi-docs');

interface ServerVariable {
  default?: string;
  enum?: string[];
  description?: string;
}

interface ServerConfig {
  url: string;
  description?: string;
  variables?: Record<string, ServerVariable>;
}

interface OpenAPISpec {
  servers?: ServerConfig[];
  // ... other OpenAPI fields
}

interface VariableConfig {
  default?: string;
  varName?: string;  // New variable name to replace the old one
}

interface ServerUrlConfig {
  urlPattern: string;
  replacement: string;
  variables?: Record<string, VariableConfig | null>;
}

interface ApiConfig {
  specPath: string;
  outputDir: string;
  sidebarOptions: {
    categoryLinkSource: string;
    groupPathsBy: string;
  };
}

function escapeRegExp(string: string): string {
  return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function createUrlPattern(pattern: string): RegExp {
  // Escape special characters except for curly braces and their contents
  const parts = pattern.split(/(\{[^}]+\})/);
  const escapedParts = parts.map((part, index) => {
    // If it's a variable (wrapped in curly braces), keep it as is
    if (part.startsWith('{') && part.endsWith('}')) {
      return part;
    }
    // Otherwise escape special characters
    return escapeRegExp(part);
  });
  return new RegExp(escapedParts.join(''));
}

function updateServerUrls(specPath: string, config: ServerUrlConfig): void {
  try {
    // Read and parse the YAML file
    const fileContent = fs.readFileSync(specPath, 'utf8');
    const spec = parse(fileContent) as OpenAPISpec;

    if (!spec.servers || !Array.isArray(spec.servers)) {
      console.warn(`No servers found in spec: ${specPath}`);
      return;
    }

    // Update each server configuration
    spec.servers = spec.servers.map(server => {
      // Update the URL using regex
      const pattern = createUrlPattern(config.urlPattern);
      server.url = server.url.replace(pattern, config.replacement);

      // Handle variables if they exist
      if (config.variables && server.variables) {
        const updatedVariables: Record<string, ServerVariable> = {};

        // Process each variable in the config
        Object.entries(config.variables).forEach(([oldVarName, varConfig]) => {
          if (varConfig === null) {
            // Skip this variable (effectively removing it)
            return;
          }

          const currentVar = server.variables?.[oldVarName];
          if (currentVar) {
            // Create updated variable with new name if specified
            const newVarName = varConfig.varName || oldVarName;
            updatedVariables[newVarName] = {
              ...currentVar,
              // Update default if specified
              ...(varConfig.default !== undefined && { default: varConfig.default })
            };
          }
        });

        // Replace the variables object with our updated version
        server.variables = updatedVariables;
      }

      return server;
    });

    // Write the updated spec back to file
    const updatedYaml = stringify(spec);
    fs.writeFileSync(specPath, updatedYaml, 'utf8');
    console.log(`Updated server URLs in: ${specPath}`);
  } catch (error) {
    console.error(`Error processing ${specPath}:`, error);
  }
}

function processSpecs(config: ServerUrlConfig): void {
  // Extract spec paths from the OpenAPI plugin config
  if (!openapiPlugin || !Array.isArray(openapiPlugin) || !openapiPlugin[1]?.config) {
    console.error('Invalid OpenAPI plugin configuration');
    return;
  }

  const pluginConfig = openapiPlugin[1].config as Record<string, ApiConfig>;
  const pattern = createUrlPattern(config.urlPattern);
  
  Object.values(pluginConfig).forEach(apiConfig => {
    const specPath = path.resolve(process.cwd(), apiConfig.specPath);
    
    try {
      // Parse the YAML to check server URLs and variables specifically
      const content = fs.readFileSync(specPath, 'utf8');
      const spec = parse(content) as OpenAPISpec;

      // Check if any server URL matches our pattern or if there are variables to update
      const hasMatchingUrl = spec.servers?.some(server => pattern.test(server.url)) ?? false;
      const hasMatchingVariables = spec.servers?.some(server => {
        if (!server.variables || !config.variables) return false;
        // Check if any of the variables we want to update exist in this server
        return Object.keys(config.variables).some(varName => varName in server.variables!);
      }) ?? false;
      
      if (hasMatchingUrl || hasMatchingVariables) {
        console.log(`Processing spec: ${specPath}`);
        if (hasMatchingUrl) {
          console.log('  - Found matching URL pattern');
        }
        if (hasMatchingVariables) {
          console.log('  - Found matching variables to update');
        }
        updateServerUrls(specPath, config);
      } else {
        console.log(`Skipping spec (no matching URLs or variables): ${specPath}`);
      }
    } catch (error) {
      console.error(`Error reading spec file ${specPath}:`, error);
    }
  });
}

// Configuration that will be applied to all matching specs
const varName = 'project_name';  // New variable name

const config: ServerUrlConfig = {
  urlPattern: 'https://{space_name}.signalwire.com/',
  replacement: `https://{${varName}}.new.yes.com/`,
  variables: {
    // Set to null to remove the variable completely
    space_name: {
      default: '{NEW_NAME}', // replace with your new default value
      varName: varName  // This will rename space_name to project_name
    }
  }
};

processSpecs(config);