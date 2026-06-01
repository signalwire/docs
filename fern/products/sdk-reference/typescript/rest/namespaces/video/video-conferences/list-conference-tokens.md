---
slug: "/reference/typescript/rest/namespaces/video/video-conferences/list-conference-tokens"
title: "listConferenceTokens"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.video.VideoConferences.listConferenceTokens"
  parent: "rest.namespaces.video.VideoConferences"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts"
---
# `listConferenceTokens`

List conference tokens associated with a conference.

## Signature

```typescript
listConferenceTokens(conferenceId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name           | Type          | Required | Default | Description                                    |
| -------------- | ------------- | -------- | ------- | ---------------------------------------------- |
| `conferenceId` | `string`      | yes      | —       | Unique identifier of the conference.           |
| `params`       | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of conference tokens.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/video.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/video.ts)

Line 196.
