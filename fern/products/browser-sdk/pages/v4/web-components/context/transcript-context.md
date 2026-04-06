# `transcriptContext`

Lit context key for sharing live transcript state down the component tree.

**Provided by:** `TranscriptController` (attached to any `LitElement` host)  
**Consumed by:** `<sw-transcript-view>`

## Value type

```ts
interface TranscriptEntry {
  id: string;
  type: 'user' | 'agent';
  state: 'partial' | 'complete';
  text: string;
}

interface TranscriptState {
  entries: TranscriptEntry[];
}
```
