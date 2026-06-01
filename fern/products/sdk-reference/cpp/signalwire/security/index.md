---
slug: "/reference/cpp/signalwire/security"
title: "security"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "module"
  language: "cpp"
  qualified_name: "signalwire::security"
  parent: "signalwire"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/security/session_manager.hpp"
---
# `security`

## Signature

```cpp
namespace signalwire::security
```

## Functions

- [`ValidateRequest`](/reference/cpp/signalwire/security/validate-request) — Legacy @signalwire/compatibility-api drop-in entry point. If params\_or\_raw\_body holds a std::string, delegates to ValidateWebhookSignature (Scheme A then Scheme B with parsed form). If it holds a FormParams, treats it as pre-parsed form params and runs Scheme B directly (with URL port normalization).
- [`ValidateWebhookSignature`](/reference/cpp/signalwire/security/validate-webhook-signature) — Validate a SignalWire webhook signature against both schemes. Tries Scheme A (hex JSON) first; on miss falls back to Scheme B (base64 form) with URL port normalization, repeated-key handling, and optional ?bodySHA256= body-hash check for JSON bodies on the compat surface.
- [`WrapWithSignatureValidation`](/reference/cpp/signalwire/security/wrap-with-signature-validation) — Wrap a downstream cpp-httplib POST handler with SignalWire webhook signature validation. Behavior:

## Type Aliases

- [`FormParams`](/reference/cpp/signalwire/security/form-params) — Pre-parsed form parameters for ValidateRequest: ordered list of (key, list-of-values) tuples. Repeated keys are represented as one entry whose values vector holds each occurrence in submission order. Used as one alternative in ParamsOrBody; the other alternative is the raw body string.
- [`HttpHandler`](/reference/cpp/signalwire/security/http-handler) — A cpp-httplib handler signature, lifted into a typedef so the adapter stays framework-agnostic at the call site (the only deps needed by this header are a forward declaration of httplib::Request/Response).
- [`ParamsOrBody`](/reference/cpp/signalwire/security/params-or-body) — Drop-in shape for ValidateRequest mirroring @signalwire/compatibility-api's RestClient.validateRequest: either a raw body string (delegates to the combined validator) or a pre-parsed form-params list (runs Scheme B directly).

## Classes

- [`SessionManager`](/reference/cpp/signalwire/security/session-manager) — Manages HMAC-SHA256 based session tokens for secure SWAIG tool calls. Token format: base64(functionName:callID:expiryTimestamp) + "." + hex(hmac\_signature)
- [`WebhookValidatorOptions`](/reference/cpp/signalwire/security/webhook-validator-options) — Optional knobs for WrapWithSignatureValidation. trust\_proxy controls whether X-Forwarded-Proto / X-Forwarded-Host headers are honored when reconstructing the public URL — opt-in because proxy headers are spoofable. proxy\_url\_base is consulted before the proxy headers and is meant for SWML\_PROXY\_URL\_BASE callers.

## Modules

- [`@130244337153053077244110077352222116025236353164`](/reference/cpp/signalwire/security/130244337153053077244110077352222116025236353164)
- [`@310351237317267124245041240013327201335267313302`](/reference/cpp/signalwire/security/310351237317267124245041240013327201335267313302)

## Source

[`include/signalwire/security/session_manager.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/security/session_manager.hpp)

Line 9.
