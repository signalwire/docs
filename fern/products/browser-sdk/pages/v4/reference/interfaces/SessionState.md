# Interface: SessionState

Defined in: [interfaces/SessionState.ts:12](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/SessionState.ts#L12)

Extended session interface that adds call management and authentication
state on top of the narrow ClientSession contract.

Accessible via `client.session`. Call and CallFactory continue to depend
only on the narrow ClientSession interface.

## Extends

- `ClientSession`

## Properties

| Property | Modifier | Type | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="authenticated"></a> `authenticated$` | `readonly` | `Observable`\<`boolean`\> | Observable that emits `true` once the session has been authenticated, and `false` after disconnect. | - | [interfaces/SessionState.ts:38](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/SessionState.ts#L38) |
| <a id="calls"></a> `calls` | `readonly` | [`Call`](Call.md)[] | Current snapshot of all active calls. | - | [interfaces/SessionState.ts:32](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/SessionState.ts#L32) |
| <a id="calls-1"></a> `calls$` | `readonly` | `Observable`\<[`Call`](Call.md)[]\> | Observable stream of all currently active calls (both inbound and outbound). | - | [interfaces/SessionState.ts:27](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/SessionState.ts#L27) |
| <a id="iceservers"></a> `iceServers` | `readonly` | `RTCIceServer`[] \| `undefined` | ICE servers configuration for WebRTC peer connections Used by VertoManager to configure RTCPeerConnection | `ClientSession.iceServers` | [interfaces/ClientSession.ts:31](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/ClientSession.ts#L31) |
| <a id="incomingcalls"></a> `incomingCalls` | `readonly` | [`Call`](Call.md)[] | Current snapshot of active inbound calls. | - | [interfaces/SessionState.ts:22](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/SessionState.ts#L22) |
| <a id="incomingcalls-1"></a> `incomingCalls$` | `readonly` | `Observable`\<[`Call`](Call.md)[]\> | Observable stream of currently active inbound calls. Filters `calls$` to only include calls with `direction === 'inbound'`. | - | [interfaces/SessionState.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/SessionState.ts#L17) |
| <a id="signalingevent"></a> `signalingEvent$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | Observable stream of incoming signaling events Used by Call to listen for call-related events from the server | `ClientSession.signalingEvent$` | [interfaces/ClientSession.ts:25](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/ClientSession.ts#L25) |

## Methods

### execute()

> **execute**\<`T`\>(`request`, `options?`): `Promise`\<`T`\>

Defined in: [interfaces/ClientSession.ts:16](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/interfaces/ClientSession.ts#L16)

Execute an RPC request through the session transport

#### Type Parameters

| Type Parameter | Default type |
| ------ | ------ |
| `T` *extends* [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) | [`JSONRPCResponse`](../type-aliases/JSONRPCResponse.md) |

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `request` | [`JSONRPCRequest`](JSONRPCRequest.md) | The JSON-RPC request to execute |
| `options?` | [`PendingRPCOptions`](PendingRPCOptions.md) | Optional RPC execution options (timeout, etc.) |

#### Returns

`Promise`\<`T`\>

Promise resolving to the RPC response

#### Inherited from

`ClientSession.execute`
