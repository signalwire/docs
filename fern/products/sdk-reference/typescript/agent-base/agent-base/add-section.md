---
slug: "/reference/typescript/agent-base/agent-base/add-section"
title: "addSection"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "AgentBase.AgentBase.addSection"
  parent: "AgentBase.AgentBase"
  module: "AgentBase"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts"
---
# `addSection`

Add a new named section to the SWML document.
Mirrors Python's `add_section()`.

## Signature

```typescript
addSection(sectionName: string): this
```

## Parameters

| Name          | Type     | Required | Default | Description                    |
| ------------- | -------- | -------- | ------- | ------------------------------ |
| `sectionName` | `string` | yes      | —       | Name of the section to create. |

## Returns

`this` — This service for chaining.

## Source

[`src/SWMLService.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLService.ts)

Line 653.
