---
slug: "/reference/dotnet/signal-wire.security"
title: "SignalWire.Security"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "module"
  language: "dotnet"
  qualified_name: "SignalWire.Security"
---
# `SignalWire.Security`

## Classes

- [`SessionManager`](/reference/dotnet/signal-wire.security/session-manager) — Generates and validates HMAC-SHA256 signed session tokens for SWAIG function calls. Each instance holds an independent 32-byte random secret.
- [`WebhookValidationMiddleware`](/reference/dotnet/signal-wire.security/webhook-validation-middleware) — HTTP middleware that validates the <code>X-SignalWire-Signature</code> header on incoming requests using <xref href="SignalWire.Security.WebhookValidator" data-throw-if-not-resolved="false"></xref>. Designed for the .NET port's HttpListener-based dispatch surface; adapts the same contract Python's FastAPI dependency provides. <p>Use <xref href="SignalWire.Security.WebhookValidationMiddleware.Validate(System.String%2cSystem.String%2cSystem.Collections.Generic.Dictionary%7bSystem.String%2cSystem.String%7d%2cSystem.String%2cSystem.String%2cSystem.Int32)" data-throw-if-not-resolved="false"></xref> to short-circuit invalid requests with 403 before they reach an agent's POST handler. Returns null on success so the caller continues to dispatch.</p> <p>This is intentionally a non-async type: the underlying validator is pure CPU work and the dispatch surface uses synchronous strings.</p>
- [`WebhookValidator`](/reference/dotnet/signal-wire.security/webhook-validator) — Validates SignalWire webhook signatures for both Scheme A (RELAY/JSON, hex HMAC-SHA1 over <code>url + rawBody</code>) and Scheme B (Compat/cXML form, base64 HMAC-SHA1 over <code>url + sortedFormParams</code>) per <code>porting-sdk/webhooks.md</code>. The contract is byte-identical across all SignalWire SDK ports — see the cross-port test vectors in the spec.
