/**
 * Inline single-element OpenAPI 3.1 schema-level `examples:` arrays as
 * singular `example:` so openapi-to-postmanv2 / json-schema-faker actually
 * uses them.
 *
 * Why:
 *   openapi-to-postmanv2 v6.0.1 reads `example:` (singular) but NOT the
 *   OpenAPI 3.1 / JSON Schema 2020-12 `examples:` array form at the schema
 *   property level. Result: ~4k curated example values across the SignalWire
 *   specs are silently replaced with faker-generated placeholders in the
 *   published Postman collection. This preprocessor closes that gap.
 *
 * Scope:
 *   Mutates a parsed OpenAPI document in place. Only touches nodes where:
 *     - `examples` is an array (the 3.1 schema-level form — NOT the
 *       OpenAPI 3.0 `examples:` object map at request/response body level,
 *       which the converter already handles correctly).
 *     - The array has exactly one element. Multi-element arrays are left
 *       alone so a future spec change adding alternates isn't silently
 *       collapsed; that property falls back to current faker behavior.
 *     - `example` (singular) is not already set. A hand-written `example:`
 *       always wins.
 */

/**
 * @param {unknown} node - Any node in the parsed OpenAPI doc.
 * @returns {number} Count of inlines performed (useful for sanity logging).
 */
export function inlineSingleExamples(node) {
  let count = 0;

  function visit(n) {
    if (Array.isArray(n)) {
      for (const item of n) visit(item);
      return;
    }
    if (n && typeof n === 'object') {
      if (
        Array.isArray(n.examples) &&
        n.examples.length === 1 &&
        n.example === undefined
      ) {
        n.example = n.examples[0];
        delete n.examples;
        count++;
      }
      for (const value of Object.values(n)) visit(value);
    }
  }

  visit(node);
  return count;
}
