---
slug: "/reference/rust/signalwire/rest/namespaces/fabric/fabric"
title: "Fabric"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::fabric::Fabric"
  parent: "signalwire::rest::namespaces::fabric"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/fabric.rs"
  visibility: "public"
---
# `Fabric`

## Signature

```rust
struct Fabric { /* fields */ }
```

## Methods

- [`addresses`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/addresses) — Read-only top-level fabric addresses (NOT under `/resources`).
- [`ai_agents`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/ai-agents)
- [`call_flows`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/call-flows) — Call flows — exposes a singular `call_flow` sub-path for addresses / versions per the API spec.
- [`call_queues`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/call-queues)
- [`client`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/client)
- [`conference_rooms`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/conference-rooms) — Conference rooms — singular `conference_room` for sub-paths.
- [`conversations`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/conversations)
- [`cxml_applications`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/cxml-applications) — cXML applications — read/update/delete only (no create).
- [`dial_plans`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/dial-plans)
- [`freeclimb_apps`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/freeclimb-apps)
- [`new`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/new)
- [`phone_numbers`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/phone-numbers)
- [`resources`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/resources) — Generic resource operations across every fabric resource type.
- [`sip_endpoints`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/sip-endpoints)
- [`sip_profiles`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/sip-profiles)
- [`subscribers`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/subscribers) — Subscribers resource — full CRUD plus SIP-endpoint sub-resources.
- [`swml_scripts`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/swml-scripts)
- [`tokens`](/reference/rust/signalwire/rest/namespaces/fabric/fabric/tokens) — Fabric token factories (subscriber / guest / invite / embed).

## Source

[`src/rest/namespaces/fabric.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/fabric.rs)

Line 46.
