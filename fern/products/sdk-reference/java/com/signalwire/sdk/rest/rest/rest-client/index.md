---
slug: "/reference/java/com/signalwire/sdk/rest/rest/rest-client"
title: "RestClient"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.RestClient"
  parent: "com.signalwire.sdk.rest"
  module: "com.signalwire.sdk.rest"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/RestClient.java"
  visibility: "public"
---
# `RestClient`

SignalWire REST API client with all 21 namespaces.

<p>
 Uses `java.net.http.HttpClient` with Basic Auth. Each namespace
 provides typed access to a group of API resources.

 <pre>client = RestClient.builder()
     .project("project-id")
     .token("api-token")
     .space("example.signalwire.com")
     .build();

 var numbers = client.phoneNumbers().list();
 var docs = client.datasphere().documents().list();</pre>

## Signature

```java
public class RestClient
```

## Methods

- [`addresses`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/addresses)
- [`billing`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/billing)
- [`builder`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/builder)
- [`calling`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/calling)
- [`campaign`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/campaign)
- [`chat`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/chat)
- [`compat`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/compat)
- [`compliance`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/compliance)
- [`conferences`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/conferences)
- [`datasphere`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/datasphere)
- [`fabric`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/fabric)
- [`fax`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/fax)
- [`getHttpClient`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/get-http-client)
- [`getProject`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/get-project)
- [`getSpace`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/get-space)
- [`importedNumbers`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/imported-numbers)
- [`logs`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/logs)
- [`messaging`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/messaging)
- [`mfa`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/mfa)
- [`numberGroups`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/number-groups)
- [`numberLookup`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/number-lookup)
- [`phoneNumbers`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/phone-numbers)
- [`project`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/project)
- [`pubSub`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/pub-sub)
- [`queues`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/queues)
- [`recordings`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/recordings)
- [`registry`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/registry)
- [`shortCodes`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/short-codes)
- [`sip`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/sip)
- [`sipProfile`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/sip-profile)
- [`streams`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/streams)
- [`swml`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/swml)
- [`transcriptions`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/transcriptions)
- [`video`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/video)
- [`withBaseUrl`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/with-base-url) — Build a `RestClient` pointed at an explicit base URL \u2014 typically a loopback fixture used by the porting-sdk's REST-transport audit.

## Classes

- [`Builder`](/reference/java/com/signalwire/sdk/rest/rest/rest-client/builder)

## Source

[`src/main/java/com/signalwire/sdk/rest/RestClient.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/RestClient.java)

Line 30.
