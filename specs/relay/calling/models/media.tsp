import "@signalwire/typespec-asyncapi";

import "./core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Play media union (calling.play / calling.play_and_collect `play[]`)
//
// Discriminated on `type`. Mirrors Ringback, but the `tts` variant additionally
// accepts a `voice` field. Shared by calling.play and calling.play_and_collect.
// ═════════════════════════════════════════════════════════════════════════════

@doc("A media element to play. Discriminated on `type`.")
@discriminator("type")
model PlayMedia {
  type: string;
}

@example(#{ type: "audio", params: #{ url: "https://example.com/welcome.mp3" } })
model PlayMediaAudio extends PlayMedia {
  type: "audio";
  params: {
    @doc("HTTP(s) URL to the audio resource to play.")
    url: url;
  };
}

@example(#{ type: "tts", params: #{ text: "Please hold while we connect you.", language: "en-US", gender: "female" } })
model PlayMediaTts extends PlayMedia {
  type: "tts";
  params: {
    @doc("Text to speak — plain text or SSML markup.")
    text: string;

    @doc("TTS language (e.g. `en-US`). Default `en-US`.")
    language?: string = "en-US";

    @doc("TTS voice gender. Default `female`.")
    gender?: TtsGender = "female";

    @doc("Specific voice to use. Highest precedence when selecting the TTS voice.")
    voice?: string;
  };
}

@example(#{ type: "silence", params: #{ duration: 2.5 } })
model PlayMediaSilence extends PlayMedia {
  type: "silence";
  params: {
    @doc("Seconds of silence to play.")
    duration: float64;
  };
}

@example(#{ type: "ringtone", params: #{ name: "us", duration: 5 } })
model PlayMediaRingtone extends PlayMedia {
  type: "ringtone";
  params: {
    @doc("Built-in ringtone name (country code).")
    name: ToneName;

    @doc("Seconds of ringtone to play.")
    @minValueExclusive(0)
    duration?: float64;
  };
}
