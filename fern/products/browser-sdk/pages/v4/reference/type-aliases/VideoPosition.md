# Type Alias: VideoPosition

> **VideoPosition** = `"auto"` \| `` `reserved-${number}` `` \| `` `standard-${number}` `` \| `"off-canvas"` \| `"playback"` \| `"full-screen"`

Defined in: [core/types/call.types.ts:152](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/types/call.types.ts#L152)

Position of a participant's video within the layout canvas.

- `'auto'` — Automatically positioned by the layout engine.
- `` `reserved-${number}` `` — A reserved slot in the layout (e.g., `'reserved-0'`).
- `` `standard-${number}` `` — A standard slot in the layout (e.g., `'standard-1'`).
- `'off-canvas'` — Participant is not visible in the layout.
- `'playback'` — Playback position for media streams.
- `'full-screen'` — Participant occupies the entire canvas.
