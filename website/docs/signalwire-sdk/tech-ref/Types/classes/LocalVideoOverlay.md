Defined in: [packages/client/src/VideoOverlays.ts:68](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L68)

## Extends

- [`UserOverlay`](UserOverlay.md)

## Constructors

### Constructor

> **new LocalVideoOverlay**(`options`): `LocalVideoOverlay`

Defined in: [packages/client/src/VideoOverlays.ts:72](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L72)

#### Parameters

##### options

`LocalVideoOverlayOptions`

#### Returns

`LocalVideoOverlay`

#### Overrides

[`UserOverlay`](UserOverlay.md).[`constructor`](UserOverlay.md#constructor)

## Properties

### id

> **id**: `string`

Defined in: [packages/client/src/VideoOverlays.ts:15](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L15)

#### Inherited from

[`UserOverlay`](UserOverlay.md).[`id`](UserOverlay.md#id)

## Accessors

### domElement

#### Get Signature

> **get** **domElement**(): `undefined` \| `HTMLDivElement`

Defined in: [packages/client/src/VideoOverlays.ts:28](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L28)

##### Returns

`undefined` \| `HTMLDivElement`

#### Set Signature

> **set** **domElement**(`element`): `void`

Defined in: [packages/client/src/VideoOverlays.ts:32](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L32)

##### Parameters

###### element

`undefined` | `HTMLDivElement`

##### Returns

`void`

#### Inherited from

[`UserOverlay`](UserOverlay.md).[`domElement`](UserOverlay.md#domelement)

***

### mirrored

#### Get Signature

> **get** **mirrored**(): `boolean`

Defined in: [packages/client/src/VideoOverlays.ts:90](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L90)

##### Returns

`boolean`

***

### status

#### Get Signature

> **get** **status**(): `OverlayStatus`

Defined in: [packages/client/src/VideoOverlays.ts:37](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L37)

##### Returns

`OverlayStatus`

#### Set Signature

> **set** **status**(`status`): `void`

Defined in: [packages/client/src/VideoOverlays.ts:41](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L41)

##### Parameters

###### status

`OverlayStatus`

##### Returns

`void`

#### Inherited from

[`UserOverlay`](UserOverlay.md).[`status`](UserOverlay.md#status)

***

### userId

#### Get Signature

> **get** **userId**(): `string`

Defined in: [packages/client/src/VideoOverlays.ts:86](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L86)

##### Returns

`string`

#### Overrides

[`UserOverlay`](UserOverlay.md).[`userId`](UserOverlay.md#userid)

## Methods

### detachListeners()

> **detachListeners**(): `void`

Defined in: [packages/client/src/VideoOverlays.ts:109](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L109)

**`Internal`**

#### Returns

`void`

***

### hide()

> **hide**(): `void`

Defined in: [packages/client/src/VideoOverlays.ts:45](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L45)

#### Returns

`void`

#### Inherited from

[`UserOverlay`](UserOverlay.md).[`hide`](UserOverlay.md#hide)

***

### setMediaStream()

> **setMediaStream**(`stream`): `void`

Defined in: [packages/client/src/VideoOverlays.ts:146](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L146)

#### Parameters

##### stream

`MediaStream`

#### Returns

`void`

***

### setMirror()

> **setMirror**(`mirror`): `void`

Defined in: [packages/client/src/VideoOverlays.ts:156](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L156)

#### Parameters

##### mirror

`boolean` = `...`

#### Returns

`void`

***

### show()

> **show**(): `void`

Defined in: [packages/client/src/VideoOverlays.ts:53](https://github.com/signalwire/signalwire-js/blob/52fa77b6c8db68f4c99b30b3776f45a4309e15bf/packages/client/src/VideoOverlays.ts#L53)

#### Returns

`void`

#### Inherited from

[`UserOverlay`](UserOverlay.md).[`show`](UserOverlay.md#show)
