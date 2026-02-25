# Platform docs reorganization — deferred work

Items not addressed in the current reorganization pass. Each needs its own
follow-up ticket or session.

## SIP

- **Domain Apps** — leave as-is for now; feature may return.
- **BYOC** — needs update: "Domain App" terminology → "SIP Address"; audit
  whether custom interop requirement is still accurate.
- **Trunking** — needs update: "SIP Endpoint" terminology → "SIP Credential".

## Video

- **Conference guides** — all deleted in this pass. Need replacement articles
  covering the UI-included way and the SDK way.

## Messaging

- **Hosted messaging** — keep for now; ticket to audit later.
- **Toll-free overview** — removed in this pass. Add a "Toll-Free Numbers"
  section to the phone numbers doc, move field descriptions to the
  Verification Form page, add TFN messaging description to messaging overview.
- **Campaign registry overview** — needs stripping (remove history fluff).
- **Campaign registry registration** — remove screenshots.
- **Platform free trial** — deleted in this pass. Add 1–2 sentence summary to
  SMS overview or get-started.
- **Messaging troubleshooting** — deleted in this pass. Cross-reference with
  Compatibility API error codes page and backfill relevant messaging details.
- **Carrier fees** — deleted (was "pending Kat").

## Voice

- **Click-to-Call "basic-implementation"** — rename away from "Basic" (slug
  change, but needs a new name decided first).

## AI

- Needs further internal reorganization: some content should move to Platform
  Get Started; "Use Cases" folder should become "Recipes".

## TTS

- Needs overhaul: modularize for product-specific use, explore `<llms-only>`
  tags for LLM-consumable reference.

## FreeSWITCH

- **Core dump backtrace guide** — deleted from SignalWire docs. Open a ticket
  to add this content to the FreeSWITCH Confluence wiki / official FS docs.
- **Memory address / pool sanitizer guide** — deleted from SignalWire docs.
  Open a ticket to add this content to the FreeSWITCH Confluence wiki / official
  FS docs.

## POM

- Technical-reference page — cross-reference against Agents SDK docs, consider
  moving to POM GitHub repo.
