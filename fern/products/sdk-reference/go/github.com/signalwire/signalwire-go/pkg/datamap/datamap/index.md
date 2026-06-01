---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap"
title: "datamap"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/datamap"
  module: "github.com.signalwire.signalwire-go.pkg.datamap"
---
# `datamap`

Package datamap provides a fluent builder for SWAIG data\_map configurations.

DataMap tools execute on SignalWire's servers without requiring webhook endpoints. They support API calls, expression-based pattern matching, variable expansion, and array processing.

Example usage:

```
dm := datamap.New("get_weather").
	Purpose("Get current weather information").
	Parameter("location", "string", "City name", true, nil).
	Webhook("GET", "https://api.weather.com/v1/current?q=${location}", nil, "", false, nil).
	Output(swaig.NewFunctionResult("Weather: ${response.current.condition.text}"))
```

## Signature

```go
package datamap
```

## Examples

**Example 1**

```go
dm := datamap.New("get_weather").
	Purpose("Get current weather information").
	Parameter("location", "string", "City name", true, nil).
	Webhook("GET", "https://api.weather.com/v1/current?q=${location}", nil, "", false, nil).
	Output(swaig.NewFunctionResult("Weather: ${response.current.condition.text}"))
```

**Example 2**

```go
dm := datamap.New("get_weather").
	Purpose("Get current weather information").
	Parameter("location", "string", "City name", true, nil).
	Webhook("GET", "https://api.weather.com/v1/current?q=${location}", nil, "", false, nil).
	Output(swaig.NewFunctionResult("Weather: ${response.current.condition.text}"))
```

## Functions

- [`CreateExpressionTool`](/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/create-expression-tool) — CreateExpressionTool creates a DataMap configured for expression-based pattern matching. name is the function name. patterns maps test values to an ExpressionPattern where Pattern is the regex string and Result is the \*swaig.FunctionResult to return on match. parameters maps parameter names to their definitions (each with "type", "description", "required" keys).
- [`CreateSimpleApiTool`](/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/create-simple-api-tool) — CreateSimpleApiTool creates a DataMap configured for a simple API call. name is the function name. url is the API endpoint URL. responseTemplate is the template for formatting the response. parameters maps parameter names to their definitions (each with "type", "description", "required" keys). method is the HTTP method (e.g., "GET", "POST"). headers are optional HTTP headers (can be nil). body is an optional request body for POST/PUT (can be nil). errorKeys are optional error indicator keys (can be nil).
- [`New`](/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/new) — New creates a new DataMap builder for a function with the given name.

## Classes

- [`DataMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/data-map) — DataMap is a fluent builder for SWAIG data\_map function definitions. Data map tools execute on SignalWire servers without needing a webhook endpoint.
- [`ExpressionPattern`](/reference/go/github.com/signalwire/signalwire-go/pkg/datamap/datamap/expression-pattern) — ExpressionPattern pairs a regex pattern string with a FunctionResult to execute when test\_value matches the pattern. Go equivalent of Python's Tuple\[str, FunctionResult] entry in create\_expression\_tool patterns.
