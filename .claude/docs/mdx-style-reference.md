# MDX style — deep reference

The five rules in `.claude/rules/` (`mdx-style`, `mdx-mechanics`, `mdx-components`, `mdx-reference-pages`, `docs-conventions`) are the binding contract and auto-load on MDX work. This file is the rationale and depth behind them: read it when doing dedicated style work (polishing a page, writing a new guide from scratch, adjudicating a style dispute), not for routine edits. Nothing in `.claude/docs/` auto-loads. Built 2026-07-21 from a five-track research pass (Claude Code docs, this repo's 2,801-page corpus, Fern's docs source, and external style-guide research); the full source-evaluation and per-rule provenance tables are recorded in the PR that introduced these rules.

## Diátaxis in depth

The compass: **action vs cognition** (is the reader doing or understanding?) × **acquisition vs application** (studying or working?). Tutorial = action+acquisition; how-to = action+application; reference = cognition+application; explanation = cognition+acquisition.

| Type | Tone | Title shape | Success looks like | Must stay out |
|---|---|---|---|---|
| Tutorial | Encouraging, steady, confidence-building | "Get started with X" | The reader *finishes* with something working | Options, alternatives, theory, abstraction |
| How-to | Direct, economical | Verb-first: "Route inbound calls…" | The reader's *goal* is met; usability beats completeness | Teaching basics, concept essays, history |
| Reference | Austere, neutral, precise | The symbol's exact name | The fact is findable and correct; structure mirrors the product | Persuasion, instruction, opinion |
| Explanation | Conversational, reflective | "About X", "Why X works this way" | The reader's mental model improves | Step-by-step, exhaustive detail |

Diátaxis prescribes first-person-plural "we" for tutorials (the guiding-hand tone). **House deviation: we use "you" everywhere** — the corpus is uniformly second-person and the newest, best pages prove it works.

Anti-pattern smells (names from developer-docs-framework, kept for their diagnostic value):

- **Kitchen Sink Page** — one page trying to be all four types. Split it.
- **Lecture Tutorial** — a tutorial that keeps stopping to explain. Move theory out; keep the reader moving.
- **Disguised How-To** — reference material written as instructions ("To configure X, do…"). References state; how-tos instruct.
- **Dead End** — a page with no onward links. Guides close with topical Next steps.
- **Feature Mirror** — guides organized by product feature instead of user goal.

## House voice profile (corpus evidence, 2,801 pages)

The corpus is two populations, not two opinions: modern-authored pages already match the target voice; nearly all drift sits on legacy ReadMe-ported pages (markers: `id:` UUID ×412 pages, `x-custom`/`ported_from_readme` ×55). The voice rules mostly *defend won ground* — classic AI tells are near-zero on modern pages (Furthermore ×0, Moreover ×1, In conclusion ×0).

Tone anchors — what the target voice sounds like:

> "Ask a language model what a ride across town costs and it will answer with a confident, plausible, invented number. Put that model on your phone line, and its invented number becomes your price." — `platform/pages/ai/guides/tool-calling/index.mdx`

> "A prompt is a suggestion, and code is a constraint." — same page

> "Data in the prompt is *recalled* by the model, approximately, while data from a function call is *returned* by your code, exactly." — `platform/pages/ai/guides/best-practices-for-ai/index.mdx`

> "Match the credential's reach to the trust level of whoever holds it. If a credential can dial anyone, then anyone who can read it can dial anyone…" — `browser-sdk/pages/v4/guides/getting-started/authentication.mdx`

Dated contrast (what to grow away from): "In order to send an SMS from a FreeSWITCH dialplan extension, we need to do a few things:" — editorial "we", filler opener, no components, no Next steps.

Ranked corpus inconsistencies (evidence for the rules; cleanup is a separate, explicitly-ordered task — never fold it into other edits):

1. Frontmatter shape drift: legacy `id:` ×412; `description` missing ×~178; `max-toc-depth` missing ×~194; `Author`/`author` casing split; `position` beyond overviews ×113 (legitimized for ordered sequences).
2. Body `# H1` ×123 pages (98 in server-sdks reference).
3. Title-Case headings persist ("## Next Steps" ×5, "## Getting Started" ×3), concentrated in server-sdks/platform.
4. Icon syntax three ways: short `regular x` ×129 (modern, now standard), full `fa-regular fa-x` ×65, bare ×37.
5. "In this guide" intros ×15.
6. Marketing vocab on legacy/landing: powerful ×39, seamless ×17, simply ×16, Let's ×35.
7. Bold-label bullets ×113 lines (param enumerations are legitimate; prose-substitutes aren't).
8. `<Cards>` stragglers ×2 (house standard is `<CardGroup>`).

Em-dashes are a deliberate house device (1,153 uses across 365 files) — the rule restricts chains, never the character. Reference-style link definitions (`[key]: /docs/…`, ×3,180) are the house pattern for link-heavy pages.

## Extended voice rules (apply during dedicated polish; too fine-grained for the always-on rule)

- **End-stress**: put the newsworthy word at the end of the sentence, where emphasis naturally falls.
- **Front-load for scanning**: first words of headings, list items, and paragraphs carry the keywords (Microsoft).
- **Start statements with verbs; cut "you can" when it adds nothing; avoid "there is/are/were"** (Microsoft).
- **Fragments are fine** when they sharpen ("Ready to dial? Create a token first.") — write like you speak, read it aloud (Microsoft).
- **Oxford comma**, always (Google + Microsoft agree).
- **Avoid Latin abbreviations** in prose: "for example", not "e.g."; "that is", not "i.e." (Kubernetes/Google).
- **Calibrated claims**: match the claim to the evidence; no "dramatically improves", no reflexive "may potentially".
- **Filler phrases to cut on sight**: in order to → to; due to the fact that → because; at this point in time → now; it may be necessary to → you may need to; in the event that → if.
- **Abstract-category crutches** ("factors", "aspects", "considerations", "elements") usually hide a missing concrete noun — name the thing instead.
- Orwell's escape hatch governs all of it: break any rule sooner than write something barbarous.

## Anti-AI-tell shortlist (cross-checked, with weights)

Weights = independent credible sources agreeing. [W] Wikipedia "Signs of AI writing" (community-maintained, explicitly descriptive-not-prescriptive); [Kob] Kobak et al. excess-vocabulary studies (empirical); [Svy] arXiv AI-linguistics survey; [Ed] editorial/detector cluster (lower credibility, mutually corroborating).

- ★★★ Significance inflation: "testament to", "plays a crucial role", "underscores", "pivotal". [W][Kob][Ed]
- ★★★ Promotional register / copula avoidance: "serves as", "stands as", "boasts" instead of "is"; "showcasing", "enhancing". [W][Kob][Ed]
- ★★ Empty "not just X, but Y" parallelism (degree matters — human listicles do it too). [W][Ed]
- ★★ Bold-label bullet spam and over-bolded "key takeaways". [W][Ed]
- ★★ Paragraph-ending summaries and "-ing" participle tails ("…, highlighting the importance of…"). [W][Ed]
- ★★ "In conclusion / Overall" closers; outline-shaped endings ("Challenges", "Future Outlook"). [W][Ed]
- ★★ Excessive hedging / weasel attributions ("studies suggest", "experts argue"). [W][Ed]
- ★★ Rule-of-three overuse — a legitimate device; only its frequency tells. [W][Ed]
- ★1.5 Stacked transition openers (Additionally/Moreover/Furthermore) — direction credible, published magnitudes are unverified SEO stats. [Ed][W partial]
- ★1.5 Uniform sentence rhythm ("burstiness" is a detector-derived metric — treat as a vary-your-rhythm heuristic, not a measure). [Ed][Svy partial]

Deliberately **not** rules, and why:

- **Vocabulary ban lists**: the overused set shifts by era (2023 "delve/intricate" → mid-2025 "enhance/showcasing" — Kobak), and models are trained around flagged words. Structural tells age better.
- **Em-dashes**: Microsoft *prescribes* them (unspaced); the house uses them deliberately. Only chains/overuse tell.
- **Contractions**: not an AI tell in either direction; every adopted guide encourages them.
- **"Elegant variation"**: contested — Wikipedia flags synonym-cycling while the academic survey finds AI *lower* in lexical diversity; era/model-dependent, so unstable.
- Wikipedia's own warning applies to us directly: don't merely mask the signs (that just makes detection harder) — fix the writing. And human writing is drifting toward these patterns, so every tell decays; prefer rhythm/variety heuristics over fixed lists.

## Fern platform notes (verified from Fern's docs source — `temp/fern-docs`, pull before re-verifying)

- **LLM surface**: every page is served as Markdown (append `.md`/`.mdx` to the URL, or `Accept: text/markdown`); `llms.txt` is auto-generated (one description + URL per page; `description` frontmatter feeds it, `subtitle` is the fallback). `llms-full.txt` is deprecated upstream. A per-page agent directive is auto-prepended (configurable under the `agents` key in docs.yml; ours points agents at signalwire.com/docs/llms.txt).
- **llms.txt query params**: `?lang=python` (and aliases) filters SDK code examples; `?excludeSpec=true` drops OpenAPI/AsyncAPI sections; combinable.
- **`<llms-only>` / `<llms-ignore>`**: served-time filters. `<llms-only>` shows only on LLM endpoints; `<llms-ignore>` shows only to humans (still indexed by Ask Fern/search). Fern's principle: "UI-only elements belong to human readers, and their programmatic equivalents belong to AI agents" — pair them. Zero uses in our corpus as of 2026-07-21; the mechanics rule seeds the practice.
- **Endpoint components render as fenced code** in the `.md` view — snippets degrade gracefully; images/SVGs don't (agents get a bare link), hence the text-equivalent rule.
- **Visibility**: `noindex: true` (frontmatter) = out of llms.txt + search engines, still in nav; `hidden: true` (nav yml) = also out of the sidebar, direct URL only; endpoint-level `hidden` exists in api layouts.
- **Snippets**: `fern/snippets/**`, included via `<Markdown src="…" />`; snippets accept `{{parameterName}}` substitution.
- **Official frontmatter keys** (beyond our required four): `sidebar-title`, `subtitle`, `last-updated`, `edit-this-page-url`, `image`, `hide-toc`, `hide-nav-links`, `hide-feedback`, `hide-page-actions`, `logo`, `layout`, `availability`, `tags`, SEO block. `position` is repo-proven for folder-nav ordering.
- **Full default component library** (29): Accordion(Group), Anchor, Aside, Badge, Button, Callout, Card(Group), CodeBlock(s), Copy, Download, EndpointRequestSnippet, EndpointResponseSnippet, EndpointSchemaSnippet, Files, Frame, Icon, If, Indent, ParamField, Prompt, RunnableEndpoint, Schema, SchemaSnippet, Markdown (snippets), Steps/Step, Tabs/Tab, Tooltip, Versions, WebhookPayloadSnippet. House usage boundaries: `mdx-components` rule.
- **Version skew**: this repo pins fern-api 5.67.1; the clone tracks latest. The llms tags filter at serve time on the hosted platform (low pin risk); anything else found upstream-only needs a render check before first use.

## Evaluated and rejected — don't relitigate without new evidence

- **agent-style's contraction ban, Title-Case rule, and blanket substitutions** ("functionality", "methodology"): academic defaults; every adopted SaaS guide and this corpus contradict them. Its structural rules were adopted — reimplemented in our own words, since the repo has no license.
- **Banned-word lists as a strategy**: AI-overused vocabulary shifts by era (Kobak et al.) and models train around flagged words — structural tells only.
- **Diátaxis's tutorial-"we"**: house voice is "you" everywhere, corpus-proven.
- **skills.sh registry**: no documentation-prose/Diátaxis skill with real adoption existed (2026-07); the popular adjacents were off-target.
- **PatrickJS/awesome-cursorrules** (40K★): zero prose-voice content — tooling rules only. **steipete/agent-rules**: archived 2026-05; doc-generation mechanics, not style.
- **anivar/developer-docs-framework as a dependency**: 7★, stale, unclear license — its tone table and smell names were borrowed as structure only.
- **Vale prose linting**: parked, not rejected — no linter infra in the repo; revisit if prose regressions start getting past review.
- **`llms-full.txt`**: deprecated by Fern upstream; per-page `.md` views + `llms.txt` are the mechanism.

When revising the anti-AI-tell rules, re-verify against the current era first — Wikipedia's "Signs of AI writing" and recent excess-vocabulary studies — because the tells decay as models and human writing coevolve.

## Process ideas worth adopting later (evaluated, parked)

- **Fresh-reader test** (from Anthropic's doc-coauthoring skill): before shipping a big page, have a context-free Claude read only the page and answer "what is this, what do I do next, what's missing?" — catches curse-of-knowledge blind spots and AI-tell drift.
- **Documentation Wrapper Score** (from github/awesome-copilot): a 0–100 deduction rubric (external-links-as-content −40, exercises without solutions −30, referenced-but-missing files −20) — a candidate shape for a future docs-audit gate.
- **Vale** (vale-cli, with packaged Google/Microsoft styles): the CI enforcement layer if prose linting is ever wanted; rejected for now — no linter infra in the repo, and the rules are the contract.
