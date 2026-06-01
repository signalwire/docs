---
slug: "/reference/java/com/signalwire/sdk/runtime/runtime/lambda-url-resolver"
title: "LambdaUrlResolver"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.runtime.LambdaUrlResolver"
  parent: "com.signalwire.sdk.runtime"
  module: "com.signalwire.sdk.runtime"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/LambdaUrlResolver.java"
  visibility: "public"
---
# `LambdaUrlResolver`

Resolve the base URL of a SignalWire agent running as an AWS Lambda
function, from standard Lambda environment variables.

<p>Precedence \u2014 highest first:
 <ol>
   <li>`AWS_LAMBDA_FUNCTION_URL` \u2014 the Function URL explicitly
       assigned to this Lambda (the only variant that is guaranteed
       correct; synthetic fallbacks below assume the Function URL
       service was used and the function name matches the public
       subdomain, which is typically true but not guaranteed).</li>
   <li>Synthesised `https://{AWS_LAMBDA_FUNCTION_NAME`.lambda-url.{AWS_REGION}.on.aws}
       \u2014 built when the Function URL env var is not present but the
       standard Lambda identity variables are.</li>
 </ol>

 <p>This class returns a bare origin (scheme + host). It intentionally
 does NOT append any route \u2014 callers (e.g. `AgentBase.buildWebhookUrl`)
 are responsible for appending the agent's route + endpoint path. This
 keeps the route-preservation invariant intact regardless of which
 source produced the base URL.

 <p>Mirrors the Lambda branch of `get_full_url()` in the Python SDK.

**Modifiers:** `final`

## Signature

```java
public final class LambdaUrlResolver
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/runtime/runtime/lambda-url-resolver/init) — Create a resolver backed by the real process environment.
- [`resolveBaseUrl`](/reference/java/com/signalwire/sdk/runtime/runtime/lambda-url-resolver/resolve-base-url) — Return the base URL for the Lambda, without any trailing slash.

## Source

[`src/main/java/com/signalwire/sdk/runtime/LambdaUrlResolver.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/runtime/LambdaUrlResolver.java)

Line 27.
