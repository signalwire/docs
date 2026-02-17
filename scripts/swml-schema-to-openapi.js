import { readFileSync, writeFileSync, mkdirSync } from "fs";
import { dirname, resolve } from "path";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const rootDir = resolve(__dirname, "..");

const inputPath = resolve(
  rootDir,
  "specs/swml/tsp-output/@typespec/json-schema/SWMLObject.json"
);
const outputDir = resolve(rootDir, "fern/apis/swml-schema");
const outputPath = resolve(outputDir, "openapi.yaml");

const jsonSchema = JSON.parse(readFileSync(inputPath, "utf-8"));

function convertJsonSchemaToOpenAPI(schema) {
  const openapiSchemas = {};

  if (schema.$defs) {
    for (const [name, def] of Object.entries(schema.$defs)) {
      openapiSchemas[name] = convertSchema(def, schema.$defs);
    }
  }

  const topLevelSchema = { ...schema };
  delete topLevelSchema.$schema;
  delete topLevelSchema.$id;
  delete topLevelSchema.$defs;
  openapiSchemas["SWMLObject"] = convertSchema(topLevelSchema, schema.$defs);

  return openapiSchemas;
}

function convertSchema(node, defs) {
  if (!node || typeof node !== "object") return node;

  if (Array.isArray(node)) {
    return node.map((item) => convertSchema(item, defs));
  }

  const result = {};
  for (const [key, value] of Object.entries(node)) {
    if (key === "$defs") continue;

    if (key === "$ref" && typeof value === "string") {
      result["$ref"] = value.replace(
        /^#\/\$defs\//,
        "#/components/schemas/"
      );
      continue;
    }

    if (key === "unevaluatedProperties") {
      if (
        typeof value === "object" &&
        value.not &&
        Object.keys(value.not).length === 0
      ) {
        continue;
      }
      result["additionalProperties"] = convertSchema(value, defs);
      continue;
    }

    if (key === "const") {
      result["enum"] = [value];
      continue;
    }

    result[key] = convertSchema(value, defs);
  }

  return result;
}

function toYaml(obj, indent = 0) {
  const pad = "  ".repeat(indent);

  if (obj === null || obj === undefined) return "null";
  if (typeof obj === "boolean") return obj.toString();
  if (typeof obj === "number") return obj.toString();
  if (typeof obj === "string") {
    if (
      obj.includes("\n") ||
      obj.includes(": ") ||
      obj.includes("#") ||
      obj.includes("{") ||
      obj.includes("}") ||
      obj.includes("[") ||
      obj.includes("]") ||
      obj.includes(",") ||
      obj.includes("'") ||
      obj.startsWith("*") ||
      obj.startsWith("&") ||
      obj.startsWith("!") ||
      obj.startsWith("%") ||
      obj.startsWith("@") ||
      obj.startsWith("`") ||
      obj.startsWith("?") ||
      obj.startsWith("-") ||
      obj.startsWith(">") ||
      obj === "true" ||
      obj === "false" ||
      obj === "null" ||
      obj === "yes" ||
      obj === "no" ||
      obj === "" ||
      /^\d/.test(obj)
    ) {
      if (obj.includes("\n")) {
        const lines = obj.split("\n");
        return (
          "|-\n" + lines.map((line) => pad + "  " + line).join("\n")
        );
      }
      return JSON.stringify(obj);
    }
    return obj;
  }

  if (Array.isArray(obj)) {
    if (obj.length === 0) return "[]";
    const items = obj.map((item) => {
      if (typeof item === "object" && item !== null && !Array.isArray(item)) {
        const entries = Object.entries(item);
        if (entries.length === 0) return pad + "- {}";
        const [firstKey, firstVal] = entries[0];
        let result =
          pad + "- " + firstKey + ": " + formatValue(firstVal, indent + 2);
        for (let i = 1; i < entries.length; i++) {
          const [k, v] = entries[i];
          result += "\n" + pad + "  " + k + ": " + formatValue(v, indent + 2);
        }
        return result;
      }
      return pad + "- " + formatValue(item, indent + 1);
    });
    return "\n" + items.join("\n");
  }

  if (typeof obj === "object") {
    const entries = Object.entries(obj);
    if (entries.length === 0) return "{}";
    const lines = entries.map(([key, value]) => {
      const safeKey =
        key.includes(" ") ||
        key.includes(":") ||
        key.includes("#") ||
        key === ""
          ? JSON.stringify(key)
          : key;
      return pad + safeKey + ": " + formatValue(value, indent + 1);
    });
    return "\n" + lines.join("\n");
  }

  return String(obj);
}

function formatValue(value, indent) {
  if (value === null || value === undefined) return "null";
  if (typeof value === "boolean") return value.toString();
  if (typeof value === "number") return value.toString();
  if (typeof value === "string") return toYaml(value, indent - 1);
  if (Array.isArray(value)) return toYaml(value, indent);
  if (typeof value === "object") return toYaml(value, indent);
  return String(value);
}

const schemas = convertJsonSchemaToOpenAPI(jsonSchema);

const openapi = {
  openapi: "3.0.0",
  info: {
    title: "SWML Schema",
    version: "1.0.0",
    description:
      "Schema definitions for SignalWire Markup Language (SWML). This spec exposes SWML type definitions for use with the Fern <Schema> documentation component.",
  },
  paths: {
    "/swml": {
      post: {
        operationId: "validateSwml",
        summary: "SWML Object",
        description:
          "Reference endpoint exposing the SWML object schema for documentation.",
        tags: ["SWML"],
        "x-fern-ignore": true,
        requestBody: {
          required: true,
          content: {
            "application/json": {
              schema: { $ref: "#/components/schemas/SWMLObject" },
            },
          },
        },
        responses: {
          200: {
            description: "Success",
            content: {
              "application/json": {
                schema: { $ref: "#/components/schemas/SWMLObject" },
              },
            },
          },
        },
      },
    },
  },
  components: {
    schemas,
  },
};

mkdirSync(outputDir, { recursive: true });

let yaml = "";
yaml += "openapi: '3.0.0'\n";
yaml += "info:" + toYaml(openapi.info, 1) + "\n";
yaml += "paths:" + toYaml(openapi.paths, 1) + "\n";
yaml += "components:\n";
yaml += "  schemas:" + toYaml(openapi.components.schemas, 2) + "\n";

writeFileSync(outputPath, yaml);
console.log(`Generated OpenAPI spec at ${outputPath}`);
console.log(`Total schemas: ${Object.keys(schemas).length}`);
