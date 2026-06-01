---
slug: "/reference/typescript/rest/namespaces/project/project-namespace"
title: "ProjectNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.project.ProjectNamespace"
  parent: "rest.namespaces.project"
  module: "rest.namespaces.project"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/project.ts"
---
# `ProjectNamespace`

Project API namespace.

Access via `client.project.*`. Manages project-level resources like
secondary API tokens.

## Signature

```typescript
class ProjectNamespace
```

## Properties

| Name     | Type            | Required | Default | Description                                        |
| -------- | --------------- | -------- | ------- | -------------------------------------------------- |
| `tokens` | `ProjectTokens` | yes      | —       | Project-scoped API token create / update / delete. |

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/project/project-namespace/constructor)

## Source

[`src/rest/namespaces/project.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/project.ts)

Line 58.
