---
slug: "/reference/python/signalwire/core/agent-base/agent-base/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent_base.AgentBase.__init__"
  parent: "signalwire.core.agent_base.AgentBase"
  module: "signalwire.core.agent_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py"
---
# `__init__`

Initialize a new agent

## Signature

```python
__init__(
    name: str,
    route: str = '/',
    host: str = '0.0.0.0',
    port: Optional[int] = None,
    basic_auth: Optional[Tuple[str, str]] = None,
    use_pom: bool = True,
    token_expiry_secs: int = 3600,
    auto_answer: bool = True,
    record_call: bool = False,
    record_format: str = 'mp4',
    record_stereo: bool = True,
    default_webhook_url: Optional[str] = None,
    agent_id: Optional[str] = None,
    native_functions: Optional[List[str]] = None,
    schema_path: Optional[str] = None,
    suppress_logs: bool = False,
    enable_post_prompt_override: bool = False,
    check_for_input_override: bool = False,
    config_file: Optional[str] = None,
    schema_validation: bool = True,
    signing_key: Optional[str] = None,
    trust_proxy_for_signature: bool = False
)
```

## Parameters

| Name                          | Type                        | Required | Default     | Description                                                                                                                                                                                                                                                                                                                |
| ----------------------------- | --------------------------- | -------- | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`                        | `str`                       | yes      | —           | Agent name/identifier                                                                                                                                                                                                                                                                                                      |
| `route`                       | `str`                       | no       | `'/'`       | HTTP route path for this agent                                                                                                                                                                                                                                                                                             |
| `host`                        | `str`                       | no       | `'0.0.0.0'` | Host to bind the web server to                                                                                                                                                                                                                                                                                             |
| `port`                        | `Optional[int]`             | no       | `None`      | Port to bind the web server to                                                                                                                                                                                                                                                                                             |
| `basic_auth`                  | `Optional[Tuple[str, str]]` | no       | `None`      | Optional (username, password) tuple for basic auth                                                                                                                                                                                                                                                                         |
| `use_pom`                     | `bool`                      | no       | `True`      | Whether to use POM for prompt building                                                                                                                                                                                                                                                                                     |
| `token_expiry_secs`           | `int`                       | no       | `3600`      | Seconds until tokens expire                                                                                                                                                                                                                                                                                                |
| `auto_answer`                 | `bool`                      | no       | `True`      | Whether to automatically answer calls                                                                                                                                                                                                                                                                                      |
| `record_call`                 | `bool`                      | no       | `False`     | Whether to record calls                                                                                                                                                                                                                                                                                                    |
| `record_format`               | `str`                       | no       | `'mp4'`     | Recording format                                                                                                                                                                                                                                                                                                           |
| `record_stereo`               | `bool`                      | no       | `True`      | Whether to record in stereo                                                                                                                                                                                                                                                                                                |
| `default_webhook_url`         | `Optional[str]`             | no       | `None`      | Optional default webhook URL for all SWAIG functions                                                                                                                                                                                                                                                                       |
| `agent_id`                    | `Optional[str]`             | no       | `None`      | Optional unique ID for this agent, generated if not provided                                                                                                                                                                                                                                                               |
| `native_functions`            | `Optional[List[str]]`       | no       | `None`      | Optional list of native functions to include in the SWAIG object                                                                                                                                                                                                                                                           |
| `schema_path`                 | `Optional[str]`             | no       | `None`      | Optional path to the schema file                                                                                                                                                                                                                                                                                           |
| `suppress_logs`               | `bool`                      | no       | `False`     | Whether to suppress structured logs                                                                                                                                                                                                                                                                                        |
| `enable_post_prompt_override` | `bool`                      | no       | `False`     | Whether to enable post-prompt override                                                                                                                                                                                                                                                                                     |
| `check_for_input_override`    | `bool`                      | no       | `False`     | Whether to enable check-for-input override                                                                                                                                                                                                                                                                                 |
| `config_file`                 | `Optional[str]`             | no       | `None`      | Optional path to configuration file                                                                                                                                                                                                                                                                                        |
| `schema_validation`           | `bool`                      | no       | `True`      | Enable SWML schema validation. Default True. Can also be disabled via SWML\_SKIP\_SCHEMA\_VALIDATION=1 env var.                                                                                                                                                                                                            |
| `signing_key`                 | `Optional[str]`             | no       | `None`      | Optional SignalWire Signing Key (from Dashboard → API Credentials). When set, webhook signature validation is enforced on POST /, /swaig, /post\_prompt — unsigned or invalidly-signed requests get a 403. Falls back to the SIGNALWIRE\_SIGNING\_KEY env var if not passed. See porting-sdk/webhooks.md for the contract. |
| `trust_proxy_for_signature`   | `bool`                      | no       | `False`     | If True, honor X-Forwarded-Proto / X-Forwarded-Host when reconstructing the URL during signature validation. Default False — proxy headers are spoofable, so opt in only when you control the proxy chain.                                                                                                                 |

## Source

[`/src/signalwire/signalwire/core/agent_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py)

Line 108.
