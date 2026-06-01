---
slug: "/reference/typescript/prefabs/survey-agent/survey-question"
title: "SurveyQuestion"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "prefabs.SurveyAgent.SurveyQuestion"
  parent: "prefabs.SurveyAgent"
  module: "prefabs.SurveyAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/SurveyAgent.ts"
---
# `SurveyQuestion`

A single survey question consumed by [SurveyAgent](/reference/typescript/prefabs/survey-agent/survey-agent).

## Signature

```typescript
interface SurveyQuestion
```

## Properties

| Name           | Type                                                        | Required | Default | Description                                                                                                                   |
| -------------- | ----------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `id`           | `string`                                                    | yes      | —       | Unique question identifier.                                                                                                   |
| `nextQuestion` | `string \| Record<string, string>`                          | no       | —       | Next question ID after this one.                                                                                              |
| `options`      | `string[]`                                                  | no       | —       | Options for multiple\_choice questions.                                                                                       |
| `points`       | `number \| Record<string, number>`                          | no       | —       | Points awarded for answers.                                                                                                   |
| `required`     | `boolean`                                                   | no       | —       | Whether the question requires an answer. Defaults to `true`. Mirrors the Python `required` flag on each question dict.        |
| `scale`        | `number`                                                    | no       | —       | For `rating` questions, the upper bound of the scale (1..scale). Defaults to 5 (matching the Python prefab) when unspecified. |
| `text`         | `string`                                                    | yes      | —       | The question text to ask the caller.                                                                                          |
| `type`         | `"multiple_choice" \| "open_ended" \| "rating" \| "yes_no"` | yes      | —       | Question type determines validation and display.                                                                              |

## Source

[`src/prefabs/SurveyAgent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/prefabs/SurveyAgent.ts)

Line 17.
