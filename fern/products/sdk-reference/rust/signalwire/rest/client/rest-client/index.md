---
slug: "/reference/rust/signalwire/rest/client/rest-client"
title: "RestClient"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::client::RestClient"
  parent: "signalwire::rest::client"
  module: "rest.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/client.rs"
  visibility: "public"
---
# `RestClient`

Top-level SignalWire REST client.

Provides lazy access to every API namespace (fabric, calling,
phone\_numbers, datasphere, video, compat, etc.). Credentials can
be supplied explicitly or pulled from environment variables.

Production HTTP transport is `ureq` (sync, blocking, real network
I/O). Tests can substitute a stub via \[`with_http`].

## Signature

```rust
struct RestClient { /* fields */ }
```

## Methods

- [`addresses`](/reference/rust/signalwire/rest/client/rest-client/addresses) — Addresses.
- [`base_url`](/reference/rust/signalwire/rest/client/rest-client/base-url)
- [`calling`](/reference/rust/signalwire/rest/client/rest-client/calling) — Calling API (37 call-control commands).
- [`chat`](/reference/rust/signalwire/rest/client/rest-client/chat) — Chat tokens.
- [`compat`](/reference/rust/signalwire/rest/client/rest-client/compat) — Compatibility (Twilio-compatible LAML) API namespace.
- [`datasphere`](/reference/rust/signalwire/rest/client/rest-client/datasphere) — Datasphere namespace (documents + chunks + search).
- [`fabric`](/reference/rust/signalwire/rest/client/rest-client/fabric) — Fabric API (sub-resources: subscribers, sip\_endpoints, call\_flows, ...).
- [`from_env`](/reference/rust/signalwire/rest/client/rest-client/from-env) — Create from environment variables.
- [`http`](/reference/rust/signalwire/rest/client/rest-client/http)
- [`imported_numbers`](/reference/rust/signalwire/rest/client/rest-client/imported-numbers) — Imported phone numbers.
- [`logs`](/reference/rust/signalwire/rest/client/rest-client/logs) — Logs (messages, voice, fax, conferences).
- [`lookup`](/reference/rust/signalwire/rest/client/rest-client/lookup) — Phone number lookup.
- [`mfa`](/reference/rust/signalwire/rest/client/rest-client/mfa) — Multi-factor authentication (sms/call/verify).
- [`new`](/reference/rust/signalwire/rest/client/rest-client/new) — Create a new REST client with explicit credentials. The base URL resolves to `https://{space}`. Use \[`with_base_url`] to override (e.g. for fixture-driven tests pointed at `http://127.0.0.1:N`).
- [`number_groups`](/reference/rust/signalwire/rest/client/rest-client/number-groups) — Number groups (CRUD + membership operations).
- [`phone_numbers`](/reference/rust/signalwire/rest/client/rest-client/phone-numbers) — Phone numbers.
- [`project`](/reference/rust/signalwire/rest/client/rest-client/project) — Project namespace (exposes `tokens` sub-resource).
- [`project_id`](/reference/rust/signalwire/rest/client/rest-client/project-id)
- [`pubsub`](/reference/rust/signalwire/rest/client/rest-client/pubsub) — PubSub tokens.
- [`queues`](/reference/rust/signalwire/rest/client/rest-client/queues) — Queues namespace (CRUD + member operations).
- [`recordings`](/reference/rust/signalwire/rest/client/rest-client/recordings) — Recordings.
- [`registry`](/reference/rust/signalwire/rest/client/rest-client/registry) — Registry (10DLC brands, campaigns, orders, numbers).
- [`short_codes`](/reference/rust/signalwire/rest/client/rest-client/short-codes) — Short codes.
- [`sip_profile`](/reference/rust/signalwire/rest/client/rest-client/sip-profile) — Project SIP profile (singular: singleton resource at `/api/relay/rest/sip_profile`).
- [`space`](/reference/rust/signalwire/rest/client/rest-client/space)
- [`token`](/reference/rust/signalwire/rest/client/rest-client/token)
- [`verified_callers`](/reference/rust/signalwire/rest/client/rest-client/verified-callers) — Verified callers.
- [`video`](/reference/rust/signalwire/rest/client/rest-client/video) — Video API namespace (rooms, sessions, recordings, conferences, tokens, streams).
- [`with_base_url`](/reference/rust/signalwire/rest/client/rest-client/with-base-url) — Create a REST client with an explicit base URL. Used by audit harnesses and integration tests to point at a local fixture without going through the `https://{space}` resolution. Production callers should use \[`new`] instead.
- [`with_http`](/reference/rust/signalwire/rest/client/rest-client/with-http) — Create a REST client with a specific HTTP client (for testing).

## Source

[`src/rest/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/client.rs)

Line 14.
