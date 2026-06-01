---
slug: "/reference/typescript/prefabs/survey-agent/survey-config"
title: "SurveyConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyConfig"
  parent: "prefabs.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/SurveyAgent.ts"
---
# `SurveyConfig`

Configuration for the [SurveyAgent](/reference/typescript/prefabs/survey-agent/survey-agent).

## Signature

```typescript
interface SurveyConfig
```

## Properties

| Name           | Type                                                                           | Required | Default | Description                                                                |
| -------------- | ------------------------------------------------------------------------------ | -------- | ------- | -------------------------------------------------------------------------- |
| `agentOptions` | `Partial<AgentOptions>`                                                        | no       | —       | Additional AgentBase options forwarded to super().                         |
| `brandName`    | `string`                                                                       | no       | —       | Brand or company name the agent represents (matches Python `brand_name`).  |
| `conclusion`   | `string`                                                                       | no       | —       | Message after the survey is complete (matches Python `conclusion`).        |
| `introduction` | `string`                                                                       | no       | —       | Opening message before the first question (matches Python `introduction`). |
| `maxRetries`   | `number`                                                                       | no       | —       | Maximum number of times to retry invalid answers. Defaults to 2.           |
| `name`         | `string`                                                                       | no       | —       | Agent display name (defaults to `"survey"`).                               |
| `onComplete`   | `(responses: Record<string, unknown>, score: number) => void \| Promise<void>` | no       | —       | Callback fired when the survey is finished.                                |
| `questions`    | `SurveyQuestion[]`                                                             | yes      | —       | Ordered list of survey questions.                                          |
| `route`        | `string`                                                                       | no       | —       | HTTP route for this agent (defaults to `"/survey"`).                       |
| `surveyName`   | `string`                                                                       | yes      | —       | Human-readable survey name, used in prompts and global data.               |

## Source

[`src/prefabs/SurveyAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/SurveyAgent.ts)

Line 52.
