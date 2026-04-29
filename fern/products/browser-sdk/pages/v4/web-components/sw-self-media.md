---
title: "sw-self-media"
slug: "/web-components/sw-self-media"
---
# `<sw-self-media>`

Local video overlay automatically positioned over the matching tile
in the MCU layout.

`sw-self-media` is designed to be slotted **inside** `<sw-call-media>`.
It listens to three observables on the `Call`:

- `call.localStream$` for the camera/microphone stream of this user;
- `call.layoutLayers$` for the percentage-based rectangles used by the MCU;
- `call.self$` for the self participant's `id`.

It then finds the layer whose `member_id === self.id` and positions an
absolutely-placed container at the matching `x / y / width / height`
(all expressed as percentages of the parent). When the layout changes
mid-call (gallery → spotlight, presenter joining, …) the overlay
re-positions automatically.

Unlike `<sw-call-media>` and `<sw-audio-level>`, this element does **not**
accept a raw `.stream` prop — it needs `layoutLayers` and `self.id` to
place itself, both of which only come from a `Call`. Input precedence
(most specific wins): **`.call` &gt; context**.

Apply the boolean `mirror` attribute to flip the video horizontally,
which is the natural default for front-facing camera previews.

_Class: `SwSelfMedia` · Module: `packages/web-components/src/components/sw-self-media.ts`_

## class: `SwSelfMedia`, `sw-self-media`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name     | Privacy | Type                | Default | Description                                                         | Inherited From |
| -------- | ------- | ------------------- | ------- | ------------------------------------------------------------------- | -------------- |
| `mirror` |         | `boolean`           | `false` |                                                                     |                |
| `call`   |         | `Call \| undefined` |         | Explicit Call — when set, subscribes directly and bypasses context. |                |

### Attributes

| Name     | Field  | Inherited From |
| -------- | ------ | -------------- |
| `mirror` | mirror |                |
| `call`   | call   |                |

### CSS Parts

| Name        | Description                                                                                                            |
| ----------- | ---------------------------------------------------------------------------------------------------------------------- |
| `container` | The absolutely-positioned overlay div whose \`top\` / \`left\` / \`width\` / \`height\` track the MCU layer rectangle. |
| `video`     | The internal \`\<video>\` element rendering the local \`MediaStream\` (\`autoplay\`, \`playsinline\`, \`muted\`).      |

---
