import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// Media items for `pay.prompts[].play`. This is the same media item shape the
// REST Calling API `play` command accepts (SignalWireAPI.Calling.Play*Item in
// specs/signalwire-rest/calling-api/calls/models/requests.tsp). The REST tree
// imports SWML, not the other way round, so the SWML schema cannot reference
// those models; keep the two in step until they move to a shared location.

@doc("Ringtone name. A two-letter country code selects that country's ringtone cadence.")
enum PayPromptRingtoneName {
  au,
  be,
  ca,
  cn,
  cy,
  cz,
  de,
  dk,
  dz,
  eg,
  es,
  fi,
  fr,
  hu,
  il,
  in,
  jp,
  ko,
  pk,
  pl,
  ro,
  rs,
  ru,
  sa,
  tr,
  uk,
  us,
  at,
  bg,
  br,
  ch,
  cl,
  ee,
  gr,
  it,
  lt,
  mx,
  my,
  nl,
  no,
  nz,
  ph,
  pt,
  se,
  sg,
  th,
  za,
  tw,
  ve,
  bong,
}

model PayPromptPlayAudioParams {
  @doc("HTTP or HTTPS URL of the audio file to play.")
  @pattern("^(http|https)://")
  @example("https://example.com/audio/enter-card-number.mp3")
  url: url;
}

model PayPromptPlayTTSParams {
  @doc("The text to speak.")
  @example("Please enter your card number.")
  text: string;

  @doc("Language code for the speech, such as `en-US`. Falls back to the `pay` method's `language`.")
  @example("en-US")
  language?: string;

  @doc("Voice gender, used when no voice is set here or on the `pay` method.")
  @example("female")
  gender?: "male" | "female";

  @doc("Text-to-speech voice. Falls back to the `pay` method's voice.")
  @example("woman")
  voice?: string;
}

model PayPromptPlaySilenceParams {
  @doc("Duration of silence in seconds. Must be a positive number.")
  @example(1.5)
  duration: float;
}

model PayPromptPlayRingtoneParams {
  @doc("The ringtone to play.")
  @example(PayPromptRingtoneName.us)
  name: PayPromptRingtoneName;

  @doc("Maximum ringtone duration in seconds. Must be a positive number. If omitted, the ringtone plays without a time limit.")
  @example(5)
  duration?: float;
}

@summary("Audio file")
model PayPromptPlayAudio {
  @doc("The type of media to play.")
  type: "audio";

  @doc("Audio file parameters.")
  params: PayPromptPlayAudioParams;
}

@summary("Text-to-speech")
model PayPromptPlayTTS {
  @doc("The type of media to play.")
  type: "tts";

  @doc("Text-to-speech parameters.")
  params: PayPromptPlayTTSParams;
}

@summary("Silence")
model PayPromptPlaySilence {
  @doc("The type of media to play.")
  type: "silence";

  @doc("Silence parameters.")
  params: PayPromptPlaySilenceParams;
}

@summary("Ringtone")
model PayPromptPlayRingtone {
  @doc("The type of media to play.")
  type: "ringtone";

  @doc("Ringtone parameters.")
  params: PayPromptPlayRingtoneParams;
}

union PayPromptPlayItem {
  PayPromptPlayAudio,
  PayPromptPlayTTS,
  PayPromptPlaySilence,
  PayPromptPlayRingtone,
}
