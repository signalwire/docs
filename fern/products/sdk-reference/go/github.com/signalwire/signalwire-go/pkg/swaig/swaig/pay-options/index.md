---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/pay-options"
title: "PayOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.PayOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `PayOptions`

PayOptions holds all optional parameters for the Pay method.

## Signature

```go
type PayOptions struct
```

## Properties

| Name                  | Type                             | Required | Default | Description                                                                                                                                                |
| --------------------- | -------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AIResponse`          | `AIResponse string`              | yes      | —       | AIResponse is the message set via "set" verb before pay; empty string uses Python default. Set to "-" to suppress the set verb entirely (no ai\_response). |
| `ChargeAmount`        | `ChargeAmount string`            | yes      | —       | ChargeAmount is the amount to charge as a decimal string (e.g. "9.99").                                                                                    |
| `Currency`            | `Currency string`                | yes      | —       | Currency is the currency code. Defaults to "usd".                                                                                                          |
| `Description`         | `Description string`             | yes      | —       | Description is a custom payment description.                                                                                                               |
| `InputMethod`         | `InputMethod string`             | yes      | —       | InputMethod is the method to collect payment details ("dtmf" or "voice"). Defaults to "dtmf".                                                              |
| `Language`            | `Language string`                | yes      | —       | Language is the language for prompts. Defaults to "en-US".                                                                                                 |
| `MaxAttempts`         | `MaxAttempts int`                | yes      | —       | MaxAttempts is the number of retry attempts. Defaults to 1.                                                                                                |
| `MinPostalCodeLength` | `MinPostalCodeLength int`        | yes      | —       | MinPostalCodeLength sets the minimum number of postal code digits. Defaults to 0.                                                                          |
| `Parameters`          | `Parameters []map[string]string` | yes      | —       | Parameters is an array of name/value pairs for the payment connector.                                                                                      |
| `PaymentMethod`       | `PaymentMethod string`           | yes      | —       | PaymentMethod is the payment method type. Defaults to "credit-card".                                                                                       |
| `PostalCode`          | `PostalCode any`                 | yes      | —       | PostalCode controls whether to prompt for postal code, or supplies the actual code. String value is used as-is; bool true/false becomes "true"/"false".    |
| `Prompts`             | `Prompts []map[string]any`       | yes      | —       | Prompts is an array of custom prompt configurations.                                                                                                       |
| `SecurityCode`        | `SecurityCode bool`              | yes      | —       | SecurityCode controls whether to prompt for security code. Defaults to true. Use SecurityCodeSet to override; zero value (false) is treated as "not set".  |
| `SecurityCodeSet`     | `SecurityCodeSet bool`           | yes      | —       | SecurityCodeSet must be true to explicitly set SecurityCode=false.                                                                                         |
| `StatusURL`           | `StatusURL string`               | yes      | —       | StatusURL is the URL for payment status change notifications.                                                                                              |
| `Timeout`             | `Timeout int`                    | yes      | —       | Timeout is the seconds to wait for the next digit. Defaults to 5.                                                                                          |
| `TokenType`           | `TokenType string`               | yes      | —       | TokenType is the payment token type: "one-time" or "reusable". Defaults to "reusable".                                                                     |
| `ValidCardTypes`      | `ValidCardTypes string`          | yes      | —       | ValidCardTypes is a space-separated list of card types. Defaults to "visa mastercard amex".                                                                |
| `Voice`               | `Voice string`                   | yes      | —       | Voice is the TTS voice to use. Defaults to "woman".                                                                                                        |

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 688.
