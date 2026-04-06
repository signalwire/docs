# `callContext`

Lit context key for sharing a `Call` object down the component tree.

**Provided by:** `<sw-call-media>` via `@provide`  
**Consumed by:** `<sw-call-controls>`, `<sw-self-media>`, `<sw-participants>`, `TranscriptController`

## Usage

```ts
import { callContext } from '@signalwire/web-components';
import { consume } from '@lit/context';

@consume({ context: callContext, subscribe: true })
@state() private _call?: Call;
```
