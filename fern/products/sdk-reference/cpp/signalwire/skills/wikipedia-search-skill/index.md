---
slug: "/reference/cpp/signalwire/skills/wikipedia-search-skill"
title: "WikipediaSearchSkill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::skills::WikipediaSearchSkill"
  parent: "signalwire::skills"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/wikipedia_search.cpp"
  visibility: "public"
---
# `WikipediaSearchSkill`

Wikipedia search skill — issues a real GET against the Wikipedia API /w/api.php endpoint with action=query\&list=search, parses the query.search\[] results, and returns titles + snippets. Matches the Python WikipediaSearchSkill upstream call shape.
WIKIPEDIA\_BASE\_URL env var overrides the API root (used by audit\_skills\_dispatch.py to point the skill at its loopback fixture).

## Signature

```cpp
class signalwire::skills::WikipediaSearchSkill : signalwire::skills::SkillBase
```

## Inheritance

**Extends:** [signalwire::skills::SkillBase](/reference/cpp/signalwire/skills/skill-base)

## Methods

- [`get_prompt_sections`](/reference/cpp/signalwire/skills/wikipedia-search-skill/get-prompt-sections) — Get prompt sections to inject into agent.
- [`register_tools`](/reference/cpp/signalwire/skills/wikipedia-search-skill/register-tools) — Register tools with the agent. Returns tool definitions.
- [`setup`](/reference/cpp/signalwire/skills/wikipedia-search-skill/setup) — Initialize the skill with given params. Return true on success.
- [`skill_description`](/reference/cpp/signalwire/skills/wikipedia-search-skill/skill-description)
- [`skill_name`](/reference/cpp/signalwire/skills/wikipedia-search-skill/skill-name)

## Source

[`src/skills/builtin/wikipedia_search.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/wikipedia_search.cpp)

Line 20.
