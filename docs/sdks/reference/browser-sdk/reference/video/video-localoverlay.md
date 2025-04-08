---
title: "LocalOverlay"
sidebar_position: 100
---

Represents the local overlay, which displays the user's local camera feed.

## Properties

### mirrored

• `Readonly` **mirrored**: `boolean`

Whether the local video overlay is mirrored.

## Methods

### setMirrored

▸ **setMirrored**(): `void`

Mirror the local video overlay when `true`. The mirrored stream is sent to the SignalWire server and is visible to all participants.

#### Parameters

| Name     | Type      | Description                                |
| :------- | :-------- | :----------------------------------------- |
| `mirror` | `boolean` | Whether to mirror the local video overlay. |

#### Returns

`void`

#### Example

```javascript
await roomSession.localOverlay.setMirrored(true);
```
