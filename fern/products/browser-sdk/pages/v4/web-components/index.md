---
title: "Overview"
slug: "/web-components"
position: 0
---

# Browser SDK Web Components

The Browser SDK contains a suite of flexible web components that can be used to create UI.

---

## Components

Ready-to-use call UI elements. Most components consume context from a parent `<sw-call-provider>` (or `<sw-call-media>`) automatically.

| Component | Description |
|-----------|-------------|
| [`<sw-audio-level>`](./sw-audio-level) | Real-time audio level visualizer — animated bar graph |
| [`<sw-call-controls>`](./sw-call-controls) | Mute audio, mute video, screen share, and hangup buttons |
| [`<sw-call-dialpad>`](./sw-call-dialpad) | Context-aware DTMF dialpad — sends tones to the active call or bubbles a `sw-dial` event |
| [`<sw-call-media>`](./sw-call-media) | Remote video container and root context provider — wrap call components inside it |
| [`<sw-call-provider>`](./sw-call-provider) | Top-level context provider that bridges an external `Call` and `DeviceController` into Lit context |
| [`<sw-call-status>`](./sw-call-status) | Displays call state label and elapsed duration timer |
| [`<sw-call-widget>`](./sw-call-widget) | All-in-one call widget — handles client init, dialing, media, controls, and optional AI transcript |
| [`<sw-click-to-call>`](./sw-click-to-call) | Single-button widget that dials on click and shows mute/hangup once connected |
| [`<sw-device-selector>`](./sw-device-selector) | Drop-up buttons for microphone, camera, and speaker selection with optional live preview |
| [`<sw-directory>`](./sw-directory) | Searchable contact list with dial actions from the SDK directory |
| [`<sw-local-camera>`](./sw-local-camera) | Local camera preview with a muted overlay |
| [`<sw-participant-controls>`](./sw-participant-controls) | Per-participant moderation controls: mute, video mute, remove, volume, pin |
| [`<sw-participants>`](./sw-participants) | Renders positioned overlays for each remote participant |
| [`<sw-self-media>`](./sw-self-media) | Local video preview — consumes `callContext` from a parent `<sw-call-media>` |

---

## UI Primitives

Low-level layout and control components used to build custom interfaces. These are presentational and do not couple to the SDK.

| Component | Description |
|-----------|-------------|
| [`<sw-ui-alert>`](./sw-ui-alert) | Confirm / alert dialog primitive — use directly or via the `showPrompt()` helper |
| [`<sw-ui-background>`](./sw-ui-background) | Decorative full-bleed background that crossfades from a blurred thumbnail to a hi-res image |
| [`<sw-ui-call-layout>`](./sw-ui-call-layout) | Fluid call layout — splits into video + transcript based on container aspect ratio |
| [`<sw-ui-content-drawer>`](./sw-ui-content-drawer) | Slide-in drawer for agent-pushed content (markdown, HTML, snippets) mid-call |
| [`<sw-ui-control-bar>`](./sw-ui-control-bar) | Call controls bar: mic, camera, speaker, screen share, hand raise, transcript, fullscreen, hang-up |
| [`<sw-ui-dialpad>`](./sw-ui-dialpad) | Presentational 12-key DTMF keypad — pure UI, no SDK coupling |
| [`<sw-ui-dropup>`](./sw-ui-dropup) | Tiny pop-up menu that opens above its anchor and closes on outside click |
| [`<sw-ui-icon>`](./sw-ui-icon) | Inline SVG icon component backed by the bundled icon set |
| [`<sw-ui-modal>`](./sw-ui-modal) | Native `<dialog>` wrapper with bounce-in/out animations and body scroll lock |
| [`<sw-ui-responsive-container>`](./sw-ui-responsive-container) | Aspect-ratio-aware sizing wrapper for hosting call surfaces inside a modal |
| [`<sw-ui-split-button>`](./sw-ui-split-button) | Pill-shaped icon button with optional chevron dropdown — atomic block for control bars |
| [`<sw-ui-transcript-view>`](./sw-ui-transcript-view) | Chat-bubble timeline rendering AI transcript entries with rich `meta` payloads |
