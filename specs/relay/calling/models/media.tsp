import "@signalwire/typespec-asyncapi";

import "./core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("A media element to play. Discriminated on `type`.")
@discriminator("type")
model PlayMedia {
  type: "audio" | "tts" | "silence" | "ringtone";
}

@doc("Play an audio file from a URL.")
model PlayMediaAudio extends PlayMedia {
  @example("audio")
  type: "audio";

  params: {
    @doc("HTTP(s) URL to the audio resource to play.")
    @example("https://example.com/welcome.mp3")
    url: url;
  };
}

@doc("Speak text with text-to-speech.")
model PlayMediaTts extends PlayMedia {
  @example("tts")
  type: "tts";

  params: {
    @doc("Text to speak — plain text or SSML markup.")
    @example("Please hold while we connect you.")
    text: string;

    @doc("TTS language (e.g. `en-US`). Default `en-US`.")
    @example("en-US")
    language?: string = "en-US";

    @doc("TTS voice gender. Default `female`.")
    @example("female")
    gender?: TtsGender = "female";

    @doc("Specific voice to use. Highest precedence when selecting the TTS voice.")
    @example("en-US-Standard-C")
    voice?: string;
  };
}

@doc("Play silence for a fixed duration.")
model PlayMediaSilence extends PlayMedia {
  @example("silence")
  type: "silence";

  params: {
    @doc("Seconds of silence to play.")
    @minValueExclusive(0)
    @example(2.5)
    duration: float64;
  };
}

@doc("Play a country-specific ringtone.")
model PlayMediaRingtone extends PlayMedia {
  @example("ringtone")
  type: "ringtone";

  params: {
    @doc("Built-in ringtone name (country code).")
    @example("us")
    name: ToneName;

    @doc("Seconds of ringtone to play.")
    @minValueExclusive(0)
    @example(5)
    duration?: float64;
  };
}
