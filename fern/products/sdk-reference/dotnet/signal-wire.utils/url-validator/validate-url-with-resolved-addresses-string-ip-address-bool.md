---
slug: "/reference/dotnet/signal-wire.utils/url-validator/validate-url-with-resolved-addresses-string-ip-address-bool"
title: "ValidateUrlWithResolvedAddresses(string, IPAddress[], bool)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Utils.UrlValidator.ValidateUrlWithResolvedAddresses(string, System.Net.IPAddress[], bool)"
  parent: "SignalWire.Utils.UrlValidator"
  module: "SignalWire.Utils"
  visibility: "public"
---
# `ValidateUrlWithResolvedAddresses(string, IPAddress[], bool)`

Test-friendly overload that accepts already-resolved IPs
instead of doing a live DNS lookup. Cross-language audit / unit
tests use this to exercise the blocked-range logic deterministically.

**Modifiers:** `static`

## Signature

```dotnet
public static bool ValidateUrlWithResolvedAddresses(string url, IPAddress[] resolvedAddresses, bool allowPrivate = false)
```

## Parameters

| Name                | Type                     | Required | Default | Description |
| ------------------- | ------------------------ | -------- | ------- | ----------- |
| `url`               | `string`                 | yes      | —       | —           |
| `resolvedAddresses` | `System.Net.IPAddress[]` | yes      | —       | —           |
| `allowPrivate`      | `bool`                   | no       | `false` | —           |

## Returns

`bool`
