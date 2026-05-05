---
title: "PreflightOptions"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L197)</sub>

Options for the preflight connectivity test.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| `audioDevice?` | `readonly` | `MediaDeviceInfo` | Test a specific audio device instead of the currently selected one. | [core/types/resilience.types.ts:203](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L203) |
| `duration?` | `readonly` | `number` | How long to run the media test in seconds (default: 10). | [core/types/resilience.types.ts:199](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L199) |
| `skipMediaTest?` | `readonly` | `boolean` | Skip the media/bandwidth test, only test signaling + TURN + devices. | [core/types/resilience.types.ts:201](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L201) |
| `videoDevice?` | `readonly` | `MediaDeviceInfo` | Test a specific video device instead of the currently selected one. | [core/types/resilience.types.ts:205](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L205) |
