---
title: "sw-click-to-call"
slug: "/web-components/sw-click-to-call"
---
# `<sw-click-to-call>`

Drop-in call button — embed it anywhere on a page and clicking it
dials a preconfigured destination, opening the full call UI in a modal.

`sw-click-to-call` is a thin wrapper around `<sw-call-widget>` configured
in `modal` mode. The host renders only the green "Call" pill button;
everything else (client init, SignalWire connection, media, controls,
optional transcript) is delegated to the widget once the user clicks.

Use this element on marketing pages, support sites, or anywhere a single
destination should be dialable with one click. For more elaborate
scenarios (multiple destinations, custom UI, inline call) reach for
`<sw-call-widget>` directly instead.

_Class: `SwClickToCall` · Module: `packages/web-components/src/components/sw-click-to-call.ts`_

## class: `SwClickToCall`, `sw-click-to-call`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name          | Privacy | Type      | Default  | Description | Inherited From |
| ------------- | ------- | --------- | -------- | ----------- | -------------- |
| `token`       |         | `string`  | `''`     |             |                |
| `host`        |         | `string`  | `''`     |             |                |
| `destination` |         | `string`  | `''`     |             |                |
| `label`       |         | `string`  | `'Call'` |             |                |
| `audioOnly`   |         | `boolean` | `false`  |             |                |

### Attributes

| Name          | Field       | Inherited From |
| ------------- | ----------- | -------------- |
| `token`       | token       |                |
| `host`        | host        |                |
| `destination` | destination |                |
| `label`       | label       |                |
| `audio-only`  | audioOnly   |                |

### CSS Properties

| Name                           | Default | Description                                      |
| ------------------------------ | ------- | ------------------------------------------------ |
| `--interactive-status-success` |         | Background color of the call button.             |
| `--type-family-body`           |         | Button font family (inherits the global tokens). |
| `--type-size-body`             |         | Button font size.                                |
| `--radius-md`                  |         | Button border radius.                            |
| `--transition-fast`            |         | Hover-state transition duration.                 |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-call-ended` | — | Fired when the call reaches a terminal state for |
| `sw-call-hangup` | — | Fired only when the user clicks the hang-up |
| `sw-dial` | — | Fired when the user clicks the button and the underlying |

---
