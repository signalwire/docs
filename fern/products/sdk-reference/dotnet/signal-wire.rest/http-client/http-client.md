---
slug: "/reference/dotnet/signal-wire.rest/http-client/http-client"
title: "HttpClient"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.HttpClient.HttpClient(string, string, string)"
  parent: "SignalWire.REST.HttpClient"
  module: "SignalWire.REST"
  visibility: "public"
---
# `HttpClient`

## Signature

**Overload 1**

```dotnet
public HttpClient(string projectId, string token, string baseUrl)
```

**Overload 2**

```dotnet
public HttpClient(string projectId, string token, string baseUrl, HttpClient? httpClient)
```

## Parameters (Overload 1)

| Name        | Type     | Required | Default | Description |
| ----------- | -------- | -------- | ------- | ----------- |
| `projectId` | `string` | yes      | —       | —           |
| `token`     | `string` | yes      | —       | —           |
| `baseUrl`   | `string` | yes      | —       | —           |

## Parameters (Overload 2)

| Name         | Type                         | Required | Default | Description |
| ------------ | ---------------------------- | -------- | ------- | ----------- |
| `projectId`  | `string`                     | yes      | —       | —           |
| `token`      | `string`                     | yes      | —       | —           |
| `baseUrl`    | `string`                     | yes      | —       | —           |
| `httpClient` | `System.Net.Http.HttpClient` | yes      | —       | —           |
