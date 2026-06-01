---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/validate-url"
title: "ValidateURL"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.ValidateURL"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/url_validator.go"
---
# `ValidateURL`

ValidateURL reports whether rawURL is safe to fetch (i.e. does not point to a private or internal resource). It returns an error describing why the URL was rejected, or nil if the URL is acceptable.

Behavior mirrors Python's validate\_url(url, allow\_private=False):

- Only http and https schemes are accepted.
- A non-empty hostname is required.
- When allowPrivate is false AND the SWML\_ALLOW\_PRIVATE\_URLS env var is not set to "1", "true", or "yes" (case-insensitive), every IP address that the hostname resolves to is checked against the nine blocked CIDR ranges above. If any resolved IP falls in a blocked range the URL is rejected.

Go idiom: returns (bool, error) instead of a bare bool so callers can log or propagate the rejection reason. Returning (false, nil) never happens — err is always non-nil when the bool is false.

## Signature

```go
func ValidateURL(rawURL string, allowPrivate bool) (bool, error)
```

## Parameters

| Name           | Type     | Required | Default | Description |
| -------------- | -------- | -------- | ------- | ----------- |
| `rawURL`       | `string` | yes      | —       | —           |
| `allowPrivate` | `bool`   | yes      | —       | —           |

## Returns

`(bool, error)`

## Source

[`pkg/swml/url_validator.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/url_validator.go)

Line 73.
