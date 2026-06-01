---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/record-call-options"
title: "RecordCallOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.RecordCallOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `RecordCallOptions`

RecordCallOptions holds optional parameters for RecordCall beyond the required fields.

## Signature

```go
type RecordCallOptions struct
```

## Properties

| Name                   | Type                        | Required | Default | Description                                                                                                                      |
| ---------------------- | --------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `Beep`                 | `Beep bool`                 | yes      | —       | Beep plays a beep before recording starts when true.                                                                             |
| `EndSilenceTimeout`    | `EndSilenceTimeout float64` | yes      | —       | EndSilenceTimeout is seconds of silence before ending (voicemail-style). Negative value is omitted.                              |
| `EndSilenceTimeoutSet` | `EndSilenceTimeoutSet bool` | yes      | —       | EndSilenceTimeoutSet must be true for EndSilenceTimeout of 0.0 to be included.                                                   |
| `InitialTimeout`       | `InitialTimeout float64`    | yes      | —       | InitialTimeout is the time in seconds to wait for speech to start (voicemail-style). Negative value is omitted.                  |
| `InitialTimeoutSet`    | `InitialTimeoutSet bool`    | yes      | —       | InitialTimeoutSet must be true for InitialTimeout of 0.0 to be included.                                                         |
| `InputSensitivity`     | `InputSensitivity float64`  | yes      | —       | InputSensitivity sets the input sensitivity for recording (default 44.0 in Python). Zero value is omitted from the SWML payload. |
| `MaxLength`            | `MaxLength float64`         | yes      | —       | MaxLength is the maximum recording length in seconds. Negative value is omitted.                                                 |
| `MaxLengthSet`         | `MaxLengthSet bool`         | yes      | —       | MaxLengthSet must be true for MaxLength of 0.0 to be included.                                                                   |
| `StatusURL`            | `StatusURL string`          | yes      | —       | StatusURL is the URL to send recording status events to.                                                                         |
| `Terminators`          | `Terminators string`        | yes      | —       | Terminators specifies digits that stop recording when pressed.                                                                   |

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 306.
