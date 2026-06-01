---
slug: "/reference/java/com/signalwire/sdk/runtime/runtime/lambda-url-resolver/resolve-base-url"
title: "resolveBaseUrl"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.runtime.LambdaUrlResolver.resolveBaseUrl"
  parent: "com.signalwire.sdk.runtime.LambdaUrlResolver"
  module: "com.signalwire.sdk.runtime.LambdaUrlResolver"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/LambdaUrlResolver.java"
  visibility: "public"
---
# `resolveBaseUrl`

Return the base URL for the Lambda, without any trailing slash.

<p>Returns `null` if none of the expected env vars are set
 (which typically means we're not actually running on Lambda). The
 caller should then fall back to its normal base-URL detection.

## Signature

```java
public java.lang.String resolveBaseUrl()
```

## Returns

`java.lang.String` — bare origin (e.g. `https://xyz.lambda-url.us-east-1.on.aws`), or `null`.

## Source

[`src/main/java/com/signalwire/sdk/runtime/LambdaUrlResolver.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/LambdaUrlResolver.java)

Line 58.
