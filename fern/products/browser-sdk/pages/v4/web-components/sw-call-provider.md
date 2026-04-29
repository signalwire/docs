---
title: "sw-call-provider"
slug: "/web-components/sw-call-provider"
---
# `<sw-call-provider>`

Top-level context provider that bridges an external `Call` and/or
`DeviceController` into Lit context for every descendant SDK-aware
component to consume.

Internally instantiates two reactive controllers:

- `CallStateContextController` — subscribes to the `Call`'s observables
(`status$`, `self$`, `participants$`, `layoutLayers$`,
`capabilities$`, …) and exposes the latest snapshot through
`callStateContext`.
- `DevicesContextController` — subscribes to the `DeviceController` for
device lists / selected devices / permissions and exposes them
through `devicesContext`. It also wires the active `Call` so
mute / unmute / device-switch operations route correctly.

Re-assigning `.call` or `.deviceController` cleanly disconnects the
previous source and reconnects to the new one.

The host renders with `display: contents`, so the provider does not
introduce its own box — descendants lay out as if they were direct
children of the parent. Use `<sw-call-widget>` if you want a packaged,
styled widget instead of just the context plumbing.

_Class: `SwCallProvider` · Module: `packages/web-components/src/components/sw-call-provider.ts`_

## class: `SwCallProvider`, `sw-call-provider`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name               | Privacy | Type                            | Default     | Description | Inherited From |
| ------------------ | ------- | ------------------------------- | ----------- | ----------- | -------------- |
| `call`             |         | `Call \| undefined`             | `undefined` |             |                |
| `deviceController` |         | `DeviceController \| undefined` | `undefined` |             |                |

### Slots

| Name | Description                                                                                                    |
| ---- | -------------------------------------------------------------------------------------------------------------- |
|      | Default slot for any descendant components that should consume \`callStateContext\` and/or \`devicesContext\`. |

---
