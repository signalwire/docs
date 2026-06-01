---
slug: "/reference/cpp/signalwire/skills/web-search-skill"
title: "WebSearchSkill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::skills::WebSearchSkill"
  parent: "signalwire::skills"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/web_search.cpp"
  visibility: "public"
---
# `WebSearchSkill`

Google Custom Search API skill — issues a real GET against Google's customsearch/v1 endpoint, parses the items\[] results, and returns a human-readable summary. Matches Python's WebSearchSkill behavior.
Configuration:
api\_key (or env GOOGLE\_SEARCH\_API\_KEY / GOOGLE\_API\_KEY)
search\_engine\_id (or env GOOGLE\_SEARCH\_ENGINE\_ID / GOOGLE\_CSE\_ID)
num\_results (default 3)
tool\_name (default "web\_search")
WEB\_SEARCH\_BASE\_URL env var overrides the upstream URL (used by audit\_skills\_dispatch.py to point the skill at a fixture)

## Signature

```cpp
class signalwire::skills::WebSearchSkill : signalwire::skills::SkillBase
```

## Inheritance

**Extends:** [signalwire::skills::SkillBase](/reference/cpp/signalwire/skills/skill-base)

## Methods

- [`get_global_data`](/reference/cpp/signalwire/skills/web-search-skill/get-global-data) — Get global data to merge into agent.
- [`get_prompt_sections`](/reference/cpp/signalwire/skills/web-search-skill/get-prompt-sections) — Get prompt sections to inject into agent.
- [`register_tools`](/reference/cpp/signalwire/skills/web-search-skill/register-tools) — Register tools with the agent. Returns tool definitions.
- [`setup`](/reference/cpp/signalwire/skills/web-search-skill/setup) — Initialize the skill with given params. Return true on success.
- [`skill_description`](/reference/cpp/signalwire/skills/web-search-skill/skill-description)
- [`skill_name`](/reference/cpp/signalwire/skills/web-search-skill/skill-name)
- [`skill_version`](/reference/cpp/signalwire/skills/web-search-skill/skill-version)
- [`supports_multiple_instances`](/reference/cpp/signalwire/skills/web-search-skill/supports-multiple-instances)

## Source

[`src/skills/builtin/web_search.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/web_search.cpp)

Line 24.
