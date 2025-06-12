---
title: "Playlist"
---

A Playlist object allows you to specify a series of media which should be played in sequence. You can then pass the playlist to the methods that support it, for example [Call.play](./voice-call.mdx#play).

#### Example

Creates a playlist for playing, in sequence, a TTS message, 1 second of silence, and an mp3 file.

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

## Constructors

### constructor

• **new Playlist**(`params?`)

Instantiates an empty Playlist. Use the [`add`](#add) method to add media to this Playlist.

#### Parameters

| Name             | Type     | Description                                                                                  |
|:-----------------|:---------|:---------------------------------------------------------------------------------------------|
| `params?`        | `Object` | -                                                                                            |
| `params.volume?` | `number` | Default volume to apply to the media in the playlist, between -40dB and +40dB. Default is 0. |

#### Example

```js
const playlist = new Voice.Playlist({ volume: 1.0 });
```

## Properties

### media

Get the list of media that have been added to this Playlist.

**Syntax:** `Playlist.media()`

**Returns:** `NestedArray<Object>`

---

### volume

Default volume for the audio in the playlist.

**Syntax:** `Playlist.volume()`

**Returns:** `undefined` \| `number`



## Methods

### add

▸ **add**(`params`): [`Playlist`](./voice-playlist.md)

Adds the speecified media in series to the Playlist.

#### Parameters

| Name     | Type   | Description                                                                                               |
| :------- | :----- | :-------------------------------------------------------------------------------------------------------- |
| `params` | Object | A media object. See [`Audio`](#audio), [`Ringtone`](#ringtone), [`Silence`](#silence), and [`TTS`](#tts). |

#### Returns

[`Playlist`](./voice-playlist.md)

#### Example

A playlist to play some audio, then a short silence, and finally a ringtone.

```js
const playlist = new Voice.DeviceBuilder()
  .add(
    Voice.Playlist.Audio({
      url: "https://cdn.signalwire.com/default-music/welcome.mp3",
    })
  )
  .add(Voice.Playlist.Silence({ duration: 1 }))
  .add(Voice.Playlist.Ringtone({ name: "it", duration: 5 }));

call.play(playlist);
```

---

### Audio

▸ `Static` **Audio**(`params`): `Object`

An audio media.

#### Parameters

| Name         | Type     | Description           |
| :----------- | :------- | :-------------------- |
| `params`     | `object` | -                     |
| `params.url` | `string` | URL of media to play. |

#### Returns

`Object`

#### Example

```js
Voice.Playlist.Audio({
  url: "https://cdn.signalwire.com/default-music/welcome.mp3",
});
```

---

### Ringtone

▸ `Static` **Ringtone**(`params`): `Object`

A ringtone media.

#### Parameters

| Name               | Type                                       | Description                            |
| :----------------- | :----------------------------------------- | :------------------------------------- |
| `params`           | `object`                                   | -                                      |
| `params.duration?` | `number`                                   | How long to play ringtone, in seconds. |
| `params.name`      | [`RingtoneName`](./types.mdx#ringtonename) | Name of the ringtone to play.          |

#### Returns

`Object`

#### Example

```js
Voice.Playlist.Ringtone({
  name: "it",
  duration: 30,
});
```

---

### Silence

▸ `Static` **Silence**(`params`): `Object`

A silence interval.

#### Parameters

| Name              | Type     | Description                           |
| :---------------- | :------- | :------------------------------------ |
| `params`          | `object` | -                                     |
| `params.duration` | `number` | How long to play silence, in seconds. |

#### Returns

`Object`

#### Example

```js
Voice.Playlist.Silence({
  duration: 2,
});
```

---

### TTS

▸ `Static` **TTS**(`params`): `Object`

A TTS media.

#### Parameters

| Name               | Type                   | Description                                                                                                                                                                                      |
|:-------------------|:-----------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `params`           | `object`               | -                                                                                                                                                                                                |
| `params.gender?`   | `'female'` \| `'male'` | Gender of the voice. Defaults to `female`.                                                                                                                                                       |
| `params.language?` | `string`               | Language of the text in `ISO 639-1` (language name) + `ISO 3166` (country code). Defaults to `en-US`.<br />Supported languages can be found [here](/voice/getting-started/voice-and-languages/)                 |
| `params.text`      | `string`               | Text to play. SSML may be entered as a string wrapped in `<speak>` tags. <br />See our [supported voices and languages](/voice/getting-started/voice-and-languages) documentation for usage and supported tags. |
| `params.voice?`    | `string`               | Voice to use (takes precedence on `gender`).<br />Supported voices can be found [here](/voice/getting-started/voice-and-languages/)                                                                             |

#### Returns

`Object`



### Examples

```js
Voice.Playlist.TTS({
  text: "Welcome to SignalWire!",
  gender: "male",
  language: "en-US",
});
```

Using SSML:

```js
Voice.Playlist.TTS({
  text: `<speak>
      Here are <say-as interpret-as="characters">SSML</say-as> samples.
      I can pause <break time="3s"/>.
      I can speak in cardinals. Your number is <say-as interpret-as="cardinal">10</say-as>.
      Or I can speak in ordinals. You are <say-as interpret-as="ordinal">10</say-as> in line.
      Or I can even speak in digits. The digits for ten are <say-as interpret-as="characters">10</say-as>.
      I can also substitute phrases, like the <sub alias="World Wide Web Consortium">W3C</sub>.
      Finally, I can speak a paragraph with two sentences.
      <p><s>This is sentence one.</s><s>This is sentence two.</s></p>
      </speak>
      `,
  voice: "polly.Joey-Neural",
});
```
