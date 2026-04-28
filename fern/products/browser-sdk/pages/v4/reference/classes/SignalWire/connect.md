# connect

> **connect**(): `Promise`\<`void`\>

Defined in: [clients/SignalWire.ts:541](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L541)

Establishes the WebSocket connection and authenticates the session.

## Reconnection behavior

After a successful connection the underlying WebSocketController
automatically attempts to reconnect whenever the socket closes
unexpectedly (e.g. network change, server restart). Reconnection uses an
**exponential back-off** strategy:

- First retry after `reconnectDelayMin` (default **0.1 s**).
- Each subsequent retry doubles the delay up to `reconnectDelayMax`
  (default **3 s**).
- The delay resets to `reconnectDelayMin` once a connection succeeds.
- A per-attempt `connectionTimeout` (default **10 s**) aborts the
  attempt and schedules the next retry if the server does not respond.

Calling [disconnect](#disconnect) stops the reconnection loop entirely.

## Message handling during temporary disconnections

While the socket is not in the `connected` state, **outgoing messages
are queued** in an internal buffer. Once the connection is
re-established the queue is flushed in order so no outgoing RPC call is
lost.

**Incoming** server-to-client messages that arrive while the socket is
down are *not* buffered by the SDK — they are expected to be
re-delivered by the server after the session is re-authenticated.
Active RPC calls that were awaiting a response will time out
(default **5 s**) and reject with an `RPCTimeoutError`; callers should
handle this and retry if appropriate.

The connection status can be observed via the `status$` observable on
the transport layer, which emits `'connecting'`, `'connected'`,
`'reconnecting'`, `'disconnecting'`, or `'disconnected'`.

#### Returns

`Promise`\<`void`\>
