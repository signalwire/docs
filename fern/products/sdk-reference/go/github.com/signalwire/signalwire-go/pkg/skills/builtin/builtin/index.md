---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin"
title: "builtin"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/skills/builtin"
  module: "github.com.signalwire.signalwire-go.pkg.skills.builtin"
---
# `builtin`

## Signature

```go
package builtin
```

## Constants

| Name                 | Type                 | Required | Default | Description                                                                             |
| -------------------- | -------------------- | -------- | ------- | --------------------------------------------------------------------------------------- |
| `_digitStartRE`      | `_digitStartRE`      | yes      | —       | \_digitStartRE checks if a string starts with a digit.                                  |
| `_hyphenSpaceRE`     | `_hyphenSpaceRE`     | yes      | —       | \_hyphenSpaceRE matches hyphens and spaces for sanitization.                            |
| `_sanitizeRE`        | `_sanitizeRE`        | yes      | —       | \_sanitizeRE matches characters invalid in SWAIG tool names.                            |
| `_shellInjectionRE`  | `_shellInjectionRE`  | yes      | —       | \_shellInjectionRE matches !`command` patterns in skill bodies.                         |
| `_unsupportedFields` | `_unsupportedFields` | yes      | —       | \_unsupportedFields maps SKILL.md frontmatter field names to warning message templates. |

## Functions

- [`NewAPINinjasTrivia`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-api-ninjas-trivia) — NewAPINinjasTrivia creates a new APINinjasTriviaSkill.
- [`NewClaudeSkills`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-claude-skills) — NewClaudeSkills creates a new ClaudeSkillsSkill.
- [`NewCustomSkills`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-custom-skills) — NewCustomSkills creates a new CustomSkillsSkill.
- [`NewDataSphere`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-data-sphere) — NewDataSphere creates a new DataSphereSkill.
- [`NewDataSphereServerless`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-data-sphere-serverless) — NewDataSphereServerless creates a new DataSphereServerlessSkill.
- [`NewDateTime`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-date-time) — NewDateTime creates a new DateTimeSkill.
- [`NewGoogleMaps`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-google-maps) — NewGoogleMaps creates a new GoogleMapsSkill.
- [`NewInfoGatherer`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-info-gatherer) — NewInfoGatherer creates a new InfoGathererSkill.
- [`NewJoke`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-joke) — NewJoke creates a new JokeSkill.
- [`NewMath`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-math) — NewMath creates a new MathSkill.
- [`NewMCPGateway`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-mcp-gateway) — NewMCPGateway creates a new MCPGatewaySkill.
- [`NewNativeVectorSearch`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-native-vector-search) — NewNativeVectorSearch creates a new NativeVectorSearchSkill.
- [`NewPlayBackgroundFile`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-play-background-file) — NewPlayBackgroundFile creates a new PlayBackgroundFileSkill.
- [`NewSpider`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-spider) — NewSpider creates a new SpiderSkill.
- [`NewSWMLTransfer`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-swml-transfer) — NewSWMLTransfer creates a new SWMLTransferSkill.
- [`NewWeatherAPI`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-weather-api) — NewWeatherAPI creates a new WeatherAPISkill.
- [`NewWebSearch`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-web-search) — NewWebSearch creates a new WebSearchSkill.
- [`NewWikipediaSearch`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/new-wikipedia-search) — NewWikipediaSearch creates a new WikipediaSearchSkill.

## Classes

- [`APINinjasTriviaSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/api-ninjas-trivia-skill) — APINinjasTriviaSkill gets trivia questions from API Ninjas.
- [`ClaudeSkillsSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/claude-skills-skill) — ClaudeSkillsSkill loads Claude-style SKILL.md files as SignalWire agent tools.
- [`CustomSkillsSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/custom-skills-skill) — CustomSkillsSkill is a meta-skill that registers user-defined tools.
- [`DataSphereServerlessSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-serverless-skill) — DataSphereServerlessSkill provides DataSphere search using DataMap (serverless execution).
- [`DataSphereSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/data-sphere-skill) — DataSphereSkill searches knowledge using SignalWire DataSphere RAG stack.
- [`DateTimeSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/date-time-skill) — DateTimeSkill provides current date and time information.
- [`GoogleMapsSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/google-maps-skill) — GoogleMapsSkill validates addresses and computes routes using Google Maps.
- [`InfoGathererSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/info-gatherer-skill) — InfoGathererSkill guides an AI agent through a series of questions, collecting and storing answers in global\_data.
- [`JokeSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/joke-skill) — JokeSkill tells random jokes from a built-in list.
- [`MathSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/math-skill) — MathSkill provides basic mathematical calculation capabilities.
- [`MCPGatewaySkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/mcp-gateway-skill) — MCPGatewaySkill connects to MCP gateway servers and registers their tools.
- [`NativeVectorSearchSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/native-vector-search-skill) — NativeVectorSearchSkill searches knowledge using a remote search server.
- [`PlayBackgroundFileSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/play-background-file-skill) — PlayBackgroundFileSkill plays audio files in the background.
- [`SpiderSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/spider-skill) — SpiderSkill fetches and extracts text content from URLs.
- [`SWMLTransferSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/swml-transfer-skill) — SWMLTransferSkill transfers calls between agents using DataMap pattern matching.
- [`WeatherAPISkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/weather-api-skill) — WeatherAPISkill gets current weather from WeatherAPI.com.
- [`WebSearchSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/web-search-skill) — WebSearchSkill searches the web using Google Custom Search API.
- [`WikipediaSearchSkill`](/reference/go/github.com/signalwire/signalwire-go/pkg/skills/builtin/builtin/wikipedia-search-skill) — WikipediaSearchSkill searches Wikipedia for information.
