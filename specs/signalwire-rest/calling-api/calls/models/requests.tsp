import "@typespec/http";
import "@typespec/openapi3";
import "../../../../swml";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace SignalWireAPI.Calling;


const CallSWMLExample = "{'version': '1.0.0', 'sections': { 'main': [{ 'answer': { 'max_duration': 60 }},{ 'play': { 'urls': ['silence:2', 'say:Hello from SignalWire!']}}]}}";

const CallFallbackURLExample = "https://example.com/fallback";

const CallSWMLURLExample = "https://example.com/swml";

const CallIdExample = "3fa85f64-5717-4562-b3fc-2c963f66afa6";

const updateCommandDescription = "The `update` command is used to update a existing call with a new dialplan.";

const uuidDescription = "The unique identifying ID of a existing call.";

const paramsDescription = "An object of parameters that will be utilized by the active command.";

alias CallCreateParamsAlias = CallCreateParamsURL | CallCreateParamsSWML;

alias CallUpdateParamsAlias = CallUpdateParamsURL | CallUpdateParamsSWML;

@doc("The reason for hanging up the call.")
enum HangupReason {
  @doc("Normal hangup by the caller or system.")
  hangup,

  @doc("The call was canceled before being answered.")
  cancel,

  @doc("The destination was busy.")
  busy,

  @doc("The destination did not answer.")
  noAnswer,

  @doc("The call was declined by the destination.")
  decline,

  @doc("The call ended due to an error.")
  error,
}

@summary("calling.end")
model CallHangupRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.end` command is used to hang up a call.")
  @example("calling.end")
  command: "calling.end";

  @doc(paramsDescription)
  params: {
    @doc("Set the reason why the call was hung up.")
    @example(HangupReason.hangup)
    reason?: HangupReason;

    @doc("If `true`, the HTTP response returns immediately without waiting for the hangup to complete.")
    @example(false)
    async?: boolean = false;
  };
}
@summary("calling.ai_hold")
model CallHoldRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.ai_hold` command is used to hold a call.")
  @example("calling.ai_hold")
  command: "calling.ai_hold";

  @doc(paramsDescription)
  params: {
    @doc("Hold timeout, expressed as a numeric string of seconds. Note: must be sent as a string — integer payloads are rejected.")
    @example("300")
    timeout?: string;

    @doc("""
      A system message added to the AI conversation before placing the caller on hold.
      The AI will speak this message to the caller before hold music begins.
      """)
    @example("Please hold while I transfer you to a specialist.")
    prompt?: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the hold to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.ai_unhold")
model CallUnholdRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.ai_unhold` command is used to unhold a call.")
  @example("calling.ai_unhold")
  command: "calling.ai_unhold";

  @doc(paramsDescription)
  params: {
    @doc("If `true`, the HTTP response returns immediately without waiting for the unhold to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

@doc("Parameters for resetting the AI conversation state.")
model CallAIMessageResetParams {
  @doc("Whether to perform a full reset of the AI conversation, clearing all history.")
  @example(true)
  full_reset?: boolean;

  @doc("A new user prompt to set after resetting the conversation.")
  @example("You are a helpful assistant.")
  user_prompt?: string;

  @doc("A new system prompt to set after resetting the conversation.")
  @example("You are a customer support agent for SignalWire.")
  system_prompt?: string;
}

@summary("calling.ai_message")
model CallAIMessageRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.ai_message` command is used to inject a message into the AI conversation.")
  @example("calling.ai_message")
  command: "calling.ai_message";

  @doc(paramsDescription)
  params: {
    @doc("""
      The role that the message is from. By convention pair with `message_text` (the validator itself does not enforce this).
      - `system`: Inject instructions or context that modify the AI's behavior mid-conversation without the caller hearing it.
      - `user`: Inject a message as if the caller said it. The AI will respond as if the caller spoke it.
      - `assistant`: Inject a message as if the AI said it. Appears as an AI response in the conversation history.
      """)
    @example("system")
    role?: "system" | "user" | "assistant";

    @doc("The text content sent to the AI. Typically required unless `reset` is provided.")
    @example("You are now in expert mode. Provide detailed technical responses.")
    message_text?: string;

    @doc("Parameters for resetting the AI conversation state.")
    @example(#{
      full_reset: true,
      system_prompt: "You are a helpful assistant.",
    })
    reset?: CallAIMessageResetParams;

    @doc("Arbitrary JSON data to merge into the AI session's global data store.")
    @example(#{ customer_tier: "premium", language: "en" })
    global_data?: TypeSpec.Record<unknown>;

    @doc("If `true`, the HTTP response returns immediately without waiting for the message to be delivered.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Live Transcribe Commands
// ============================================

// TranscribeDirection, SpeechEngine, and SupportedAIModels are imported from the SWML module

@summary("start Action")
model LiveTranscribeStartAction {
  @doc("Starts live transcription of the call.")
  start: {
    @doc("The language to transcribe (e.g., 'en-US', 'es-ES').")
    @example("en-US")
    lang: string;

    @doc("The direction(s) of the call to transcribe.")
    @example(#[
      TranscribeDirection.`local-caller`,
      TranscribeDirection.`remote-caller`
    ])
    direction: TranscribeDirection[];

    @doc("The webhook URL to receive transcription events.")
    @example("https://example.com/webhook")
    webhook?: string;

    @doc("Whether to send real-time utterance events as speech is recognized.")
    @example(true)
    live_events?: boolean;

    @doc("Whether to generate an AI summary when transcription ends.")
    @example(true)
    ai_summary?: boolean;

    @doc("The AI prompt that instructs how to summarize the conversation when `ai_summary` is enabled.")
    @example("Summarize the key points of this conversation.")
    ai_summary_prompt?: string;

    @doc("The speech recognition engine to use.")
    @example(SpeechEngine.deepgram)
    speech_engine?: SpeechEngine = SpeechEngine.deepgram;

    @doc("Speech timeout in milliseconds.")
    @example(60000)
    speech_timeout?: int32 = 60000;

    @doc("Voice activity detection silence time in milliseconds. Default depends on speech engine: `300` for Deepgram, `500` for Google.")
    @example(300)
    vad_silence_ms?: int32;

    @doc("Voice activity detection threshold (0-1800).")
    @example(400)
    vad_thresh?: int32 = 400;

    @doc("Debug level for logging (0-2).")
    @example(0)
    debug_level?: int32 = 0;
  };
}

@summary("summarize Action")
model LiveTranscribeSummarizeAction {
  @doc("Request an on-demand AI summary of the conversation.")
  summarize: {
    @doc("The webhook URL to receive the summary.")
    @example("https://example.com/webhook")
    webhook?: string;

    @doc("The AI prompt that instructs how to summarize the conversation.")
    @example("Provide a bullet-point summary of the main topics discussed.")
    prompt?: string;
  };
}

@summary("stop Action")
@doc("Stops the live transcription session.")
enum LiveTranscribeStopAction {
  stop,
}

alias LiveTranscribeAction = LiveTranscribeStartAction | LiveTranscribeSummarizeAction | LiveTranscribeStopAction;

@summary("calling.live_transcribe")
model CallLiveTranscribeRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.live_transcribe` command is used to control live transcription on an active call.")
  @example("calling.live_transcribe")
  command: "calling.live_transcribe";

  @doc(paramsDescription)
  params: {
    @doc("The transcription action to perform: start, stop, or summarize.")
    action: LiveTranscribeAction;

    @doc("If `true`, the HTTP response returns immediately without waiting for the action to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Live Translate Commands
// ============================================

// TranslationFilterPreset, CustomTranslationFilter, and TranslationFilter are imported from the SWML module

@summary("start Action")
model LiveTranslateStartAction {
  @doc("Starts live translation of the call.")
  start: {
    @doc("The language to translate from (e.g., 'en-US').")
    @example("en-US")
    from_lang: string;

    @doc("The language to translate to (e.g., 'es-ES').")
    @example("es-ES")
    to_lang: string;

    @doc("The direction(s) of the call to translate.")
    @example(#[
      TranscribeDirection.`local-caller`,
      TranscribeDirection.`remote-caller`
    ])
    direction: TranscribeDirection[];

    @doc("The TTS voice for the source language.")
    @example("elevenlabs.josh")
    from_voice?: string;

    @doc("The TTS voice for the target language.")
    @example("elevenlabs.josh")
    to_voice?: string;

    @doc("Translation filter for the source language direction.")
    @example("professional")
    filter_from?: TranslationFilter;

    @doc("Translation filter for the target language direction.")
    @example("professional")
    filter_to?: TranslationFilter;

    @doc("The webhook URL to receive translation events.")
    @example("https://example.com/webhook")
    webhook?: string;

    @doc("Whether to send real-time translation events.")
    @example(true)
    live_events?: boolean;

    @doc("Whether to generate AI summaries in both languages when translation ends.")
    @example(true)
    ai_summary?: boolean;

    @doc("The AI prompt that instructs how to summarize the conversation when `ai_summary` is enabled.")
    @example("Summarize this translated conversation.")
    ai_summary_prompt?: string;

    @doc("The speech recognition engine to use.")
    @example(SpeechEngine.deepgram)
    speech_engine?: SpeechEngine = SpeechEngine.deepgram;

    @doc("Speech timeout in milliseconds.")
    @example(60000)
    speech_timeout?: int32 = 60000;

    @doc("Voice activity detection silence time in milliseconds. Default depends on speech engine: `300` for Deepgram, `500` for Google.")
    @example(300)
    vad_silence_ms?: int32;

    @doc("Voice activity detection threshold (0-1800).")
    @example(400)
    vad_thresh?: int32 = 400;

    @doc("Debug level for logging (0-2).")
    @example(0)
    debug_level?: int32 = 0;
  };
}

@summary("summarize Action")
model LiveTranslateSummarizeAction {
  @doc("Request an on-demand AI summary of the translated conversation.")
  summarize: {
    @doc("The webhook URL to receive the summary.")
    @example("https://example.com/webhook")
    webhook?: string;

    @doc("The AI prompt that instructs how to summarize the conversation.")
    @example("Summarize the key agreements reached in both languages.")
    prompt?: string;
  };
}

@summary("inject Action")
model LiveTranslateInjectAction {
  @doc("Inject a message into the conversation to be translated and spoken.")
  inject: {
    @doc("The text message to inject and translate.")
    @example("Please hold while I transfer you to a specialist.")
    message: string;

    @doc("The direction to send the translated message.")
    @example(TranscribeDirection.`remote-caller`)
    direction: TranscribeDirection;
  };
}

@summary("stop Action")
@doc("Stops the live translation session.")
enum LiveTranslateStopAction {
  stop,
}

alias LiveTranslateAction =
  | LiveTranslateStartAction
  | LiveTranslateSummarizeAction
  | LiveTranslateInjectAction
  | LiveTranslateStopAction;

@summary("calling.live_translate")
model CallLiveTranslateRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.live_translate` command is used to control live translation on an active call.")
  @example("calling.live_translate")
  command: "calling.live_translate";

  @doc(paramsDescription)
  params: {
    @doc("The translation action to perform: start, stop, summarize, or inject.")
    action: LiveTranslateAction;

    @doc("HTTP or HTTPS URL that receives translation-session webhooks.")
    @example("https://example.com/status_callback")
    status_url?: url;

    @doc("If `true`, the HTTP response returns immediately without waiting for the action to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("dial")
model CallCreateRequest {
  @doc("The `dial` command is used to create a new call.")
  @example("dial")
  command: "dial";

  @doc(paramsDescription)
  params: CallCreateParamsAlias;
}

model CallCreateParamsBase {
  @doc("The address that initiates the call. For PSTN destinations, must be an E.164 number; for SIP/Verto destinations may also be a SIP URI (`sip:user@host`) or a short caller-id token.")
  @example("sip:from-sip@example-112233445566.sip.signalwire.com")
  from: string;

  @doc("Destination address. Accepts E.164 (`+xxxxxxxxxxx`), SIP URI (`sip:` / `sips:`), Verto URI (`verto:`), client address (`client:`), or a fabric address. Required unless `to_script` is provided.")
  @example("sip:from-sip@example-112233445567.sip.signalwire.com")
  to?: string;

  @doc("Inline SWML document (JSON or YAML string), or an `http(s)://` URL that returns one, executed at the destination end. Useful for directing the call to a RelayBin / external SWML handler. When present, `to` may be omitted.")
  @example("https://example.com/destination.swml.json")
  to_script?: string | SWMLObject;

  @doc("Caller ID displayed to the destination. E.164 for PSTN; short caller-id token or SIP URI for SIP/Verto.")
  @example("+1234567890")
  caller_id?: string;

  @doc("Fallback URL that returns SWML if the primary `url` fails.")
  @example(CallFallbackURLExample)
  fallback_url?: string;

  @doc("HTTP or HTTPS URL that receives call lifecycle webhooks for events listed in `status_events`.")
  @example("https://example.com/status_callback")
  status_url?: url;

  @doc("Call lifecycle events that will be delivered to `status_url`.")
  @example(#["answered", "ended"])
  status_events?: (
    | "queued"
    | "initiated"
    | "ringing"
    | "answered"
    | "ending"
    | "ended")[] = #["ended"];

  @doc("HTTP method used when requesting the `url`. Defaults to `POST`.")
  @example("POST")
  url_method?: "GET" | "POST" = "POST";

  @doc("Codecs to offer on the outbound call. May be provided as an array or a comma-separated string. Allowed values: `PCMU`, `PCMA`, `G722`, `G729`, `OPUS`, `AMR-WB`, `VP8`, `H264`. For PSTN, `PCMU`/`PCMA` are widely supported. If the `to` value is a SIP URI containing `codecs=...`, those take precedence.")
  @example(#["OPUS", "G729", "VP8", "PCMA"])
  codecs?: string[] | string;

  @doc("Ring timeout in seconds. Must be between 1 and 600.")
  @example(30)
  @minValue(1)
  @maxValue(600)
  timeout?: int32;

  @doc("Maximum per-minute price (in dollars). If the computed billing route exceeds this value, the call is rejected.")
  @example(0.05)
  @minValue(0)
  max_price_per_minute?: float64;

  @doc("DTMF digits to send after the call is answered. Allowed characters: `0-9`, `A-D`, `*`, `#`, `w` (wait), `,` (pause).")
  @example("1234#")
  send_digits?: string;

  @doc("Preferred FreeSWITCH region(s) for call routing. Must be drawn from the project's available regions. Accepts a single region or a priority-ordered array.")
  @example(#["us-east-1", "us-west-2"])
  region?: string | string[];
}

@summary("dial (URL)")
model CallCreateParamsURL is CallCreateParamsBase {
  @doc("""
    The URL to handle the call. This parameter allows you to specify a webhook or different route in your code containing SWML instructions for handling the call.
    Either `url` or `swml` must be included for a new call.
    """)
  @example(CallSWMLURLExample)
  url: string;
}

@summary("dial (Inline SWML)")
model CallCreateParamsSWML is CallCreateParamsBase {
  @doc("Inline SWML object containing SWML instructions for handling the call. Either `url` or `swml` must be included for a new call.")
  swml: SWMLObject;
}

@summary("update")
model CallUpdateParamsBase {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("""
    The Fallback URL to handle the call.
    This parameter allows you to specify a backup webhook or different route in your code containing SWML instructions for handling the call.
    """)
  @example(CallFallbackURLExample)
  fallback_url?: string;

  @doc("Either `canceled` (to cancel a not yet connected call) or `completed` (to end a call that is in progress).")
  @example("canceled")
  status?: "canceled" | "completed";

  @doc("A URL to receive call status update callbacks.")
  @example("https://example.com/status_callback")
  status_url?: url;
}

@summary("update (Inline SWML)")
model CallUpdateParamsSWML is CallUpdateParamsBase {
  @doc("Inline SWML object containing SWML instructions for handling the call. Either `url` or `swml` must be included for a new call.")
  swml: SWMLObject;
}

@summary("update (URL)")
model CallUpdateParamsURL is CallUpdateParamsBase {
  @doc("""
    The URL to handle the call. This parameter allows you to specify a webhook or different route in your code containing SWML instructions for handling the call.
    Either `url` or `swml` must be included for a new call.
    """)
  @example(CallSWMLURLExample)
  url: string;
}

/**
 * Update a call in progress — cancel, complete, or redirect the SWML flow.
 *
 * State-transition rules:
 * - `status: canceled` is only valid while the leg is `queued` or `ringing`.
 * - `status: completed` is only valid while the leg is `answered` (or in-progress).
 * - Supplying `url` or `swml` (redirect) is only valid while the leg is `answered`.
 * - Calls in terminal states (`busy`, `failed`, `no-answer`, `canceled`, `completed`) cannot be updated.
 */
@summary("update")
model CallUpdateCurrentCallRequest {
  @doc(updateCommandDescription)
  @example("update")
  command: "update";

  @doc(paramsDescription)
  params: CallUpdateParamsAlias;
}

// ============================================
// Disconnect Command
// ============================================

@summary("calling.disconnect")
model CallDisconnectRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.disconnect` command is used to disconnect a call leg.")
  @example("calling.disconnect")
  command: "calling.disconnect";

  @doc(paramsDescription)
  params: {
    @doc("If `true`, the HTTP response returns immediately without waiting for the disconnect to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Play Commands
// ============================================


@doc("The type of media to play.")
enum PlayMediaType {
  @doc("Play an audio file from a URL.")
  audio,

  @doc("Play text-to-speech.")
  tts,

  @doc("Play silence for a specified duration.")
  silence,

  @doc("Play a ringtone by country code.")
  ringtone,
}

@doc("The direction of audio playback relative to the call participants.")
enum PlayDirection {
  @doc("Play audio only to the caller (listen direction).")
  listen,

  @doc("Play audio only to the called party (speak direction).")
  speak,

  @doc("Play audio to both parties.")
  both,
}

@doc("Text-to-speech voice gender.")
enum TtsGender {
  male,
  female,
}

@doc("Ringtone name. Two-letter country code selects a country-specific ringtone cadence.")
enum PlayRingtoneName {
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
  `in`,
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

@doc("Audio file playback parameters.")
model PlayAudioParams {
  @doc("HTTP or HTTPS URL of the audio file to play.")
  @example("https://example.com/audio.mp3")
  url: url;
}

@doc("Text-to-speech playback parameters.")
model PlayTtsParams {
  @doc("The text to speak.")
  @example("Hello from SignalWire.")
  text: string;

  @doc("BCP-47 language tag. Falls back to the request-level `language`, then `en-US`.")
  @example("en-US")
  language?: string;

  @doc("Voice gender. Falls back to the request-level `gender`, then `female`.")
  @example(TtsGender.female)
  gender?: TtsGender;

  @doc("Specific voice name (provider-dependent, 1-60 chars, no special characters except `.` and `-`). Falls back to the request-level `voice`, then to `gender`.")
  @example("en-US-Wavenet-C")
  voice?: string;
}

@doc("Silence playback parameters.")
model PlaySilenceParams {
  @doc("Duration of silence in seconds (must be positive).")
  @example(2.0)
  duration: float64;
}

@doc("Ringtone playback parameters.")
model PlayRingtoneParams {
  @doc("Country code identifying the ringtone cadence.")
  @example(PlayRingtoneName.us)
  name: PlayRingtoneName;

  @doc("Maximum ringtone duration in seconds. If omitted, the ringtone plays until stopped.")
  @example(10.0)
  duration?: float64;
}

@doc("A media item to play on the call. The shape of `params` is determined by `type`.")
@discriminator("type")
model PlayMediaItem {
  @doc("The type of media to play.")
  @example(PlayMediaType.audio)
  type: PlayMediaType;
}

@doc("Play an audio file from a URL.")
model PlayAudioItem extends PlayMediaItem {
  type: PlayMediaType.audio;

  @doc("Audio playback parameters.")
  @example(#{ url: "https://example.com/audio.mp3" })
  params: PlayAudioParams;
}

@doc("Play text-to-speech. Per-item `language`/`voice`/`gender` override the request-level fallbacks.")
model PlayTtsItem extends PlayMediaItem {
  type: PlayMediaType.tts;

  @doc("TTS parameters.")
  @example(#{ text: "Hello from SignalWire.", language: "en-US", gender: TtsGender.female })
  params: PlayTtsParams;
}

@doc("Play silence for a fixed duration.")
model PlaySilenceItem extends PlayMediaItem {
  type: PlayMediaType.silence;

  @doc("Silence parameters.")
  @example(#{ duration: 2.0 })
  params: PlaySilenceParams;
}

@doc("Play a country-coded ringtone cadence.")
model PlayRingtoneItem extends PlayMediaItem {
  type: PlayMediaType.ringtone;

  @doc("Ringtone parameters.")
  @example(#{ name: PlayRingtoneName.us, duration: 10.0 })
  params: PlayRingtoneParams;
}

/**
 * Play media (audio files, text-to-speech, silence, or ringtones) on an active call.
 *
 * The HTTP response confirms the command was accepted. Playback lifecycle
 * is delivered asynchronously via the `status_url` webhook, with payloads
 * of the form `{control_id, call_id, node_id, state}` where `state` is one
 * of `playing`, `paused`, `finished`, or `error`.
 */
@summary("calling.play")
model CallPlayRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.play` command is used to play media on an active call.")
  @example("calling.play")
  command: "calling.play";

  @doc(paramsDescription)
  params: {
    @doc("Unique identifier for this play operation, used to control it later. Must be unique per active play on this call.")
    @example("play-control-1")
    control_id: string;

    @doc("Ordered list of media items to play. Items play sequentially.")
    @example(#[#{ type: PlayMediaType.audio, params: #{ url: "https://example.com/audio.mp3" } }])
    play: (PlayAudioItem | PlayTtsItem | PlaySilenceItem | PlayRingtoneItem)[];

    @doc("Volume adjustment in dB. Must be between -40 and 40.")
    @example(0)
    @minValue(-40)
    @maxValue(40)
    volume?: float64 = 0;

    @doc("The direction of audio playback relative to the call participants.")
    @example(PlayDirection.listen)
    direction?: PlayDirection = PlayDirection.listen;

    @doc("Number of times the full `play` sequence is repeated. `0` loops forever; `N > 0` plays a total of N times.")
    @example(1)
    @minValue(0)
    loop?: int32 = 1;

    @doc("Default BCP-47 language tag applied to any TTS item that does not set its own `language`.")
    @example("en-US")
    language?: string = "en-US";

    @doc("Default voice applied to any TTS item that does not set its own `voice`. Defaults to the request-level `gender` when unset.")
    @example("en-US-Wavenet-C")
    voice?: string;

    @doc("Default voice gender applied to any TTS item that does not set its own `gender`.")
    @example(TtsGender.female)
    gender?: TtsGender = TtsGender.female;

    @doc("HTTP or HTTPS URL that receives playback lifecycle webhooks (`playing`, `paused`, `finished`, `error`).")
    @example("https://example.com/status_callback")
    status_url?: url;

    @doc("If `true`, the HTTP response returns immediately without waiting for playback to start.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.play.pause")
model CallPlayPauseRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.play.pause` command pauses an active play operation.")
  @example("calling.play.pause")
  command: "calling.play.pause";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the play operation to pause.")
    @example("play-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the pause to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.play.resume")
model CallPlayResumeRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.play.resume` command resumes a paused play operation.")
  @example("calling.play.resume")
  command: "calling.play.resume";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the play operation to resume.")
    @example("play-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the resume to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.play.stop")
model CallPlayStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.play.stop` command stops an active play operation.")
  @example("calling.play.stop")
  command: "calling.play.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the play operation to stop.")
    @example("play-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the stop to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.play.volume")
model CallPlayVolumeRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.play.volume` command adjusts the volume of an active play operation.")
  @example("calling.play.volume")
  command: "calling.play.volume";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the play operation to adjust.")
    @example("play-control-1")
    control_id: string;

    @doc("Volume adjustment in dB. Must be between -40 and 40.")
    @example(5)
    @minValue(-40)
    @maxValue(40)
    volume: float64;

    @doc("If `true`, the HTTP response returns immediately without waiting for the volume change to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Record Commands
// ============================================

@doc("Audio recording parameters.")
model RecordAudioParams {
  @doc("Whether to play a beep before recording starts.")
  @example(false)
  beep?: boolean = false;

  @doc("The audio format for the recording.")
  @example("mp3")
  format?: "mp3" | "wav" | "mp4" = "mp3";

  @doc("Whether to record in stereo (separate channels for each direction).")
  @example(false)
  stereo?: boolean = false;

  @doc("The direction of audio to record.")
  @example(PlayDirection.speak)
  direction?: PlayDirection = PlayDirection.speak;

  @doc("Maximum time in seconds to wait for initial speech before stopping.")
  @example(5)
  @minValue(0)
  initial_timeout?: float64 = 4.0;

  @doc("Time in seconds of silence after speech to stop recording.")
  @example(3)
  @minValue(0)
  end_silence_timeout?: float64 = 0.5;

  @doc("Maximum recording duration in seconds. Set to `0` for no limit.")
  @example(0)
  @minValue(0)
  max_length?: int32 = 0;

  @doc("DTMF digits that terminate the recording when pressed. Accepts `0-9`, `A-D` (case insensitive), `*`, and `#`.")
  @example("#")
  terminators?: string = "#";

  @doc("Input sensitivity for voice detection (0.0-100.0).")
  @example(50)
  @minValue(0)
  @maxValue(100)
  input_sensitivity?: float64 = 44.0;
}

@doc("Recording configuration wrapper. Currently only audio recording is supported.")
model RecordParams {
  @doc("Audio recording configuration parameters.")
  @example(#{ format: "mp3", direction: PlayDirection.speak, stereo: false })
  audio: RecordAudioParams;
}

@summary("calling.record")
@doc("""
  Starts recording an active call. The HTTP response returns the call leg — the recording URL
  is not included. Recording runs asynchronously; provide `status_url` to receive a webhook when
  the recording finishes (with the final URL), or query the call's events endpoint.
  """)
model CallRecordRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.record` command starts recording an active call.")
  @example("calling.record")
  command: "calling.record";

  @doc(paramsDescription)
  params: {
    @doc("Unique identifier for this record operation, used to control it later. Must be unique among active recordings on the call.")
    @example("record-control-1")
    control_id: string;

    @doc("Recording configuration. Wraps the media-type-specific parameters (currently only `audio`).")
    @example(#{ audio: #{ format: "mp3", direction: PlayDirection.speak, stereo: false } })
    record: RecordParams;

    @doc("If `true`, the request returns immediately without waiting for the recording to start. Defaults to `false`.")
    @example(true)
    async?: boolean = false;

    @doc("Webhook URL invoked with recording events — including a `finished` event that contains the final recording URL. Must begin with `http://` or `https://`.")
    @example("https://example.com/status_callback")
    status_url?: url;
  };
}

@summary("calling.record.pause")
model CallRecordPauseRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.record.pause` command pauses an active recording.")
  @example("calling.record.pause")
  command: "calling.record.pause";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the recording to pause.")
    @example("record-control-1")
    control_id: string;

    @doc("How the paused audio is handled. `skip` omits paused audio from the output file; `silence` replaces it with silence, preserving timing.")
    @example("skip")
    behavior?: "skip" | "silence" = "skip";

    @doc("If `true`, the request returns immediately. Defaults to `false`.")
    @example(true)
    async?: boolean = false;
  };
}

@summary("calling.record.resume")
model CallRecordResumeRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.record.resume` command resumes a paused recording.")
  @example("calling.record.resume")
  command: "calling.record.resume";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the recording to resume.")
    @example("record-control-1")
    control_id: string;

    @doc("If `true`, the request returns immediately. Defaults to `false`.")
    @example(true)
    async?: boolean = false;
  };
}

@summary("calling.record.stop")
model CallRecordStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.record.stop` command stops an active recording.")
  @example("calling.record.stop")
  command: "calling.record.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the recording to stop.")
    @example("record-control-1")
    control_id: string;

    @doc("If `true`, the request returns immediately. Defaults to `false`.")
    @example(true)
    async?: boolean = false;
  };
}

// ============================================
// Collect Commands
// ============================================

@doc("Speech recognition engine for `calling.collect`. Note: values are case-sensitive and differ from the SWML engine names.")
enum CollectSpeechEngine {
  Google: "Google",
  `Google.V2`: "Google.V2",
  Deepgram: "Deepgram",
}

@doc("Parameters for collecting DTMF digit input.")
model CollectDigitsParams {
  @doc("Maximum number of digits to collect. Must be positive.")
  @example(4)
  max: int32;

  @doc("DTMF digits that terminate input when pressed. Allowed: `0-9`, `A-D` (case insensitive), `*`, `#`. Empty string disables terminators.")
  @example("#")
  terminators?: string;

  @doc("Time in seconds to wait between digit presses. Must be positive. Defaults to the server-configured digit timeout when omitted.")
  @example(5)
  digit_timeout?: float64;
}

@doc("Parameters for collecting speech input.")
model CollectSpeechParams {
  @doc("Time in seconds of silence after speech to consider input complete. Must be positive.")
  @example(3)
  end_silence_timeout?: float64;

  @doc("Maximum time in seconds to wait for speech input. Must be positive.")
  @example(30)
  speech_timeout?: float64;

  @doc("Speech recognition language. Accepts a BCP-47 tag (e.g. `en-US`) or an `engine:tag` override (e.g. `Deepgram:en-US`) to pick a specific engine. Defaults to the server-configured ASR language when omitted.")
  @example("en-US")
  language?: string;

  @doc("Array of words or phrases to bias the speech recognition.")
  @example(#["yes", "no", "maybe"])
  hints?: string[];

  @doc("Provider-specific ASR model name (e.g. Deepgram `nova-3`). Freeform string; validation is performed by the selected engine.")
  @example("nova-3")
  `model`?: string;

  @doc("Speech recognition engine to use.")
  @example(CollectSpeechEngine.Deepgram)
  engine?: CollectSpeechEngine;
}

/**
 * Collect user input (DTMF digits, speech, or both) on an active call.
 *
 * At least one of `digits` or `speech` must be provided; requests missing
 * both return 400. Results are delivered asynchronously via the `status_url`
 * webhook. Digit events have the shape `{control_id, call_id, node_id, result: {type:"digit", params: {digits, terminator}}}`
 * and speech events `{..., result: {type:"speech", params: {text, confidence}}}`.
 *
 * When `start_input_timers` is `false`, the `initial_timeout` clock does not
 * start until you send `calling.collect.start_input_timers` for the same
 * `control_id`.
 */
@summary("calling.collect")
model CallCollectRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.collect` command collects user input (digits or speech) during a call.")
  @example("calling.collect")
  command: "calling.collect";

  @doc(paramsDescription)
  params: {
    @doc("Unique identifier for this collect operation, used to control it later. Must be unique per active collect on this call.")
    @example("collect-control-1")
    control_id: string;

    @doc("Maximum time in seconds to wait for initial input. Must be positive. Defaults to the server-configured no-input timeout when omitted.")
    @example(5)
    initial_timeout?: float64;

    @doc("Configuration for collecting DTMF digit input. Provide `digits`, `speech`, or both.")
    @example(#{ max: 4, terminators: "#" })
    digits?: CollectDigitsParams;

    @doc("Configuration for collecting speech input. Provide `digits`, `speech`, or both.")
    @example(#{ end_silence_timeout: 3, language: "en-US" })
    speech?: CollectSpeechParams;

    @doc("If `true`, the collect restarts after each result until `calling.collect.stop` is called. Continuous events include a `state` field indicating collect state.")
    @example(false)
    continuous?: boolean = false;

    @doc("If `true`, partial results are delivered as they are recognized, and events include a `final` field (`false` for partial, `true` for final).")
    @example(false)
    partial_results?: boolean = false;

    @doc("If `true`, a `start_of_input` webhook event is fired when input is first detected.")
    @example(false)
    send_start_of_input?: boolean = false;

    @doc("If `false`, the initial-timeout clock does not start until `calling.collect.start_input_timers` is called for this `control_id`.")
    @example(false)
    start_input_timers?: boolean = false;

    @doc("HTTP or HTTPS URL that receives collect result webhooks.")
    @example("https://example.com/collect_callback")
    status_url?: url;

    @doc("If `true`, the HTTP response returns immediately without waiting for the collect to be set up.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.collect.stop")
model CallCollectStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.collect.stop` command stops an active collect operation.")
  @example("calling.collect.stop")
  command: "calling.collect.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the collect operation to stop.")
    @example("collect-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the stop to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.collect.start_input_timers")
model CallCollectStartInputTimersRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.collect.start_input_timers` command starts input timers for an active collect operation.")
  @example("calling.collect.start_input_timers")
  command: "calling.collect.start_input_timers";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the collect operation to start input timers for.")
    @example("collect-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the timers to start.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Detect Commands
// ============================================

@doc("The type of detection to perform.")
enum DetectType {
  @doc("Detect answering machines vs. humans.")
  machine,

  @doc("Detect fax tones.")
  fax,

  @doc("Detect DTMF digits.")
  digit,
}

@doc("Answering-machine detection parameters. Applies only when `detect.type` is `machine`.")
model DetectMachineParams {
  @doc("Maximum time in seconds to wait for initial speech/voice.")
  @example(4.5)
  initial_timeout?: float64 = 4.5;

  @doc("Time in seconds of silence after voice ends to finalize the result.")
  @example(1.0)
  end_silence_timeout?: float64 = 1.0;

  @doc("Time in seconds to wait for the machine greeting to be ready. Defaults to `end_silence_timeout`.")
  @example(1.0)
  machine_ready_timeout?: float64;

  @doc("Voice duration threshold in seconds distinguishing machine from human.")
  @example(1.25)
  machine_voice_threshold?: float64 = 1.25;

  @doc("Word-count threshold distinguishing machine greetings from human speech.")
  @example(6)
  machine_words_threshold?: int32 = 6;

  @doc("If `true`, detect the caller interrupting during the machine greeting playback.")
  @example(false)
  detect_interruptions?: boolean = false;

  @doc("If `true`, detect when a machine message has finished.")
  @example(true)
  detect_message_end?: boolean = true;
}

@doc("Fax tone to detect.")
enum DetectFaxTone {
  CNG: "CNG",
  CED: "CED",
  cng: "cng",
  ced: "ced",
}

@doc("Fax-tone detection parameters. Applies only when `detect.type` is `fax`.")
model DetectFaxParams {
  @doc("The fax tone to detect. Omitted means either tone matches.")
  @example(DetectFaxTone.CNG)
  tone?: DetectFaxTone;
}

@doc("DTMF-digit detection parameters. Applies only when `detect.type` is `digit`.")
model DetectDigitParams {
  @doc("Set of DTMF digits to match. Allowed: `0-9`, `A-D` (case insensitive), `*`, `#`. Empty string matches any digit.")
  @example("0123456789#*")
  digits?: string;
}

@doc("Detection configuration. The shape of `params` depends on `type`.")
@discriminator("type")
model DetectConfig {
  @doc("The type of detection to perform.")
  @example(DetectType.machine)
  type: DetectType;
}

@doc("Answering-machine detection configuration.")
model DetectMachineConfig extends DetectConfig {
  type: DetectType.machine;

  @doc("Machine-detection parameters.")
  @example(#{ initial_timeout: 4.5, end_silence_timeout: 1.0 })
  params?: DetectMachineParams;
}

@doc("Fax-tone detection configuration.")
model DetectFaxConfig extends DetectConfig {
  type: DetectType.fax;

  @doc("Fax-detection parameters.")
  @example(#{ tone: DetectFaxTone.CNG })
  params?: DetectFaxParams;
}

@doc("DTMF-digit detection configuration.")
model DetectDigitConfig extends DetectConfig {
  type: DetectType.digit;

  @doc("Digit-detection parameters.")
  @example(#{ digits: "0123456789#*" })
  params?: DetectDigitParams;
}

/**
 * Start detection (answering machine, fax tone, or DTMF digits) on an active call.
 *
 * Detection runs asynchronously up to `timeout` seconds. Results are delivered
 * via the `status_url` webhook.
 */
@summary("calling.detect")
model CallDetectRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.detect` command starts detection (machine, fax, or digit) on an active call.")
  @example("calling.detect")
  command: "calling.detect";

  @doc(paramsDescription)
  params: {
    @doc("Unique identifier for this detect operation, used to control it later. Must be unique per active detect on this call.")
    @example("detect-control-1")
    control_id: string;

    @doc("Detection configuration specifying what to detect.")
    @example(#{ type: DetectType.machine })
    detect: DetectMachineConfig | DetectFaxConfig | DetectDigitConfig;

    @doc("Maximum time in seconds the detection may run before timing out.")
    @example(30)
    @minValue(0)
    timeout?: float64 = 30;

    @doc("HTTP or HTTPS URL that receives detection result webhooks.")
    @example("https://example.com/detect_callback")
    status_url?: url;

    @doc("If `true`, the HTTP response returns immediately without waiting for the detect to be set up.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.detect.stop")
model CallDetectStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.detect.stop` command stops an active detection operation.")
  @example("calling.detect.stop")
  command: "calling.detect.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the detect operation to stop.")
    @example("detect-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the stop to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Tap Commands
// ============================================

@doc("The type of tap device to stream audio to.")
enum TapDeviceType {
  @doc("Stream audio via RTP protocol.")
  rtp,

  @doc("Stream audio via WebSocket.")
  ws,
}

@doc("RTP/WebSocket audio codec. Case-sensitive; accepted in both upper and lower case.")
enum TapCodec {
  PCMA: "PCMA",
  PCMU: "PCMU",
  pcma: "pcma",
  pcmu: "pcmu",
  OPUS: "OPUS",
  opus: "opus",
}

@doc("RTP packetization time in milliseconds. Must be a multiple of 10 between 10 and 120.")
enum TapPtime {
  `10`: 10,
  `20`: 20,
  `30`: 30,
  `40`: 40,
  `50`: 50,
  `60`: 60,
  `70`: 70,
  `80`: 80,
  `90`: 90,
  `100`: 100,
  `110`: 110,
  `120`: 120,
}

@doc("Tap configuration — specifies what audio to capture.")
model TapConfig {
  @doc("Currently only `audio` is supported.")
  @example("audio")
  type: "audio";

  @doc("Audio tap parameters.")
  @example(#{ direction: PlayDirection.both })
  params: {
    @doc("The direction of audio to tap.")
    @example(PlayDirection.both)
    direction: PlayDirection;
  };
}

@doc("RTP tap target parameters.")
model TapRtpParams {
  @doc("Public IPv4 address of the RTP target. Private/reserved ranges are rejected.")
  @example("198.51.100.42")
  addr: string;

  @doc("UDP port of the RTP target (1-65535).")
  @example(5060)
  @minValue(1)
  @maxValue(65535)
  port: int32;

  @doc("Audio codec to request. Defaults to the call's negotiated codec.")
  @example(TapCodec.PCMU)
  codec?: TapCodec;

  @doc("Packetization time in milliseconds. Defaults to the call's negotiated ptime.")
  @example(TapPtime.`20`)
  ptime?: TapPtime;
}

@doc("WebSocket tap target parameters.")
model TapWsParams {
  @doc("WebSocket URI of the tap target. Must start with `ws://` or `wss://`.")
  @example("wss://example.com/tap")
  uri: string;

  @doc("Audio codec to request. Defaults to the call's negotiated codec.")
  @example(TapCodec.PCMU)
  codec?: TapCodec;
}

@doc("Tap device configuration — specifies where to stream captured audio.")
@discriminator("type")
model TapDevice {
  @doc("The type of tap device.")
  @example(TapDeviceType.rtp)
  type: TapDeviceType;
}

@doc("RTP tap device configuration.")
model TapDeviceRtp extends TapDevice {
  type: TapDeviceType.rtp;

  @doc("RTP connection parameters.")
  @example(#{ addr: "198.51.100.42", port: 5060 })
  params: TapRtpParams;
}

@doc("WebSocket tap device configuration.")
model TapDeviceWs extends TapDevice {
  type: TapDeviceType.ws;

  @doc("WebSocket connection parameters.")
  @example(#{ uri: "wss://example.com/tap" })
  params: TapWsParams;
}

/**
 * Capture audio from an active call and stream it to an external destination.
 *
 * Audio is streamed via RTP (to a public IP/port) or WebSocket (to a `ws://`/`wss://` URI).
 * Stop the tap with `calling.tap.stop` using the same `control_id`.
 */
@summary("calling.tap")
model CallTapRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.tap` command starts tapping (capturing audio) on an active call.")
  @example("calling.tap")
  command: "calling.tap";

  @doc(paramsDescription)
  params: {
    @doc("Unique identifier for this tap operation, used to control it later. Must be unique per active tap on this call.")
    @example("tap-control-1")
    control_id: string;

    @doc("Tap configuration specifying what audio to capture.")
    @example(#{ type: "audio", params: #{ direction: PlayDirection.both } })
    tap: TapConfig;

    @doc("Device configuration specifying where to stream captured audio.")
    @example(#{ type: TapDeviceType.rtp, params: #{ addr: "198.51.100.42", port: 5060 } })
    device: TapDeviceRtp | TapDeviceWs;

    @doc("HTTP or HTTPS URL that receives tap lifecycle webhooks.")
    @example("https://example.com/tap_callback")
    status_url?: url;

    @doc("If `true`, the HTTP response returns immediately without waiting for the tap to be set up.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.tap.stop")
model CallTapStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.tap.stop` command stops an active tap operation.")
  @example("calling.tap.stop")
  command: "calling.tap.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the tap operation to stop.")
    @example("tap-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the stop to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Stream Commands
// ============================================

@doc("The audio track to stream.")
enum StreamTrack {
  @doc("Stream the inbound (caller) audio track.")
  inbound_track,

  @doc("Stream the outbound (called party) audio track.")
  outbound_track,

  @doc("Stream both audio tracks.")
  both_tracks,
}

@doc("HTTP method used when invoking the `status_url` webhook.")
enum StreamStatusUrlMethod {
  GET,
  POST,
}

/**
 * Stream call audio to an external WebSocket endpoint.
 *
 * Audio is sent to a `wss://` URL; `custom_parameters` pass through to the
 * endpoint as connection metadata. Stream lifecycle webhooks are delivered to
 * `status_url` (default method `POST`). Stop the stream with
 * `calling.stream.stop` using the same `control_id`.
 */
@summary("calling.stream")
model CallStreamRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.stream` command starts streaming call audio to a WebSocket endpoint.")
  @example("calling.stream")
  command: "calling.stream";

  @doc(paramsDescription)
  params: {
    @doc("Unique identifier for this stream operation, used to control it later. Must be unique per active stream on this call.")
    @example("stream-control-1")
    control_id: string;

    @doc("WebSocket URL to stream audio to. Must start with `wss://` (TLS is required; plain `ws://` is rejected).")
    @example("wss://example.com/stream")
    @format("uri")
    url: string;

    @doc("Optional human-readable name to identify the stream at the endpoint.")
    @example("customer-support-recording")
    name?: string;

    @doc("Audio codec to request. Freeform; endpoint-specific. Common values include `PCMU`, `PCMA`, `OPUS`.")
    @example("PCMU")
    codec?: string;

    @doc("The audio track to stream.")
    @example(StreamTrack.inbound_track)
    track?: StreamTrack = StreamTrack.inbound_track;

    @doc("Bearer token included as `Authorization: Bearer <token>` when establishing the WebSocket connection.")
    @example("my-secret-token")
    authorization_bearer_token?: string;

    @doc("Arbitrary JSON object passed through to the WebSocket endpoint as connection metadata.")
    @example(#{ session_id: "abc123" })
    custom_parameters?: TypeSpec.Record<unknown>;

    @doc("HTTP or HTTPS URL that receives stream lifecycle webhooks.")
    @example("https://example.com/stream_callback")
    status_url?: url;

    @doc("HTTP method used for the `status_url` webhook.")
    @example(StreamStatusUrlMethod.POST)
    status_url_method?: StreamStatusUrlMethod = StreamStatusUrlMethod.POST;

    @doc("If `true`, the HTTP response returns immediately without waiting for the stream to be set up.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.stream.stop")
model CallStreamStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.stream.stop` command stops an active audio stream.")
  @example("calling.stream.stop")
  command: "calling.stream.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the stream operation to stop.")
    @example("stream-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the stop to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Denoise Commands
// ============================================

/**
 * Enable noise reduction on an active call. Denoise is per-call (no
 * `control_id`); a call has at most one active denoise filter. Use
 * `calling.denoise.stop` to disable it.
 */
@summary("calling.denoise")
model CallDenoiseRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.denoise` command enables noise reduction on an active call.")
  @example("calling.denoise")
  command: "calling.denoise";

  @doc(paramsDescription)
  params: {
    @doc("If `true`, the HTTP response returns immediately without waiting for the filter to be set up.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.denoise.stop")
model CallDenoiseStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.denoise.stop` command disables noise reduction on an active call.")
  @example("calling.denoise.stop")
  command: "calling.denoise.stop";

  @doc(paramsDescription)
  params: {
    @doc("If `true`, the HTTP response returns immediately without waiting for the filter to be torn down.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// AI Stop Command
// ============================================

@summary("calling.ai.stop")
model CallAIStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.ai.stop` command stops an active AI session on the call.")
  @example("calling.ai.stop")
  command: "calling.ai.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the AI session to stop.")
    @example("ai-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the stop to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Fax Stop Commands
// ============================================

@summary("calling.send_fax.stop")
model CallSendFaxStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.send_fax.stop` command stops an active fax send operation.")
  @example("calling.send_fax.stop")
  command: "calling.send_fax.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the fax send operation to stop.")
    @example("fax-send-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the stop to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.receive_fax.stop")
model CallReceiveFaxStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.receive_fax.stop` command stops an active fax receive operation.")
  @example("calling.receive_fax.stop")
  command: "calling.receive_fax.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the fax receive operation to stop.")
    @example("fax-receive-control-1")
    control_id: string;

    @doc("If `true`, the HTTP response returns immediately without waiting for the stop to take effect.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Refer (SIP) Command
// ============================================

@doc("SIP REFER device parameters.")
model ReferSipParams {
  @doc("SIP URI to refer the call to (must start with `sip:`).")
  @example("sip:destination@example.com")
  to: string;

  @doc("Optional SIP From URI (must start with `sip:` when provided).")
  @example("sip:operator@example.com")
  from?: string;

  @doc("Optional SIP authentication username.")
  @example("user")
  username?: string;

  @doc("Optional SIP authentication password.")
  @example("password")
  password?: string;
}

@doc("Device configuration for SIP REFER.")
model ReferDevice {
  @doc("The device type. Currently only 'sip' is supported.")
  @example("sip")
  type: "sip";

  @doc("SIP REFER parameters.")
  @example(#{ to: "sip:destination@example.com" })
  params: ReferSipParams;
}

@summary("calling.refer")
model CallReferRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.refer` command performs a SIP REFER on an active call.")
  @example("calling.refer")
  command: "calling.refer";

  @doc(paramsDescription)
  params: {
    @doc("The SIP device to refer the call to.")
    @example(#{ type: "sip", params: #{ to: "sip:destination@example.com" } })
    device: ReferDevice;

    @doc("HTTP or HTTPS URL that receives refer lifecycle webhooks.")
    @example("https://example.com/status_callback")
    status_url?: url;

    @doc("If `true`, the HTTP response returns immediately without waiting for the refer to be sent.")
    @example(false)
    async?: boolean = false;
  };
}

// ============================================
// Transfer and User Event Commands
// ============================================

@summary("calling.transfer")
model CallTransferRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.transfer` command is used to transfer an active call to a new destination.")
  @example("calling.transfer")
  command: "calling.transfer";

  @doc(paramsDescription)
  params: {
    @doc("The destination to transfer the call to. Can be a SIP URI, phone number, SWML URL, or an inline SWML object.")
    @example("sip:destination@example.com")
    dest: string | SWMLObject;

    @doc("If `true`, the HTTP response returns immediately without waiting for the transfer to complete.")
    @example(false)
    async?: boolean = false;
  };
}

@summary("calling.user_event")
model CallUserEventRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.user_event` command is used to fire a custom user event on the call.")
  @example("calling.user_event")
  command: "calling.user_event";

  @doc(paramsDescription)
  params: {
    @doc("Arbitrary JSON event data to fire on the call.")
    @example(#{ action: "custom_action", data: "example" })
    event: TypeSpec.Record<unknown>;

    @doc("If `true`, the HTTP response returns immediately without waiting for the event to fire.")
    @example(false)
    async?: boolean = false;
  };
}

@discriminated(#{ discriminatorPropertyName: "command", envelope: "none" })
@doc("""
  Call request union for JSON-RPC style method dispatch. Use the `command` field to specify which call method to invoke.
  All async-safe RELAY methods can be sent through this endpoint without a WebSocket connection.
  """)
union CallRequest {
  dial: CallCreateRequest,
  update: CallUpdateCurrentCallRequest,
  `calling.end`: CallHangupRequest,
  `calling.disconnect`: CallDisconnectRequest,
  `calling.ai_hold`: CallHoldRequest,
  `calling.ai_unhold`: CallUnholdRequest,
  `calling.ai_message`: CallAIMessageRequest,
  `calling.ai.stop`: CallAIStopRequest,
  `calling.play`: CallPlayRequest,
  `calling.play.pause`: CallPlayPauseRequest,
  `calling.play.resume`: CallPlayResumeRequest,
  `calling.play.stop`: CallPlayStopRequest,
  `calling.play.volume`: CallPlayVolumeRequest,
  `calling.record`: CallRecordRequest,
  `calling.record.pause`: CallRecordPauseRequest,
  `calling.record.resume`: CallRecordResumeRequest,
  `calling.record.stop`: CallRecordStopRequest,
  `calling.collect`: CallCollectRequest,
  `calling.collect.stop`: CallCollectStopRequest,
  `calling.collect.start_input_timers`: CallCollectStartInputTimersRequest,
  `calling.detect`: CallDetectRequest,
  `calling.detect.stop`: CallDetectStopRequest,
  `calling.tap`: CallTapRequest,
  `calling.tap.stop`: CallTapStopRequest,
  `calling.stream`: CallStreamRequest,
  `calling.stream.stop`: CallStreamStopRequest,
  `calling.denoise`: CallDenoiseRequest,
  `calling.denoise.stop`: CallDenoiseStopRequest,
  `calling.live_transcribe`: CallLiveTranscribeRequest,
  `calling.live_translate`: CallLiveTranslateRequest,
  `calling.transfer`: CallTransferRequest,
  `calling.send_fax.stop`: CallSendFaxStopRequest,
  `calling.receive_fax.stop`: CallReceiveFaxStopRequest,
  `calling.refer`: CallReferRequest,
  `calling.user_event`: CallUserEventRequest,
}
