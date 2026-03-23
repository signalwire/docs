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
    @doc("The duration to hold the caller in seconds.")
    @example(300)
    @minValue(1)
    @maxValue(300)
    timeout?: int32 = 300;

    @doc("""
      A system message added to the AI conversation before placing the caller on hold.
      The AI will speak this message to the caller before hold music begins.
      """)
    @example("Please hold while I transfer you to a specialist.")
    prompt?: string = "Tell the user you are putting them on hold.";
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
    @doc("""
      A system message added to the AI conversation when taking the caller off hold.
      The AI will use this context when resuming the conversation.
      """)
    @example("The user has been connected to a specialist.")
    prompt?: string = "The user has been taken off hold.";
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
      The role that the message is from. Required when `reset` is not provided. Each role type has a different purpose and will influence how the AI will interpret the message.
      - `system`: Inject instructions or context that modify the AI's behavior mid-conversation without the caller hearing it. This could change the AI's personality, add new constraints, provide context about the conversation, or give the AI information it should know going forward.
      - `user`: Inject a message as if the caller said it. This would appear in the conversation history as coming from the caller, and the AI would respond to it as if the caller just spoke it.
      - `assistant`: Inject a message as if the AI said it. This would appear as an AI response in the conversation history. The AI would treat this as its own previous response when generating future replies.
      """)
    @example("system")
    role?: "system" | "user" | "assistant";

    @doc("""
      The text content that will be sent to the AI. Required when `reset` is not provided.
      """)
    @example("You are now in expert mode. Provide detailed technical responses.")
    message_text?: string;

    @doc("Parameters for resetting the AI conversation state. When provided, `role` and `message_text` are optional.")
    @example(#{
      full_reset: true,
      system_prompt: "You are a helpful assistant.",
    })
    reset?: CallAIMessageResetParams;

    @doc("Arbitrary JSON data to merge into the AI session's global data store.")
    @example(#{ customer_tier: "premium", language: "en" })
    global_data?: TypeSpec.Record<unknown>;
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

    @doc("A URL to receive status update callbacks for the translation session.")
    @example("https://example.com/status_callback")
    status_url?: url;
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
  @doc("The address that initiated the call. Can be either a E.164 formatted number (`+xxxxxxxxxxx`), or a SIP endpoint (`sip:xxx@yyy.zzz`).")
  @example("sip:from-sip@example-112233445566.sip.signalwire.com")
  from: string;

  @doc("The address that received the call. Can be either a E.164 formatted number (`+xxxxxxxxxxx`), or a SIP endpoint (`sip:xxx@yyy.zzz`).")
  @example("sip:from-sip@example-112233445567.sip.signalwire.com")
  to: string;

  @doc("The number, in E.164 format, or identifier of the caller.")
  @example("+1234567890")
  caller_id?: string;

  @doc("The Fallback URL to handle the call. This parameter allows you to specify a backup webhook or different route in your code containing SWML instructions for handling the call.")
  @example(CallFallbackURLExample)
  fallback_url?: string;

  @doc("A URL that will recieve status updates of the current call. Any call events defined in `status_events` will be delivered to the defined URL.")
  @example("https://example.com/status_callback")
  status_url?: url;

  @doc("The call events that will be monitored and sent to the `status_url` when active.")
  @example(#["answered", "ended"])
  status_events?: (
    | "answered"
    | "queued"
    | "initiated"
    | "ringing"
    | "ending"
    | "ended")[] = #["ended"];

  @doc("The HTTP method to use when requesting the URL.")
  @example("POST")
  url_method?: string = "POST";
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
  params: {};
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

  @doc("Play a ringing tone.")
  ring,
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

@doc("A media item to play on the call.")
model PlayMediaItem {
  @doc("The type of media to play.")
  @example(PlayMediaType.audio)
  type: PlayMediaType;

  @doc("Type-specific parameters for the media item.")
  @example(#{ url: "https://example.com/audio.mp3" })
  params?: TypeSpec.Record<unknown>;
}

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
    @doc("Unique identifier for this play operation, used to control it later.")
    @example("play-control-1")
    control_id?: string;

    @doc("Array of media objects to play.")
    @example(#[#{ type: PlayMediaType.audio, params: #{ url: "https://example.com/audio.mp3" } }])
    play: PlayMediaItem[];

    @doc("Volume adjustment in dB (-40 to 40).")
    @example(0)
    @minValue(-40)
    @maxValue(40)
    volume?: float64 = 0;

    @doc("The direction of audio playback.")
    @example(PlayDirection.both)
    direction?: PlayDirection = PlayDirection.both;

    @doc("Number of times to loop playback. 0 for infinite loop.")
    @example(1)
    loop?: int32;

    @doc("A URL to receive status update callbacks for the play operation.")
    @example("https://example.com/status_callback")
    status_url?: url;
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

    @doc("Volume adjustment in dB (-40 to 40).")
    @example(5)
    @minValue(-40)
    @maxValue(40)
    volume: float64;
  };
}

// ============================================
// Record Commands
// ============================================

@doc("The audio format for recording.")
enum RecordFormat {
  @doc("MP3 audio format.")
  mp3,

  @doc("WAV audio format.")
  wav,
}

@doc("Audio recording parameters.")
model RecordAudioParams {
  @doc("Whether to play a beep before recording starts.")
  @example(false)
  beep?: boolean = false;

  @doc("The audio format for the recording.")
  @example(RecordFormat.mp3)
  format?: RecordFormat = RecordFormat.mp3;

  @doc("Whether to record in stereo (separate channels for each direction).")
  @example(false)
  stereo?: boolean = false;

  @doc("The direction of audio to record.")
  @example(PlayDirection.both)
  direction?: PlayDirection = PlayDirection.both;

  @doc("Maximum time in seconds to wait for speech before stopping.")
  @example(5)
  initial_timeout?: float64;

  @doc("Time in seconds of silence after speech to stop recording.")
  @example(3)
  end_silence_timeout?: float64;

  @doc("DTMF digits that will stop the recording when pressed.")
  @example("#*")
  terminators?: string;

  @doc("Input sensitivity for voice detection (0-100).")
  @example(50)
  @minValue(0)
  @maxValue(100)
  input_sensitivity?: float64;
}

@summary("calling.record")
model CallRecordRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.record` command starts recording an active call.")
  @example("calling.record")
  command: "calling.record";

  @doc(paramsDescription)
  params: {
    @doc("Unique identifier for this record operation, used to control it later.")
    @example("record-control-1")
    control_id?: string;

    @doc("Audio recording configuration parameters.")
    @example(#{ format: RecordFormat.mp3, direction: PlayDirection.both, stereo: false })
    audio?: RecordAudioParams;

    @doc("A URL to receive status update callbacks for the record operation.")
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
  };
}

// ============================================
// Collect Commands
// ============================================

@doc("Parameters for collecting DTMF digit input.")
model CollectDigitsParams {
  @doc("Maximum number of digits to collect.")
  @example(4)
  max?: int32;

  @doc("DTMF digits that signal the end of input.")
  @example("#")
  terminators?: string;

  @doc("Time in seconds to wait between digit presses.")
  @example(5)
  digit_timeout?: float64;
}

@doc("Parameters for collecting speech input.")
model CollectSpeechParams {
  @doc("Time in seconds of silence after speech to consider input complete.")
  @example(3)
  end_silence_timeout?: float64;

  @doc("Maximum time in seconds to wait for speech input.")
  @example(30)
  speech_timeout?: float64;

  @doc("The language for speech recognition (e.g., 'en-US').")
  @example("en-US")
  language?: string;

  @doc("Array of words or phrases to bias the speech recognition.")
  @example(#["yes", "no", "maybe"])
  hints?: string[];

  @doc("The speech recognition engine to use.")
  @example("default")
  engine?: string;
}

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
    @doc("Unique identifier for this collect operation, used to control it later.")
    @example("collect-control-1")
    control_id?: string;

    @doc("Maximum time in seconds to wait for initial input.")
    @example(5)
    initial_timeout?: float64;

    @doc("Configuration for collecting DTMF digit input.")
    @example(#{ max: 4, terminators: "#" })
    digits?: CollectDigitsParams;

    @doc("Configuration for collecting speech input.")
    @example(#{ end_silence_timeout: 3, language: "en-US" })
    speech?: CollectSpeechParams;

    @doc("Whether to continuously collect input (restart after each result).")
    @example(false)
    continuous?: boolean;

    @doc("Whether to send partial results as speech is recognized.")
    @example(false)
    partial_results?: boolean;
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

@doc("Parameters for call detection configuration.")
model DetectParams {
  @doc("Maximum time in seconds to wait for initial detection.")
  @example(5)
  initial_timeout?: float64;

  @doc("Time in seconds of silence after detection to finalize the result.")
  @example(3)
  end_silence_timeout?: float64;

  @doc("Time in seconds to wait for the machine to be ready (machine detection only).")
  @example(5)
  machine_ready_timeout?: float64;

  @doc("Voice duration threshold in seconds for machine vs. human detection.")
  @example(1.25)
  machine_voice_threshold?: float64;

  @doc("Number of words threshold for machine vs. human detection.")
  @example(6)
  machine_words_threshold?: int32;

  @doc("Whether to detect interruptions during machine greeting playback.")
  @example(false)
  detect_interruptions?: boolean;

  @doc("Whether to detect the end of a machine message.")
  @example(false)
  detect_message_end?: boolean;

  @doc("The DTMF tone to detect (digit detection only).")
  @example("1")
  tone?: string;

  @doc("The DTMF digits to detect (digit detection only).")
  @example("0123456789#*")
  digits?: string;
}

@doc("Detection configuration specifying what to detect and how.")
model DetectConfig {
  @doc("The type of detection to perform.")
  @example(DetectType.machine)
  type: DetectType;

  @doc("Type-specific detection parameters.")
  @example(#{ initial_timeout: 5, end_silence_timeout: 3 })
  params?: DetectParams;
}

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
    @doc("Unique identifier for this detect operation, used to control it later.")
    @example("detect-control-1")
    control_id?: string;

    @doc("Detection configuration specifying what to detect.")
    @example(#{ type: DetectType.machine })
    detect: DetectConfig;

    @doc("Maximum time in seconds to run the detection.")
    @example(30)
    timeout?: float64;
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

@doc("Tap configuration specifying what audio to capture.")
model TapConfig {
  @doc("The type of media to tap. Currently only 'audio' is supported.")
  @example("audio")
  type: "audio";

  @doc("Tap parameters including audio direction.")
  @example(#{ direction: PlayDirection.both })
  params?: {
    @doc("The direction of audio to tap.")
    @example(PlayDirection.both)
    direction?: PlayDirection;
  };
}

@doc("Parameters for the tap device connection.")
model TapDeviceParams {
  @doc("The IP address or hostname of the device (RTP).")
  @example("192.168.1.100")
  addr?: string;

  @doc("The port number of the device (RTP).")
  @example(5060)
  port?: int32;

  @doc("The audio codec to use.")
  @example("PCMU")
  codec?: string;

  @doc("The packetization time in milliseconds.")
  @example(20)
  ptime?: int32;

  @doc("The WebSocket URI to stream audio to (WS).")
  @example("wss://example.com/tap")
  uri?: string;

  @doc("The audio sample rate in Hz.")
  @example(8000)
  rate?: int32;
}

@doc("Tap device configuration specifying where to stream captured audio.")
model TapDevice {
  @doc("The type of tap device.")
  @example(TapDeviceType.rtp)
  type: TapDeviceType;

  @doc("Device-specific connection parameters.")
  @example(#{ addr: "192.168.1.100", port: 5060 })
  params?: TapDeviceParams;
}

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
    @doc("Unique identifier for this tap operation, used to control it later.")
    @example("tap-control-1")
    control_id?: string;

    @doc("Tap configuration specifying what audio to capture.")
    @example(#{ type: "audio", params: #{ direction: PlayDirection.both } })
    tap: TapConfig;

    @doc("Device configuration specifying where to stream captured audio.")
    @example(#{ type: TapDeviceType.rtp, params: #{ addr: "192.168.1.100", port: 5060 } })
    device: TapDevice;
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
    @doc("Unique identifier for this stream operation, used to control it later.")
    @example("stream-control-1")
    control_id?: string;

    @doc("The WebSocket URL to stream audio to.")
    @example("wss://example.com/stream")
    @format("uri")
    url: string;

    @doc("The audio codec to use for streaming.")
    @example("PCMU")
    codec?: string;

    @doc("The audio track to stream.")
    @example(StreamTrack.both_tracks)
    track?: StreamTrack;

    @doc("Bearer token for WebSocket authentication.")
    @example("my-secret-token")
    authorization_bearer_token?: string;

    @doc("Custom parameters to include in the WebSocket connection.")
    @example(#{ session_id: "abc123" })
    custom_parameters?: TypeSpec.Record<unknown>;
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
  };
}

// ============================================
// Denoise Commands
// ============================================

@summary("calling.denoise")
model CallDenoiseRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.denoise` command enables noise reduction on an active call.")
  @example("calling.denoise")
  command: "calling.denoise";

  @doc(paramsDescription)
  params: {};
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
  params: {};
}

// ============================================
// Transcribe Commands (distinct from Live Transcribe)
// ============================================

@summary("calling.transcribe")
model CallTranscribeRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.transcribe` command starts transcription on an active call.")
  @example("calling.transcribe")
  command: "calling.transcribe";

  @doc(paramsDescription)
  params: {
    @doc("Unique identifier for this transcribe operation, used to control it later.")
    @example("transcribe-control-1")
    control_id?: string;

    @doc("A URL to receive status update callbacks for the transcription.")
    @example("https://example.com/status_callback")
    status_url?: url;
  };
}

@summary("calling.transcribe.stop")
model CallTranscribeStopRequest {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: uuid;

  @doc("The `calling.transcribe.stop` command stops an active transcription.")
  @example("calling.transcribe.stop")
  command: "calling.transcribe.stop";

  @doc(paramsDescription)
  params: {
    @doc("The control ID of the transcription to stop.")
    @example("transcribe-control-1")
    control_id: string;
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
  };
}

// ============================================
// Refer (SIP) Command
// ============================================

@doc("SIP REFER device parameters.")
model ReferSipParams {
  @doc("The SIP URI to refer the call to.")
  @example("sip:destination@example.com")
  to: string;

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

    @doc("A URL to receive status update callbacks for the refer operation.")
    @example("https://example.com/status_callback")
    status_url?: url;
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
    @doc("The destination to transfer the call to. Can be a SIP URI, phone number, or an inline SWML object.")
    @example("sip:destination@example.com")
    dest: string | SWMLObject;
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
  `calling.transcribe`: CallTranscribeRequest,
  `calling.transcribe.stop`: CallTranscribeStopRequest,
  `calling.live_transcribe`: CallLiveTranscribeRequest,
  `calling.live_translate`: CallLiveTranslateRequest,
  `calling.transfer`: CallTransferRequest,
  `calling.send_fax.stop`: CallSendFaxStopRequest,
  `calling.receive_fax.stop`: CallReceiveFaxStopRequest,
  `calling.refer`: CallReferRequest,
  `calling.user_event`: CallUserEventRequest,
}
