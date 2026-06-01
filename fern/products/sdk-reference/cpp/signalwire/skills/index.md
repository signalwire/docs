---
slug: "/reference/cpp/signalwire/skills"
title: "skills"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "module"
  language: "cpp"
  qualified_name: "signalwire::skills"
  parent: "signalwire"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_base.hpp"
---
# `skills`

## Signature

```cpp
namespace signalwire::skills
```

## Functions

- [`ensure_builtin_skills_registered`](/reference/cpp/signalwire/skills/ensure-builtin-skills-registered) — Ensure all built-in skills are registered. Called automatically but can be called explicitly to force linkage.
- [`http_get`](/reference/cpp/signalwire/skills/http-get) — Issue a real HTTP GET. Implementation uses cpp-httplib so it works against any plain-HTTP host (including loopback fixtures used by the audit\_skills\_dispatch.py audit). Skills that need TLS to reach production upstreams set the appropriate base-URL env var (e.g. WEB\_SEARCH\_BASE\_URL) — production deployments point at TLS proxies or a dev-side rewriter; the SDK keeps its transport stack OpenSSL-3 independent until the wider port adopts it.
- [`http_post`](/reference/cpp/signalwire/skills/http-post) — Issue a real HTTP POST with body as the request body and content\_type for Content-Type. Same semantics as http\_get for status / error / body.

## Type Aliases

- [`json`](/reference/cpp/signalwire/skills/json)
- [`SkillFactory`](/reference/cpp/signalwire/skills/skill-factory) — Factory function type for creating skill instances.

## Classes

- [`ApiNinjasTriviaSkill`](/reference/cpp/signalwire/skills/api-ninjas-trivia-skill)
- [`ApiNinjasTriviaSkillR`](/reference/cpp/signalwire/skills/api-ninjas-trivia-skill-r)
- [`ClaudeSkillsSkill`](/reference/cpp/signalwire/skills/claude-skills-skill)
- [`ClaudeSkillsSkillR`](/reference/cpp/signalwire/skills/claude-skills-skill-r)
- [`CustomSkillsSkill`](/reference/cpp/signalwire/skills/custom-skills-skill)
- [`CustomSkillsSkillR`](/reference/cpp/signalwire/skills/custom-skills-skill-r)
- [`DatasphereServerlessSkill`](/reference/cpp/signalwire/skills/datasphere-serverless-skill)
- [`DatasphereServerlessSkillR`](/reference/cpp/signalwire/skills/datasphere-serverless-skill-r)
- [`DatasphereSkill`](/reference/cpp/signalwire/skills/datasphere-skill) — SignalWire DataSphere RAG search skill — issues a real POST against the DataSphere /api/datasphere/documents/{document\_id}/search endpoint with the user query in the JSON body, parses the results\[] array, and returns a flattened text summary. Matches the Python DatasphereSkill upstream-call shape. DATASPHERE\_BASE\_URL env var overrides the upstream URL (used by audit\_skills\_dispatch.py); when unset, the real upstream is built from space\_name (https://{space}.signalwire.com).
- [`DatasphereSkillR`](/reference/cpp/signalwire/skills/datasphere-skill-r)
- [`DateTimeSkill`](/reference/cpp/signalwire/skills/date-time-skill)
- [`GoogleMapsSkill`](/reference/cpp/signalwire/skills/google-maps-skill)
- [`GoogleMapsSkillR`](/reference/cpp/signalwire/skills/google-maps-skill-r)
- [`InfoGathererSkill`](/reference/cpp/signalwire/skills/info-gatherer-skill)
- [`InfoGathererSkillR`](/reference/cpp/signalwire/skills/info-gatherer-skill-r)
- [`JokeSkill`](/reference/cpp/signalwire/skills/joke-skill)
- [`JokeSkillR`](/reference/cpp/signalwire/skills/joke-skill-r)
- [`MathSkill`](/reference/cpp/signalwire/skills/math-skill)
- [`MathSkillR`](/reference/cpp/signalwire/skills/math-skill-r)
- [`McpGatewaySkill`](/reference/cpp/signalwire/skills/mcp-gateway-skill)
- [`McpGatewaySkillR`](/reference/cpp/signalwire/skills/mcp-gateway-skill-r)
- [`NativeVectorSearchSkill`](/reference/cpp/signalwire/skills/native-vector-search-skill)
- [`NativeVectorSearchSkillR`](/reference/cpp/signalwire/skills/native-vector-search-skill-r)
- [`PlayBackgroundFileSkill`](/reference/cpp/signalwire/skills/play-background-file-skill)
- [`PlayBackgroundFileSkillR`](/reference/cpp/signalwire/skills/play-background-file-skill-r)
- [`SkillBase`](/reference/cpp/signalwire/skills/skill-base) — Abstract base class for all skills.
- [`SkillHttpResponse`](/reference/cpp/signalwire/skills/skill-http-response) — Result of a skill HTTP request. status is the HTTP status code (0 indicates a transport-level error — connection refused, DNS, etc.). body is the raw response body. error is non-empty when status is 0.
- [`SkillManager`](/reference/cpp/signalwire/skills/skill-manager) — Manages skill lifecycle: creation, setup, registration with agents.
- [`SkillPromptSection`](/reference/cpp/signalwire/skills/skill-prompt-section) — POM section for skill prompts.
- [`SkillRegistry`](/reference/cpp/signalwire/skills/skill-registry) — Global registry of skill factories.
- [`SpiderSkill`](/reference/cpp/signalwire/skills/spider-skill) — Spider scrape skill — issues a real GET against the URL the LLM passes in. Strips HTML tags from the response and returns the text payload. Matches Python SpiderSkill's scrape\_url behavior. SPIDER\_BASE\_URL env var overrides the host portion of the URL the caller passes in (used by audit\_skills\_dispatch.py to redirect scrape requests at a loopback fixture).
- [`SpiderSkillR`](/reference/cpp/signalwire/skills/spider-skill-r)
- [`SwmlTransferSkill`](/reference/cpp/signalwire/skills/swml-transfer-skill)
- [`SwmlTransferSkillR`](/reference/cpp/signalwire/skills/swml-transfer-skill-r)
- [`WeatherApiSkill`](/reference/cpp/signalwire/skills/weather-api-skill)
- [`WeatherApiSkillR`](/reference/cpp/signalwire/skills/weather-api-skill-r)
- [`WebSearchSkill`](/reference/cpp/signalwire/skills/web-search-skill) — Google Custom Search API skill — issues a real GET against Google's customsearch/v1 endpoint, parses the items\[] results, and returns a human-readable summary. Matches Python's WebSearchSkill behavior. Configuration: api\_key (or env GOOGLE\_SEARCH\_API\_KEY / GOOGLE\_API\_KEY) search\_engine\_id (or env GOOGLE\_SEARCH\_ENGINE\_ID / GOOGLE\_CSE\_ID) num\_results (default 3) tool\_name (default "web\_search") WEB\_SEARCH\_BASE\_URL env var overrides the upstream URL (used by audit\_skills\_dispatch.py to point the skill at a fixture)
- [`WebSearchSkillR`](/reference/cpp/signalwire/skills/web-search-skill-r)
- [`WikipediaSearchSkill`](/reference/cpp/signalwire/skills/wikipedia-search-skill) — Wikipedia search skill — issues a real GET against the Wikipedia API /w/api.php endpoint with action=query\&list=search, parses the query.search\[] results, and returns titles + snippets. Matches the Python WikipediaSearchSkill upstream call shape. WIKIPEDIA\_BASE\_URL env var overrides the API root (used by audit\_skills\_dispatch.py to point the skill at its loopback fixture).
- [`WikipediaSearchSkillR`](/reference/cpp/signalwire/skills/wikipedia-search-skill-r)

## Modules

- [`@011351214012374154063235375201161322036027077100`](/reference/cpp/signalwire/skills/011351214012374154063235375201161322036027077100)
- [`@044201377331237057223153205077125146107254241264`](/reference/cpp/signalwire/skills/044201377331237057223153205077125146107254241264)
- [`@123330021344330275220072012311063102306064323372`](/reference/cpp/signalwire/skills/123330021344330275220072012311063102306064323372)
- [`@344222106152327310046213145327241115225257024370`](/reference/cpp/signalwire/skills/344222106152327310046213145327241115225257024370)

## Source

[`include/signalwire/skills/skill_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/skills/skill_base.hpp)

Line 14.
