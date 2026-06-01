---
slug: "/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway"
title: "McpGateway"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Skills\\Builtin\\McpGateway"
  parent: "SignalWire\\Skills\\Builtin"
  module: "SignalWire.Skills.Builtin"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/McpGateway.php"
---
# `McpGateway`

MCP Gateway skill.

Mirrors signalwire-python's `signalwire.skills.mcp_gateway.skill`:

POST {gateway\_url}/services/{service}/call
Auth: Bearer auth\_token  OR  Basic auth\_user:auth\_password
Body: { tool, arguments, session\_id, timeout, metadata }
Response: { result } — surfaced verbatim

For session cleanup the Python skill issues `DELETE
/sessions/{session_id}` from the hangup-hook tool. The audit only
exercises the per-tool `call` path; the hangup hook is preserved
but does not block on the audit.

No upstream URL override env var — the gateway URL is mandatory and
fully user-supplied (no third-party host to mock). The audit path
isn't probed for this skill (it's not in audit\_skills\_dispatch's
SKILL\_PROBES list as of this writing) but the implementation must
still be real because the surface is shipped to users.

## Signature

```php
class McpGateway extends SkillBase
```

## Inheritance

**Extends:** [SignalWire\Skills\SkillBase](/reference/php/signal-wire/skills/skills/skill-base)

## Methods

- [`__construct`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/construct)
- [`cleanup`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/cleanup)
- [`getDescription`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/get-description)
- [`getGlobalData`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/get-global-data)
- [`getHints`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/get-hints)
- [`getInstanceKey`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/get-instance-key)
- [`getName`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/get-name)
- [`getParameterSchema`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/get-parameter-schema)
- [`getPromptSections`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/get-prompt-sections)
- [`getRequiredEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/get-required-env-vars)
- [`getVersion`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/get-version)
- [`registerTools`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/register-tools)
- [`setup`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/setup)
- [`supportsMultipleInstances`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/supports-multiple-instances)
- [`validateEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/mcp-gateway/validate-env-vars)

## Source

[`/src/src/SignalWire/Skills/Builtin/McpGateway.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/McpGateway.php)

Line 32.
