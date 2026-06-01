---
slug: "/reference/rust/signalwire/utils/url-validator"
title: "url_validator"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "module"
  language: "rust"
  qualified_name: "signalwire::utils::url_validator"
  parent: "signalwire::utils"
  module: "utils"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/utils/url_validator.rs"
  visibility: "public"
---
# `url_validator`

SSRF-prevention guard for user-supplied URLs.

Mirrors Python's `signalwire.utils.url_validator.validate_url`:
rejects non-http(s) schemes, missing hostnames, and any URL whose
hostname resolves to a private / loopback / link-local / cloud-
metadata IP. When `allow_private` is true, OR the
`SWML_ALLOW_PRIVATE_URLS` env var is set to `"1"`, `"true"`, or
`"yes"` (case-insensitive), the IP-blocklist check is skipped.

## Constants

| Name               | Type                                | Required | Default | Description                                                                                       |
| ------------------ | ----------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------- |
| `BLOCKED_NETWORKS` | `const BLOCKED_NETWORKS: [&str; 9]` | yes      | —       | Cross-port SSRF block list. Order matches the Python reference for ease of cross-language review. |

## Functions

- [`_set_resolver`](/reference/rust/signalwire/utils/url-validator/set-resolver) — Install a custom resolver (for tests). Pass `None` to clear.
- [`validate_url`](/reference/rust/signalwire/utils/url-validator/validate-url) — Validate that a URL is safe to fetch.

## Source

[`src/utils/url_validator.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/utils/url_validator.rs)

Line 6.
