---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace"
title: "RegistryNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.RegistryNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/RegistryNamespace.java"
  visibility: "public"
---
# `RegistryNamespace`

10DLC Campaign Registry namespace \u2014 brands, campaigns, orders, numbers.

<p>Mirrors `signalwire.rest.namespaces.registry.RegistryNamespace`.
 All endpoints sit under `/api/relay/rest/registry/beta`.

## Signature

```java
public class RegistryNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace/init)
- [`brands`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace/brands)
- [`campaigns`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace/campaigns)
- [`numbers`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace/numbers)
- [`orders`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace/orders)

## Classes

- [`RegistryBrands`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace/registry-brands) — 10DLC brand management \u2014 list / create / get plus brand-scoped campaign sub-resources.
- [`RegistryCampaigns`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace/registry-campaigns) — 10DLC campaign management \u2014 get / update (PUT) plus number / order sub-resources.
- [`RegistryNumbers`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace/registry-numbers) — 10DLC number-assignment management \u2014 release a number.
- [`RegistryOrders`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/registry-namespace/registry-orders) — 10DLC assignment-order management \u2014 read-only get.

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/RegistryNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/RegistryNamespace.java)

Line 19.
