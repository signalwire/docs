# Interface: WebRTCApiProvider

Defined in: [dependencies/interfaces.ts:104](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L104)

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
| <a id="mediadevices"></a> `mediaDevices` | [`WebRTCMediaDevices`](WebRTCMediaDevices.md) | Custom media device access. Only the methods used by the SDK are required. | [dependencies/interfaces.ts:109](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L109) |
| <a id="rtcpeerconnection"></a> `RTCPeerConnection` | (`configuration?`) => `RTCPeerConnection` | Custom RTCPeerConnection constructor. | [dependencies/interfaces.ts:106](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/dependencies/interfaces.ts#L106) |
