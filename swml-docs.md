Goal: Reorganize SWML methods documentation. Split the existing methods reference into two sub-sections — calling and messaging — by moving all current method docs into calling/, then authoring new messaging method docs in the same style.

  Working directory: /Users/devon/projects/docs

  Phase 1 — Move existing method docs into calling/

  Existing path:
  fern/products/swml/pages/reference/methods/<method>.mdx
  fern/products/swml/pages/reference/methods/<method>/index.mdx   (folder-style for complex methods)

  New path:
  fern/products/swml/pages/reference/methods/calling/<method>.mdx
  fern/products/swml/pages/reference/methods/calling/<method>/index.mdx

  All currently-documented methods are calling-flavored, so move every page wholesale. Preserve folder structure for complex methods (e.g. ai/, connect/, play/).

  Update fern/products/swml/swml.yml so the Methods nav has two children (Calling and Messaging) instead of a flat method list. Use the existing folder directive pattern with title-source: frontmatter so pages are auto-discovered under each subdirectory.

  Phase 2 — Author messaging method docs

  Source-of-truth for shapes (definitive): TypeSpec at /Users/devon/projects/docs/specs/swml/messaging/Methods/<method>/main.tsp. The schema there is canonical — match parameter names, types, defaults, and required/optional exactly.

  Source for prose/behavior/examples:
  - /Users/devon/projects/docs/inbound-messaging.md — public-facing summary
  - /Users/devon/projects/docs/additional.md — internal spec with deeper detail; selectively use (some sections are explicitly internal-only — see exclusions below)

  Create one MDX page per messaging method at fern/products/swml/pages/reference/methods/messaging/<method>.mdx:

  ┌──────────┬───────────────────────────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
  │  Method  │         TypeSpec          │                                                                                                    Notes                                                                                                     │
  ├──────────┼───────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ reply    │ Methods/reply/main.tsp    │ String shorthand or hash with body, media (max 8), to, from, status_url. Status-callback details from inbound-messaging.md Status callbacks section.                                                         │
  ├──────────┼───────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ receive  │ Methods/receive/main.tsp  │ No params. Empty {}.                                                                                                                                                                                         │
  ├──────────┼───────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ request  │ Methods/request/main.tsp  │ url, method (default POST), headers, body, timeout (default 5.0, clamped max 5), save_variables. Document request_response.*, request_result, request_response_code, request_response_body output variables. │
  ├──────────┼───────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ switch   │ Methods/switch/main.tsp   │ variable, transform enum (lowercase/uppercase/trim/lowercase_trim/uppercase_trim), case (Record→method[]), default. Full-mode only — do not document the simple-mode inline-under-reply switch form.         │
  ├──────────┼───────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ execute  │ Methods/execute/main.tsp  │ String shorthand or hash with dest (section name only, not URL/inline) and params.                                                                                                                           │
  ├──────────┼───────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ transfer │ Methods/transfer/main.tsp │ String shorthand or hash with dest (URL only, not section/inline), method (default POST), params. Tail-call semantics.                                                                                       │
  ├──────────┼───────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ goto     │ Methods/goto/main.tsp     │ String shorthand or hash with label, max (default 100, range 1-100).                                                                                                                                         │
  ├──────────┼───────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ return   │ Methods/return/main.tsp   │ string | null value. Bare - return and - return: "value" forms.                                                                                                                                              │
  ├──────────┼───────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
  │ label    │ Methods/label/main.tsp    │ { label: string } only.                                                                                                                                                                                      │
  └──────────┴───────────────────────────┴──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

  Each page must:
  - Follow the exact Fern MDX conventions of the calling pages — frontmatter (id UUID, title, slug, description, max-toc-depth), <ParamField> components, <CodeBlocks> with paired YAML + JSON examples.
  - Document parameters with correct types, required/optional flags, and defaults that match the TypeSpec.
  - Include a Variables section where the method sets/reads variables (request, return, reply).
  - Include working examples (full-mode sections.main documents) in both YAML and JSON.

  Internal-only items — DO NOT publish

  additional.md contains internal/operational details that must not appear in public docs:

  - The feature-flag name swml_inbound_message_handling. Public docs may say "in beta / limited availability" without naming the flag.
  - Rails/Sidekiq class names: ProcessInboundMessage, SwmlInboundMessageProcessSwmlJob, RelayMessage, MessageSegment, RelayConversation, RelayMessageSendCallback, Signalwire::RetryableError, SectionExecutor, Swml::VariableExpander.
  - MESSAGING_ALLOW_FROM_ANY_ALPHANUMERIC — explicitly flagged "Do not include in public-facing documentation" in the spec source.
  - Routing metadata internals: LRN lookups, peer legal carrier key, peer SPID, registry campaign details, outbound partition key/rank.
  - Sidekiq retry counts and internal job retry behavior class names. The user-facing concept ("transient errors are retried, deterministic ones are not") IS public — just reframe without internals.
  - swml_unknown_error's "missing locale entry" implementation note. The error code itself can be documented as a fallback.

  Strip the alphanumeric-sender clause from the reply.from description (lines 261, 265-267 of additional.md). Just say "Sending phone number — must be a PhoneRoute or ShortCode in the project."

  Style requirements

  - Mirror the existing calling MDX pages 1:1 — same section headings (Description, Parameters, Variables, Examples, Failure behavior where relevant), same component usage.
  - Use <ParamField> with path="<param>", type="...", required flag, default value (in brackets), and clear description.
  - Use <CodeBlocks> for paired YAML/JSON code samples.
  - Frontmatter id should be a fresh UUID per page; everything else follows existing patterns.

  Phase 3 — Verify

  - Run yarn fern-check — Fern config must validate.
  - Run yarn fern-md-check — MDX must be valid.
  - Mirror the existing calling MDX pages 1:1 — same section headings (Description, Parameters, Variables, Examples, Failure behavior where relevant), same component usage.
  - Use <ParamField> with path="<param>", type="...", required flag, default value (in brackets), and clear description.
  - Use <CodeBlocks> for paired YAML/JSON code samples.
  - Frontmatter id should be a fresh UUID per page; everything else follows existing patterns.

  Phase 3 — Verify

  - Run yarn fern-check — Fern config must validate.
  - Run yarn fern-md-check — MDX must be valid.
  - Run yarn check-links — no dead cross-refs.
  - Run yarn start:dev for visual smoke-check if practical.

  Out of scope

  - Do not modify TypeSpec — schemas are finalized.
  - Do not create a messaging-overview, getting-started, or LaML-parity guide page. Those are separate tickets.
  - Do not modify the calling docs' content — only their location.
  - Do not add a top-level "SWML Inbound Message Handling" landing page — separate ticket.

  Report back

  - List of calling MDX files moved (old → new path).
  - List of new messaging MDX files created.
  - The diff to fern/products/swml/swml.yml.
  - Any items where the spec was ambiguous and you made a judgment call (with the call you made and the reason).
  - Build/check status from Phase 3.

  ---