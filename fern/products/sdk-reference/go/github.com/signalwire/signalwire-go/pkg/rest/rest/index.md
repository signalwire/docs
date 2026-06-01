---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest"
title: "rest"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
---
# `rest`

Package rest provides a REST client for the SignalWire platform APIs.

It includes an HTTP transport layer, generic CRUD resource abstractions, paginated iteration, and namespaced sub-clients for each API domain.

## Signature

```go
package rest
```

## Functions

- [`NewCrudResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-crud-resource) — NewCrudResource creates a CrudResource for the given path. The default update method is PATCH.
- [`NewCrudResourcePUT`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-crud-resource-put) — NewCrudResourcePUT creates a CrudResource that uses PUT for updates.
- [`NewHttpClient`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-http-client) — NewHttpClient creates a new HttpClient configured for the given SignalWire space. The baseURL is normally constructed as "https://\<space>", but the SIGNALWIRE\_REST\_BASE\_URL environment variable overrides it when set — pointing the client at a loopback fixture for the porting-sdk audit\_rest\_transport.py harness, or at any non-default endpoint.
- [`NewPaginatedIterator`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-paginated-iterator) — NewPaginatedIterator creates a new iterator for the given endpoint. dataKey is the JSON key that holds the array of items (typically "data").
- [`NewRestClient`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-rest-client) — NewRestClient creates a new RestClient. If project, token, or space are empty strings the corresponding environment variables are used:
- [`NewSignalWireRestError`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-signal-wire-rest-error) — NewSignalWireRestError constructs a SignalWireRestError, substituting "GET" as the method when method is empty — matches Python's default.

## Classes

- [`CrudResource`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/crud-resource) — CrudResource provides standard List, Create, Get, Update, Delete operations against a REST collection endpoint. Update defaults to PATCH; set UpdateMethod to "PUT" to override.
- [`HttpClient`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/http-client) — HttpClient is a thin wrapper around net/http that provides Basic Auth, JSON encoding/decoding, and standard headers for SignalWire API calls.
- [`PaginatedIterator`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/paginated-iterator) — PaginatedIterator walks through paginated API responses one page at a time. Each call to Next returns the items from the current page, a boolean indicating whether more pages exist, and any error encountered.
- [`RestClient`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/rest-client) — RestClient is the top-level REST client for the SignalWire platform. It provides namespaced access to all SignalWire API domains.
- [`SignalWireRestError`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/signal-wire-rest-error) — SignalWireRestError is returned when the SignalWire REST API responds with a non-2xx status code.
