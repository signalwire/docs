---
title: "sw-local-camera"
slug: /reference/web-component/sw-local-camera
---
Aspect-ratio-aware preview tile for the local camera, with a
"camera off" placeholder when video is muted or the stream is missing.

```html
<sw-call-provider token="YOUR_GUEST_TOKEN">
  <sw-local-camera></sw-local-camera>
</sw-call-provider>
```

Designed for small picture-in-picture-style previews — typically slotted
into `<sw-ui-call-layout>`'s `floating-video` slot or used standalone in
a settings panel. The element reads `getSettings()` on the active video
track to detect the natural orientation (landscape, portrait, or square)
and rewrites `--sw-local-camera-aspect` so its container hugs the track.

Input precedence (most specific wins): **`.stream` / `.videoMuted` &gt;
`.call` &gt; context**. Any of `.stream` and `.videoMuted` can be set
independently — for example, you can supply an explicit `stream` from a
"join" preview screen while still letting `videoMuted` come from
`devicesContext`.

The `mirror` attribute reflects to the host so it can be styled with
`:host([mirror])` and is the natural default for selfie cameras.

_Class: `SwLocalCamera` · Module: `packages/web-components/src/components/sw-local-camera.ts`_

## class: `SwLocalCamera`, `sw-local-camera`

### Fields


<ParamField path="stream" type="MediaStream | null" default="null" toc={true}>
  Explicit stream — highest precedence.
</ParamField>

<ParamField path="videoMuted" type="boolean | undefined" toc={true}>
  Explicit muted flag — overrides devicesContext.videoMuted.
</ParamField>

<ParamField path="call" type="Call | undefined" toc={true}>
  Explicit Call — used when `.stream` is not set. Bypasses context.
</ParamField>

<ParamField path="mirror" type="boolean" default="false" toc={true}>
  `mirror` field.
</ParamField>

### Attributes

| Name          | Field      | Inherited From |
| ------------- | ---------- | -------------- |
| `video-muted` | videoMuted |                |
| `mirror`      | mirror     |                |
| `call`        | call       |                |

### CSS Properties

| Name                       | Default | Description                                                                                                                             |
| -------------------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `--sw-local-camera-aspect` | `16/9`  | Aspect ratio of the tile. Automatically rewritten to match the active track's orientation (e.g. \`9 / 16\` for portrait phone cameras). |

### CSS Parts

| Name          | Description                                                                                              |
| ------------- | -------------------------------------------------------------------------------------------------------- |
| `video`       | The internal \`\<video>\` element rendering the local stream (\`autoplay\`, \`muted\`, \`playsinline\`). |
| `placeholder` | The "camera off" overlay shown while video is muted or no stream is bound.                               |

---
