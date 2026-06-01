---
slug: "/reference/dotnet/signal-wire.rest.namespaces/calling"
title: "Calling"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.Calling"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `Calling`

Calling API namespace.

Provides 37 call-control command methods that each POST to
/api/calling/calls with a JSON body containing the command name,
an optional call ID, and parameters.

## Signature

```dotnet
public class Calling
```

## Properties

| Name        | Type                                | Required | Default | Description |
| ----------- | ----------------------------------- | -------- | ------- | ----------- |
| `Client`    | `public HttpClient Client { get; }` | yes      | —       | —           |
| `ProjectId` | `public string ProjectId { get; }`  | yes      | —       | —           |

## Methods

- [`AiHoldAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/ai-hold-async-string-dictionary-string-object)
- [`AiMessageAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/ai-message-async-string-dictionary-string-object)
- [`AiStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/ai-stop-async-string-dictionary-string-object)
- [`AiUnholdAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/ai-unhold-async-string-dictionary-string-object)
- [`Calling(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/calling/calling-http-client-string)
- [`CollectAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/collect-async-string-dictionary-string-object)
- [`CollectStartInputTimersAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/collect-start-input-timers-async-string-dictionary-string-object)
- [`CollectStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/collect-stop-async-string-dictionary-string-object)
- [`DenoiseAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/denoise-async-string-dictionary-string-object)
- [`DenoiseStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/denoise-stop-async-string-dictionary-string-object)
- [`DetectAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/detect-async-string-dictionary-string-object)
- [`DetectStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/detect-stop-async-string-dictionary-string-object)
- [`DialAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/dial-async-dictionary-string-object)
- [`DisconnectAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/disconnect-async-string-dictionary-string-object)
- [`EndAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/end-async-string-dictionary-string-object)
- [`GetBasePath()`](/reference/dotnet/signal-wire.rest.namespaces/calling/get-base-path)
- [`LiveTranscribeAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/live-transcribe-async-string-dictionary-string-object)
- [`LiveTranslateAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/live-translate-async-string-dictionary-string-object)
- [`PlayAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/play-async-string-dictionary-string-object)
- [`PlayPauseAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/play-pause-async-string-dictionary-string-object)
- [`PlayResumeAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/play-resume-async-string-dictionary-string-object)
- [`PlayStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/play-stop-async-string-dictionary-string-object)
- [`PlayVolumeAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/play-volume-async-string-dictionary-string-object)
- [`ReceiveFaxStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/receive-fax-stop-async-string-dictionary-string-object)
- [`RecordAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/record-async-string-dictionary-string-object)
- [`RecordPauseAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/record-pause-async-string-dictionary-string-object)
- [`RecordResumeAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/record-resume-async-string-dictionary-string-object)
- [`RecordStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/record-stop-async-string-dictionary-string-object)
- [`ReferAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/refer-async-string-dictionary-string-object)
- [`SendFaxStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/send-fax-stop-async-string-dictionary-string-object)
- [`StreamAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/stream-async-string-dictionary-string-object)
- [`StreamStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/stream-stop-async-string-dictionary-string-object)
- [`TapAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/tap-async-string-dictionary-string-object)
- [`TapStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/tap-stop-async-string-dictionary-string-object)
- [`TranscribeAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/transcribe-async-string-dictionary-string-object)
- [`TranscribeStopAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/transcribe-stop-async-string-dictionary-string-object)
- [`TransferAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/transfer-async-string-dictionary-string-object)
- [`UpdateAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/update-async-dictionary-string-object) — Python-parity alias for <xref href="SignalWire.REST.Namespaces.Calling.UpdateCallAsync(System.Collections.Generic.Dictionary%7bSystem.String%2cSystem.Object%7d)" data-throw-if-not-resolved="false"></xref>. Mirrors `CallingNamespace.update`.
- [`UpdateCallAsync(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/update-call-async-dictionary-string-object)
- [`UserEventAsync(string, Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.rest.namespaces/calling/user-event-async-string-dictionary-string-object)
