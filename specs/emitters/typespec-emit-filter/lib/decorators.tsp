using TypeSpec.Reflection;

namespace SignalWire.EmitFilter;

/**
 * Mark a scope so that, when emitted, the given type(s) are removed as allowed
 * values within that scope. Acts as a watcher at the depth it is set:
 *
 * - on a **model** it walks the whole model subtree,
 * - on a **property** it applies to that property only,
 * - on a **union** it applies to that union's arms.
 *
 * A union left with a single arm after removal collapses to that bare type.
 *
 * Honoring is per-emitter: emitters that do not recognize this decorator simply
 * ignore it, so the decorated source type and other emitters' output are
 * unaffected. This lets a shared model be imported and emitted as a filtered
 * variant for one target without changing the model or any other consumer.
 *
 * @param excludedTypes One or more types to strip from the decorated scope.
 *
 * @example
 * ```typespec
 * @excludeFromEmit(SWML.Calling.SWMLVar)
 * model AiBehaviorParams {
 *   ...SWML.Calling.AIParams;
 * }
 * ```
 */
extern dec excludeFromEmit(target: Model | ModelProperty | Union, ...excludedTypes: unknown[]);
