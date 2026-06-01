---
slug: "/reference/php/signal-wire/rest/namespaces/namespaces/calling"
title: "Calling"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\Namespaces\\Calling"
  parent: "SignalWire\\REST\\Namespaces"
  module: "SignalWire.REST.Namespaces"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/Namespaces/Calling.php"
---
# `Calling`

Calling API namespace.

Provides 37 call-control command methods that each POST to
/api/calling/calls with a JSON body containing the command name,
an optional call ID, and parameters.

## Signature

```php
class Calling
```

## Methods

- [`__construct`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/construct)
- [`aiHold`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/ai-hold)
- [`aiMessage`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/ai-message)
- [`aiStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/ai-stop)
- [`aiUnhold`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/ai-unhold)
- [`collect`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/collect)
- [`collectStartInputTimers`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/collect-start-input-timers)
- [`collectStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/collect-stop)
- [`denoise`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/denoise)
- [`denoiseStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/denoise-stop)
- [`detect`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/detect)
- [`detectStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/detect-stop)
- [`dial`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/dial)
- [`disconnect`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/disconnect)
- [`end`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/end)
- [`getBasePath`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/get-base-path)
- [`getClient`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/get-client)
- [`getProjectId`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/get-project-id)
- [`liveTranscribe`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/live-transcribe)
- [`liveTranslate`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/live-translate)
- [`play`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/play)
- [`playPause`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/play-pause)
- [`playResume`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/play-resume)
- [`playStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/play-stop)
- [`playVolume`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/play-volume)
- [`receiveFaxStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/receive-fax-stop)
- [`record`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/record)
- [`recordPause`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/record-pause)
- [`recordResume`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/record-resume)
- [`recordStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/record-stop)
- [`refer`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/refer)
- [`sendFaxStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/send-fax-stop)
- [`stream`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/stream)
- [`streamStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/stream-stop)
- [`tap`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/tap)
- [`tapStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/tap-stop)
- [`transcribe`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/transcribe)
- [`transcribeStop`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/transcribe-stop)
- [`transfer`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/transfer)
- [`update`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/update) — Send the bare `update` command (no call\_id at body root; `id` is
- [`userEvent`](/reference/php/signal-wire/rest/namespaces/namespaces/calling/user-event)

## Source

[`/src/src/SignalWire/REST/Namespaces/Calling.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/Namespaces/Calling.php)

Line 16.
