---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/department"
title: "Department"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.Department"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/receptionist.go"
---
# `Department`

Department describes a destination the receptionist can transfer to.

## Signature

```go
type Department struct
```

## Properties

| Name           | Type                 | Required | Default | Description                                              |
| -------------- | -------------------- | -------- | ------- | -------------------------------------------------------- |
| `Description`  | `Description string` | yes      | —       | what the department handles                              |
| `Name`         | `Name string`        | yes      | —       | e.g. "sales"                                             |
| `Number`       | `Number string`      | yes      | —       | phone number or SWML transfer destination                |
| `TransferSWML` | `TransferSWML bool`  | yes      | —       | true if Number is a SWML destination (uses SwmlTransfer) |

## Source

[`pkg/prefabs/receptionist.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/receptionist.go)

Line 15.
