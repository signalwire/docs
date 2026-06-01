---
slug: "/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers"
title: "CompatPhoneNumbers"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.CompatPhoneNumbers"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `CompatPhoneNumbers`

Compat phone-number management with purchase, import, and search.

## Signature

```dotnet
public class CompatPhoneNumbers
```

## Properties

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `BasePath` | `public string BasePath { get; }` | yes      | —       | —           |

## Methods

- [`CompatPhoneNumbers(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/compat-phone-numbers-http-client-string)
- [`DeleteAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/delete-async-string)
- [`GetAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/get-async-string)
- [`ImportNumberAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/import-number-async-dictionary-string-object)
- [`ListAsync(Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/list-async-dictionary-string-string)
- [`ListAvailableCountriesAsync(Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/list-available-countries-async-dictionary-string-string)
- [`PurchaseAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/purchase-async-dictionary-string-object)
- [`SearchLocalAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/search-local-async-string-dictionary-string-string)
- [`SearchTollFreeAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/search-toll-free-async-string-dictionary-string-string)
- [`UpdateAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-phone-numbers/update-async-string-dictionary-string-object)
