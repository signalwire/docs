---
title: Voice.DeviceBuilder
sidebar_label: DeviceBuilder
---

A DeviceBuilder object allows you to specify a set of devices which should be dialed in sequence or parallel. You can then pass the device plan to the methods that support it, for example [Call.connect](./voice-call.mdx#connect).

#### Example

Creates a plan which specifies to dial a SIP endpoint. If there is no answer within 30 seconds, calls two phone numbers in parallel (as indicated by the array syntax). As soon as one of the two answers, the operation is considered successful.

```js
const plan = new Voice.DeviceBuilder()
  .add(
    Voice.DeviceBuilder.Sip({
      from: "sip:user1@domain.com",
      to: "sip:user2@domain.com",
      timeout: 30,
    })
  )
  .add([
    Voice.DeviceBuilder.Phone({ to: "+yyyyyy", timeout: 30 }),
    Voice.DeviceBuilder.Phone({ to: "+zzzzzz", timeout: 30 }),
  ]);
```

## Constructors

### constructor

• **new DeviceBuilder**()

Instantiates an empty DeviceBuilder. Use the [`add`](#add) method to add devices to this DeviceBuilder.

#### Example

```js
const plan = new Voice.DeviceBuilder();
```

## Properties

### devices

Get the list of devices that have been added to this DeviceBuilder.

**Syntax:** `DeviceBuilder.devices()`

**Returns:** `NestedArray<Object>`

## Methods

### add

▸ **add**(`device`): [`DeviceBuilder`](./voice-devicebuilder.md)

Adds the specified device (or set of devices) in series to this DeviceBuilder.
When you add a device in series, a call to that device will be made only if none
of the previously added devices answer the call.

You can pass either a device ([`Phone`](#phone) or [`Sip`](#sip)) or an array of devices.

- Passing a single device will add that device in series to the sequence.
- Passing an array of devices will add those devices in series to the previous ones, but among themselves they will be called in parallel.

#### Parameters

| Name     | Type                   | Description                                                                      |
|:---------|:-----------------------|:---------------------------------------------------------------------------------|
| `device` | `Object` \| `Object[]` | A single device or an array of devices. See [`Phone`](#phone) and [`Sip`](#sip). |

#### Returns

[`DeviceBuilder`](./voice-devicebuilder.md)

#### Example

Adding two devices in series. If `"+xxxxxx"` doesn't answer within 30 seconds, `"+yyyyyy"` will be called.

```js
const plan = new Voice.DeviceBuilder()
  .add(Voice.DeviceBuilder.Phone({ to: "+xxxxxx", timeout: 30 }))
  .add(Voice.DeviceBuilder.Phone({ to: "+yyyyyy", timeout: 30 }));

client.dial(plan);
```

Adding two devices in parallel. Both will ring simultaneously. As soon as
either `"+xxxxxx"` or `"+yyyyyy"` answers, the other stops ringing.

```js
const plan = new Voice.DeviceBuilder().add([
  Voice.DeviceBuilder.Phone({ to: "+xxxxxx", from: "+aaaaa", timeout: 30 }),
  Voice.DeviceBuilder.Phone({ to: "+yyyyyy", from: "+bbbbb", timeout: 30 }),
]);

client.dial(plan);
```

Mixing series and parallel. First calls the SIP device. If it doesn't
answer, calls `"+yyyyyy"` and `"+zzzzzz"` simultaneously.

```js
const plan = new Voice.DeviceBuilder()
  .add(
    Voice.DeviceBuilder.Sip({
      from: "sip:user1@domain.com",
      to: "sip:user2@domain.com",
      timeout: 30,
    })
  )
  .add([
    Voice.DeviceBuilder.Phone({ to: "+yyyyyy", from: "+aaaaa", timeout: 30 }),
    Voice.DeviceBuilder.Phone({ to: "+zzzzzz", from: "+bbbbb", timeout: 30 }),
  ]);

client.dial(plan);
```

---

### Phone

▸ `Static` **Phone**(`params`): `Object`

Represents the configuration to call a phone device.

#### Parameters

| Name                        | Type       | Description                                                                                                                                                                                                                                                      |
|:----------------------------|:-----------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `params`                    | `Object`   | -                                                                                                                                                                                                                                                                |
| `params.callStateEvents`    | `string[]` | An optional array of event names to be notified about. Allowed values are `created`, `ringing`, `answered`, and `ended`. Default is `ended`.                                                                                                                     |
| `params.callStateUrl`       | `string`   | Optional webhook URL to which SignalWire will send call status change notifications. See the payload specifications under [`CallState`](./callstate.mdx).                                                                                                        |
| `params.to`                 | `string`   | Number to call, in E.164 format.                                                                                                                                                                                                                                 |
| `params.from`               | `string`   | SignalWire number to use to initiate the call, in E.164 format.                                                                                                                                                                                                  |
| `params.maxPricePerMinute?` | `number`   | The optional maximum price in USD acceptable for the call to be created. If the rate for the call is greater than this value, the call will not be created. If not set, all calls will be created. Price can have a maximum of four decimal places, i.e. 0.0075. |
| `params.timeout?`           | `number`   | Time to wait for the call to be answered, in seconds. Optional. Default is 30 seconds.                                                                                                                                                                           |

#### Returns

`Object`

#### Example

```js
Voice.DeviceBuilder.Phone({
  to: "+xxxxxx",
  from: "+aaaaa",
  timeout: 30,
  callStateUrl: "http://mydomain.com/hook",
  callStateEvents: ["ended", "answered"],
});
```

---

### Sip

▸ `Static` **Sip**(`params`): `Object`

Represents the configuration to call a SIP device.

#### Parameters

| Name                        | Type                                   | Description                                                                                                                                                                                                                                             |
|:----------------------------|:---------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `params`                    | `Object`                               | -                                                                                                                                                                                                                                                       |
| `params.from`               | `string`                               | SIP endpoint URI to use to initiate the call.                                                                                                                                                                                                           |
| `params.callStateEvents`    | `string[]`                             | An optional array of event names to be notified about. Allowed values are `created`, `ringing`, `answered`, and `ended`. Default is `ended`.                                                                                                            |
| `params.callStateUrl`       | `string`                               | Optional webhook URL to which SignalWire will send call status change notifications. See the payload specifications under [`CallState`](./callstate.mdx).                                                                                               |
| `params.to`                 | `string`                               | SIP endpoint URI to call.                                                                                                                                                                                                                               |
| `params.codecs?`            | [`SipCodec`](./types.mdx#sipcodec)[]   | Optional array of desired codecs in order of preference.                                                                                                                                                                                                |
| `params.headers?`           | [`SipHeader`](./types.mdx#sipheader)[] | Optional array of headers. Must be X- headers only.                                                                                                                                                                                                     |
| `params.maxPricePerMinute?` | `number`                               | The maximum price in USD acceptable for the call to be created. If the rate for the call is greater than this value, the call will not be created. If not set, all calls will be created. Price can have a maximum of four decimal places, i.e. 0.0075. |
| `params.timeout?`           | `number`                               | Time to wait for the call to be answered, in seconds. Default is 30 seconds.                                                                                                                                                                            |

#### Returns

`Object`

#### Example

```js
Voice.DeviceBuilder.Sip({
  from: "sip:user1@domain.com",
  to: "sip:user2@domain.com",
  timeout: 30,
  callStateUrl: "http://mydomain.com/hook",
  callStateEvents: ["ended", "answered"],
});
```
