import { isSelfExcluded } from "@signalwire/typespec-emit-filter";
import { listWebhooks, WEBHOOK_ROUTE_PREFIX } from "@signalwire/typespec-webhook";
import {
  createTypeSpecLibrary,
  emitFile,
  getExamples,
  getNamespaceFullName,
  interpolatePath,
  navigateProgram,
  NoTarget,
  type EmitContext,
  type Model,
  type Namespace,
  type Program,
  type Type,
} from "@typespec/compiler";
import { getHttpOperation, isHeader, isStatusCode } from "@typespec/http";
import {
  getOpenAPI3,
  resolveOptions,
  $lib as openapi3Lib,
  type OpenAPI3ServiceRecord,
  type OpenAPIDocument3_1,
} from "@typespec/openapi3";
import { stringify } from "yaml";

/**
 * `@typespec/openapi3` wrapped with behaviours the stock emitter has no hook
 * for (a third, example metadata stripping, is documented on
 * `stripMetadataFromExamples`):
 *
 * 1. **`@excludeFromEmit` honoring** — types marked with the bare (self-exclusion)
 *    form are removed from the program in place before emit: union variants of
 *    (or arrays of) an excluded type are deleted, and a property typed as one is
 *    dropped. A union left with a single variant collapses in the stock emitter's
 *    own single-member handling, and an excluded type that is no longer
 *    referenced is simply never emitted as a component.
 *
 * 2. **`@webhook` lifting** — OpenAPI 3.1 has a top-level `webhooks` object that
 *    TypeSpec does not model (microsoft/typespec#4736 is open, `design:needed`,
 *    on Backlog). Operations marked `@webhook` are parked on a synthetic route by
 *    that decorator, emitted by the stock emitter as ordinary paths — which is
 *    what gives them real schemas, `$ref`s into `components`, tags and examples —
 *    and then moved here from `paths` into `webhooks`.
 *
 * Lifting after the fact, rather than hand-building the webhook entries, is the
 * whole point: it means webhook payloads go through the *same* schema emitter as
 * everything else instead of a parallel implementation that drifts every time
 * TypeSpec changes how it renders a schema.
 *
 * In-place mutation for (1) is safe because emit runs after checking completes
 * (the type graph is not frozen) and this emitter owns the whole compilation —
 * pair it with other emitters in one compilation only if they should see the
 * same filtered view.
 *
 * The scoped form `@excludeFromEmit(...types)` is NOT honored by this wrapper:
 * scoping would require cloning the subgraph per consumer, which the stock
 * emitter cannot be handed. Self-exclusion is global by definition, so
 * in-place removal matches its semantics exactly.
 */
export const $lib = createTypeSpecLibrary({
  name: "@signalwire/typespec-openapi3",
  diagnostics: {
    "webhook-not-lifted": {
      severity: "error",
      messages: {
        default:
          "Internal: a @webhook operation was not found in the emitted paths, so it could not be lifted into `webhooks`. The synthetic webhook route would leak into the published document.",
      },
    },
    "webhook-route-leaked": {
      severity: "error",
      messages: {
        default:
          "Internal: a synthetic webhook route survived into the emitted document's `paths`.",
      },
    },
  },
  emitter: { options: openapi3Lib.emitter!.options as any },
});

const { reportDiagnostic } = $lib;

/** True when `t` is, or is an array of, a self-excluded type. */
function isDropped(program: Program, t: Type): boolean {
  if (isSelfExcluded(program, t)) return true;
  if (t.kind === "Model" && t.name === "Array" && t.indexer) {
    return isDropped(program, t.indexer.value);
  }
  return false;
}

function stripSelfExcluded(program: Program): void {
  navigateProgram(program, {
    union(union) {
      const dropped = [...union.variants.entries()].filter(([, variant]) =>
        isDropped(program, variant.type),
      );
      for (const [key] of dropped) union.variants.delete(key);
    },
    modelProperty(property) {
      if (isDropped(program, property.type)) {
        property.model?.properties.delete(property.name);
      }
    },
  });
}

/**
 * Drop HTTP envelope metadata from model `@example` values.
 *
 * A response model such as `model X is StatusCode422` carries
 * `@statusCode statusCode: 422`, so the checker requires every `@example` on it
 * to include `statusCode` too. The stock emitter strips that property from the
 * component schema (it is a status code, not part of the body) but serializes
 * the example verbatim, so the published example shows a `statusCode` field the
 * schema forbids and the API never returns. Removing `@statusCode` and `@header`
 * entries from the example value before emit keeps the example and the schema
 * describing the same body.
 */
function stripMetadataFromExamples(program: Program): void {
  navigateProgram(program, {
    model(model) {
      const examples = getExamples(program, model);
      if (examples.length === 0) return;

      const metadataNames: string[] = [];
      for (let current: Model | undefined = model; current; current = current.baseModel) {
        for (const property of current.properties.values()) {
          if (isStatusCode(program, property) || isHeader(program, property)) {
            metadataNames.push(property.name);
          }
        }
      }
      if (metadataNames.length === 0) return;

      for (const example of examples) {
        if (example.value.valueKind !== "ObjectValue") continue;
        for (const name of metadataNames) example.value.properties.delete(name);
      }
    },
  });
}

function sortObjectByKeys<T extends object>(obj: T): T {
  return Object.fromEntries(
    Object.entries(obj).sort(([a], [b]) => (a < b ? -1 : a > b ? 1 : 0)),
  ) as T;
}

/**
 * Move every `@webhook` operation out of `document.paths` and into
 * `document.webhooks`, keyed by the name the decorator registered.
 *
 * The path is resolved through `getHttpOperation` rather than by rebuilding the
 * route string, so any namespace-level `@route` prefix is accounted for and a
 * miss is a real error rather than a silent no-op.
 */
function liftWebhooks(
  program: Program,
  document: OpenAPIDocument3_1,
  serviceNamespace: Namespace,
): void {
  const webhooks = listWebhooks(program);
  if (webhooks.size === 0) return;

  const lifted: NonNullable<OpenAPIDocument3_1["webhooks"]> = {};

  for (const [operation, name] of webhooks) {
    // A webhook belonging to another service in the same compilation simply
    // isn't part of this document — skip it rather than reporting a miss.
    if (!isUnder(operation.namespace, serviceNamespace)) continue;

    const [httpOperation] = getHttpOperation(program, operation);
    const pathItem = document.paths?.[httpOperation.path];

    if (!pathItem) {
      reportDiagnostic(program, { code: "webhook-not-lifted", target: operation });
      continue;
    }

    lifted[name] = pathItem;
    delete document.paths![httpOperation.path];
  }

  if (Object.keys(lifted).length === 0) return;

  document.webhooks = { ...(document.webhooks ?? {}), ...lifted };
}

/** True when `ns`, or one of its ancestors, is `ancestor`. */
function isUnder(ns: Namespace | undefined, ancestor: Namespace): boolean {
  for (let current = ns; current; current = current.namespace) {
    if (current === ancestor) return true;
  }
  return false;
}

/** Guard against a synthetic route reaching the published document. */
function assertNoLeakedRoutes(program: Program, document: OpenAPIDocument3_1): void {
  for (const path of Object.keys(document.paths ?? {})) {
    if (path.startsWith(WEBHOOK_ROUTE_PREFIX)) {
      reportDiagnostic(program, { code: "webhook-route-leaked", target: NoTarget });
    }
  }
}

function sortDocument(document: OpenAPIDocument3_1): void {
  if (document.paths) document.paths = sortObjectByKeys(document.paths);
  if (document.webhooks) document.webhooks = sortObjectByKeys(document.webhooks);
  if (document.components?.schemas) {
    document.components.schemas = sortObjectByKeys(document.components.schemas);
  }
  if (document.components?.parameters) {
    document.components.parameters = sortObjectByKeys(document.components.parameters);
  }
}

function serializeDocument(document: OpenAPIDocument3_1, fileType: "yaml" | "json"): string {
  sortDocument(document);
  switch (fileType) {
    case "json":
      return JSON.stringify(document, null, 2) + "\n";
    case "yaml":
      return stringify(document, {
        singleQuote: true,
        aliasDuplicateObjects: false,
        lineWidth: 0,
        compat: "yaml-1.1",
      });
  }
}

export async function $onEmit(context: EmitContext): Promise<void> {
  const { program } = context;
  stripSelfExcluded(program);
  stripMetadataFromExamples(program);

  const options = resolveOptions(context as Parameters<typeof resolveOptions>[0]);

  // getOpenAPI3 flattens its results across every requested OpenAPI version and
  // drops the association back to the version that produced each one, so ask for
  // one version at a time. This matches what the stock emitter does internally
  // (a fresh emitter instance per spec version) — no extra work, and it keeps
  // `{openapi-version}` in output-file resolvable.
  for (const specVersion of options.openapiVersions) {
    const serviceRecords: OpenAPI3ServiceRecord[] = await getOpenAPI3(program, {
      ...(context.options as object),
      "openapi-versions": [specVersion],
    });

    for (const serviceRecord of serviceRecords) {
      if (serviceRecord.versioned) {
        for (const documentRecord of serviceRecord.versions) {
          program.reportDiagnostics(documentRecord.diagnostics);
        }
      } else {
        program.reportDiagnostics(serviceRecord.diagnostics);
      }
    }

    if (program.compilerOptions.dryRun || program.hasError()) return;

    const multipleService = serviceRecords.length > 1;

    const resolveOutputFile = (
      service: OpenAPI3ServiceRecord["service"],
      fileType: string,
      version?: string,
    ): string =>
      interpolatePath(options.outputFile, {
        "openapi-version": specVersion,
        "service-name-if-multiple": multipleService
          ? getNamespaceFullName(service.type)
          : undefined,
        "service-name": getNamespaceFullName(service.type),
        "file-type": fileType,
        version,
      });

    const write = async (
      document: OpenAPIDocument3_1,
      service: OpenAPI3ServiceRecord["service"],
      fileType: "yaml" | "json",
      version?: string,
    ) => {
      liftWebhooks(program, document, service.type);
      assertNoLeakedRoutes(program, document);
      await emitFile(program, {
        path: resolveOutputFile(service, fileType, version),
        content: serializeDocument(document, fileType),
        newLine: options.newLine,
      });
    };

    for (const serviceRecord of serviceRecords) {
      for (const fileType of options.fileTypes) {
        if (serviceRecord.versioned) {
          for (const documentRecord of serviceRecord.versions) {
            await write(
              documentRecord.document as OpenAPIDocument3_1,
              serviceRecord.service,
              fileType,
              documentRecord.version,
            );
          }
        } else {
          await write(
            serviceRecord.document as OpenAPIDocument3_1,
            serviceRecord.service,
            fileType,
          );
        }
      }
    }
  }
}
