// Tiny query helper. Every element the app touches exists in index.html, so
// we assert non-null and keep call sites terse.
export const $ = <T extends HTMLElement>(sel: string): T =>
  document.querySelector<T>(sel)!;
