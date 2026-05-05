---
title: "SessionState"
---

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/SessionState.ts#L12)</sub>

Extended session interface that adds call management and authentication
state on top of the narrow ClientSession contract.

Accessible via `client.session`. Call and CallFactory continue to depend
only on the narrow ClientSession interface.

## Extends

- `ClientSession`

## Properties

| Property | Modifier | Type | Description | Overrides | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| `authenticated` | `readonly` | `boolean` | Current authentication state. Returns `true` if the session is currently authenticated. | - | - | [interfaces/SessionState.ts:44](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/SessionState.ts#L44) |
| `authenticated$` | `readonly` | `Observable`\<`boolean`\> | Observable that emits `true` once the session has been authenticated, and `false` after disconnect. | `ClientSession.authenticated$` | - | [interfaces/SessionState.ts:38](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/SessionState.ts#L38) |
| `calls` | `readonly` | [`Call`](Call.md)[] | Current snapshot of all active calls. | - | - | [interfaces/SessionState.ts:32](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/SessionState.ts#L32) |
| `calls$` | `readonly` | `Observable`\<[`Call`](Call.md)[]\> | Observable stream of all currently active calls (both inbound and outbound). | - | - | [interfaces/SessionState.ts:27](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/SessionState.ts#L27) |
| `iceServers` | `readonly` | `RTCIceServer`[] \| `undefined` | ICE servers configuration for WebRTC peer connections Used by VertoManager to configure RTCPeerConnection | - | `ClientSession.iceServers` | [interfaces/ClientSession.ts:31](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/ClientSession.ts#L31) |
| `incomingCalls` | `readonly` | [`Call`](Call.md)[] | Current snapshot of active inbound calls. | - | - | [interfaces/SessionState.ts:22](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/SessionState.ts#L22) |
| `incomingCalls$` | `readonly` | `Observable`\<[`Call`](Call.md)[]\> | Observable stream of currently active inbound calls. Filters `calls$` to only include calls with `direction === 'inbound'`. | - | - | [interfaces/SessionState.ts:17](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/SessionState.ts#L17) |
| `signalingEvent$` | `readonly` | `Observable`\<`Record`\<`string`, `unknown`\>\> | Observable stream of incoming signaling events Used by Call to listen for call-related events from the server | - | `ClientSession.signalingEvent$` | [interfaces/ClientSession.ts:25](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/ClientSession.ts#L25) |

## Methods

### execute()

> **execute**\<`T`\>(`request`, `options?`): `Promise`\<`T`\>

<sub>[Go to Code](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/interfaces/ClientSession.ts#L16)</sub>

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
