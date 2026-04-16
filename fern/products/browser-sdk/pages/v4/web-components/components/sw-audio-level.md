# `<sw-audio-level>`

Real-time audio visualizer bars via Web Audio API.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `stream` | `MediaStream` | — | Stream to analyze |
| `bars` | `number` | `5` | Number of level bars |
| `orientation` | `'vertical' \| 'horizontal'` | `'vertical'` | Bar orientation |
| `auto-request` | `boolean` | `false` | Acquire mic via `getUserMedia` when no stream is set |
