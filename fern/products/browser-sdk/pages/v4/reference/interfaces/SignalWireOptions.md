# Interface: SignalWireOptions

Defined in: [clients/SignalWire.ts:38](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L38)

Options for constructing a [SignalWire](../classes/SignalWire.md).

## Properties

| Property | Type | Description | Defined in |
| ------ | ------ | ------ | ------ |
| <a id="reconnectattachedcalls"></a> `reconnectAttachedCalls?` | `boolean` | Whether to reconnect to previously attached calls. | [clients/SignalWire.ts:46](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L46) |
| <a id="savepreferences"></a> `savePreferences?` | `boolean` | Whether to save preferences. | [clients/SignalWire.ts:48](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L48) |
| <a id="skipconnection"></a> `skipConnection?` | `boolean` | Skip automatic WebSocket connection on construction. | [clients/SignalWire.ts:40](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L40) |
| <a id="skipdevicemonitoring"></a> `skipDeviceMonitoring?` | `boolean` | Skip monitoring media device changes. | [clients/SignalWire.ts:44](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L44) |
| <a id="skipregister"></a> `skipRegister?` | `boolean` | Skip automatic subscriber registration on construction. | [clients/SignalWire.ts:42](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L42) |
| <a id="storageimplementation"></a> `storageImplementation?` | [`Storage`](Storage.md) | Custom storage implementation for persistence. | [clients/SignalWire.ts:50](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L50) |
| <a id="webrtcapiprovider"></a> `webRTCApiProvider?` | [`WebRTCApiProvider`](WebRTCApiProvider.md) | Custom WebRTC API provider | [clients/SignalWire.ts:54](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L54) |
| <a id="websocketconstructor"></a> `webSocketConstructor?` | [`NodeSocketAdapter`](NodeSocketAdapter.md) \| [`WebSocketAdapter`](../type-aliases/WebSocketAdapter.md) | Custom WebSocket constructor | [clients/SignalWire.ts:52](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/clients/SignalWire.ts#L52) |
