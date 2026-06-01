---
slug: "/reference/php/signal-wire/rest/rest/rest-client/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\REST\\RestClient::__construct"
  parent: "SignalWire\\REST\\RestClient"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/RestClient.php"
  visibility: "public"
---
# `__construct`

## Signature

```php
public function __construct(
    string $projectId = '',
    string $token = '',
    string $space = ''
)
```

## Parameters

| Name        | Type     | Required | Default | Description                                                                                                                                                                                                                                    |
| ----------- | -------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `projectId` | `string` | no       | `''`    | Project ID (falls back to SIGNALWIRE\_PROJECT\_ID env var).                                                                                                                                                                                    |
| `token`     | `string` | no       | `''`    | API token  (falls back to SIGNALWIRE\_API\_TOKEN env var).                                                                                                                                                                                     |
| `space`     | `string` | no       | `''`    | Space host or full base URL. - "mycompany.signalwire.com" → https://mycompany.signalwire.com - "https://example.com:8080" → used verbatim - "http://127.0.0.1:8080"   → used verbatim (test fixtures) Falls back to SIGNALWIRE\_SPACE env var. |

## Source

[`/src/src/SignalWire/REST/RestClient.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/RestClient.php)

Line 73.
