---
title: "PreflightOptions"
---

# Interface: PreflightOptions

Defined in: [core/types/resilience.types.ts:197](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L197)

Options for the preflight connectivity test.

## Properties

| Property | Modifier | Type | Description | Defined in |
| ------ | ------ | ------ | ------ | ------ |
| <a id="audiodevice"></a> `audioDevice?` | `readonly` | `MediaDeviceInfo` | Test a specific audio device instead of the currently selected one. | [core/types/resilience.types.ts:203](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L203) |
| <a id="duration"></a> `duration?` | `readonly` | `number` | How long to run the media test in seconds (default: 10). | [core/types/resilience.types.ts:199](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L199) |
| <a id="skipmediatest"></a> `skipMediaTest?` | `readonly` | `boolean` | Skip the media/bandwidth test, only test signaling + TURN + devices. | [core/types/resilience.types.ts:201](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L201) |
| <a id="videodevice"></a> `videoDevice?` | `readonly` | `MediaDeviceInfo` | Test a specific video device instead of the currently selected one. | [core/types/resilience.types.ts:205](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/core/types/resilience.types.ts#L205) |
