# Class: Participant

Defined in: [core/entities/Participant.ts:45](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L45)

Represents a participant in a call.

Provides observable state (audio/video mute, hand raise, volume, etc.)
and control methods for the participant. See [SelfParticipant](SelfParticipant.md) for
the local participant with additional device control.

## Extends

- `Destroyable`

## Extended by

- [`SelfParticipant`](SelfParticipant.md)

## Implements

- [`CallParticipant`](../interfaces/CallParticipant.md)

## Constructors

### Constructor

> **new Participant**(`id`, `executeMethod`, `deviceController`): `Participant`

Defined in: [core/entities/Participant.ts:49](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L49)

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `id` | `string` |
| `executeMethod` | [`ExecuteMethod`](../type-aliases/ExecuteMethod.md) |
| `deviceController` | [`DeviceController`](../interfaces/DeviceController.md) |

#### Returns

`Participant`

#### Overrides

`Destroyable.constructor`

## Properties

| Property | Modifier | Type | Default value | Description | Inherited from | Defined in |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| <a id="_destroyed"></a> `_destroyed$` | `protected` | `Subject`\<`void`\> | `undefined` | - | `Destroyable._destroyed$` | [behaviors/Destroyable.ts:17](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L17) |
| <a id="devicecontroller"></a> `deviceController` | `protected` | [`DeviceController`](../interfaces/DeviceController.md) | `undefined` | - | - | [core/entities/Participant.ts:52](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L52) |
| <a id="executemethod"></a> `executeMethod` | `protected` | [`ExecuteMethod`](../type-aliases/ExecuteMethod.md) | `undefined` | - | - | [core/entities/Participant.ts:51](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L51) |
| <a id="id"></a> `id` | `readonly` | `string` | `undefined` | Unique member ID of this participant. | - | [core/entities/Participant.ts:47](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L47) |
| <a id="subjects"></a> `subjects` | `protected` | `Subject`\<`unknown`\>[] | `[]` | - | `Destroyable.subjects` | [behaviors/Destroyable.ts:16](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L16) |
| <a id="subscriptions"></a> `subscriptions` | `protected` | `Subscription`[] | `[]` | - | `Destroyable.subscriptions` | [behaviors/Destroyable.ts:15](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L15) |

## Accessors

### $

#### Get Signature

> **get** **$**(): `Observable`\<`this`\>

Defined in: [behaviors/Destroyable.ts:100](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L100)

##### Returns

`Observable`\<`this`\>

#### Inherited from

`Destroyable.$`

***

### addressId

#### Get Signature

> **get** **addressId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:394](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L394)

Address ID of this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`addressId`](../interfaces/CallParticipant.md#addressid)

***

### addressId$

#### Get Signature

> **get** **addressId$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:250](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L250)

Observable of the participant's address ID.

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`addressId$`](../interfaces/CallParticipant.md#addressid-1)

***

### audioMuted

#### Get Signature

> **get** **audioMuted**(): `boolean`

Defined in: [core/entities/Participant.ts:329](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L329)

Whether the participant's audio is muted.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`audioMuted`](../interfaces/CallParticipant.md#audiomuted)

***

### audioMuted$

#### Get Signature

> **get** **audioMuted$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:107](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L107)

Observable indicating whether the participant's audio is muted.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`audioMuted$`](../interfaces/CallParticipant.md#audiomuted-1)

***

### autoGain

#### Get Signature

> **get** **autoGain**(): `boolean`

Defined in: [core/entities/Participant.ts:364](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L364)

Whether automatic gain control is enabled.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`autoGain`](../interfaces/CallParticipant.md#autogain)

***

### autoGain$

#### Get Signature

> **get** **autoGain$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:184](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L184)

Observable indicating whether auto-gain control is enabled.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`autoGain$`](../interfaces/CallParticipant.md#autogain-1)

***

### deaf

#### Get Signature

> **get** **deaf**(): `boolean`

Defined in: [core/entities/Participant.ts:339](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L339)

Whether the participant is deafened (incoming audio muted).

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`deaf`](../interfaces/CallParticipant.md#deaf)

***

### deaf$

#### Get Signature

> **get** **deaf$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:129](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L129)

Observable indicating whether the participant is deafened.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`deaf$`](../interfaces/CallParticipant.md#deaf-1)

***

### denoise

#### Get Signature

> **get** **denoise**(): `boolean`

Defined in: [core/entities/Participant.ts:379](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L379)

Whether noise reduction (denoise) is active.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`denoise`](../interfaces/CallParticipant.md#denoise)

***

### denoise$

#### Get Signature

> **get** **denoise$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:217](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L217)

Observable indicating whether noise reduction is active.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`denoise$`](../interfaces/CallParticipant.md#denoise-1)

***

### destroyed$

#### Get Signature

> **get** **destroyed$**(): `Observable`\<`void`\>

Defined in: [behaviors/Destroyable.ts:112](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/behaviors/Destroyable.ts#L112)

Observable that emits when the instance is destroyed

##### Returns

`Observable`\<`void`\>

#### Inherited from

`Destroyable.destroyed$`

***

### echoCancellation

#### Get Signature

> **get** **echoCancellation**(): `boolean`

Defined in: [core/entities/Participant.ts:359](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L359)

Whether echo cancellation is enabled.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`echoCancellation`](../interfaces/CallParticipant.md#echocancellation)

***

### echoCancellation$

#### Get Signature

> **get** **echoCancellation$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:173](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L173)

Observable indicating whether echo cancellation is enabled.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`echoCancellation$`](../interfaces/CallParticipant.md#echocancellation-1)

***

### handraised

#### Get Signature

> **get** **handraised**(): `boolean`

Defined in: [core/entities/Participant.ts:319](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L319)

Whether the participant has raised their hand.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`handraised`](../interfaces/CallParticipant.md#handraised)

***

### handraised$

#### Get Signature

> **get** **handraised$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:85](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L85)

Observable indicating whether the participant has raised their hand.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`handraised$`](../interfaces/CallParticipant.md#handraised-1)

***

### inputSensitivity

#### Get Signature

> **get** **inputSensitivity**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:354](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L354)

Current microphone input sensitivity level, or `undefined` if not set.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`inputSensitivity`](../interfaces/CallParticipant.md#inputsensitivity)

***

### inputSensitivity$

#### Get Signature

> **get** **inputSensitivity$**(): `Observable`\<`number`\>

Defined in: [core/entities/Participant.ts:162](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L162)

Observable of the microphone input sensitivity level.

##### Returns

`Observable`\<`number`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`inputSensitivity$`](../interfaces/CallParticipant.md#inputsensitivity-1)

***

### inputVolume

#### Get Signature

> **get** **inputVolume**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:344](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L344)

Current microphone input volume level, or `undefined` if not set.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`inputVolume`](../interfaces/CallParticipant.md#inputvolume)

***

### inputVolume$

#### Get Signature

> **get** **inputVolume$**(): `Observable`\<`number`\>

Defined in: [core/entities/Participant.ts:140](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L140)

Observable of the participant's microphone input volume.

##### Returns

`Observable`\<`number`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`inputVolume$`](../interfaces/CallParticipant.md#inputvolume-1)

***

### isAudience

#### Get Signature

> **get** **isAudience**(): `boolean`

Defined in: [core/entities/Participant.ts:304](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L304)

Whether the participant is an audience member (view-only).

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`isAudience`](../interfaces/CallParticipant.md#isaudience)

***

### isTalking

#### Get Signature

> **get** **isTalking**(): `boolean`

Defined in: [core/entities/Participant.ts:283](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L283)

Whether the participant is currently speaking.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`isTalking`](../interfaces/CallParticipant.md#istalking)

***

### isTalking$

#### Get Signature

> **get** **isTalking$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:272](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L272)

Observable indicating whether the participant is currently speaking.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`isTalking$`](../interfaces/CallParticipant.md#istalking-1)

***

### lowbitrate

#### Get Signature

> **get** **lowbitrate**(): `boolean`

Defined in: [core/entities/Participant.ts:374](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L374)

Whether low-bitrate mode is active.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`lowbitrate`](../interfaces/CallParticipant.md#lowbitrate)

***

### lowbitrate$

#### Get Signature

> **get** **lowbitrate$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:206](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L206)

Observable indicating whether low-bitrate mode is active.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`lowbitrate$`](../interfaces/CallParticipant.md#lowbitrate-1)

***

### meta

#### Get Signature

> **get** **meta**(): `Record`\<`string`, `unknown`\> \| `undefined`

Defined in: [core/entities/Participant.ts:384](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L384)

Custom metadata for this participant, or `undefined` if not set.

##### Returns

`Record`\<`string`, `unknown`\> \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`meta`](../interfaces/CallParticipant.md#meta)

***

### meta$

#### Get Signature

> **get** **meta$**(): `Observable`\<`Record`\<`string`, `unknown`\>\>

Defined in: [core/entities/Participant.ts:228](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L228)

Observable of custom metadata for this participant.

##### Returns

`Observable`\<`Record`\<`string`, `unknown`\>\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`meta$`](../interfaces/CallParticipant.md#meta-1)

***

### name

#### Get Signature

> **get** **name**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:309](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L309)

Display name of this participant.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`name`](../interfaces/CallParticipant.md#name)

***

### name$

#### Get Signature

> **get** **name$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:63](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L63)

Observable of the participant's display name.

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`name$`](../interfaces/CallParticipant.md#name-1)

***

### nodeId

#### Get Signature

> **get** **nodeId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:399](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L399)

Server node ID for this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`nodeId`](../interfaces/CallParticipant.md#nodeid)

***

### nodeId$

#### Get Signature

> **get** **nodeId$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:261](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L261)

Observable of the server node ID for this participant.

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`nodeId$`](../interfaces/CallParticipant.md#nodeid-1)

***

### noiseSuppression

#### Get Signature

> **get** **noiseSuppression**(): `boolean`

Defined in: [core/entities/Participant.ts:369](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L369)

Whether noise suppression is enabled.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`noiseSuppression`](../interfaces/CallParticipant.md#noisesuppression)

***

### noiseSuppression$

#### Get Signature

> **get** **noiseSuppression$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:195](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L195)

Observable indicating whether noise suppression is enabled.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`noiseSuppression$`](../interfaces/CallParticipant.md#noisesuppression-1)

***

### outputVolume

#### Get Signature

> **get** **outputVolume**(): `number` \| `undefined`

Defined in: [core/entities/Participant.ts:349](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L349)

Current speaker output volume level, or `undefined` if not set.

##### Returns

`number` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`outputVolume`](../interfaces/CallParticipant.md#outputvolume)

***

### outputVolume$

#### Get Signature

> **get** **outputVolume$**(): `Observable`\<`number`\>

Defined in: [core/entities/Participant.ts:151](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L151)

Observable of the participant's speaker output volume.

##### Returns

`Observable`\<`number`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`outputVolume$`](../interfaces/CallParticipant.md#outputvolume-1)

***

### position

#### Get Signature

> **get** **position**(): [`LayoutLayer`](../interfaces/LayoutLayer.md) \| `undefined`

Defined in: [core/entities/Participant.ts:299](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L299)

Current layout position.

##### Returns

[`LayoutLayer`](../interfaces/LayoutLayer.md) \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`position`](../interfaces/CallParticipant.md#position)

***

### position$

#### Get Signature

> **get** **position$**(): `Observable`\<[`LayoutLayer`](../interfaces/LayoutLayer.md) \| `undefined`\>

Defined in: [core/entities/Participant.ts:288](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L288)

Observable of the participant's layout position.

##### Returns

`Observable`\<[`LayoutLayer`](../interfaces/LayoutLayer.md) \| `undefined`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`position$`](../interfaces/CallParticipant.md#position-1)

***

### subscriberId

#### Get Signature

> **get** **subscriberId**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:389](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L389)

Subscriber ID of this participant, or `undefined` if not available.

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`subscriberId`](../interfaces/CallParticipant.md#subscriberid)

***

### subscriberId$

#### Get Signature

> **get** **subscriberId$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:239](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L239)

Observable of the participant's subscriber ID.

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`subscriberId$`](../interfaces/CallParticipant.md#subscriberid-1)

***

### type

#### Get Signature

> **get** **type**(): `string` \| `undefined`

Defined in: [core/entities/Participant.ts:314](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L314)

Participant type (e.g. `'member'`, `'screen'`).

##### Returns

`string` \| `undefined`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`type`](../interfaces/CallParticipant.md#type)

***

### type$

#### Get Signature

> **get** **type$**(): `Observable`\<`string`\>

Defined in: [core/entities/Participant.ts:74](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L74)

Observable of the participant type (e.g. `'member'`, `'screen'`).

##### Returns

`Observable`\<`string`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`type$`](../interfaces/CallParticipant.md#type-1)

***

### videoMuted

#### Get Signature

> **get** **videoMuted**(): `boolean`

Defined in: [core/entities/Participant.ts:334](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L334)

Whether the participant's video is muted.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`videoMuted`](../interfaces/CallParticipant.md#videomuted)

***

### videoMuted$

#### Get Signature

> **get** **videoMuted$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:118](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L118)

Observable indicating whether the participant's video is muted.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`videoMuted$`](../interfaces/CallParticipant.md#videomuted-1)

***

### visible

#### Get Signature

> **get** **visible**(): `boolean`

Defined in: [core/entities/Participant.ts:324](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L324)

Whether the participant is visible in the layout.

##### Returns

`boolean`

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`visible`](../interfaces/CallParticipant.md#visible)

***

### visible$

#### Get Signature

> **get** **visible$**(): `Observable`\<`boolean`\>

Defined in: [core/entities/Participant.ts:96](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L96)

Observable indicating whether the participant is visible in the layout.

##### Returns

`Observable`\<`boolean`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`visible$`](../interfaces/CallParticipant.md#visible-1)

## Methods

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

`Destroyable.cachedObservable`

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

`Destroyable.createBehaviorSubject`

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

`Destroyable.createReplaySubject`

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

`Destroyable.createSubject`

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

`Destroyable.deferEmission`

***

### destroy()

> **destroy**(): `void`

Defined in: [core/entities/Participant.ts:558](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L558)

Destroys the participant, releasing all subscriptions and references.

#### Returns

`void`

#### Overrides

`Destroyable.destroy`

***

### end()

> **end**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:532](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L532)

Ends the call for this participant.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`end`](../interfaces/CallParticipant.md#end)

***

### mute()

> **mute**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:421](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L421)

Mutes the participant's audio.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`mute`](../interfaces/CallParticipant.md#mute)

***

### muteVideo()

> **muteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:436](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L436)

Mutes the participant's video.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`muteVideo`](../interfaces/CallParticipant.md#mutevideo)

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

`Destroyable.publicCachedObservable`

***

### remove()

> **remove**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:521](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L521)

Removes this participant from the call.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`remove`](../interfaces/CallParticipant.md#remove)

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

[`CallParticipant`](../interfaces/CallParticipant.md).[`setAudioInputSensitivity`](../interfaces/CallParticipant.md#setaudioinputsensitivity)

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

[`CallParticipant`](../interfaces/CallParticipant.md).[`setAudioInputVolume`](../interfaces/CallParticipant.md#setaudioinputvolume)

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

[`CallParticipant`](../interfaces/CallParticipant.md).[`setAudioOutputVolume`](../interfaces/CallParticipant.md#setaudiooutputvolume)

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

[`CallParticipant`](../interfaces/CallParticipant.md).[`setMeta`](../interfaces/CallParticipant.md#setmeta)

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

[`CallParticipant`](../interfaces/CallParticipant.md).[`setPosition`](../interfaces/CallParticipant.md#setposition)

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

`Destroyable.subscribeTo`

***

### toggleAudioInputAutoGain()

> **toggleAudioInputAutoGain**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:460](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L460)

Toggles automatic gain control on the audio input.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`toggleAudioInputAutoGain`](../interfaces/CallParticipant.md#toggleaudioinputautogain)

***

### toggleDeaf()

> **toggleDeaf**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:409](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L409)

Toggles the deafened state (mutes/unmutes incoming audio).

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`toggleDeaf`](../interfaces/CallParticipant.md#toggledeaf)

***

### toggleEchoCancellation()

> **toggleEchoCancellation**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:451](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L451)

Toggles echo cancellation on the audio input.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`toggleEchoCancellation`](../interfaces/CallParticipant.md#toggleechocancellation)

***

### toggleHandraise()

> **toggleHandraise**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:416](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L416)

Toggles the hand-raised state.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`toggleHandraise`](../interfaces/CallParticipant.md#togglehandraise)

***

### toggleLowbitrate()

> **toggleLowbitrate**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:478](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L478)

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`toggleLowbitrate`](../interfaces/CallParticipant.md#togglelowbitrate)

***

### toggleMute()

> **toggleMute**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:431](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L431)

Toggles the participant's audio mute state.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`toggleMute`](../interfaces/CallParticipant.md#togglemute)

***

### toggleMuteVideo()

> **toggleMuteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:446](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L446)

Toggles the participant's video mute state.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`toggleMuteVideo`](../interfaces/CallParticipant.md#togglemutevideo)

***

### toggleNoiseSuppression()

> **toggleNoiseSuppression**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:469](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L469)

Toggles noise suppression on the audio input.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`toggleNoiseSuppression`](../interfaces/CallParticipant.md#togglenoisesuppression)

***

### unmute()

> **unmute**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:426](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L426)

Unmutes the participant's audio.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`unmute`](../interfaces/CallParticipant.md#unmute)

***

### unmuteVideo()

> **unmuteVideo**(): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:441](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L441)

Unmutes the participant's video.

#### Returns

`Promise`\<`void`\>

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`unmuteVideo`](../interfaces/CallParticipant.md#unmutevideo)

***

### updateMeta()

> **updateMeta**(`_meta`): `Promise`\<`void`\>

Defined in: [core/entities/Participant.ts:552](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/core/entities/Participant.ts#L552)

Merges values into custom metadata (unlike [setMeta](#setmeta) which replaces).

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `_meta` | `Record`\<`string`, `unknown`\> | Metadata to merge. |

#### Returns

`Promise`\<`void`\>

#### Throws

Not yet implemented.

#### Implementation of

[`CallParticipant`](../interfaces/CallParticipant.md).[`updateMeta`](../interfaces/CallParticipant.md#updatemeta)
