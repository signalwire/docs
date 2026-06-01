---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-accounts"
title: "CompatAccounts"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.CompatNamespace.CompatAccounts"
  parent: "com.signalwire.sdk.rest.namespaces.CompatNamespace"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/CompatNamespace.java"
  visibility: "public"
---
# `CompatAccounts`

Compat account / sub-project management.

<p>Mirrors `signalwire.rest.namespaces.compat.CompatAccounts`:
 accounts.create lives at the top-level `/Accounts` collection
 (no AccountSid prefix); accounts.get/update operate on
 `/Accounts/{sid`}. update is a Twilio-compat POST (not PATCH/PUT).

**Modifiers:** `static`

## Signature

```java
public static class CompatAccounts
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-accounts/init)
- [`create`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-accounts/create)
- [`get`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-accounts/get)
- [`getBasePath`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-accounts/get-base-path)
- [`list`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-accounts/list)
- [`update`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-accounts/update)

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/CompatNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/CompatNamespace.java)

Line 328.
