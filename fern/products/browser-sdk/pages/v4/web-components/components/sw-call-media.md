---
title: "sw-call-media"
slug: "/web-components/sw-call-media"
---
# `<sw-call-media>`

Renders the remote MCU video stream with aspect-ratio-aware sizing,
plus a default slot positioned as an overlay layer on top of the video.

`sw-call-media` is the visual canvas of the call. It binds to a remote
`MediaStream` (provided directly via `.stream`, derived from a `.call`,
or pulled from `callStateContext`) and attaches it to an internal
`<video>` element with `autoplay`, `muted`, and `playsinline`.

To keep the rendered area inside the viewport regardless of host size,
a `ResizeObserver` (debounced 50 ms) watches the host element, the
`<video>` `resize` event watches the intrinsic media dimensions, and a
`window` `resize` listener watches the viewport. A "contain" fitting
algorithm picks the constraining dimension and re-applies a centered
`transform: translate(...)`. Audio-only tracks fall back to filling
the container.

The element can run **standalone** (pass `.call` or `.stream` directly)
or **inside a provider** (`<sw-call-provider>` / `<sw-call-widget>`),
where it picks up the active call from context. Input precedence (most
specific wins): **`.stream` &gt; `.call` &gt; context**.

_Class: `SwCallMedia` · Module: `packages/web-components/src/components/sw-call-media.ts`_

## class: `SwCallMedia`, `sw-call-media`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name     | Privacy | Type                  | Default | Description                                                                                                                                    | Inherited From |
| -------- | ------- | --------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `call`   |         | `Call \| undefined`   |         | Explicit Call — when set, subscribes directly to its observables instead&#xA;of relying on context. Overridden by \`.stream\` if both are set. |                |
| `stream` |         | `MediaStream \| null` | `null`  | Explicit remote MediaStream — highest precedence. Bypasses both \`.call\`&#xA;and context. Useful for raw rendering with no SDK at all.        |                |

### Attributes

| Name   | Field | Inherited From |
| ------ | ----- | -------------- |
| `call` | call  |                |

### CSS Properties

| Name        | Default   | Description                                                                                                        |
| ----------- | --------- | ------------------------------------------------------------------------------------------------------------------ |
| `--bg-page` | `#0e0e18` | Background color shown behind the video (visible while the stream is loading or letterboxed for audio-only calls). |

### CSS Parts

| Name        | Description                                                                                                            |
| ----------- | ---------------------------------------------------------------------------------------------------------------------- |
| `container` | Outer container (\`.mcu-content\`) that holds the video plus overlay layers. Style for backgrounds, drop shadows, etc. |
| `video`     | The internal \`\<video>\` element rendering the MCU stream. Useful for \`object-fit\`, filters, and rounded corners.   |

### Slots

| Name | Description                                                                                                                                                                                                |
| ---- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|      | Default slot rendered as an absolutely-positioned overlay layer above the remote video. Use it to compose \`\<sw-participants>\`, \`\<sw-self-media>\`, captions, branding, status chips, or any other UI. |

---
