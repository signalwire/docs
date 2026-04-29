---
title: "sw-ui-call-layout"
slug: "/web-components/sw-ui-call-layout"
---
# `<sw-ui-call-layout>`

Fluid call layout that adapts to any container shape.

Uses the container's **aspect ratio** (not just width) to decide whether
the transcript pane sits beside the video (landscape) or below it
(portrait / narrow). The video area is always maximised.

```
Wide (landscape):                Narrow (portrait):
┌────────────────┬─────────┐    ┌─────────────────┐
│     VIDEO      │ TRANSCR │    │      VIDEO       │
│  (maximised)   │ (side)  │    │   (maximised)    │
├────────────────┴─────────┤    ├──────────────────┤
│        CONTROLS           │    │    CONTROLS      │
└──────────────────────────┘    ├──────────────────┤
                                 │    TRANSCRIPT    │
                                 └──────────────────┘
```

_Class: `SwUiCallLayout` · Module: `packages/web-components/src/components/UI/layout/sw-ui-call-layout.ts`_

## class: `SwUiCallLayout`, `sw-ui-call-layout`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name         | Privacy | Type      | Default | Description                                       | Inherited From |
| ------------ | ------- | --------- | ------- | ------------------------------------------------- | -------------- |
| `transcript` |         | `boolean` | `false` | show / hide the transcript pane                   |                |
| `loading`    |         | `boolean` | `false` | show a spinner overlay on the video area          |                |
| `shadow`     |         | `boolean` | `false` | apply a drop shadow to the host                   |                |
| `fullscreen` |         | `boolean` |         | (read-only) reflects the current fullscreen state |                |

### Methods

| Name               | Privacy | Description | Parameters | Return | Inherited From |
| ------------------ | ------- | ----------- | ---------- | ------ | -------------- |
| `toggleTranscript` |         |             |            | `void` |                |
| `toggleFullscreen` |         |             |            | `void` |                |

### Attributes

| Name         | Field      | Inherited From |
| ------------ | ---------- | -------------- |
| `transcript` | transcript |                |
| `loading`    | loading    |                |
| `shadow`     | shadow     |                |

### CSS Properties

| Name                                     | Default | Description                                                |
| ---------------------------------------- | ------- | ---------------------------------------------------------- |
| `--sw-call-layout-radius`                |         | \[0]                   - border-radius on external corners |
| `--sw-call-layout-shadow`                |         | box-shadow when \`shadow\` is set                          |
| `--sw-call-layout-loading-bg`            |         | \[rgba(0,0,0,0.6)]    - loading overlay background         |
| `--loading-spinner-size`                 |         | \[48]        - spinner icon size (px, number)              |
| `--sw-call-layout-transcript-transition` |         | \[350ms ease-in-out] - open/close transition               |
| `--sw-call-layout-pip-width`             |         | \[clamp(100px, 20%, 200px)]  - PiP container width         |
| `--sw-call-layout-pip-radius`            |         | \[8px]               - PiP border-radius                   |
| `--sw-call-layout-pip-shadow`            |         | \[0 2px 8px rgba(0,0,0,0.5)] - PiP box-shadow              |
| `--sw-call-layout-pip-bottom`            |         | \[12px]              - PiP offset from bottom              |
| `--sw-call-layout-pip-right`             |         | \[12px]               - PiP offset from right              |

### Slots

| Name             | Description                                             |
| ---------------- | ------------------------------------------------------- |
| `video`          | main video content                                      |
| `background`     | element behind the video (e.g. \`\<sw-ui-background>\`) |
| `floating-video` | picture-in-picture overlay (absolute, bottom-right)     |
| `controls`       | control bar beneath the video                           |
| `transcript`     | transcript panel (side or bottom)                       |

---
