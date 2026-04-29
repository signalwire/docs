---
title: "sw-ui-modal"
slug: "/web-components/sw-ui-modal"
---
# `<sw-ui-modal>`

Lightweight modal wrapper built on the native `<dialog>` element
with a built-in bounce-in / bounce-out animation.

Toggle visibility via the boolean `open` property. Opening calls
`dialog.showModal()` (so focus is trapped, the body is inert, and the
native `::backdrop` is rendered); closing animates out before calling
`dialog.close()` so the host can be removed cleanly.

The element fires a **cancelable** `sw-modal-close` event on ESC or
backdrop click — call `event.preventDefault()` from a parent to veto
the close (e.g. when there are unsaved changes in the dialog body).

_Class: `SwUiModal` · Module: `packages/web-components/src/components/UI/layout/sw-ui-modal.ts`_

## class: `SwUiModal`, `sw-ui-modal`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name   | Privacy | Type      | Default | Description | Inherited From |
| ------ | ------- | --------- | ------- | ----------- | -------------- |
| `open` |         | `boolean` | `false` |             |                |

### Attributes

| Name   | Field | Inherited From |
| ------ | ----- | -------------- |
| `open` | open  |                |

### CSS Properties

| Name                                  | Default | Description                            |
| ------------------------------------- | ------- | -------------------------------------- |
| `--sw-modal-duration`                 | `0.2s`  | Open / close animation duration.       |
| `--sw-modal-animation`                |         | Open animation (bounce-in by default). |
| `--sw-modal-close-animation`          |         | Close animation (bounce-out).          |
| `--sw-modal-backdrop-animation`       |         | Backdrop fade-in animation.            |
| `--sw-modal-backdrop-close-animation` |         | Backdrop fade-out animation.           |

### Slots

| Name | Description                                                                              |
| ---- | ---------------------------------------------------------------------------------------- |
|      | Dialog content. Receives focus via the platform \`\<dialog>\` element's autofocus rules. |

### Events

| Name | Detail | Description |
| ---- | ------ | ----------- |
| `sw-modal-close` | — | **Cancelable.** Fired on ESC or backdrop click; |

---
