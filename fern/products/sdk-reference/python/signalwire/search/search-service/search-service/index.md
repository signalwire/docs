---
slug: "/reference/python/signalwire/search/search-service/search-service"
title: "SearchService"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.search.search_service.SearchService"
  parent: "signalwire.search.search_service"
  module: "signalwire.search.search_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_service.py"
---
# `SearchService`

Local search service with HTTP API supporting both SQLite and pgvector backends

## Signature

```python
class SearchService
```

## Properties

| Name                | Type                | Required | Default | Description |
| ------------------- | ------------------- | -------- | ------- | ----------- |
| `app`               | `app`               | yes      | —       | —           |
| `backend`           | `backend`           | yes      | —       | —           |
| `connection_string` | `connection_string` | yes      | —       | —           |
| `indexes`           | `indexes`           | yes      | —       | —           |
| `model`             | `model`             | yes      | —       | —           |
| `port`              | `port`              | yes      | —       | —           |
| `search_engines`    | `search_engines`    | yes      | —       | —           |
| `security`          | `security`          | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/search/search-service/search-service/init)
- [`search_direct`](/reference/python/signalwire/search/search-service/search-service/search-direct) — Direct search method (non-async) for programmatic use
- [`start`](/reference/python/signalwire/search/search-service/search-service/start) — Start the service with optional HTTPS support.
- [`stop`](/reference/python/signalwire/search/search-service/search-service/stop) — Stop the service (placeholder for cleanup)

## Source

[`/src/signalwire/signalwire/search/search_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_service.py)

Line 100.
