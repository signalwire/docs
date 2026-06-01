---
slug: "/reference/php/signal-wire/rest/rest/http-client"
title: "HttpClient"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\HttpClient"
  parent: "SignalWire\\REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/HttpClient.php"
---
# `HttpClient`

Low-level HTTP client for SignalWire REST APIs.

Uses cURL for HTTP requests, Basic Auth with project\_id:token,
and returns parsed JSON responses as associative arrays.

## Signature

```php
class HttpClient
```

## Methods

- [`__construct`](/reference/php/signal-wire/rest/rest/http-client/construct)
- [`delete`](/reference/php/signal-wire/rest/rest/http-client/delete)
- [`get`](/reference/php/signal-wire/rest/rest/http-client/get)
- [`getAuthHeader`](/reference/php/signal-wire/rest/rest/http-client/get-auth-header)
- [`getBaseUrl`](/reference/php/signal-wire/rest/rest/http-client/get-base-url)
- [`getProjectId`](/reference/php/signal-wire/rest/rest/http-client/get-project-id)
- [`getToken`](/reference/php/signal-wire/rest/rest/http-client/get-token)
- [`listAll`](/reference/php/signal-wire/rest/rest/http-client/list-all) — Return a generator that follows `next` links automatically.
- [`patch`](/reference/php/signal-wire/rest/rest/http-client/patch)
- [`post`](/reference/php/signal-wire/rest/rest/http-client/post)
- [`put`](/reference/php/signal-wire/rest/rest/http-client/put)

## Source

[`/src/src/SignalWire/REST/HttpClient.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/HttpClient.php)

Line 13.
