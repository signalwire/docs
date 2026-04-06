# Class: ClientPreferences

Defined in: [containers/PreferencesContainer.ts:220](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L220)

Public preferences API for configuring SDK behavior.

Exposed as [SignalWire.preferences](SignalWire.md#preferences). All timeout values
are in seconds when accessed through this class.

When [enableSavePreferences](#enablesavepreferences) is called, preferences are
automatically loaded from storage and synced back on every change.

## Constructors

### Constructor

> **new ClientPreferences**(): `ClientPreferences`

#### Returns

`ClientPreferences`

## Accessors

### connectionTimeout

#### Get Signature

> **get** **connectionTimeout**(): `number`

Defined in: [containers/PreferencesContainer.ts:233](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L233)

WebSocket connection timeout in seconds.

##### Returns

`number`

#### Set Signature

> **set** **connectionTimeout**(`seconds`): `void`

Defined in: [containers/PreferencesContainer.ts:236](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L236)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `seconds` | `number` |

##### Returns

`void`

***

### deviceDebounceTime

#### Get Signature

> **get** **deviceDebounceTime**(): `number`

Defined in: [containers/PreferencesContainer.ts:336](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L336)

Debounce time for device change events, in seconds.

##### Returns

`number`

#### Set Signature

> **set** **deviceDebounceTime**(`seconds`): `void`

Defined in: [containers/PreferencesContainer.ts:339](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L339)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `seconds` | `number` |

##### Returns

`void`

***

### devicePollingInterval

#### Get Signature

> **get** **devicePollingInterval**(): `number`

Defined in: [containers/PreferencesContainer.ts:345](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L345)

Polling interval for device enumeration, in seconds.

##### Returns

`number`

#### Set Signature

> **set** **devicePollingInterval**(`seconds`): `void`

Defined in: [containers/PreferencesContainer.ts:348](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L348)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `seconds` | `number` |

##### Returns

`void`

***

### disableUdpIceServers

#### Get Signature

> **get** **disableUdpIceServers**(): `boolean`

Defined in: [containers/PreferencesContainer.ts:354](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L354)

Whether to filter out UDP-based ICE servers.

##### Returns

`boolean`

#### Set Signature

> **set** **disableUdpIceServers**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:357](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L357)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `boolean` |

##### Returns

`void`

***

### iceCandidateTimeout

#### Get Signature

> **get** **iceCandidateTimeout**(): `number`

Defined in: [containers/PreferencesContainer.ts:372](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L372)

Timeout for individual ICE candidate gathering, in seconds.

##### Returns

`number`

#### Set Signature

> **set** **iceCandidateTimeout**(`seconds`): `void`

Defined in: [containers/PreferencesContainer.ts:375](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L375)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `seconds` | `number` |

##### Returns

`void`

***

### iceGatheringTimeout

#### Get Signature

> **get** **iceGatheringTimeout**(): `number`

Defined in: [containers/PreferencesContainer.ts:381](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L381)

Timeout for the entire ICE gathering phase, in seconds.

##### Returns

`number`

#### Set Signature

> **set** **iceGatheringTimeout**(`seconds`): `void`

Defined in: [containers/PreferencesContainer.ts:384](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L384)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `seconds` | `number` |

##### Returns

`void`

***

### iceServers

#### Get Signature

> **get** **iceServers**(): `RTCIceServer`[] \| `undefined`

Defined in: [containers/PreferencesContainer.ts:390](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L390)

Custom ICE servers for TURN/STUN configuration.

##### Returns

`RTCIceServer`[] \| `undefined`

#### Set Signature

> **set** **iceServers**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:393](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L393)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `RTCIceServer`[] \| `undefined` |

##### Returns

`void`

***

### inputAudioConstraints

#### Get Signature

> **get** **inputAudioConstraints**(): `MediaTrackConstraints` \| `undefined`

Defined in: [containers/PreferencesContainer.ts:320](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L320)

Default audio input track constraints.

##### Returns

`MediaTrackConstraints` \| `undefined`

#### Set Signature

> **set** **inputAudioConstraints**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:323](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L323)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `MediaTrackConstraints` \| `undefined` |

##### Returns

`void`

***

### inputVideoConstraints

#### Get Signature

> **get** **inputVideoConstraints**(): `MediaTrackConstraints` \| `undefined`

Defined in: [containers/PreferencesContainer.ts:328](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L328)

Default video input track constraints.

##### Returns

`MediaTrackConstraints` \| `undefined`

#### Set Signature

> **set** **inputVideoConstraints**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:331](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L331)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `MediaTrackConstraints` \| `undefined` |

##### Returns

`void`

***

### preferredAudioInput

#### Get Signature

> **get** **preferredAudioInput**(): `MediaDeviceInfo` \| `null`

Defined in: [containers/PreferencesContainer.ts:296](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L296)

Preferred audio input device for new calls.

##### Returns

`MediaDeviceInfo` \| `null`

#### Set Signature

> **set** **preferredAudioInput**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:299](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L299)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `MediaDeviceInfo` \| `null` |

##### Returns

`void`

***

### preferredAudioOutput

#### Get Signature

> **get** **preferredAudioOutput**(): `MediaDeviceInfo` \| `null`

Defined in: [containers/PreferencesContainer.ts:304](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L304)

Preferred audio output device for new calls.

##### Returns

`MediaDeviceInfo` \| `null`

#### Set Signature

> **set** **preferredAudioOutput**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:307](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L307)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `MediaDeviceInfo` \| `null` |

##### Returns

`void`

***

### preferredVideoInput

#### Get Signature

> **get** **preferredVideoInput**(): `MediaDeviceInfo` \| `null`

Defined in: [containers/PreferencesContainer.ts:312](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L312)

Preferred video input device for new calls.

##### Returns

`MediaDeviceInfo` \| `null`

#### Set Signature

> **set** **preferredVideoInput**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:315](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L315)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `MediaDeviceInfo` \| `null` |

##### Returns

`void`

***

### receiveAudio

#### Get Signature

> **get** **receiveAudio**(): `boolean`

Defined in: [containers/PreferencesContainer.ts:287](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L287)

Whether to receive remote audio by default.

##### Returns

`boolean`

#### Set Signature

> **set** **receiveAudio**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:290](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L290)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `boolean` |

##### Returns

`void`

***

### receiveVideo

#### Get Signature

> **get** **receiveVideo**(): `boolean`

Defined in: [containers/PreferencesContainer.ts:278](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L278)

Whether to receive remote video by default.

##### Returns

`boolean`

#### Set Signature

> **set** **receiveVideo**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:281](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L281)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `boolean` |

##### Returns

`void`

***

### reconnectCallsTimeout

#### Get Signature

> **get** **reconnectCallsTimeout**(): `number`

Defined in: [containers/PreferencesContainer.ts:242](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L242)

Timeout for reconnecting to previously attached calls, in seconds.

##### Returns

`number`

#### Set Signature

> **set** **reconnectCallsTimeout**(`seconds`): `void`

Defined in: [containers/PreferencesContainer.ts:245](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L245)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `seconds` | `number` |

##### Returns

`void`

***

### reconnectDelayMax

#### Get Signature

> **get** **reconnectDelayMax**(): `number`

Defined in: [containers/PreferencesContainer.ts:260](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L260)

Maximum reconnection backoff delay in seconds.

##### Returns

`number`

#### Set Signature

> **set** **reconnectDelayMax**(`seconds`): `void`

Defined in: [containers/PreferencesContainer.ts:263](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L263)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `seconds` | `number` |

##### Returns

`void`

***

### reconnectDelayMin

#### Get Signature

> **get** **reconnectDelayMin**(): `number`

Defined in: [containers/PreferencesContainer.ts:251](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L251)

Minimum reconnection backoff delay in seconds.

##### Returns

`number`

#### Set Signature

> **set** **reconnectDelayMin**(`seconds`): `void`

Defined in: [containers/PreferencesContainer.ts:254](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L254)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `seconds` | `number` |

##### Returns

`void`

***

### relayHost

#### Get Signature

> **get** **relayHost**(): `string`

Defined in: [containers/PreferencesContainer.ts:269](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L269)

Custom relay host URL. Empty string uses the default.

##### Returns

`string`

#### Set Signature

> **set** **relayHost**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:272](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L272)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `string` |

##### Returns

`void`

***

### relayOnly

#### Get Signature

> **get** **relayOnly**(): `boolean`

Defined in: [containers/PreferencesContainer.ts:363](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L363)

Whether to force TURN relay-only ICE candidates.

##### Returns

`boolean`

#### Set Signature

> **set** **relayOnly**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:366](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L366)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `boolean` |

##### Returns

`void`

***

### userVariables

#### Get Signature

> **get** **userVariables**(): `Record`\<`string`, `unknown`\>

Defined in: [containers/PreferencesContainer.ts:399](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L399)

Custom user variables attached to calls.

##### Returns

`Record`\<`string`, `unknown`\>

#### Set Signature

> **set** **userVariables**(`value`): `void`

Defined in: [containers/PreferencesContainer.ts:402](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L402)

##### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `Record`\<`string`, `unknown`\> |

##### Returns

`void`

## Methods

### enableSavePreferences()

> **enableSavePreferences**(`storage`): `void`

Defined in: [containers/PreferencesContainer.ts:227](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/containers/PreferencesContainer.ts#L227)

Enables persistence of preferences to storage.
Loads any previously saved preferences and syncs future changes.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `storage` | `StorageManager` |

#### Returns

`void`
