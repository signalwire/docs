---
title: "sw-audio-level"
slug: "/web-components/sw-audio-level"
---
# `<sw-audio-level>`

Real-time audio-level meter rendered as a row (or column) of bars.

Pipes a `MediaStream` through the Web Audio API (`AnalyserNode`,
`fftSize=256`, `smoothingTimeConstant=0.8`) and updates an animation
loop once per frame. Each bar represents an averaged frequency band;
bar height (vertical) or width (horizontal) is proportional to the
average magnitude. Color thresholds:

- level &gt; 0.05 → bar becomes "active" (`--interactive-status-success`)
- level &gt; 0.40 → yellow (`--interactive-status-warning`)
- level &gt; 0.70 → red (`--interactive-button-destructive-bg`)

The component handles AudioContext / source / analyser teardown
automatically on disconnect, when the source changes, and when
`releaseResources()` is invoked. Always call `releaseResources()`
**before** stopping the underlying MediaStream tracks if you want a
clean, synchronous teardown — used by `<sw-device-selector>`.

If the supplied stream has no audio tracks, the component logs a
warning and renders an empty meter.

Input precedence (most specific wins): **`.stream`** > **`.call`** (uses
`localStream`) > **context** (uses `localStream` from `callStateContext`).

_Class: `SwAudioLevel` · Module: `packages/web-components/src/components/sw-audio-level.ts`_

## class: `SwAudioLevel`, `sw-audio-level`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name          | Privacy | Type                         | Default      | Description                                                                                                                                           | Inherited From |
| ------------- | ------- | ---------------------------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `stream`      |         | `MediaStream \| undefined`   |              | Explicit MediaStream to analyze — highest precedence.                                                                                                 |                |
| `call`        |         | `Call \| undefined`          |              | Explicit Call — when set, analyzes the call's \`localStream\`.&#xA;Bypassed by \`.stream\` if both are set.                                           |                |
| `bars`        |         | `number`                     | `5`          | Number of bars to display (default: 5)                                                                                                                |                |
| `orientation` |         | `'vertical' \| 'horizontal'` | `'vertical'` | Orientation of the bars: 'vertical' or 'horizontal'                                                                                                   |                |
| `autoRequest` |         | `boolean`                    | `false`      | When true, automatically calls getUserMedia(\{ audio: true \}) to acquire&#xA;a microphone stream instead of requiring the consumer to set \`.stream\`. |                |
| `maxSize`     |         | `number`                     | `32`         | Maximum height/width of bars in pixels                                                                                                                |                |

### Methods

| Name               | Privacy | Description                                                                                                                            | Parameters | Return | Inherited From |
| ------------------ | ------- | -------------------------------------------------------------------------------------------------------------------------------------- | ---------- | ------ | -------------- |
| `releaseResources` | public  | Public method to release all audio resources immediately&#xA;Call this before stopping the MediaStream tracks to ensure proper cleanup |            | `void` |                |

### Attributes

| Name           | Field       | Inherited From |
| -------------- | ----------- | -------------- |
| `stream`       | stream      |                |
| `call`         | call        |                |
| `bars`         | bars        |                |
| `orientation`  | orientation |                |
| `auto-request` | autoRequest |                |
| `maxSize`      | maxSize     |                |

### CSS Properties

| Name                                  | Default                 | Description                                          |
| ------------------------------------- | ----------------------- | ---------------------------------------------------- |
| `--interactive-status-success`        | `#22c55e`               | Color for low audio levels.                          |
| `--interactive-status-warning`        | `#ffd700`               | Color for medium audio levels.                       |
| `--interactive-button-destructive-bg` | `#dc2626`               | Color for high audio levels.                         |
| `--sw-audio-bar-width`                | `4px`                   | Width of each vertical bar (height when horizontal). |
| `--sw-audio-bar-gap`                  | `2px`                   | Gap between audio level bars.                        |
| `--sw-audio-bar-radius`               | `2px`                   | Border radius of each bar.                           |
| `--sw-audio-bar-background`           | `rgba(255,255,255,0.2)` | Background color of inactive bars.                   |

### CSS Parts

| Name         | Description                                                                                                                                |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `container`  | The flex container holding all bars. Style for layout, padding, or background.                                                             |
| `bar`        | Every individual bar element.                                                                                                              |
| `bar-active` | Applied additionally when the bar is above the activity threshold (\~5% of full scale). Lets you style silent vs. active bars differently. |

---
