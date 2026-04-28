# preflight

> **preflight**(`destination`, `options?`): `Promise`\<[`PreflightResult`](../../interfaces/PreflightResult.md)\>

Defined in: [clients/SignalWire.ts:1087](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/clients/SignalWire.ts#L1087)

Runs a multi-phase connectivity test against the given destination.

The test checks:
  1. **Signaling** -- WebSocket connected, RTT measurement
  2. **Devices** -- getUserMedia succeeds with selected (or specified) devices
  3. **ICE/TURN** -- gathers ICE candidates to verify STUN/TURN reachability
  4. **Media/bandwidth** (unless `skipMediaTest`) -- dials the destination,
     collects getStats() for `duration` seconds, computes bandwidth estimates

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `destination` | `string` | A destination to dial for the media test (e.g. `'/private/network-test'`). |
| `options?` | [`PreflightOptions`](../../interfaces/PreflightOptions.md) | Preflight options (duration, skipMediaTest, device overrides). |

#### Returns

`Promise`\<[`PreflightResult`](../../interfaces/PreflightResult.md)\>

A [PreflightResult](../../interfaces/PreflightResult.md) describing connectivity health.

#### Example

```ts
const result = await client.preflight('/private/network-test', { duration: 5 });
if (!result.ok) console.warn('Connectivity issues:', result.warnings);
```
