#!/usr/bin/env node
/**
 * Post-emit companion to @signalwire/typespec-emit-filter for emitters that
 * cannot honor `@excludeFromEmit` (the stock @typespec/openapi3 emitter has no
 * hook for it): strips the named component schemas from an emitted OpenAPI
 * document, applying the same drop/collapse rules the filter-honoring
 * emitters apply at emit time.
 *
 * Rules:
 *   - an anyOf/oneOf arm is removed when it is a `$ref` to a target schema,
 *     or an array whose items resolve entirely to one
 *   - a union left with a single arm collapses to that bare arm, in place
 *     (kept as a one-arm union only if hoisting would clash with a key the
 *     parent already has)
 *   - the target's components/schemas entry is deleted
 *   - any target ref remaining afterwards is a hard error: a shape this
 *     script does not understand yet — extend it rather than ignore it
 *
 * Serialization matches @typespec/openapi3's serializeDocument options
 * byte-for-byte (yaml 2.8.2, singleQuote/no-alias/lineWidth 0/yaml-1.1), so
 * re-running the pipeline is a no-op and diffs stay surgical.
 *
 * Usage: node apply-emit-filter.mjs <openapi.yaml> <SchemaName> [...]
 */
import { readFileSync, writeFileSync } from "node:fs";
import { parse, stringify } from "yaml";

const [file, ...names] = process.argv.slice(2);
if (!file || names.length === 0) {
  console.error("usage: apply-emit-filter.mjs <openapi.yaml> <SchemaName>...");
  process.exit(1);
}

const refs = new Set(names.map((n) => `#/components/schemas/${n}`));
const isObj = (v) => v !== null && typeof v === "object" && !Array.isArray(v);
const isTargetOnly = (v) =>
  (isObj(v) && refs.has(v.$ref)) ||
  (isObj(v) && v.type === "array" && isTargetOnly(v.items));

let removedArms = 0;

function filterUnions(node) {
  if (Array.isArray(node)) {
    for (const item of node) filterUnions(item);
    return;
  }
  if (!isObj(node)) return;
  for (const key of ["anyOf", "oneOf"]) {
    const arms = node[key];
    if (!Array.isArray(arms)) continue;
    const kept = arms.filter((a) => !isTargetOnly(a));
    if (kept.length === arms.length) continue;
    removedArms += arms.length - kept.length;
    if (kept.length === 0) {
      throw new Error(
        `${key} emptied by filtering — the owning property must be dropped instead; extend this script`,
      );
    }
    const arm = kept[0];
    const canHoist =
      kept.length === 1 &&
      isObj(arm) &&
      Object.keys(arm).every((k) => k === key || !(k in node));
    if (canHoist) {
      // Rebuild in place so the hoisted keys keep the union's position.
      const merged = {};
      for (const [k, v] of Object.entries(node)) {
        if (k === key) Object.assign(merged, arm);
        else merged[k] = v;
      }
      for (const k of Object.keys(node)) delete node[k];
      Object.assign(node, merged);
    } else {
      node[key] = kept;
    }
  }
  for (const value of Object.values(node)) filterUnions(value);
}

const doc = parse(readFileSync(file, "utf8"));
filterUnions(doc);

for (const name of names) {
  if (!doc.components?.schemas?.[name]) {
    throw new Error(
      `component schema "${name}" not found in ${file} — stale filter argument?`,
    );
  }
  delete doc.components.schemas[name];
}

const out = stringify(doc, {
  singleQuote: true,
  aliasDuplicateObjects: false,
  lineWidth: 0,
  compat: "yaml-1.1",
});

for (const ref of refs) {
  const needle = `${ref}'`;
  if (out.includes(needle)) {
    throw new Error(
      `refs to ${ref} remain after filtering — a shape this script does not handle; extend it`,
    );
  }
}

writeFileSync(file, out);
console.log(
  `emit-filter: removed ${removedArms} union arm(s) and ${names.length} component schema(s) [${names.join(", ")}] from ${file}`,
);
