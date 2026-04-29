---
title: "WebRTCApiProvider"
---

# Interface: WebRTCApiProvider

Defined in: [dependencies/interfaces.ts:106](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L106)

Provides custom WebRTC API implementations for non-standard environments.

Use this when the standard browser WebRTC APIs are not available or need
to be replaced (e.g., Citrix HDX, React Native, Electron).

## Example

```typescript
import { SignalWire, type WebRTCApiProvider } from '@signalwire/js';

const provider: WebRTCApiProvider = {
  RTCPeerConnection: CustomRTCPeerConnection,
  mediaDevices: {
    getUserMedia: (constraints) => customGetUserMedia(constraints),
    enumerateDevices: () => customEnumerateDevices(),
    addEventListener: (type, listener) => { ... },
    removeEventListener: (type, listener) => { ... },
  }
};

const client = new SignalWire(credentialProvider, { webRTCApiProvider: provider });
```

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="mediadevices"></a> `mediaDevices` | [`WebRTCMediaDevices`](WebRTCMediaDevices.md) | Custom media device access. Only the methods used by the SDK are required. | [dependencies/interfaces.ts:111](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L111) |
| <a id="rtcpeerconnection"></a> `RTCPeerConnection` | (`configuration?`) => `RTCPeerConnection` | Custom RTCPeerConnection constructor. | [dependencies/interfaces.ts:108](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/dependencies/interfaces.ts#L108) |
