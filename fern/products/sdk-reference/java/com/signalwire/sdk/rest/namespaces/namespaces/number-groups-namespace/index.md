---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace"
title: "NumberGroupsNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.NumberGroupsNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/NumberGroupsNamespace.java"
  visibility: "public"
---
# `NumberGroupsNamespace`

Number Groups namespace \u2014 full CRUD on number groups + membership ops.

<p>Mirrors
 `signalwire.rest.namespaces.number_groups.NumberGroupsResource`: the
 group CRUD uses PUT for update; membership get/delete operate against a
 separate top-level `/api/relay/rest/number_group_memberships`
 collection (not a sub-collection of the group).

## Signature

```java
public class NumberGroupsNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/init)
- [`addMembership`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/add-membership)
- [`create`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/create)
- [`delete`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/delete)
- [`deleteMembership`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/delete-membership)
- [`get`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/get)
- [`getBasePath`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/get-base-path)
- [`getMembership`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/get-membership)
- [`list`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/list)
- [`listMemberships`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/list-memberships)
- [`update`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/number-groups-namespace/update)

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/NumberGroupsNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/NumberGroupsNamespace.java)

Line 22.
