---
title: "sw-call-widget"
slug: "/web-components/sw-call-widget"
---
# `<sw-call-widget>`

All-in-one call widget — handles client initialisation, dialling,
media, controls and optional AI transcript in either inline or modal mode.

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

| Name                 | Privacy | Type      | Default | Description                                                                                                                                                                                                                                                                                                                                                                                 | Inherited From |
| -------------------- | ------- | --------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `token`              |         | `string`  | `''`    |                                                                                                                                                                                                                                                                                                                                                                                             |                |
| `host`               |         | `string`  | `''`    |                                                                                                                                                                                                                                                                                                                                                                                             |                |
| `destination`        |         | `string`  | `''`    |                                                                                                                                                                                                                                                                                                                                                                                             |                |
| `modal`              |         | `boolean` | `false` |                                                                                                                                                                                                                                                                                                                                                                                             |                |
| `transcription`      |         | `boolean` | `false` |                                                                                                                                                                                                                                                                                                                                                                                             |                |
| `allowIncomingCalls` |         | `boolean` | `false` |                                                                                                                                                                                                                                                                                                                                                                                             |                |
| `audioOnly`          |         | `boolean` | `false` |                                                                                                                                                                                                                                                                                                                                                                                             |                |
| `userVariables`      |         | `string`  | `''`    | Custom variables sent with the Verto invite as a JSON object.&#xA;&#xA;The widget always advertises \`capabilities.display\_content\` and&#xA;\`metadata.widget.opened\_at\` so the agent can detect that the caller&#xA;supports the content drawer; user-supplied keys are merged in and win&#xA;on shallow conflict.&#xA;&#xA;Invalid JSON is logged and ignored — the call still dials. |                |
| `disableAutoTheme`   |         | `boolean` | `false` | Skip auto-injecting the SignalWire \`theme.css\` design-token stylesheet.&#xA;Set this when the host page already loads \`@signalwire/web-components/theme.css\`&#xA;or a custom theme written against the same DTCG token names.                                                                                                                                                           |                |
| `disableAutoFonts`   |         | `boolean` | `false` | Skip auto-loading the SignalWire brand fonts (Lexend, Instrument Sans,&#xA;JetBrains Mono) from Google Fonts. Set this when fonts are self-hosted&#xA;or loaded elsewhere.                                                                                                                                                                                                                  |                |

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
