# `<sw-audio-level>`

_Class: `AudioLevel` · Module: `packages/web-components/src/components/audio-level.ts`_

## class: `AudioLevel`, `sw-audio-level`

### Superclass

| Name         | Module | Package |
| ------------ | ------ | ------- |
| `LitElement` |        | lit     |

### Fields

| Name          | Privacy | Type                         | Default      | Description                                         | Inherited From |
| ------------- | ------- | ---------------------------- | ------------ | --------------------------------------------------- | -------------- |
| `stream`      |         | `MediaStream \| undefined`   |              | MediaStream to analyze for audio levels             |                |
| `bars`        |         | `number`                     | `5`          | Number of bars to display (default: 5)              |                |
| `orientation` |         | `'vertical' \| 'horizontal'` | `'vertical'` | Orientation of the bars: 'vertical' or 'horizontal' |                |
| `maxSize`     |         | `number`                     | `32`         | Maximum height/width of bars in pixels              |                |

### Methods

| Name               | Privacy | Description                                                                                                                            | Parameters | Return | Inherited From |
| ------------------ | ------- | -------------------------------------------------------------------------------------------------------------------------------------- | ---------- | ------ | -------------- |
| `releaseResources` | public  | Public method to release all audio resources immediately&#xA;Call this before stopping the MediaStream tracks to ensure proper cleanup |            | `void` |                |

### Attributes

| Name          | Field       | Inherited From |
| ------------- | ----------- | -------------- |
| `stream`      | stream      |                |
| `bars`        | bars        |                |
| `orientation` | orientation |                |
| `maxSize`     | maxSize     |                |

---
