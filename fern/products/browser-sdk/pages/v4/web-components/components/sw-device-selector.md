# `<sw-device-selector>`

Compact row of three drop-up buttons for microphone, camera, and speaker selection. Optional live preview.

## Props

| prop | type | default | description |
|------|------|---------|-------------|
| `deviceController` | `DeviceController` | — | SDK device controller |
| `show-preview` | `boolean` | `false` | Show camera preview and mic level below the bar |

## Events

| event | detail | description |
|-------|--------|-------------|
| `sw-device-change` | `{ type: 'microphone'\|'camera'\|'speaker', device: MediaDeviceInfo }` | Device selected |
| `sw-test-speaker` | — | Test speaker button pressed |

## CSS custom properties

| property | description |
|----------|-------------|
| `--sw-device-gap` | Gap between drop-ups (default `8px`) |
| `--sw-device-padding` | Bar padding (default `10px 14px`) |
| `--sw-device-background` | Bar background (default `transparent`) |
| `--ctrl-*` | All primitive ctrl tokens |

## Parts

`bar`, `dropup-mic`, `dropup-camera`, `dropup-speaker`, `preview`
