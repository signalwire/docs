---
title: "Playlist"
slug: /voice/playlist
sidebar_label: Playlist
---

[link]: #add
[link-1]: #audio
[link-2]: #ringtone
[link-3]: #silence
[link-4]: #tts
[link-5]: /voice/getting-started/voice-and-languages/
[types]: types.mdx#ringtonename
[voice-and-languages]: /voice/getting-started/voice-and-languages
[voice-call]: voice-call.mdx#play
[voice-playlist]: voice-playlist.md

A Playlist object allows you to specify a series of media which should be played in sequence. You can then pass the playlist to the methods that support it, for example [Call.play][voice-call].

#### Example

In this example, we create a playlist for playing the following items sequentially:
- A TTS message
- 1 second of silence
- An mp3 file

```js
import { Voice } from "@signalwire/realtime-api";

const playlist = new Voice.Playlist({ volume: 1.0 })
  .add(
    Voice.Playlist.TTS({
      text: "Welcome to SignalWire!",
    })
  )
  .add(Voice.Playlist.Silence({ duration: 1 }))
  .add(
    Voice.Playlist.Audio({
      url: "https://cdn.signalwire.com/default-music/welcome.mp3",
    })
  );
```

## **Constructors**

### constructor

• **new Playlist**(`params?`)

Instantiates an empty Playlist. Use the [`add`][link] method to add media to this Playlist.

#### Parameters

<APIField name="params" type="object">
  Object containing the parameters of the constructor.
</APIField>

<APIField name="params.volume" type="number" default="0">
  Default volume to apply to the media in the playlist, between -40dB and +40dB.
</APIField>

#### Example

```js
const playlist = new Voice.Playlist({ volume: 1.0 });
```

## **Properties**

<APIField name="media" type="NestedArray<Object>">
  The list of media items that have been added to this Playlist.
</APIField>

<APIField name="volume" type="number | undefined">
  The default volume for the audio in the playlist, between -40dB and +40dB.
</APIField>

## **Methods**

### add

▸ **add**(`params`): [`Playlist`][voice-playlist]

Adds the speecified media in series to the Playlist.

#### Parameters

<APIField name="params" type="object" required={true}>
  A media object. See [`Audio`][link-1], [`Ringtone`][link-2], [`Silence`][link-3], and [`TTS`][link-4].
</APIField>

#### Returns

[`Playlist`][voice-playlist]

#### Example

A playlist to play some audio, then a short silence, and finally a ringtone.

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const call = await client.voice.dialPhone({
  from: "+1xxxxxxxxxx",
  to: "+1yyyyyyyyyy",
  timeout: 30
});

const playlist = new Voice.Playlist()
  .add(
    Voice.Playlist.Audio({
      url: "https://cdn.signalwire.com/default-music/welcome.mp3",
    })
  )
  .add(Voice.Playlist.Silence({ duration: 1 }))
  .add(Voice.Playlist.Ringtone({ name: "it", duration: 5 }));

await call.play(playlist);
```

---

### Audio

▸ `Static` **Audio**(`params`): `Object`

An audio media.

#### Parameters

<APIField name="params" type="object" required={true}>
  Object containing the parameters of the method.
</APIField>

<APIField name="params.url" type="string" required={true}>
  URL of media to play.
</APIField>

#### Returns

`Object`

#### Example

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const call = await client.voice.dialPhone({
  from: "+1xxxxxxxxxx",
  to: "+1yyyyyyyyyy",
  timeout: 30
});

const playlist = new Voice.Playlist()
  .add(Voice.Playlist.Audio({
    url: "https://cdn.signalwire.com/default-music/welcome.mp3",
  }));

await call.play(playlist);
```

---

### Ringtone

▸ `Static` **Ringtone**(`params`): `Object`

A ringtone media.

#### Parameters

<APIField name="params" type="object" required={true}>
  Object containing the parameters of the method.
</APIField>

<APIField name="params.name" type="RingtoneName" required={true}>
  Name of the ringtone to play. See [`RingtoneName`][types].
</APIField>

<APIField name="params.duration" type="number">
  How long to play ringtone, in seconds.
</APIField>

#### Returns

`Object`

#### Example

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const call = await client.voice.dialPhone({
  from: "+1xxxxxxxxxx",
  to: "+1yyyyyyyyyy",
  timeout: 30
});

const playlist = new Voice.Playlist()
  .add(Voice.Playlist.Ringtone({
    name: "it",
    duration: 30,
  }));

await call.play(playlist);
```

---

### Silence

▸ `Static` **Silence**(`params`): `Object`

A silence interval.

#### Parameters

<APIField name="params" type="object" required={true}>
  Object containing the parameters of the method.
</APIField>

<APIField name="params.duration" type="number" required={true}>
  How long to play silence, in seconds.
</APIField>

#### Returns

`Object`

#### Example

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const call = await client.voice.dialPhone({
  from: "+1xxxxxxxxxx",
  to: "+1yyyyyyyyyy",
  timeout: 30
});

// Use silence to create a pause between other media
const playlist = new Voice.Playlist()
  .add(Voice.Playlist.TTS({ text: "Please hold." }))
  .add(Voice.Playlist.Silence({ duration: 2 }))
  .add(Voice.Playlist.TTS({ text: "Connecting you now." }));

await call.play(playlist);
```

---

### TTS

▸ `Static` **TTS**(`params`): `Object`

A TTS media.

#### Parameters

<APIField name="params" type="object" required={true}>
  Object containing the parameters of the method.
</APIField>

<APIField name="params.text" type="string" required={true}>
  Text to play. SSML may be entered as a string wrapped in `<speak>` tags. See our [supported voices and languages][voice-and-languages] documentation for usage and supported tags.
</APIField>

<APIField name="params.language" type="string" default='"en-US"'>
  Language of the text in `ISO 639-1` (language name) + `ISO 3166` (country code). Supported languages can be found [here][link-5].
</APIField>

<APIField name="params.gender" type='"female" | "male"' default='"female"'>
  Gender of the voice.
</APIField>

<APIField name="params.voice" type="string">
  Voice to use (takes precedence over `gender`). Supported voices can be found [here][link-5].
</APIField>

#### Returns

`Object`



#### Example

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const call = await client.voice.dialPhone({
  from: "+1xxxxxxxxxx",
  to: "+1yyyyyyyyyy",
  timeout: 30
});

const playlist = new Voice.Playlist()
  .add(Voice.Playlist.TTS({
    text: "Welcome to SignalWire!",
    gender: "male",
    language: "en-US",
  }));

await call.play(playlist);
```

##### SSML Example

```js
import { SignalWire, Voice } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const call = await client.voice.dialPhone({
  from: "+1xxxxxxxxxx",
  to: "+1yyyyyyyyyy",
  timeout: 30
});

const playlist = new Voice.Playlist()
  .add(Voice.Playlist.TTS({
    text: `<speak>
      Here are <say-as interpret-as="characters">SSML</say-as> samples.
      I can pause <break time="3s"/>.
      I can speak in cardinals. Your number is <say-as interpret-as="cardinal">10</say-as>.
      Or I can speak in ordinals. You are <say-as interpret-as="ordinal">10</say-as> in line.
      Or I can even speak in digits. The digits for ten are <say-as interpret-as="characters">10</say-as>.
      I can also substitute phrases, like the <sub alias="World Wide Web Consortium">W3C</sub>.
      Finally, I can speak a paragraph with two sentences.
      <p><s>This is sentence one.</s><s>This is sentence two.</s></p>
    </speak>`,
    voice: "polly.Joey-Neural",
  }));

await call.play(playlist);
```
