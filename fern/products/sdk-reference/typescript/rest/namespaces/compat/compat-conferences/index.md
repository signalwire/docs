---
slug: "/reference/typescript/rest/namespaces/compat/compat-conferences"
title: "CompatConferences"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatConferences"
  parent: "rest.namespaces.compat"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `CompatConferences`

Compat conference management with participants, recordings, and streams.

## Signature

```typescript
class CompatConferences extends BaseResource
```

## Inheritance

**Extends:** `BaseResource`

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/compat/compat-conferences/constructor)
- [`deleteRecording`](/reference/typescript/rest/namespaces/compat/compat-conferences/delete-recording) — Delete a conference recording.
- [`get`](/reference/typescript/rest/namespaces/compat/compat-conferences/get) — Fetch a conference by SID.
- [`getParticipant`](/reference/typescript/rest/namespaces/compat/compat-conferences/get-participant) — Fetch a specific participant (by its call SID) in a conference.
- [`getRecording`](/reference/typescript/rest/namespaces/compat/compat-conferences/get-recording) — Fetch a specific conference recording.
- [`list`](/reference/typescript/rest/namespaces/compat/compat-conferences/list) — List conferences in the account.
- [`listParticipants`](/reference/typescript/rest/namespaces/compat/compat-conferences/list-participants) — List participants in a conference.
- [`listRecordings`](/reference/typescript/rest/namespaces/compat/compat-conferences/list-recordings) — List recordings taken of a conference.
- [`removeParticipant`](/reference/typescript/rest/namespaces/compat/compat-conferences/remove-participant) — Remove a participant from a conference (kick).
- [`startStream`](/reference/typescript/rest/namespaces/compat/compat-conferences/start-stream) — Start a media stream on a conference.
- [`stopStream`](/reference/typescript/rest/namespaces/compat/compat-conferences/stop-stream) — Stop an active conference media stream.
- [`update`](/reference/typescript/rest/namespaces/compat/compat-conferences/update) — Update a conference (e.g. `Status=completed` to terminate). LAML uses `POST` (not PATCH/PUT).
- [`updateParticipant`](/reference/typescript/rest/namespaces/compat/compat-conferences/update-participant) — Update a participant (mute, hold, announce, etc.). LAML uses `POST`.
- [`updateRecording`](/reference/typescript/rest/namespaces/compat/compat-conferences/update-recording) — Update an active conference recording (pause, resume, stop). LAML uses `POST`.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 247.
