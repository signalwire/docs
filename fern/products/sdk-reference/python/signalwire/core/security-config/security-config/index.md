---
slug: "/reference/python/signalwire/core/security-config/security-config"
title: "SecurityConfig"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.security_config.SecurityConfig"
  parent: "signalwire.core.security_config"
  module: "signalwire.core.security_config"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security_config.py"
---
# `SecurityConfig`

Unified security configuration for SignalWire services.

This class provides centralized security settings that can be used by
both SWML and Search services, ensuring consistent security behavior.

## Signature

```python
class SecurityConfig
```

## Properties

| Name                  | Type                  | Required | Default | Description |
| --------------------- | --------------------- | -------- | ------- | ----------- |
| `ALLOWED_HOSTS`       | `ALLOWED_HOSTS`       | yes      | —       | —           |
| `BASIC_AUTH_PASSWORD` | `BASIC_AUTH_PASSWORD` | yes      | —       | —           |
| `BASIC_AUTH_USER`     | `BASIC_AUTH_USER`     | yes      | —       | —           |
| `CORS_ORIGINS`        | `CORS_ORIGINS`        | yes      | —       | —           |
| `DEFAULTS`            | `DEFAULTS`            | yes      | —       | —           |
| `HSTS_MAX_AGE`        | `HSTS_MAX_AGE`        | yes      | —       | —           |
| `MAX_REQUEST_SIZE`    | `MAX_REQUEST_SIZE`    | yes      | —       | —           |
| `RATE_LIMIT`          | `RATE_LIMIT`          | yes      | —       | —           |
| `REQUEST_TIMEOUT`     | `REQUEST_TIMEOUT`     | yes      | —       | —           |
| `SSL_CERT_PATH`       | `SSL_CERT_PATH`       | yes      | —       | —           |
| `SSL_DOMAIN`          | `SSL_DOMAIN`          | yes      | —       | —           |
| `SSL_ENABLED`         | `SSL_ENABLED`         | yes      | —       | —           |
| `SSL_KEY_PATH`        | `SSL_KEY_PATH`        | yes      | —       | —           |
| `SSL_VERIFY_MODE`     | `SSL_VERIFY_MODE`     | yes      | —       | —           |
| `USE_HSTS`            | `USE_HSTS`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/security-config/security-config/init) — Initialize security configuration.
- [`get_basic_auth`](/reference/python/signalwire/core/security-config/security-config/get-basic-auth) — Get basic auth credentials, generating if not set.
- [`get_cors_config`](/reference/python/signalwire/core/security-config/security-config/get-cors-config) — Get CORS configuration for FastAPI.
- [`get_security_headers`](/reference/python/signalwire/core/security-config/security-config/get-security-headers) — Get security headers to add to responses.
- [`get_ssl_context_kwargs`](/reference/python/signalwire/core/security-config/security-config/get-ssl-context-kwargs) — Get SSL context kwargs for uvicorn.
- [`get_url_scheme`](/reference/python/signalwire/core/security-config/security-config/get-url-scheme) — Get the URL scheme based on SSL configuration
- [`load_from_env`](/reference/python/signalwire/core/security-config/security-config/load-from-env) — Load configuration from environment variables
- [`log_config`](/reference/python/signalwire/core/security-config/security-config/log-config) — Log the current security configuration
- [`should_allow_host`](/reference/python/signalwire/core/security-config/security-config/should-allow-host) — Check if a host is allowed.
- [`validate_ssl_config`](/reference/python/signalwire/core/security-config/security-config/validate-ssl-config) — Validate SSL configuration.

## Source

[`/src/signalwire/signalwire/core/security_config.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security_config.py)

Line 19.
