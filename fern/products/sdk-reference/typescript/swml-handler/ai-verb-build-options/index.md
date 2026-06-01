---
slug: "/reference/typescript/swml-handler/ai-verb-build-options"
title: "AIVerbBuildOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SWMLHandler.AIVerbBuildOptions"
  parent: "SWMLHandler"
  module: "SWMLHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts"
---
# `AIVerbBuildOptions`

Options accepted by [AIVerbHandler.buildConfig](/reference/typescript/swml-handler/ai-verb-handler/build-config).

## Signature

```typescript
interface AIVerbBuildOptions
```

## Properties

| Name            | Type                        | Required | Default | Description                                                                   |
| --------------- | --------------------------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `contexts`      | `Record<string, unknown>`   | no       | —       | Optional contexts and steps configuration (can be combined with text or pom). |
| `postPrompt`    | `string`                    | no       | —       | Optional post-prompt text.                                                    |
| `postPromptUrl` | `string`                    | no       | —       | Optional URL for post-prompt processing.                                      |
| `promptPom`     | `Record<string, unknown>[]` | no       | —       | POM structure for the AI prompt (mutually exclusive with promptText).         |
| `promptText`    | `string`                    | no       | —       | Text prompt for the AI (mutually exclusive with promptPom).                   |
| `swaig`         | `Record<string, unknown>`   | no       | —       | Optional SWAIG configuration.                                                 |

## Source

[`src/SWMLHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts)

Line 67.
