---
slug: "/reference/typescript/security-utils"
title: "SecurityUtils"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "SecurityUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts"
---
# `SecurityUtils`

## Signature

```typescript
module SecurityUtils
```

## Constants

| Name                     | Type   | Required | Default | Description                                                            |
| ------------------------ | ------ | -------- | ------- | ---------------------------------------------------------------------- |
| `MAX_SKILL_INPUT_LENGTH` | `1000` | yes      | —       | Maximum allowed input length for skill handler arguments (characters). |

## Functions

- [`filterSensitiveHeaders`](/reference/typescript/security-utils/filter-sensitive-headers) — Return a copy of `headers` with sensitive entries (authorization, cookie, etc.) removed.
- [`isPrivateIp`](/reference/typescript/security-utils/is-private-ip) — Check whether an IP address belongs to a private/reserved range. Covers RFC1918, loopback, link-local, IPv6 private (fc/fd, ::1, fe80).
- [`isServerlessMode`](/reference/typescript/security-utils/is-serverless-mode) — Whether the current process is running in a serverless environment (anything other than a long-lived `server` runtime).
- [`isValidHostname`](/reference/typescript/security-utils/is-valid-hostname) — Validate that a hostname string does not contain whitespace, slashes, or control characters.
- [`redactUrl`](/reference/typescript/security-utils/redact-url) — Redact credentials embedded in a URL (e.g. `https://user:secret@host` -> `https://user:****@host`). Returns the URL unchanged if no credentials are present.
- [`resolveAndValidateUrl`](/reference/typescript/security-utils/resolve-and-validate-url) — DNS-resolve a URL's hostname and reject it if it points to a private IP.
- [`safeAssign`](/reference/typescript/security-utils/safe-assign) — Copy properties from `source` to `target`, filtering out prototype-pollution keys. Drop-in replacement for `Object.assign(target, source)` where `source` is untrusted.
- [`validateUrl`](/reference/typescript/security-utils/validate-url) — Validate that a URL is safe to fetch (not pointing to private/internal resources).

## Source

[`src/SecurityUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts)

Line 1.
