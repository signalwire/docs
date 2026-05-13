---
title: "sw-call-widget"
slug: /reference/web-component/sw-call-widget
---
All-in-one call widget — handles client initialisation, dialling,
media, controls and optional AI transcript in either inline or modal mode.

```html
<sw-call-widget
  token="YOUR_GUEST_TOKEN"
  destination="/private/sales"
></sw-call-widget>
```

The widget owns the entire call lifecycle:

1. Builds a SignalWire credential provider from `token` (+ optional
`host`) and connects on demand via `client-factory`.
2. Wires `CallStateContextController`, `DevicesContextController`,
`TranscriptController`, and `UserEventController` so every nested
SDK-aware component picks up live state for free.
3. Composes the visual layout from `<sw-ui-call-layout>`,
`<sw-call-media>`, `<sw-local-camera>`, `<sw-call-controls>`, and
optionally `<sw-ui-transcript-view>` and `<sw-ui-content-drawer>`.
4. Shows an `<sw-ui-modal>` overlay when `modal` is set, or renders
inline (within the host's bounding box) when it isn't.
5. Listens for incoming-call signals via `IncomingCallController` when
`allow-incoming-calls` is enabled and prompts the user to accept.

Use the imperative `dial()` and `hangup()` methods to trigger the
widget programmatically, or click any element placed in the default
slot (the trigger) when in idle state.

_Class: `SwCallWidget` · Module: `packages/web-components/src/components/sw-call-widget/sw-call-widget.ts`_

## class: `SwCallWidget`, `sw-call-widget`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields


<ParamField path="token" type="string" default="''" toc={true}>
  `token` field.
</ParamField>

<ParamField path="host" type="string" default="''" toc={true}>
  `host` field.
</ParamField>

<ParamField path="destination" type="string" default="''" toc={true}>
  `destination` field.
</ParamField>

<ParamField path="modal" type="boolean" default="false" toc={true}>
  `modal` field.
</ParamField>

<ParamField path="transcription" type="boolean" default="false" toc={true}>
  `transcription` field.
</ParamField>

<ParamField path="allowIncomingCalls" type="boolean" default="false" toc={true}>
  `allowIncomingCalls` field.
</ParamField>

<ParamField path="audioOnly" type="boolean" default="false" toc={true}>
  `audioOnly` field.
</ParamField>

<ParamField path="userVariables" type="string" default="''" toc={true}>
  Custom variables sent with the Verto invite as a JSON object. The widget always advertises `capabilities.display\_content` and `metadata.widget.opened\_at` so the agent can detect that the caller supports the content drawer; user-supplied keys are merged in and win on shallow conflict. Invalid JSON is logged and ignored — the call still dials.
</ParamField>

<ParamField path="disableAutoTheme" type="boolean" default="false" toc={true}>
  Skip auto-injecting the SignalWire `theme.css` design-token stylesheet. Set this when the host page already loads `@signalwire/web-components/theme.css` or a custom theme written against the same DTCG token names.
</ParamField>

<ParamField path="disableAutoFonts" type="boolean" default="false" toc={true}>
  Skip auto-loading the SignalWire brand fonts (Lexend, Instrument Sans, JetBrains Mono) from Google Fonts. Set this when fonts are self-hosted or loaded elsewhere.
</ParamField>

### Methods

| Name     | Privacy | Description | Parameters | Return          | Inherited From |
| -------- | ------- | ----------- | ---------- | --------------- | -------------- |
| `dial`   |         |             |            | `Promise<void>` |                |
| `hangup` |         |             |            | `Promise<void>` |                |

### Attributes

| Name                   | Field              | Inherited From |
| ---------------------- | ------------------ | -------------- |
| `token`                | token              |                |
| `host`                 | host               |                |
| `destination`          | destination        |                |
| `modal`                | modal              |                |
| `transcription`        | transcription      |                |
| `allow-incoming-calls` | allowIncomingCalls |                |
| `audio-only`           | audioOnly          |                |
| `user-variables`       | userVariables      |                |
| `disable-auto-theme`   | disableAutoTheme   |                |
| `disable-auto-fonts`   | disableAutoFonts   |                |

### Slots

| Name         | Description                                                                    |
| ------------ | ------------------------------------------------------------------------------ |
| `background` | Background element behind the call view, e.g. \`\<sw-ui-background default>\`. |
|              | Default slot. Trigger element shown when idle; clicking it dials.              |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `signalwire-address:event` | — | Forwarded SignalWire custom user events. |
| `sw-call-ended` | — | The call reached a terminal state — user hangup, |
| `sw-dial` | — | The widget began dialing (programmatic or via trigger). |
| `sw-display-content` | — | Forwarded from a `display_content` user event. |

---
