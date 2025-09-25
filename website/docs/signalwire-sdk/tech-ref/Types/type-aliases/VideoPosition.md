> **VideoPosition** = `"auto"` \| `` `reserved-${number}` `` \| `` `standard-${number}` `` \| `"off-canvas"` \| `"playback"` \| `"full-screen"`

Defined in: [packages/core/src/types/video.ts:56](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/core/src/types/video.ts#L56)

Each video layout has a number of positions which members can be assigned to.
This type enumerates all the available position names. Note that not all
these position names may be available within a given layout.

 - `auto`: the position of the member in the layout is determined automatically.
 - `reserved-n`: the _n_-th reserved position in the layout (e.g. `reserved-3`).
 - `standard-n`: the _n_-th standard position in the layout (e.g. `standard-3`).
 - `off-canvas`: the member is hidden outside the layout.
