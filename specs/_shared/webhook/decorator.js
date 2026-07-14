// @webhook decorator implementation.
//
// Two-phase design that follows the canonical TypeSpec library pattern:
//
//   1. $webhook (decorator phase) — pure registration. Resolves the
//      enclosing service namespace via the compiler's listServices/
//      getService accessors, validates the target/payload, and stores a
//      per-namespace Map<name, entry> via useStateMap. No schema work,
//      no module-level mutables, no array of pending tasks.
//
//   2. $onValidate — post-checking phase, runs once after all types and
//      @tagMetadata are known. Resolves tag inheritance through getAllTags
//      (which walks operation → interface → namespace, the same chain
//      @typespec/openapi3 uses), builds the JSON Schema for each payload
//      via the schema module, and injects the consolidated `webhooks`
//      object onto the service namespace through the OpenAPI extension
//      hook (setExtension).
//
// The `setExtension(program, namespace, "webhooks", ...)` call exploits
// the fact that @typespec/openapi3 spreads the extension map onto the
// emitted document root via attachExtensions. ExtensionKey is typed
// `\`x-${string}\`` for type-checking only — the runtime accepts any
// string and lands at the OpenAPI 3.1 `webhooks` slot. This is the only
// supported integration point for injecting top-level fields without
// owning the emitter.

import {
  getDoc,
  getSummary,
  getAllTags,
  getService,
  listServices,
  isService,
} from "@typespec/compiler";
import { useStateMap } from "@typespec/compiler/utils";
import { setExtension, getTagsMetadata } from "@typespec/openapi";
import { reportDiagnostic, stateKeys } from "./lib.js";
import { buildPayloadSchema } from "./schema.js";

// ── State ─────────────────────────────────────────────────────────────

// Per-service-namespace map: webhook name → { name, target, payload, explicitTag, operationId }.
const [getWebhooks, setWebhooks] = useStateMap(stateKeys.webhooks);

// ── String helpers ────────────────────────────────────────────────────

function toSnakeCase(str) {
  return str.replace(/([A-Z])/g, "_$1").toLowerCase().replace(/^_/, "");
}

function toHumanReadable(str) {
  const words = str.replace(/([A-Z])/g, " $1").trim().split(/\s+/);
  return words
    .map((w, i) =>
      i === 0 ? w.charAt(0).toUpperCase() + w.slice(1).toLowerCase() : w.toLowerCase(),
    )
    .join(" ");
}

function parseTag(tag) {
  if (!tag) return null;
  if (typeof tag === "string") return { name: tag };
  return tag;
}

// ── Service resolution ────────────────────────────────────────────────

// Walk parent chain looking for a @service namespace. If the target is
// orphaned from any service (e.g., a free-floating Namespace), fall back
// to the single-service shortcut so common cases still work.
function findServiceNamespace(target, program) {
  let current = target;
  while (current) {
    if (current.kind === "Namespace" && isService(program, current)) return current;
    current =
      current.kind === "ModelProperty" ? current.model :
      current.kind === "Model" ? (current.namespace || current.model) :
      current.namespace ?? null;
  }
  const services = listServices(program);
  return services.length === 1 ? services[0].type : null;
}

// ── Decorator entry point ─────────────────────────────────────────────

export function $webhook(context, target, name, payload, tag, operationId) {
  const { program } = context;

  if (payload?.kind !== "Model") {
    reportDiagnostic(program, {
      code: "invalid-payload",
      target: context.decoratorTarget,
    });
    return;
  }

  const namespace = findServiceNamespace(target, program);
  if (!namespace) {
    reportDiagnostic(program, {
      code: "not-in-service",
      target: context.decoratorTarget,
    });
    return;
  }

  let webhooks = getWebhooks(program, namespace);
  if (!webhooks) {
    webhooks = new Map();
    setWebhooks(program, namespace, webhooks);
  }

  // Dedup is a feature: the same webhook name can be referenced from
  // multiple request fields without producing duplicate entries. Only
  // diagnose when a second declaration would actually change the
  // emitted shape (different payload model).
  const existing = webhooks.get(name);
  if (existing) {
    if (existing.payload !== payload) {
      reportDiagnostic(program, {
        code: "duplicate-name",
        format: { name },
        target: context.decoratorTarget,
      });
    }
    return;
  }

  webhooks.set(name, {
    name,
    target,
    payload,
    explicitTag: parseTag(tag),
    operationId,
  });
}

// ── Tag inheritance ───────────────────────────────────────────────────
//
// Build a Model → tag map by walking every operation under the service
// namespace and assigning each model reachable through the operation's
// parameters the tag returned by getTags(program, op). getTags handles
// namespace/interface inheritance natively, so we no longer have to
// special-case interface vs. namespace operations the way the previous
// implementation did.

function collectModelsFromType(type, models, seen) {
  if (!type || seen.has(type)) return;
  seen.add(type);

  if (type.kind === "Model") {
    models.add(type);
    for (const prop of type.properties?.values() || []) {
      collectModelsFromType(prop.type, models, seen);
    }
    for (const src of type.sourceModels || []) {
      collectModelsFromType(src.model, models, seen);
    }
    if (type.baseModel) collectModelsFromType(type.baseModel, models, seen);
  } else if (type.kind === "Union") {
    for (const v of type.variants?.values() || []) {
      collectModelsFromType(v.type, models, seen);
    }
  }
}

function buildModelTagMap(program, ns, map) {
  for (const op of ns.operations?.values() || []) {
    assignTagToOpModels(program, op, map);
  }
  for (const iface of ns.interfaces?.values() || []) {
    for (const op of iface.operations?.values() || []) {
      assignTagToOpModels(program, op, map);
    }
  }
  for (const child of ns.namespaces?.values() || []) {
    buildModelTagMap(program, child, map);
  }
  return map;
}

function assignTagToOpModels(program, op, map) {
  // getAllTags walks operation → interface → namespace and returns the
  // union of every @tag on the chain. getTags (which we used previously)
  // returns only direct tags, which silently dropped interface-level tags
  // like @tag(CALLS_TAG) on `interface Calls`.
  const tags = getAllTags(program, op);
  if (!tags || tags.length === 0) return;
  const tagName = tags[0];

  const models = new Set();
  const seen = new Set();
  for (const param of op.parameters?.properties?.values() || []) {
    collectModelsFromType(param.type, models, seen);
  }
  for (const model of models) {
    if (!map.has(model)) map.set(model, tagName);
  }
}

function inheritedTagFor(target, modelTagMap) {
  if (target.kind !== "ModelProperty") return undefined;
  return modelTagMap.get(target.model);
}

// Auto-create a tag entry on the service namespace's @tagMetadata map
// if the resolved tag isn't already declared. Mutates the live state-map
// reference returned by getTagsMetadata — @typespec/openapi does not
// export setTagsMetadata, so this is the only avenue. The reference
// contract is stable because @typespec/openapi's useStateMap getter
// returns the underlying object directly.
function ensureTag(program, namespace, tagName, tagMetadata) {
  const tags = getTagsMetadata(program, namespace);
  if (!tags) return;
  if (tags[tagName]) return;
  tags[tagName] = tagMetadata || {};
}

// ── OpenAPI emitter options ───────────────────────────────────────────
//
// Mirrors what @typespec/openapi3's resolveOptions(EmitContext) returns,
// but read directly from compilerOptions because $onValidate runs before
// any EmitContext exists. We pull only the options the schema walker
// cares about. When multi-version emit is configured, pick the highest
// version — schemas are emitted once, regardless of how many versions
// the emitter is asked to produce. Defaults match @typespec/openapi3:
// version "3.0.0", seal-object-schemas false.

function getOpenAPI3Options(program) {
  // The OpenAPI document may be emitted by stock @typespec/openapi3 or by the
  // @signalwire/typespec-openapi3 wrapper (which delegates to it and takes the
  // same options) — read whichever is configured.
  const all = program?.compilerOptions?.options ?? {};
  const raw = all["@signalwire/typespec-openapi3"] ?? all["@typespec/openapi3"] ?? {};

  let version = "3.0.0";
  const versions = raw["openapi-versions"];
  if (Array.isArray(versions) && versions.length > 0) {
    if (versions.includes("3.2.0")) version = "3.2.0";
    else if (versions.includes("3.1.0")) version = "3.1.0";
  }

  return {
    version,
    sealObjectSchemas: raw["seal-object-schemas"] === true,
  };
}

// ── $onValidate: assemble webhooks and inject ─────────────────────────

export function $onValidate(program) {
  const services = listServices(program);
  if (services.length === 0) return;
  const options = getOpenAPI3Options(program);

  for (const service of services) {
    const webhooks = getWebhooks(program, service.type);
    if (!webhooks || webhooks.size === 0) continue;

    const modelTagMap = buildModelTagMap(program, service.type, new Map());
    const out = {};

    for (const [name, entry] of webhooks) {
      const post = {
        operationId: entry.operationId ?? toSnakeCase(name),
        summary: getSummary(program, entry.payload) ?? toHumanReadable(name),
        requestBody: {
          required: true,
          content: {
            "application/json": {
              schema: buildPayloadSchema(program, entry.payload, options),
            },
          },
        },
        responses: { 200: { description: "Webhook received" } },
      };

      const description = getDoc(program, entry.payload);
      if (description) post.description = description;

      const tagName =
        entry.explicitTag?.name ?? inheritedTagFor(entry.target, modelTagMap);
      if (tagName) {
        post.tags = [tagName];
        let metadata;
        if (entry.explicitTag) {
          const { name: _ignored, ...rest } = entry.explicitTag;
          metadata = Object.keys(rest).length > 0 ? rest : undefined;
        }
        ensureTag(program, service.type, tagName, metadata);
      }

      out[name] = { post };
    }

    setExtension(program, service.type, "webhooks", out);
  }
}
