---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/join-conference-options"
title: "JoinConferenceOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.JoinConferenceOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `JoinConferenceOptions`

JoinConferenceOptions holds optional parameters for JoinConference beyond the required name.

## Signature

```go
type JoinConferenceOptions struct
```

## Properties

| Name                            | Type                                   | Required | Default | Description                                                                                                |
| ------------------------------- | -------------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------- |
| `Beep`                          | `Beep string`                          | yes      | —       | Beep controls beep behavior: "true" (default), "false", "onEnter", "onExit".                               |
| `Coach`                         | `Coach string`                         | yes      | —       | Coach sets the SWML Call ID or CXML CallSid for coaching.                                                  |
| `EndOnExit`                     | `EndOnExit bool`                       | yes      | —       | EndOnExit controls whether the conference ends when this participant exits (default false).                |
| `MaxParticipants`               | `MaxParticipants int`                  | yes      | —       | MaxParticipants sets the maximum number of participants (<= 250). 0 uses server default.                   |
| `Muted`                         | `Muted bool`                           | yes      | —       | Muted joins the conference muted when true.                                                                |
| `Record`                        | `Record string`                        | yes      | —       | Record sets the recording mode: "do-not-record" (default) or "record-from-start".                          |
| `RecordingStatusCallback`       | `RecordingStatusCallback string`       | yes      | —       | RecordingStatusCallback is the URL for recording status callbacks.                                         |
| `RecordingStatusCallbackEvent`  | `RecordingStatusCallbackEvent string`  | yes      | —       | RecordingStatusCallbackEvent sets recording events to report.                                              |
| `RecordingStatusCallbackMethod` | `RecordingStatusCallbackMethod string` | yes      | —       | RecordingStatusCallbackMethod sets the HTTP method for recording callbacks ("GET" or "POST").              |
| `Region`                        | `Region string`                        | yes      | —       | Region sets the conference region.                                                                         |
| `Result`                        | `Result any`                           | yes      | —       | Result sets switch-on-return-value behavior (object or array).                                             |
| `StartOnEnter`                  | `StartOnEnter *bool`                   | yes      | —       | StartOnEnter controls whether the conference starts when this participant enters (default true in Python). |
| `StatusCallback`                | `StatusCallback string`                | yes      | —       | StatusCallback is the URL for status callbacks.                                                            |
| `StatusCallbackEvent`           | `StatusCallbackEvent string`           | yes      | —       | StatusCallbackEvent specifies events to report (space-separated).                                          |
| `StatusCallbackMethod`          | `StatusCallbackMethod string`          | yes      | —       | StatusCallbackMethod sets the HTTP method for status callbacks ("GET" or "POST").                          |
| `Trim`                          | `Trim string`                          | yes      | —       | Trim controls silence trimming: "trim-silence" (default) or "do-not-trim".                                 |
| `WaitURL`                       | `WaitURL string`                       | yes      | —       | WaitURL is the SWML URL for hold music (replaces the old holdAudio parameter).                             |

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 471.
