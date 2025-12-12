---
slug: /voice/device-builder
sidebar_label: DeviceBuilder
---

# Voice.DeviceBuilder

[callstate]: callstate.mdx
[link]: #add
[link-1]: #phone
[link-2]: #sip
[types]: types.mdx#sipcodec
[types-1]: types.mdx#sipheader
[voice-call]: voice-call.mdx#connect
[voice-devicebuilder]: voice-devicebuilder.md
[voicecallphoneparams]: types.mdx#voicecallphoneparams
[voicecallsipparams]: types.mdx#voicecallsipparams

A DeviceBuilder object allows you to specify a set of devices which should be dialed in sequence or parallel. You can then pass the device plan to the methods that support it, for example [Call.connect][voice-call].

#### Example

Creates a plan which specifies to dial a SIP endpoint. If there is no answer within 30 seconds, calls two phone numbers in parallel (as indicated by the array syntax). As soon as one of the two answers, the operation is considered successful.

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const devices = new Voice.DeviceBuilder()
  .add(
    Voice.DeviceBuilder.Sip({
      from: "sip:user1@domain.com",
      to: "sip:user2@domain.com",
      timeout: 30,
    })
  )
  .add([
    Voice.DeviceBuilder.Phone({ to: "+1yyyyyyyyyy", from: "+1xxxxxxxxxx", timeout: 30 }),
    Voice.DeviceBuilder.Phone({ to: "+1zzzzzzzzzz", from: "+1xxxxxxxxxx", timeout: 30 }),
  ]);

const call = await client.voice.dial(devices);
console.log("Call answered:", call.id);
```

## **Constructors**

### constructor

• **new DeviceBuilder**()

Instantiates an empty DeviceBuilder. Use the [`add`][link] method to add devices to this DeviceBuilder.

#### Example

```js
import { Voice } from "@signalwire/realtime-api";

const devices = new Voice.DeviceBuilder();
```

## **Properties**

<APIField name="devices" type="NestedArray<Object>">
  The list of devices that have been added to this DeviceBuilder.
</APIField>

## **Methods**

### add

▸ **add**(`device`): [`DeviceBuilder`][voice-devicebuilder]

Adds the specified device (or set of devices) in series to this DeviceBuilder.
When you add a device in series, a call to that device will be made only if none
of the previously added devices answer the call.

You can pass either a device ([`Phone`][link-1] or [`Sip`][link-2]) or an array of devices.

- Passing a single device will add that device in series to the sequence.
- Passing an array of devices will add those devices in series to the previous ones, but among themselves they will be called in parallel.

#### Parameters

<APIField name="device" type="object | object[]" required={true}>
  A single device or an array of devices. See [`Phone`][link-1] and [`Sip`][link-2].
</APIField>

#### Returns

[`DeviceBuilder`][voice-devicebuilder]

#### Example

Adding two devices in series. If `"+1xxxxxxxxxx"` doesn't answer within 30 seconds, `"+1yyyyyyyyyy"` will be called.

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const devices = new Voice.DeviceBuilder()
  .add(Voice.DeviceBuilder.Phone({ to: "+1xxxxxxxxxx", from: "+1aaaaaaaaaa", timeout: 30 }))
  .add(Voice.DeviceBuilder.Phone({ to: "+1yyyyyyyyyy", from: "+1aaaaaaaaaa", timeout: 30 }));

const call = await client.voice.dial(devices);
```

Adding two devices in parallel. Both will ring simultaneously. As soon as
either `"+1xxxxxxxxxx"` or `"+1yyyyyyyyyy"` answers, the other stops ringing.

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const devices = new Voice.DeviceBuilder().add([
  Voice.DeviceBuilder.Phone({ to: "+1xxxxxxxxxx", from: "+1aaaaaaaaaa", timeout: 30 }),
  Voice.DeviceBuilder.Phone({ to: "+1yyyyyyyyyy", from: "+1bbbbbbbbbb", timeout: 30 }),
]);

const call = await client.voice.dial(devices);
```

Mixing series and parallel. First calls the SIP device. If it doesn't
answer, calls `"+1yyyyyyyyyy"` and `"+1zzzzzzzzzz"` simultaneously.

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const devices = new Voice.DeviceBuilder()
  .add(
    Voice.DeviceBuilder.Sip({
      from: "sip:user1@domain.com",
      to: "sip:user2@domain.com",
      timeout: 30,
    })
  )
  .add([
    Voice.DeviceBuilder.Phone({ to: "+1yyyyyyyyyy", from: "+1aaaaaaaaaa", timeout: 30 }),
    Voice.DeviceBuilder.Phone({ to: "+1zzzzzzzzzz", from: "+1bbbbbbbbbb", timeout: 30 }),
  ]);

const call = await client.voice.dial(devices);
```

---

### Phone

▸ `Static` **Phone**(`params`): [`VoiceCallPhoneParams`][voicecallphoneparams]

Represents the configuration to call a phone device.

#### Parameters

<APIField name="params" type="object" required={true}>
  Object containing the parameters of the method.
</APIField>

<APIField name="params.to" type="string" required={true}>
  Number to call, in E.164 format.
</APIField>

<APIField name="params.from" type="string" required={true}>
  SignalWire number to use to initiate the call, in E.164 format.
</APIField>

<APIField name="params.timeout" type="number" default="30">
  Time to wait for the call to be answered, in seconds.
</APIField>

<APIField name="params.callStateUrl" type="string">
  Optional webhook URL to which SignalWire will send call status change notifications. See the payload specifications under [`CallState`][callstate].
</APIField>

<APIField name="params.callStateEvents" type="string[]" default='["ended"]'>
  An optional array of event names to be notified about. Allowed values are `created`, `ringing`, `answered`, and `ended`.
</APIField>

<APIField name="params.maxPricePerMinute" type="number">
  The optional maximum price in USD acceptable for the call to be created. If the rate for the call is greater than this value, the call will not be created. If not set, all calls will be created. Price can have a maximum of four decimal places, i.e. `0.0075`.
</APIField>

#### Returns

[`VoiceCallPhoneParams`][voicecallphoneparams] - A device configuration object to pass to [`DeviceBuilder.add()`][link].

#### Example

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const devices = new Voice.DeviceBuilder()
  .add(Voice.DeviceBuilder.Phone({
    to: "+1yyyyyyyyyy",
    from: "+1xxxxxxxxxx",
    timeout: 30,
    callStateUrl: "https://example.com/call-state-webhook",
    callStateEvents: ["created", "ringing", "answered", "ended"],
    maxPricePerMinute: 0.50
  }));

const call = await client.voice.dial(devices);
```

---

### Sip

▸ `Static` **Sip**(`params`): [`VoiceCallSipParams`][voicecallsipparams]

Represents the configuration to call a SIP device.

#### Parameters

<APIField name="params" type="object" required={true}>
  Object containing the parameters of the method.
</APIField>

<APIField name="params.to" type="string" required={true}>
  SIP endpoint URI to call.
</APIField>

<APIField name="params.from" type="string" required={true}>
  SIP endpoint URI to use to initiate the call.
</APIField>

<APIField name="params.timeout" type="number" default="30">
  Time to wait for the call to be answered, in seconds.
</APIField>

<APIField name="params.codecs" type="SipCodec[]">
  Optional array of desired codecs in order of preference. See [`SipCodec`][types].
</APIField>

<APIField name="params.headers" type="SipHeader[]">
  Optional array of headers. Must be X- headers only. See [`SipHeader`][types-1].
</APIField>

<APIField name="params.callStateUrl" type="string">
  Optional webhook URL to which SignalWire will send call status change notifications. See the payload specifications under [`CallState`][callstate].
</APIField>

<APIField name="params.callStateEvents" type="string[]" default='["ended"]'>
  An optional array of event names to be notified about. Allowed values are `created`, `ringing`, `answered`, and `ended`.
</APIField>

<APIField name="params.maxPricePerMinute" type="number">
  The maximum price in USD acceptable for the call to be created. If the rate for the call is greater than this value, the call will not be created. If not set, all calls will be created. Price can have a maximum of four decimal places, i.e. `0.0075`.
</APIField>

#### Returns

[`VoiceCallSipParams`][voicecallsipparams] - A device configuration object to pass to [`DeviceBuilder.add()`][link].

#### Example

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const devices = new Voice.DeviceBuilder()
  .add(Voice.DeviceBuilder.Sip({
    from: "sip:user1@domain.com",
    to: "sip:user2@domain.com",
    timeout: 30,
    codecs: ["PCMU", "PCMA", "OPUS"],
    headers: [
      { name: "X-Custom-Header", value: "custom-value" }
    ],
    callStateUrl: "https://example.com/call-state-webhook",
    callStateEvents: ["created", "ringing", "answered", "ended"],
    maxPricePerMinute: 0.50
  }));

const call = await client.voice.dial(devices);
```
