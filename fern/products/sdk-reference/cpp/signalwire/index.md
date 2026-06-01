---
slug: "/reference/cpp/signalwire"
title: "signalwire"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "module"
  language: "cpp"
  qualified_name: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
---
# `signalwire`

SignalWire webhook signature validation.
Implements both schemes from porting-sdk/webhooks.md:

Scheme A (RELAY/SWML/JSON): hex(HMAC-SHA1(key, url + raw\_body))
Scheme B (Compat/cXML form): base64(HMAC-SHA1(key, url + sortedFormParams)) with optional bodySHA256 query-param fallback for JSON-on-compat-surface.

All comparisons use CRYPTO\_memcmp (constant-time) so the secret is not leaked over repeated requests. The implementation MUST NOT log keys, signatures, or which branch failed — that's a spec requirement.

## Signature

```cpp
namespace signalwire
```

## Functions

- [`add_skill_directory`](/reference/cpp/signalwire/add-skill-directory) — Add a directory to search for skills. Mirrors Python's signalwire.add\_skill\_directory(path) — delegates to the singleton skills::SkillRegistry instance so third-party skill collections can be registered by path.
- [`base64_decode`](/reference/cpp/signalwire/base64-decode)
- [`base64_encode`](/reference/cpp/signalwire/base64-encode)
- [`generate_random_password`](/reference/cpp/signalwire/generate-random-password)
- [`generate_uuid`](/reference/cpp/signalwire/generate-uuid)
- [`get_env`](/reference/cpp/signalwire/get-env)
- [`get_logger`](/reference/cpp/signalwire/get-logger)
- [`list_skills_with_params`](/reference/cpp/signalwire/list-skills-with-params) — Get complete schema for all available skills. Mirrors Python's signalwire.list\_skills\_with\_params(). Returns a map keyed by skill name where each value contains parameter metadata. Useful for GUI configuration tools, API documentation, or programmatic skill discovery. C++ skills don't carry rich Python-style parameter introspection in v1, so each entry contains the skill name and an empty parameter map; built-in skills that expose parameter\_schema() via SkillBase get richer detail merged in.
- [`register_skill`](/reference/cpp/signalwire/register-skill) — Register a custom skill class with the global skill registry. Mirrors Python's signalwire.register\_skill(skill\_class). Delegates to skills::SkillRegistry::register\_skill. The skill's name comes from the supplied skills::SkillBase factory (which instantiates a SkillBase to read its skill\_name() accessor).
- [`RestClient`](/reference/cpp/signalwire/rest-client) — Top-level convenience entry points — mirror Python's signalwire/**init**.py package-level helpers (RestClient, register\_skill, add\_skill\_directory, list\_skills\_with\_params). The audit projects each free function onto the canonical Python signalwire.<name> path. RestClient preserves PascalCase to match Python's same-cased factory function name. Construct a rest::RestClient from positional or keyword credentials. Mirrors Python's top-level signalwire.RestClient(\*args, \*\*kwargs) factory — a thin wrapper that lazy-imports signalwire.rest.RestClient and instantiates it. Supports both positional credentials (args = {project, token, space}) and keyword credentials (kwargs\["project"] etc.) with environment-variable fallback.
- [`timing_safe_compare`](/reference/cpp/signalwire/timing-safe-compare)
- [`url_encode`](/reference/cpp/signalwire/url-encode)

## Type Aliases

- [`json`](/reference/cpp/signalwire/json)

## Classes

- [`Logger`](/reference/cpp/signalwire/logger)

## Enums

- [`LogLevel`](/reference/cpp/signalwire/log-level)

## Modules

- [`@100125301063314044140006005130377163361074200160`](/reference/cpp/signalwire/100125301063314044140006005130377163361074200160)
- [`agent`](/reference/cpp/signalwire/agent)
- [`contexts`](/reference/cpp/signalwire/contexts)
- [`core`](/reference/cpp/signalwire/core)
- [`datamap`](/reference/cpp/signalwire/datamap)
- [`logging`](/reference/cpp/signalwire/logging)
- [`pom`](/reference/cpp/signalwire/pom)
- [`prefabs`](/reference/cpp/signalwire/prefabs)
- [`relay`](/reference/cpp/signalwire/relay)
- [`rest`](/reference/cpp/signalwire/rest)
- [`security`](/reference/cpp/signalwire/security)
- [`server`](/reference/cpp/signalwire/server)
- [`skills`](/reference/cpp/signalwire/skills)
- [`swaig`](/reference/cpp/signalwire/swaig)
- [`swml`](/reference/cpp/signalwire/swml)
- [`utils`](/reference/cpp/signalwire/utils)

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 28.
