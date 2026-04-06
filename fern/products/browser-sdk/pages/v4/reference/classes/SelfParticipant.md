# Class: SelfParticipant

Defined in: [core/entities/Participant.ts:572](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L572)

The local participant in a call, with additional device and media control.

Extends [Participant](Participant.md) with screen sharing, device selection,
and local media stream management.

## Extends

- [`Participant`](Participant.md)

## Implements

- [`CallSelfParticipant`](../interfaces/CallSelfParticipant.md)

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | [`Participant`](Participant.md).[`_destroyed$`](Participant.md#_destroyed) | [behaviors/Destroyable.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L17) |
| <a id="capabilities"></a> `capabilities` | `readonly` | [`SelfCapabilities`](SelfCapabilities.md) | `undefined` | Capabilities for this participant. Contains all capability flags as both observables and values. | - | [core/entities/Participant.ts:577](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L577) |
| <a id="devicecontroller"></a> `deviceController` | `protected` | [`DeviceController`](../interfaces/DeviceController.md) | `undefined` | - | [`Participant`](Participant.md).[`deviceController`](Participant.md#devicecontroller) | [core/entities/Participant.ts:52](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L52) |
| <a id="executemethod"></a> `executeMethod` | `protected` | [`ExecuteMethod`](../type-aliases/ExecuteMethod.md) | `undefined` | - | [`Participant`](Participant.md).[`executeMethod`](Participant.md#executemethod) | [core/entities/Participant.ts:51](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L51) |
| <a id="id"></a> `id` | `readonly` | `string` | `undefined` | Unique member ID of this participant. | [`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`id`](../interfaces/CallSelfParticipant.md#id) [`Participant`](Participant.md).[`id`](Participant.md#id) | [core/entities/Participant.ts:47](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L47) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | [`Participant`](Participant.md).[`subjects`](Participant.md#subjects) | [behaviors/Destroyable.ts:16](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L16) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | [`Participant`](Participant.md).[`subscriptions`](Participant.md#subscriptions) | [behaviors/Destroyable.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L15) |

## Accessors

### $

#### Get Signature

> **get** **$**(): `Observable`\<`this`\>

Defined in: [behaviors/Destroyable.ts:100](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L100)

##### Returns

`Observable`\<`this`\>

#### Inherited from

[`Participant`](Participant.md).[`$`](Participant.md#_)

***

### addressId

#### Get Signature

> **get** **addressId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:394](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L394)

Address ID of this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`addressId`](../interfaces/CallSelfParticipant.md#addressid)

#### Inherited from

[`Participant`](Participant.md).[`addressId`](Participant.md#addressid)

***

### addressId$

#### Get Signature

> **get** **addressId$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:250](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L250)

Observable of the participant's address ID.

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`addressId$`](../interfaces/CallSelfParticipant.md#addressid-1)

#### Inherited from

[`Participant`](Participant.md).[`addressId$`](Participant.md#addressid-1)

***

### audioMuted

#### Get Signature

> **get** **audioMuted**(): `boolean`

Defined in: [core/entities/Participant.ts:329](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L329)

Whether the participant's audio is muted.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`audioMuted`](../interfaces/CallSelfParticipant.md#audiomuted)

#### Inherited from

[`Participant`](Participant.md).[`audioMuted`](Participant.md#audiomuted)

***

### audioMuted$

#### Get Signature

> **get** **audioMuted$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:107](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L107)

Observable indicating whether the participant's audio is muted.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`audioMuted$`](../interfaces/CallSelfParticipant.md#audiomuted-1)

#### Inherited from

[`Participant`](Participant.md).[`audioMuted$`](Participant.md#audiomuted-1)

***

### autoGain

#### Get Signature

> **get** **autoGain**(): `boolean`

Defined in: [core/entities/Participant.ts:364](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L364)

Whether automatic gain control is enabled.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`autoGain`](../interfaces/CallSelfParticipant.md#autogain)

#### Inherited from

[`Participant`](Participant.md).[`autoGain`](Participant.md#autogain)

***

### autoGain$

#### Get Signature

> **get** **autoGain$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:184](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L184)

Observable indicating whether auto-gain control is enabled.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`autoGain$`](../interfaces/CallSelfParticipant.md#autogain-1)

#### Inherited from

[`Participant`](Participant.md).[`autoGain$`](Participant.md#autogain-1)

***

### deaf

#### Get Signature

> **get** **deaf**(): `boolean`

Defined in: [core/entities/Participant.ts:339](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L339)

Whether the participant is deafened (incoming audio muted).

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`deaf`](../interfaces/CallSelfParticipant.md#deaf)

#### Inherited from

[`Participant`](Participant.md).[`deaf`](Participant.md#deaf)

***

### deaf$

#### Get Signature

> **get** **deaf$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:129](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L129)

Observable indicating whether the participant is deafened.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`deaf$`](../interfaces/CallSelfParticipant.md#deaf-1)

#### Inherited from

[`Participant`](Participant.md).[`deaf$`](Participant.md#deaf-1)

***

### denoise

#### Get Signature

> **get** **denoise**(): `boolean`

Defined in: [core/entities/Participant.ts:379](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L379)

Whether noise reduction (denoise) is active.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`denoise`](../interfaces/CallSelfParticipant.md#denoise)

#### Inherited from

[`Participant`](Participant.md).[`denoise`](Participant.md#denoise)

***

### denoise$

#### Get Signature

> **get** **denoise$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:217](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L217)

Observable indicating whether noise reduction is active.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`denoise$`](../interfaces/CallSelfParticipant.md#denoise-1)

#### Inherited from

[`Participant`](Participant.md).[`denoise$`](Participant.md#denoise-1)

***

### destroyed$

#### Get Signature

> **get** **destroyed$**(): `Observable`\<`void`\>

Defined in: [behaviors/Destroyable.ts:112](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L112)

Observable that emits when the instance is destroyed

##### Returns

`Observable`\<`void`\>

#### Inherited from

[`Participant`](Participant.md).[`destroyed$`](Participant.md#destroyed)

***

### echoCancellation

#### Get Signature

> **get** **echoCancellation**(): `boolean`

Defined in: [core/entities/Participant.ts:359](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L359)

Whether echo cancellation is enabled.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`echoCancellation`](../interfaces/CallSelfParticipant.md#echocancellation)

#### Inherited from

[`Participant`](Participant.md).[`echoCancellation`](Participant.md#echocancellation)

***

### echoCancellation$

#### Get Signature

> **get** **echoCancellation$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:173](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L173)

Observable indicating whether echo cancellation is enabled.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`echoCancellation$`](../interfaces/CallSelfParticipant.md#echocancellation-1)

#### Inherited from

[`Participant`](Participant.md).[`echoCancellation$`](Participant.md#echocancellation-1)

***

### handraised

#### Get Signature

> **get** **handraised**(): `boolean`

Defined in: [core/entities/Participant.ts:319](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L319)

Whether the participant has raised their hand.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`handraised`](../interfaces/CallSelfParticipant.md#handraised)

#### Inherited from

[`Participant`](Participant.md).[`handraised`](Participant.md#handraised)

***

### handraised$

#### Get Signature

> **get** **handraised$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:85](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L85)

Observable indicating whether the participant has raised their hand.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`handraised$`](../interfaces/CallSelfParticipant.md#handraised-1)

#### Inherited from

[`Participant`](Participant.md).[`handraised$`](Participant.md#handraised-1)

***

### inputSensitivity

#### Get Signature

> **get** **inputSensitivity**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:354](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L354)

Current microphone input sensitivity level, or `undefined` if not set.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`inputSensitivity`](../interfaces/CallSelfParticipant.md#inputsensitivity)

#### Inherited from

[`Participant`](Participant.md).[`inputSensitivity`](Participant.md#inputsensitivity)

***

### inputSensitivity$

#### Get Signature

> **get** **inputSensitivity$**(): `Observable`\<`number`\>

Defined in: [core/entities/Participant.ts:162](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L162)

Observable of the microphone input sensitivity level.

##### Returns

`Observable`\<`number`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`inputSensitivity$`](../interfaces/CallSelfParticipant.md#inputsensitivity-1)

#### Inherited from

[`Participant`](Participant.md).[`inputSensitivity$`](Participant.md#inputsensitivity-1)

***

### inputVolume

#### Get Signature

> **get** **inputVolume**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:344](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L344)

Current microphone input volume level, or `undefined` if not set.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`inputVolume`](../interfaces/CallSelfParticipant.md#inputvolume)

#### Inherited from

[`Participant`](Participant.md).[`inputVolume`](Participant.md#inputvolume)

***

### inputVolume$

#### Get Signature

> **get** **inputVolume$**(): `Observable`\<`number`\>

Defined in: [core/entities/Participant.ts:140](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L140)

Observable of the participant's microphone input volume.

##### Returns

`Observable`\<`number`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`inputVolume$`](../interfaces/CallSelfParticipant.md#inputvolume-1)

#### Inherited from

[`Participant`](Participant.md).[`inputVolume$`](Participant.md#inputvolume-1)

***

### isAudience

#### Get Signature

> **get** **isAudience**(): `boolean`

Defined in: [core/entities/Participant.ts:304](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L304)

Whether the participant is an audience member (view-only).

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`isAudience`](../interfaces/CallSelfParticipant.md#isaudience)

#### Inherited from

[`Participant`](Participant.md).[`isAudience`](Participant.md#isaudience)

***

### isTalking

#### Get Signature

> **get** **isTalking**(): `boolean`

Defined in: [core/entities/Participant.ts:283](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L283)

Whether the participant is currently speaking.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`isTalking`](../interfaces/CallSelfParticipant.md#istalking)

#### Inherited from

[`Participant`](Participant.md).[`isTalking`](Participant.md#istalking)

***

### isTalking$

#### Get Signature

> **get** **isTalking$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:272](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L272)

Observable indicating whether the participant is currently speaking.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`isTalking$`](../interfaces/CallSelfParticipant.md#istalking-1)

#### Inherited from

[`Participant`](Participant.md).[`isTalking$`](Participant.md#istalking-1)

***

### lowbitrate

#### Get Signature

> **get** **lowbitrate**(): `boolean`

Defined in: [core/entities/Participant.ts:374](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L374)

Whether low-bitrate mode is active.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`lowbitrate`](../interfaces/CallSelfParticipant.md#lowbitrate)

#### Inherited from

[`Participant`](Participant.md).[`lowbitrate`](Participant.md#lowbitrate)

***

### lowbitrate$

#### Get Signature

> **get** **lowbitrate$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:206](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L206)

Observable indicating whether low-bitrate mode is active.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`lowbitrate$`](../interfaces/CallSelfParticipant.md#lowbitrate-1)

#### Inherited from

[`Participant`](Participant.md).[`lowbitrate$`](Participant.md#lowbitrate-1)

***

### meta

#### Get Signature

> **get** **meta**(): `Record`\<`string`, `unknown`\> \| `undefined`

Defined in: [core/entities/Participant.ts:384](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L384)

Custom metadata for this participant, or `undefined` if not set.

##### Returns

`Record`\<`string`, `unknown`\> \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`meta`](../interfaces/CallSelfParticipant.md#meta)

#### Inherited from

[`Participant`](Participant.md).[`meta`](Participant.md#meta)

***

### meta$

#### Get Signature

> **get** **meta$**(): `Observable`\<`Record`\<`string`, `unknown`\>\>

Defined in: [core/entities/Participant.ts:228](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L228)

Observable of custom metadata for this participant.

##### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`meta$`](../interfaces/CallSelfParticipant.md#meta-1)

#### Inherited from

[`Participant`](Participant.md).[`meta$`](Participant.md#meta-1)

***

### name

#### Get Signature

> **get** **name**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:309](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L309)

Display name of this participant.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`name`](../interfaces/CallSelfParticipant.md#name)

#### Inherited from

[`Participant`](Participant.md).[`name`](Participant.md#name)

***

### name$

#### Get Signature

> **get** **name$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:63](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L63)

Observable of the participant's display name.

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`name$`](../interfaces/CallSelfParticipant.md#name-1)

#### Inherited from

[`Participant`](Participant.md).[`name$`](Participant.md#name-1)

***

### nodeId

#### Get Signature

> **get** **nodeId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:399](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L399)

Server node ID for this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`nodeId`](../interfaces/CallSelfParticipant.md#nodeid)

#### Inherited from

[`Participant`](Participant.md).[`nodeId`](Participant.md#nodeid)

***

### nodeId$

#### Get Signature

> **get** **nodeId$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:261](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L261)

Observable of the server node ID for this participant.

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`nodeId$`](../interfaces/CallSelfParticipant.md#nodeid-1)

#### Inherited from

[`Participant`](Participant.md).[`nodeId$`](Participant.md#nodeid-1)

***

### noiseSuppression

#### Get Signature

> **get** **noiseSuppression**(): `boolean`

Defined in: [core/entities/Participant.ts:369](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L369)

Whether noise suppression is enabled.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`noiseSuppression`](../interfaces/CallSelfParticipant.md#noisesuppression)

#### Inherited from

[`Participant`](Participant.md).[`noiseSuppression`](Participant.md#noisesuppression)

***

### noiseSuppression$

#### Get Signature

> **get** **noiseSuppression$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:195](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L195)

Observable indicating whether noise suppression is enabled.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`noiseSuppression$`](../interfaces/CallSelfParticipant.md#noisesuppression-1)

#### Inherited from

[`Participant`](Participant.md).[`noiseSuppression$`](Participant.md#noisesuppression-1)

***

### outputVolume

#### Get Signature

> **get** **outputVolume**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:349](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L349)

Current speaker output volume level, or `undefined` if not set.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`outputVolume`](../interfaces/CallSelfParticipant.md#outputvolume)

#### Inherited from

[`Participant`](Participant.md).[`outputVolume`](Participant.md#outputvolume)

***

### outputVolume$

#### Get Signature

> **get** **outputVolume$**(): `Observable`\<`number`\>

Defined in: [core/entities/Participant.ts:151](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L151)

Observable of the participant's speaker output volume.

##### Returns

`Observable`\<`number`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`outputVolume$`](../interfaces/CallSelfParticipant.md#outputvolume-1)

#### Inherited from

[`Participant`](Participant.md).[`outputVolume$`](Participant.md#outputvolume-1)

***

### position

#### Get Signature

> **get** **position**(): [`LayoutLayer`](../interfaces/LayoutLayer.md) \| `undefined`

Defined in: [core/entities/Participant.ts:299](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L299)

Current layout position.

##### Returns

[`LayoutLayer`](../interfaces/LayoutLayer.md) \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`position`](../interfaces/CallSelfParticipant.md#position)

#### Inherited from

[`Participant`](Participant.md).[`position`](Participant.md#position)

***

### position$

#### Get Signature

> **get** **position$**(): `Observable`\<[`LayoutLayer`](../interfaces/LayoutLayer.md) \| `undefined`\>

Defined in: [core/entities/Participant.ts:288](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L288)

Observable of the participant's layout position.

##### Returns

`Observable`\<[`LayoutLayer`](../interfaces/LayoutLayer.md) \| `undefined`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`position$`](../interfaces/CallSelfParticipant.md#position-1)

#### Inherited from

[`Participant`](Participant.md).[`position$`](Participant.md#position-1)

***

### screenShareStatus

#### Get Signature

> **get** **screenShareStatus**(): `ScreenShareStatus`

Defined in: [core/entities/Participant.ts:610](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L610)

Current screen share status.

##### Returns

`ScreenShareStatus`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`screenShareStatus`](../interfaces/CallSelfParticipant.md#screensharestatus)

***

### screenShareStatus$

#### Get Signature

> **get** **screenShareStatus$**(): `Observable`\<`ScreenShareStatus`\>

Defined in: [core/entities/Participant.ts:605](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L605)

Observable of the current screen share status.

##### Returns

`Observable`\<`ScreenShareStatus`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`screenShareStatus$`](../interfaces/CallSelfParticipant.md#screensharestatus-1)

***

### subscriberId

#### Get Signature

> **get** **subscriberId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:389](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L389)

Subscriber ID of this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`subscriberId`](../interfaces/CallSelfParticipant.md#subscriberid)

#### Inherited from

[`Participant`](Participant.md).[`subscriberId`](Participant.md#subscriberid)

***

### subscriberId$

#### Get Signature

> **get** **subscriberId$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:239](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L239)

Observable of the participant's subscriber ID.

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`subscriberId$`](../interfaces/CallSelfParticipant.md#subscriberid-1)

#### Inherited from

[`Participant`](Participant.md).[`subscriberId$`](Participant.md#subscriberid-1)

***

### type

#### Get Signature

> **get** **type**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:314](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L314)

Participant type (e.g. `'member'`, `'screen'`).

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`type`](../interfaces/CallSelfParticipant.md#type)

#### Inherited from

[`Participant`](Participant.md).[`type`](Participant.md#type)

***

### type$

#### Get Signature

> **get** **type$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:74](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L74)

Observable of the participant type (e.g. `'member'`, `'screen'`).

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`type$`](../interfaces/CallSelfParticipant.md#type-1)

#### Inherited from

[`Participant`](Participant.md).[`type$`](Participant.md#type-1)

***

### videoMuted

#### Get Signature

> **get** **videoMuted**(): `boolean`

Defined in: [core/entities/Participant.ts:334](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L334)

Whether the participant's video is muted.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`videoMuted`](../interfaces/CallSelfParticipant.md#videomuted)

#### Inherited from

[`Participant`](Participant.md).[`videoMuted`](Participant.md#videomuted)

***

### videoMuted$

#### Get Signature

> **get** **videoMuted$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:118](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L118)

Observable indicating whether the participant's video is muted.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`videoMuted$`](../interfaces/CallSelfParticipant.md#videomuted-1)

#### Inherited from

[`Participant`](Participant.md).[`videoMuted$`](Participant.md#videomuted-1)

***

### visible

#### Get Signature

> **get** **visible**(): `boolean`

Defined in: [core/entities/Participant.ts:324](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L324)

Whether the participant is visible in the layout.

##### Returns

`boolean`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`visible`](../interfaces/CallSelfParticipant.md#visible)

#### Inherited from

[`Participant`](Participant.md).[`visible`](Participant.md#visible)

***

### visible$

#### Get Signature

> **get** **visible$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:96](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L96)

Observable indicating whether the participant is visible in the layout.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`visible$`](../interfaces/CallSelfParticipant.md#visible-1)

#### Inherited from

[`Participant`](Participant.md).[`visible$`](Participant.md#visible-1)

## Methods

### addAdditionalDevice()

> **addAdditionalDevice**(`options`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:620](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L620)

Adds an additional media input device to the call.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options` | [`MediaOptions`](../interfaces/MediaOptions.md) |

#### Returns

`Promise`\<`void`\>

***

### addAudioInputDevice()

> **addAudioInputDevice**(`__namedParameters?`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:634](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L634)

Adds or replaces the primary audio input device with optional constraints or stream.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `__namedParameters` | \{ `constraints?`: `MediaTrackConstraints`; `stream?`: `MediaStream`; \} |
| `__namedParameters.constraints?` | `MediaTrackConstraints` |
| `__namedParameters.stream?` | `MediaStream` |

#### Returns

`Promise`\<`void`\>

***

### addInputDevices()

> **addInputDevices**(`options?`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:666](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L666)

Adds or replaces primary input devices (audio and/or video).

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `options` | [`MediaOptions`](../interfaces/MediaOptions.md) |

#### Returns

`Promise`\<`void`\>

***

### addVideoInputDevice()

> **addVideoInputDevice**(`__namedParameters?`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:650](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L650)

Adds or replaces the primary video input device with optional constraints or stream.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `__namedParameters` | \{ `constraints?`: `MediaTrackConstraints`; `stream?`: `MediaStream`; \} |
| `__namedParameters.constraints?` | `MediaTrackConstraints` |
| `__namedParameters.stream?` | `MediaStream` |

#### Returns

`Promise`\<`void`\>

***

### cachedObservable()

> `protected` **cachedObservable**\<`T`\>(`key`, `factory`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:28](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L28)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `key` | `string` |
| `factory` | () => `Observable`\<`T`\> |

#### Returns

`Observable`\<`T`\>

#### Inherited from

[`Participant`](Participant.md).[`cachedObservable`](Participant.md#cachedobservable)

***

### createBehaviorSubject()

> `protected` **createBehaviorSubject**\<`T`\>(`initialValue`): `BehaviorSubject`\<`T`\>

Defined in: [behaviors/Destroyable.ts:94](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L94)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `initialValue` | `T` |

#### Returns

`BehaviorSubject`\<`T`\>

#### Inherited from

[`Participant`](Participant.md).[`createBehaviorSubject`](Participant.md#createbehaviorsubject)

***

### createReplaySubject()

> `protected` **createReplaySubject**\<`T`\>(`bufferSize?`, `windowTime?`): `ReplaySubject`\<`T`\>

Defined in: [behaviors/Destroyable.ts:88](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L88)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `bufferSize?` | `number` |
| `windowTime?` | `number` |

#### Returns

`ReplaySubject`\<`T`\>

#### Inherited from

[`Participant`](Participant.md).[`createReplaySubject`](Participant.md#createreplaysubject)

***

### createSubject()

> `protected` **createSubject**\<`T`\>(): `Subject`\<`T`\>

Defined in: [behaviors/Destroyable.ts:82](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L82)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Returns

`Subject`\<`T`\>

#### Inherited from

[`Participant`](Participant.md).[`createSubject`](Participant.md#createsubject)

***

### deferEmission()

> `protected` **deferEmission**\<`T`\>(`observable`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:70](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L70)

Wraps an observable so emissions are deferred to the microtask queue.

Use ONLY for public-facing getters that expose a subject via
`.asObservable()` without going through `cachedObservable`.

Do NOT use for observables consumed internally by the SDK.

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `observable` | `Observable`\<`T`\> |

#### Returns

`Observable`\<`T`\>

#### Inherited from

[`Participant`](Participant.md).[`deferEmission`](Participant.md#deferemission)

***

### destroy()

> **destroy**(): `void`

Defined in: [core/entities/Participant.ts:590](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L590)

Destroys the participant, releasing all subscriptions and references.

#### Returns

`void`

#### Overrides

[`Participant`](Participant.md).[`destroy`](Participant.md#destroy)

***

### end()

> **end**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:532](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L532)

Ends the call for this participant.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`end`](../interfaces/CallSelfParticipant.md#end)

#### Inherited from

[`Participant`](Participant.md).[`end`](Participant.md#end)

***

### mute()

> **mute**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:713](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L713)

Mutes local audio. Falls back to local device mute if the server RPC fails.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`mute`](../interfaces/CallSelfParticipant.md#mute)

#### Overrides

[`Participant`](Participant.md).[`mute`](Participant.md#mute)

***

### muteVideo()

> **muteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:741](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L741)

Mutes local video. Falls back to local device mute if the server RPC fails.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`muteVideo`](../interfaces/CallSelfParticipant.md#mutevideo)

#### Overrides

[`Participant`](Participant.md).[`muteVideo`](Participant.md#mutevideo)

***

### publicCachedObservable()

> `protected` **publicCachedObservable**\<`T`\>(`key`, `factory`): `Observable`\<`T`\>

Defined in: [behaviors/Destroyable.ts:51](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L51)

Like `cachedObservable`, but defers emissions to the microtask queue
via `observeOn(asapScheduler)`.

Use ONLY for public-facing observable getters that external consumers
subscribe to. Prevents a class of bugs where `BehaviorSubject` or
`ReplaySubject` replays synchronously during `subscribe()`, before
the subscription variable is assigned in the caller's scope.

Do NOT use for observables consumed internally by the SDK — internal
code using `subscribeTo()`, `firstValueFrom()`, or `withLatestFrom()`
depends on synchronous emission delivery.

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `key` | `string` |
| `factory` | () => `Observable`\<`T`\> |

#### Returns

`Observable`\<`T`\>

#### Inherited from

[`Participant`](Participant.md).[`publicCachedObservable`](Participant.md#publiccachedobservable)

***

### remove()

> **remove**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:521](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L521)

Removes this participant from the call.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`remove`](../interfaces/CallSelfParticipant.md#remove)

#### Inherited from

[`Participant`](Participant.md).[`remove`](Participant.md#remove)

***

### removeAdditionalDevice()

> **removeAdditionalDevice**(`id`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:629](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L629)

Removes an additional media input device by ID.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `id` | `string` |

#### Returns

`Promise`\<`void`\>

***

### selectAudioInputDevice()

> **selectAudioInputDevice**(`device`, `options?`): `void`

Defined in: [core/entities/Participant.ts:671](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L671)

Selects the audio input device for future calls. Optionally saves as a preference.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |
| `options` | `SelectDeviceOptions` |

#### Returns

`void`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`selectAudioInputDevice`](../interfaces/CallSelfParticipant.md#selectaudioinputdevice)

***

### selectAudioOutputDevice()

> **selectAudioOutputDevice**(`device`, `options?`): `void`

Defined in: [core/entities/Participant.ts:705](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L705)

Selects the audio output device. Optionally saves as a preference.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |
| `options` | `SelectDeviceOptions` |

#### Returns

`void`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`selectAudioOutputDevice`](../interfaces/CallSelfParticipant.md#selectaudiooutputdevice)

***

### selectVideoInputDevice()

> **selectVideoInputDevice**(`device`, `options?`): `void`

Defined in: [core/entities/Participant.ts:692](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L692)

Selects the video input device for future calls. Optionally saves as a preference.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `device` | `MediaDeviceInfo` |
| `options` | `SelectDeviceOptions` |

#### Returns

`void`

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`selectVideoInputDevice`](../interfaces/CallSelfParticipant.md#selectvideoinputdevice)

***

### setAudioInputDeviceConstraints()

> **setAudioInputDeviceConstraints**(`constraints`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:679](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L679)

Updates the audio input track constraints for the active call.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | `MediaTrackConstraints` |

#### Returns

`Promise`\<`void`\>

***

### setAudioInputSensitivity()

> **setAudioInputSensitivity**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:484](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L484)

Sets the microphone input sensitivity level.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `value` | `number` |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`setAudioInputSensitivity`](../interfaces/CallSelfParticipant.md#setaudioinputsensitivity)

#### Inherited from

[`Participant`](Participant.md).[`setAudioInputSensitivity`](Participant.md#setaudioinputsensitivity)

***

### setAudioInputVolume()

> **setAudioInputVolume**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:494](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L494)

Sets the microphone input volume level.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `value` | `number` | Volume level (0-100). |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`setAudioInputVolume`](../interfaces/CallSelfParticipant.md#setaudioinputvolume)

#### Inherited from

[`Participant`](Participant.md).[`setAudioInputVolume`](Participant.md#setaudioinputvolume)

***

### setAudioOutputVolume()

> **setAudioOutputVolume**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:504](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L504)

Sets the speaker output volume level.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `value` | `number` | Volume level (0-100). |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`setAudioOutputVolume`](../interfaces/CallSelfParticipant.md#setaudiooutputvolume)

#### Inherited from

[`Participant`](Participant.md).[`setAudioOutputVolume`](Participant.md#setaudiooutputvolume)

***

### setInputDevicesConstraints()

> **setInputDevicesConstraints**(`constraints`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:684](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L684)

Updates both audio and video input track constraints for the active call.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | \{ `audio`: `MediaTrackConstraints`; `video`: `MediaTrackConstraints`; \} |
| `constraints.audio` | `MediaTrackConstraints` |
| `constraints.video` | `MediaTrackConstraints` |

#### Returns

`Promise`\<`void`\>

***

### setMeta()

> **setMeta**(`_meta`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:542](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L542)

Replaces custom metadata for this participant.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `_meta` | `Record`\<`string`, `unknown`\> | Metadata object to set. |

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented.

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`setMeta`](../interfaces/CallSelfParticipant.md#setmeta)

#### Inherited from

[`Participant`](Participant.md).[`setMeta`](Participant.md#setmeta)

***

### setPosition()

> **setPosition**(`value`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:514](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L514)

Sets the participant's position in the video layout.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `value` | [`VideoPosition`](../type-aliases/VideoPosition.md) | The [VideoPosition](../type-aliases/VideoPosition.md) to assign (e.g. `'auto'`, `'reserved-0'`). |

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`setPosition`](../interfaces/CallSelfParticipant.md#setposition)

#### Inherited from

[`Participant`](Participant.md).[`setPosition`](Participant.md#setposition)

***

### setVideoInputDeviceConstraints()

> **setVideoInputDeviceConstraints**(`constraints`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:700](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L700)

Updates the video input track constraints for the active call.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `constraints` | `MediaTrackConstraints` |

#### Returns

`Promise`\<`void`\>

***

### startScreenShare()

> **startScreenShare**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:596](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L596)

Starts sharing the local screen.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`startScreenShare`](../interfaces/CallSelfParticipant.md#startscreenshare)

***

### stopScreenShare()

> **stopScreenShare**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:615](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L615)

Stops the current screen share.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`stopScreenShare`](../interfaces/CallSelfParticipant.md#stopscreenshare)

***

### subscribeTo()

> `protected` **subscribeTo**\<`T`\>(`observable`, `observerOrNext`): `void`

Defined in: [behaviors/Destroyable.ts:74](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L74)

#### Type Parameters

| Type Parameter |
| ------ |
| `T` |

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `observable` | `Observable`\<`T`\> |
| `observerOrNext` | `Partial`\<`Observer`\<`T`\>\> \| ((`value`) => `void`) \| `undefined` |

#### Returns

`void`

#### Inherited from

[`Participant`](Participant.md).[`subscribeTo`](Participant.md#subscribeto)

***

### toggleAudioInputAutoGain()

> **toggleAudioInputAutoGain**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:460](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L460)

Toggles automatic gain control on the audio input.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`toggleAudioInputAutoGain`](../interfaces/CallSelfParticipant.md#toggleaudioinputautogain)

#### Inherited from

[`Participant`](Participant.md).[`toggleAudioInputAutoGain`](Participant.md#toggleaudioinputautogain)

***

### toggleDeaf()

> **toggleDeaf**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:409](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L409)

Toggles the deafened state (mutes/unmutes incoming audio).

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`toggleDeaf`](../interfaces/CallSelfParticipant.md#toggledeaf)

#### Inherited from

[`Participant`](Participant.md).[`toggleDeaf`](Participant.md#toggledeaf)

***

### toggleEchoCancellation()

> **toggleEchoCancellation**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:451](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L451)

Toggles echo cancellation on the audio input.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`toggleEchoCancellation`](../interfaces/CallSelfParticipant.md#toggleechocancellation)

#### Inherited from

[`Participant`](Participant.md).[`toggleEchoCancellation`](Participant.md#toggleechocancellation)

***

### toggleHandraise()

> **toggleHandraise**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:416](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L416)

Toggles the hand-raised state.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`toggleHandraise`](../interfaces/CallSelfParticipant.md#togglehandraise)

#### Inherited from

[`Participant`](Participant.md).[`toggleHandraise`](Participant.md#togglehandraise)

***

### toggleLowbitrate()

> **toggleLowbitrate**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:478](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L478)

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`toggleLowbitrate`](../interfaces/CallSelfParticipant.md#togglelowbitrate)

#### Inherited from

[`Participant`](Participant.md).[`toggleLowbitrate`](Participant.md#togglelowbitrate)

***

### toggleMute()

> **toggleMute**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:431](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L431)

Toggles the participant's audio mute state.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`toggleMute`](../interfaces/CallSelfParticipant.md#togglemute)

#### Inherited from

[`Participant`](Participant.md).[`toggleMute`](Participant.md#togglemute)

***

### toggleMuteVideo()

> **toggleMuteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:446](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L446)

Toggles the participant's video mute state.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`toggleMuteVideo`](../interfaces/CallSelfParticipant.md#togglemutevideo)

#### Inherited from

[`Participant`](Participant.md).[`toggleMuteVideo`](Participant.md#togglemutevideo)

***

### toggleNoiseSuppression()

> **toggleNoiseSuppression**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:469](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L469)

Toggles noise suppression on the audio input.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`toggleNoiseSuppression`](../interfaces/CallSelfParticipant.md#togglenoisesuppression)

#### Inherited from

[`Participant`](Participant.md).[`toggleNoiseSuppression`](Participant.md#togglenoisesuppression)

***

### unmute()

> **unmute**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:727](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L727)

Unmutes local audio. Falls back to local device unmute if the server RPC fails.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`unmute`](../interfaces/CallSelfParticipant.md#unmute)

#### Overrides

[`Participant`](Participant.md).[`unmute`](Participant.md#unmute)

***

### unmuteVideo()

> **unmuteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:755](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L755)

Unmutes local video. Falls back to local device unmute if the server RPC fails.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`unmuteVideo`](../interfaces/CallSelfParticipant.md#unmutevideo)

#### Overrides

[`Participant`](Participant.md).[`unmuteVideo`](Participant.md#unmutevideo)

***

### updateMeta()

> **updateMeta**(`_meta`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:552](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L552)

Merges values into custom metadata (unlike [setMeta](Participant.md#setmeta) which replaces).

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `_meta` | `Record`\<`string`, `unknown`\> | Metadata to merge. |

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented.

#### Implementation of

[`CallSelfParticipant`](../interfaces/CallSelfParticipant.md).[`updateMeta`](../interfaces/CallSelfParticipant.md#updatemeta)

#### Inherited from

[`Participant`](Participant.md).[`updateMeta`](Participant.md#updatemeta)
