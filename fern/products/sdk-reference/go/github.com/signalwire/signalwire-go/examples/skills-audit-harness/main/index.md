---
slug: "/reference/go/github.com/signalwire/signalwire-go/examples/skills-audit-harness/main"
title: "main"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/examples/skills_audit_harness"
  module: "github.com.signalwire.signalwire-go.examples.skills_audit_harness"
---
# `main`

Example: skills\_audit\_harness

Audit-only harness — exercises a single network skill against the loopback fixture spun up by porting-sdk's audit\_skills\_dispatch.py. Reads:

- SKILL\_NAME e.g. "web\_search", "datasphere"
- SKILL\_FIXTURE\_URL "http://127.0.0.1:NNNN"
- SKILL\_HANDLER\_ARGS JSON dict (forwarded to handler / template)
- per-skill upstream env (e.g. WEB\_SEARCH\_BASE\_URL); the audit sets these to point the skill at its loopback fixture
- per-skill credential env vars (e.g. GOOGLE\_API\_KEY); the audit sets fake values that the fixture accepts

Behavior:

- For handler-based skills (web\_search, wikipedia\_search, datasphere, spider) the harness instantiates the skill, calls its registered handler with the parsed args, and prints the handler's response.
- For DataMap-based skills (api\_ninjas\_trivia, weather\_api) the SignalWire platform — not the SDK — would normally fetch the configured webhook URL. The harness simulates the platform: it extracts the webhook URL from the registered DataMap, expands %{args.X} references against the parsed args, and issues the HTTP call itself. This proves the SDK serialised a real URL and points it at a real upstream — which is what the audit verifies.

Not for production use. The harness's whole purpose is to give the audit a small, fast binary to drive its fixture against.

## Signature

```go
package main
```
