---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers"
title: "CompatPhoneNumbers"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatPhoneNumbers"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `CompatPhoneNumbers`

CompatPhoneNumbers provides compat phone number management.

## Signature

```go
type CompatPhoneNumbers struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`Delete`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/delete) — Delete releases an incoming phone number.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/get) — Get retrieves an incoming phone number by SID.
- [`ImportNumber`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/import-number) — ImportNumber imports an externally-hosted phone number.
- [`List`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/list) — List lists all incoming phone numbers.
- [`ListAvailableCountries`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/list-available-countries) — ListAvailableCountries lists countries with available numbers.
- [`Purchase`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/purchase) — Purchase purchases a phone number.
- [`SearchLocal`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/search-local) — SearchLocal searches for available local numbers in a country.
- [`SearchTollFree`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/search-toll-free) — SearchTollFree searches for available toll-free numbers in a country.
- [`Update`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-phone-numbers/update) — Update updates an incoming phone number.

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 207.
