---
slug: "/reference/rust/signalwire/serverless/adapter"
title: "adapter"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "module"
  language: "rust"
  qualified_name: "signalwire::serverless::adapter"
  parent: "signalwire::serverless"
  module: "serverless"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs"
  visibility: "public"
---
# `adapter`

Serverless adapter -- auto-detect runtime environment (Lambda, Azure,
server) and handle requests accordingly.

## Classes

- [`Adapter`](/reference/rust/signalwire/serverless/adapter/adapter) — Auto-detect and handle serverless environments (Lambda, Azure, GCF, CGI) or fall back to the built-in server.

## Interfaces

- [`RequestHandler`](/reference/rust/signalwire/serverless/adapter/request-handler) — Trait that the agent/service must implement so the adapter can forward requests to it.

## Enums

- [`RuntimeEnvironment`](/reference/rust/signalwire/serverless/adapter/runtime-environment) — Detected runtime environment.

## Source

[`src/serverless/adapter.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs)

Line 1.
