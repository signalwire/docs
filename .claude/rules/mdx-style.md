---
paths:
  - "fern/**/*.mdx"
  - "fern/**/*.md"
---

# Writing style — SignalWire docs

How pages should read. Mechanics: `mdx-mechanics`; components: `mdx-components`; ParamField/reference patterns: `mdx-reference-pages`; what's generated vs editable: `docs-conventions`.

## Page types (Diátaxis) [D]

Pick by asking: is the reader **learning or working**, and do they need **action or understanding**?

- **Tutorial** (learning + action; get-started paths): a lesson that guarantees a working result. One path, concrete steps, visible progress early. Voice: encouraging and steady — build the reader's confidence. Keep out: options, digressions, theory.
- **How-to guide** (working + action): starts from a goal, assumes setup. Voice: direct. Verb-first title, conditions before instructions, only meaningful choices. Keep out: re-teaching basics (link them), exhaustive edge cases.
- **Reference** (working + lookup): austere, neutral, factual, complete, structured like the product. Keep out: persuasion, instruction beyond usage notes.
- **Explanation** (learning + understanding): why it works this way. Voice: discursive and reflective — the one place tradeoffs, background, and opinions belong. Keep out: step-by-step procedures.

One page, one type. Smells: a tutorial or how-to that keeps stopping to explain (move the theory to an explanation page or one short aside, and link it); reference written as instructions; one page trying to be all four types (split it); a guide with no onward links.

## Voice

- Second person, present tense, active voice. The platform acts ("SignalWire sends…"); no editorial "we". Contractions welcome. [G][MS][SW]
- Sentence-case headings, no end punctuation ("Next steps", never "Next Steps"). [G][MS][SW]
- Open with a concrete hook — the problem or the outcome — never "In this guide, you will learn…". Close guides with `## Next steps` cards that deepen *this* topic only. [SW]
- Vary sentence length and openers: split sentences past ~30 words, and don't start consecutive sentences the same way. [AS][MS]
- Cut filler ("in order to", "it is important to note that", "due to the fact that") and reflexive hedging — state what the source supports, plainly, or don't state it. [AS][G]
- Prose is the default; bullets only for true enumerations, kept parallel in form — never bold-label bullets as a paragraph substitute. [W][AS][SW]
- No paragraph-closing summary sentences or significance tails ("…, highlighting the importance of…"). No "Additionally/Furthermore/Moreover" openers; no "In conclusion/Overall" closers. [W][AS]
- State facts plainly: "is", not "serves as"/"stands as". No significance inflation ("plays a crucial role"), no marketing adjectives (powerful, seamless, robust), no empty "not just X, but Y". [W][G][SW]
- No "simply/easily/just" and no "please" in instructions. [G]
- Em-dashes are a house device — but not several per paragraph. [MS][SW] Aphorisms land at 2–3 per page, max. [SW] (judgment)
- No emoji — not in headings, tab/card titles, or prose. Say good/bad in words. [SW]
- Terminology: "Server SDKs" (never "Agents SDK"); tokens are *created*/*issued* (never *minted*); "resource addresses" (never "Fabric addresses"); expand every acronym at first use. [SW]

## Grounding [SW]

- Every fact traces to specs, source, the dashboard, or a ticket. Can't verify? Write `[NEEDS SOURCE: what's missing]` — never guess. Never invent params, endpoints, components, or behavior.
- Customer-facing only: no internal implementation detail (backend endpoints, transports, engine-side params). Placeholder data only — no real names, emails, or domains.
- Examples do real work: tool call → your server → system of record → response. No knowledge-trivia bots.
- Don't cite other vendors' docs as authority; never disparage anyone's product.

## Modes

- **New page**: pick the type above, then mirror the best sibling page of that type; frontmatter per `mdx-mechanics`.
- **Editing**: everything you write or rewrite follows these rules; leave untouched text alone and flag its violations in your summary instead. Preserve meaning, structure, and length unless asked. "Polish" means structural first — mental model, complete example — then sentences.
- Legacy-page tells (strip from parts you rewrite; don't sweep the rest without an explicit cleanup task): `id:`/`x-custom`/`ported_from_readme` frontmatter, "In this guide…" intros, editorial "we", Title-Case headings. [SW]

*Sources: [D] Diátaxis · [G] Google dev-docs style guide · [MS] Microsoft style guide · [W] Wikipedia "Signs of AI writing" · [AS] agent-style (ideas reimplemented) · [SW] this repo (census + house feedback, 2026). Unmarked rules always apply; (judgment) = discretionary. Deep reference: `.claude/docs/mdx-style-reference.md`.*
