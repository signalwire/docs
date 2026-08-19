---
paths:
  - "fern/assets/images/img/*.svg"
  - "fern/**/*.mdx"
---

# Diagram authoring

## Themed SVG diagrams

Applies to hand-authored SVG diagrams under `fern/assets/images/img/`.
Exemplar: `ai-agent-flow-themed.svg`.

### One file, both modes

Author a single themed SVG and embed it as a plain `<img>`. Do not ship a
`.light-only` / `.dark-only` pair — that pattern is for diagrams whose brand
colors must not be inverted, not for new work.

### How theming works

The site sets `color-scheme` on `html`; it inherits to the `img`, and the
browser propagates it into the SVG's own document. So
`@media (prefers-color-scheme: dark)` *inside the SVG* tracks Fern's theme
toggle. Where a browser hasn't implemented that propagation it falls back to
the OS preference, which is what the toggle defaults to anyway.

### Colors

- Custom properties do not cross document boundaries. Nothing from the page
  reaches an img-embedded SVG — not Fern's `--accent`, not `--grayscale-*`.
  Redefine every value inside the SVG as a literal brand hex.
- `var()` is invalid in SVG presentation attributes. Never write
  `fill="var(--x)"`. Put colored fills and strokes in CSS classes in the SVG's
  `<style>` block, and keep the mode-dependent values as custom properties on
  one wrapper class (see `.swflow-theme`).
- Brand values in use: `--sw-fuchsia: #F72A72`, `--sw-purple: #601BE6`.
  Light ink `#070c2d`, chip `#044EF4`, on-chip `#ffffff`. Dark ink `#f0f0f4`,
  chip `#40E0D0`, on-chip `#0e0e18`. Caller icon matches ink in light mode,
  matches the chip color in dark mode.

### Filename

Keep the word `diagram` **out** of the filename. `styles.css` inverts
`img.diagram` and `[src*="diagram"]` for dark mode, which wrecks a themed SVG.
Name it `<subject>-themed.svg`.

### Motion

Guard every animation with
`@media (prefers-reduced-motion: reduce) { … { animation: none; } }`.

### Embedding

- Plain `<img>` with meaningful alt text. **No `<Frame>`** — its border artifact
  shows in both themes and is worse in dark mode.
- Needs a caption? Put it as a sentence in the prose above the image, not a
  `<Frame caption>`.
- Wrap the `<img>` in `<llms-ignore>` and pair it with an `<llms-only>` mermaid
  block carrying the same information. An SVG reaches agents only as a link.

### When not to use SVG

Mermaid is fine for anything whose source is already text and whose labels are
short. Reach for a themed SVG when Mermaid truncates long node text or when the
diagram carries brand weight.

## Information diagrams in LLM exports

Raster diagrams render as image links in the Markdown endpoint. Give human and agent readers equivalent information:

- Put the complete `<Frame>` that contains an information-bearing raster diagram inside `<llms-ignore>`.
- Follow it immediately with `<llms-only>` containing an equivalent in Mermaid or structured Markdown. Preserve the original entities, sequence, branches, labels, and direction; do not substitute a generic summary for relationships visible in the image.
- Choose the format that preserves the information most precisely. Use `sequenceDiagram` for messages between actors and `flowchart` for processes and decisions, but prefer an ordered list or table when it represents exact steps, ordering, or labels more faithfully.
- Do not infer relationships from visual placement alone. A grid or grouped layout may be organizing information rather than defining branches or connections.
- A standalone `<llms-ignore>` is allowed for a screenshot only when the adjacent prose already states every action or value needed to complete the task.
- Do not pair Mermaid source with these tags. Mermaid already exports as readable source.

Keep the visibility tags at column 0 with blank lines inside and around each block, as specified in `mdx-mechanics.md`.
