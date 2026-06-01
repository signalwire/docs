---
slug: "/reference/cpp/signalwire/security/validate-webhook-signature"
title: "ValidateWebhookSignature"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::security::ValidateWebhookSignature"
  parent: "signalwire::security"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/security/webhook_validator.cpp"
  visibility: "public"
---
# `ValidateWebhookSignature`

Validate a SignalWire webhook signature against both schemes.
Tries Scheme A (hex JSON) first; on miss falls back to Scheme B (base64 form) with URL port normalization, repeated-key handling, and optional ?bodySHA256= body-hash check for JSON bodies on the compat surface.

signing\_key

The customer's Signing Key. UTF-8 string. MUST NOT be empty — empty throws std::invalid\_argument, that's a programming error not a validation failure.

signature

The X-SignalWire-Signature header value (or the legacy X-Twilio-Signature alias). Empty returns false without throwing.

url

Full URL SignalWire POSTed to (scheme, host, optional port, path, query) — must match what the platform saw, see the URL-reconstruction section of porting-sdk/webhooks.md.

raw\_body

Raw request body bytes as a UTF-8 string, BEFORE any JSON / form parsing. Re-serialized JSON breaks Scheme A.

true if either scheme matches; false otherwise.

std::invalid\_argument

when signing\_key is empty.

## Signature

```cpp
bool ValidateWebhookSignature(
    std::string_view signing_key,
    std::string_view signature,
    std::string_view url,
    std::string_view raw_body
)
```

## Parameters

| Name          | Type               | Required | Default | Description                                                                                                                                                                 |
| ------------- | ------------------ | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `signing_key` | `std::string_view` | yes      | —       | The customer's Signing Key. UTF-8 string. MUST NOT be empty — empty throws std::invalid\_argument, that's a programming error not a validation failure.                     |
| `signature`   | `std::string_view` | yes      | —       | The X-SignalWire-Signature header value (or the legacy X-Twilio-Signature alias). Empty returns false without throwing.                                                     |
| `url`         | `std::string_view` | yes      | —       | Full URL SignalWire POSTed to (scheme, host, optional port, path, query) — must match what the platform saw, see the URL-reconstruction section of porting-sdk/webhooks.md. |
| `raw_body`    | `std::string_view` | yes      | —       | Raw request body bytes as a UTF-8 string, BEFORE any JSON / form parsing. Re-serialized JSON breaks Scheme A.                                                               |

## Returns

`bool` — true if either scheme matches; false otherwise.

## Throws

- `std::invalid_argument` — when signing\_key is empty.

## Source

[`src/security/webhook_validator.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/security/webhook_validator.cpp)

Line 406.
