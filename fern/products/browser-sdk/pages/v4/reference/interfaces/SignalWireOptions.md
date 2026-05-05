---
title: "SignalWireOptions"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L58)</sub>

Options for constructing a [SignalWire](../SignalWire/index.md).

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| `debug?` | [`DebugOptions`](DebugOptions.md) | Debug options for verbose SDK diagnostics (e.g., `{ logWsTraffic: true }`). | [clients/SignalWire.ts:106](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L106) |
| `logger?` | [`SDKLogger`](SDKLogger.md) \| `null` | Custom logger implementation. Must implement the [SDKLogger](SDKLogger.md) interface. Pass `null` to restore the built-in logger. **Note:** Logger configuration is global — setting it on one instance affects all instances. | [clients/SignalWire.ts:96](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L96) |
| `logLevel?` | [`LogLevel`](../type-aliases/LogLevel.md) | Log level for the built-in logger. Default: `'warn'`. Set to `'debug'` for verbose SDK output. Has no effect when a custom `logger` is provided. **Note:** Logger configuration is global — setting it on one instance affects all instances. | [clients/SignalWire.ts:104](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L104) |
| `persistSession?` | `boolean` | Persist the session across page reloads. When `true`, credential, authorization state, and protocol are stored in `localStorage` (survives reload). The DPoP key pair is persisted in IndexedDB. On reload, the SDK restores the session from cache without calling `credentialProvider.authenticate()`. When `false` (default), session data lives in `sessionStorage` and is lost on reload. Call [destroy()](../SignalWire/index.md) to clear all persisted state (explicit logout). | [clients/SignalWire.ts:83](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L83) |
| `reconnectAttachedCalls?` | `boolean` | Whether to reconnect to previously attached calls. | [clients/SignalWire.ts:66](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L66) |
| `savePreferences?` | `boolean` | Whether to save preferences. | [clients/SignalWire.ts:68](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L68) |
| `skipConnection?` | `boolean` | Skip automatic WebSocket connection on construction. | [clients/SignalWire.ts:60](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L60) |
| `skipDeviceMonitoring?` | `boolean` | Skip monitoring media device changes. | [clients/SignalWire.ts:64](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L64) |
| `skipRegister?` | `boolean` | Skip automatic subscriber registration on construction. | [clients/SignalWire.ts:62](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L62) |
| `storageImplementation?` | [`Storage`](Storage.md) | Custom storage implementation for persistence. | [clients/SignalWire.ts:85](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L85) |
| `webRTCApiProvider?` | [`WebRTCApiProvider`](WebRTCApiProvider.md) | Custom WebRTC API provider | [clients/SignalWire.ts:89](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L89) |
| `webSocketConstructor?` | [`NodeSocketAdapter`](NodeSocketAdapter.md) \| [`WebSocketAdapter`](../type-aliases/WebSocketAdapter.md) | Custom WebSocket constructor | [clients/SignalWire.ts:87](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/clients/SignalWire.ts#L87) |
