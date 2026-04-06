# `<sw-audio-level>`

Real-time audio level visualiser — animated bar graph.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `stream` | `MediaStream` | — | Audio stream to analyse |
| `bars` | `number` | `5` | Number of bars |
| `orientation` | `'vertical' \| 'horizontal'` | `'vertical'` | Bar direction |
| `maxSize` | `number` | `32` | Max bar length in px |

## Methods

| method | description |
|--------|-------------|
| `releaseResources()` | Closes the AudioContext and disconnects the analyser |

## CSS custom properties

| property | description |
|----------|-------------|
| `--sw-color-success` | Low-level bar colour |
| `--sw-color-warning` | Mid-level bar colour |
| `--sw-color-danger` | High-level bar colour |
| `--sw-audio-bar-width` | Bar thickness |
| `--sw-audio-bar-gap` | Gap between bars |
| `--sw-audio-bar-radius` | Bar border radius |
| `--sw-audio-bar-background` | Inactive bar colour |
