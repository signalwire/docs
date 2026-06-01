---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace"
title: "CompatNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.CompatNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/CompatNamespace.java"
  visibility: "public"
---
# `CompatNamespace`

REST namespace for compatibility (CXML/Twilio-compatible) resources.

<p>The Twilio-compatible LAML API is mounted under
 `/api/laml/2010-04-01/Accounts/{AccountSid`}. The trailing
 `/api` prefix is added by `HttpClient`, so namespace base
 paths here begin with `/laml/2010-04-01/Accounts/...`.

## Signature

```java
public class CompatNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/init)
- [`accounts`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/accounts)
- [`applications`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/applications)
- [`calls`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/calls)
- [`conferences`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/conferences)
- [`faxes`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/faxes)
- [`lamlBins`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/laml-bins)
- [`messages`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/messages)
- [`phoneNumbers`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/phone-numbers)
- [`queues`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/queues)
- [`recordings`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/recordings)
- [`sipCredentialLists`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/sip-credential-lists)
- [`sipDomains`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/sip-domains)
- [`sipIpAccessControlLists`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/sip-ip-access-control-lists)
- [`tokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/tokens)
- [`transcriptions`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/transcriptions)

## Classes

- [`CompatAccounts`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-accounts) — Compat account / sub-project management.
- [`CompatApplications`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-applications) — Compat application management.
- [`CompatCalls`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-calls) — Compat call management with recording and stream sub-resources.
- [`CompatConferences`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-conferences) — Compat conference management with participants, recordings, and stream sub-resources.
- [`CompatFaxes`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-faxes) — Compat fax management with media sub-resources.
- [`CompatLamlBins`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-laml-bins) — Compat cXML/LaML script bin management.
- [`CompatMessages`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-messages) — Compat message management with media sub-resources.
- [`CompatPhoneNumbers`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-phone-numbers) — Compat IncomingPhoneNumbers + AvailablePhoneNumbers management.
- [`CompatQueues`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-queues) — Compat queue management with member operations.
- [`CompatRecordings`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-recordings) — Compat recording management.
- [`CompatTokens`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-tokens) — Compat API token management.
- [`CompatTranscriptions`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/compat-namespace/compat-transcriptions) — Compat transcription management.

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/CompatNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/CompatNamespace.java)

Line 22.
