# `<sw-local-camera>`

Local camera PiP. Adaptive aspect ratio from video track. Consumes `callStateContext` + `devicesContext`.

## Props

| prop | type | description |
|------|------|-------------|
| `stream` | `MediaStream` | Explicit stream (bypasses context) |
| `videoMuted` | `boolean` | Explicit mute (bypasses context) |
| `mirror` | `boolean` | Mirror video horizontally |
