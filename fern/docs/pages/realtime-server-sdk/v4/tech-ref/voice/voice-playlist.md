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

| Name             | Type     | Description                                                                                    |
|:-----------------|:---------|:-----------------------------------------------------------------------------------------------|
| `params`<span className="optional-arg">Optional</span>        | `Object` | -                                                                                              |
| `params.volume`<span className="optional-arg">Optional</span> | `number` | Default volume to apply to the media in the playlist, between -40dB and +40dB. Default is `0`. |

#### Example

```js
const playlist = new Voice.Playlist({ volume: 1.0 });
```

## **Properties**

### media

Get the list of media that have been added to this Playlist.

**Syntax:** `Playlist.media`

**Returns:** `NestedArray<Object>`

---

### volume

Default volume for the audio in the playlist.

**Syntax:** `Playlist.volume`

**Returns:** `undefined` \| `number`



## **Methods**

### add

▸ **add**(`params`): [`Playlist`][voice-playlist]

Adds the speecified media in series to the Playlist.

#### Parameters

| Name     | Type   | Description                                                                                               |
|:---------|:-------|:----------------------------------------------------------------------------------------------------------|
| `params`<span className="required-arg">Required</span> | Object | A media object. See [`Audio`][link-1], [`Ringtone`][link-2], [`Silence`][link-3], and [`TTS`][link-4]. |

#### Returns

[`Playlist`][voice-playlist]

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
|:-------------|:---------|:----------------------|
| `params`<span className="required-arg">Required</span>     | `object` | -                     |
| `params.url`<span className="required-arg">Required</span> | `string` | URL of media to play. |

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
|:-------------------|:-------------------------------------------|:---------------------------------------|
| `params`<span className="required-arg">Required</span>           | `object`                                   | -                                      |
| `params.duration`<span className="optional-arg">Optional</span> | `number`                                   | How long to play ringtone, in seconds. |
| `params.name`<span className="required-arg">Required</span>      | [`RingtoneName`][types] | Name of the ringtone to play.          |

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
|:------------------|:---------|:--------------------------------------|
| `params`<span className="required-arg">Required</span>          | `object` | -                                     |
| `params.duration`<span className="required-arg">Required</span> | `number` | How long to play silence, in seconds. |

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
| :----------------- | :--------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `params`<span className="required-arg">Required</span>           | `object`               | -                                                                                                                                                                                                |
| `params.gender`<span className="optional-arg">Optional</span>   | `'female'` \| `'male'` | Gender of the voice. Defaults to `female`.                                                                                                                                                       |
| `params.language`<span className="optional-arg">Optional</span> | `string`               | Language of the text in `ISO 639-1` (language name) + `ISO 3166` (country code). Defaults to `en-US`.<br />Supported languages can be found [here][link-5].                |
| `params.text`<span className="required-arg">Required</span>      | `string`               | Text to play. SSML may be entered as a string wrapped in `<speak>` tags. <br />See our [supported voices and languages][voice-and-languages] documentation for usage and supported tags. |
| `params.voice`<span className="optional-arg">Optional</span>    | `string`               | Voice to use (takes precedence on `gender`).<br />Supported voices can be found [here][link-5].                                                                            |

#### Returns

`Object`



#### Example

```js
Voice.Playlist.TTS({
  text: "Welcome to SignalWire!",
  gender: "male",
  language: "en-US",
});
```

##### SSML Example

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
