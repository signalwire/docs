---
title: "sw-call-status"
slug: /reference/web-component/sw-call-status
---
Compact status pill that mirrors the live call state plus a running
duration timer once the call is connected.

```html
<sw-call-provider token="YOUR_GUEST_TOKEN">
  <sw-call-status></sw-call-status>
</sw-call-provider>
```

Subscribes to `call.status$` (or to `callStateContext.status` when
nested inside `<sw-call-provider>` / `<sw-call-widget>`) and renders
three pieces of UI:

1. A circular status indicator dot whose color/animation reflects the
current state — pulsing yellow for `connecting`/`ringing`/`trying`/
`recovering`, solid green for `connected`, pulsing red for
`disconnecting`, solid red for `disconnected`/`failed`, gray for
`new`/`destroyed`.
2. A status label, mapped from the SDK's `CallStatus` enum to a
human-readable string ("Connecting…", "Ringing…", "Connected", …).
3. A monospace `M:SS` (or `H:MM:SS`) duration counter that starts when
the call enters `connected` and resets when it leaves.

Input precedence (most specific wins): **`.call`** > context.
The label uses `aria-live="polite"` so screen readers are notified of
state transitions without interrupting the user.

_Class: `SwCallStatus` · Module: `packages/web-components/src/components/sw-call-status.ts`_

## class: `SwCallStatus`, `sw-call-status`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields


<ParamField path="call" type="Call | undefined" toc={true}>
  Explicit Call — when set, subscribes directly to its observables and bypasses context.
</ParamField>

### Attributes

| Name   | Field | Inherited From |
| ------ | ----- | -------------- |
| `call` | call  |                |

### CSS Properties

| Name                                  | Default | Description                                              |
| ------------------------------------- | ------- | -------------------------------------------------------- |
| `--type-family-body`                  |         | Font family inherited from the design tokens.            |
| `--type-size-small`                   |         | Font size for the label.                                 |
| `--radius-md`                         |         | Border radius of the container pill.                     |
| `--fg-default`                        |         | Default label color.                                     |
| `--bg-surface-raised`                 |         | Indicator color in idle states (\`new\`, \`destroyed\`). |
| `--interactive-status-success`        |         | Color used while connected.                              |
| `--interactive-status-warning`        |         | Color used during connection / recovery.                 |
| `--interactive-button-destructive-bg` |         | Color used for failure / disconnect states.              |

### CSS Parts

| Name          | Description                                                 |
| ------------- | ----------------------------------------------------------- |
| `container`   | Outer pill that wraps the indicator, label, and timer.      |
| `status-text` | The text label (\`role="status"\`, \`aria-live="polite"\`). |
| `duration`    | The running timer (only rendered while \`connected\`).      |

---
