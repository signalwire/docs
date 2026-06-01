---
slug: "/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace"
title: "CallingNamespace"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.rest.namespaces.CallingNamespace"
  parent: "com.signalwire.sdk.rest.namespaces"
  module: "com.signalwire.sdk.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/CallingNamespace.java"
  visibility: "public"
---
# `CallingNamespace`

REST-based call control.

All commands are dispatched as
/api/calling/calls with a `"command"` field that names
the operation, optionally an `"id"` field that names the target call,
and a `"params"` object containing keyword arguments. The mock
server (and the real Calling API) matches commands against the registered
routes via the `command` field.

## Signature

```java
public class CallingNamespace
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/init)
- [`aiHold`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/ai-hold)
- [`aiMessage`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/ai-message)
- [`aiStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/ai-stop)
- [`aiUnhold`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/ai-unhold)
- [`calls`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/calls)
- [`collect`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/collect)
- [`collectStartInputTimers`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/collect-start-input-timers)
- [`collectStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/collect-stop)
- [`denoise`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/denoise)
- [`denoiseStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/denoise-stop)
- [`detect`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/detect)
- [`detectStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/detect-stop)
- [`dial`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/dial)
- [`disconnect`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/disconnect)
- [`end`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/end)
- [`liveTranscribe`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/live-transcribe)
- [`liveTranslate`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/live-translate)
- [`play`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/play)
- [`playPause`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/play-pause)
- [`playResume`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/play-resume)
- [`playStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/play-stop)
- [`playVolume`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/play-volume)
- [`receiveFaxStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/receive-fax-stop)
- [`record`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/record)
- [`recordPause`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/record-pause)
- [`recordResume`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/record-resume)
- [`recordStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/record-stop)
- [`refer`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/refer)
- [`sendFaxStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/send-fax-stop)
- [`stream`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/stream)
- [`streamStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/stream-stop)
- [`tap`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/tap)
- [`tapStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/tap-stop)
- [`transcribe`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/transcribe)
- [`transcribeStop`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/transcribe-stop)
- [`transfer`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/transfer)
- [`update`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/update)
- [`userEvent`](/reference/java/com/signalwire/sdk/rest/namespaces/namespaces/calling-namespace/user-event)

## Source

[`src/main/java/com/signalwire/sdk/rest/namespaces/CallingNamespace.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/rest/namespaces/CallingNamespace.java)

Line 24.
