import "@typespec/http";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

const CallSWMLExample = "{'version': '1.0.0', 'sections': { 'main': [{ 'answer': { 'max_duration': 60 }},{ 'play': { 'urls': ['silence:2', 'say:Hello from SignalWire!']}}]}}";

const CallFallbackURLExample = "https://example.com/fallback";

const CallSWMLURLExample = "https://example.com/swml";

const CallIdExample = "3fa85f64-5717-4562-b3fc-2c963f66afa6";

const updateCommandDescription = "The `update` command is used to update a existing call with a new dialplan.";

const uuidDescription = "The unique identifying ID of a existing call.";

const paramsDescription = "An object of parameters that will be utilized by the active command.";

alias CallCreateParamsAlias = CallCreateParamsURL | CallCreateParamsSWML;

alias CallUpdateParamsAlias = CallUpdateParamsURL | CallUpdateParamsSWML;

@summary("Hangup call")
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
    @example("hangup")
    reason?: "hangup" | "busy";
  };
}
@summary("Hold call")
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

@summary("Unhold call")
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

@summary("Inject AI message")
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
      The role that the message is from. Each role type has a different purpose and will influence how the AI will interpret the message.
      - `system`: Inject instructions or context that modify the AI's behavior mid-conversation without the caller hearing it. This could change the AI's personality, add new constraints, provide context about the conversation, or give the AI information it should know going forward.
      - `user`: Inject a message as if the caller said it. This would appear in the conversation history as coming from the caller, and the AI would respond to it as if the caller just spoke it.
      - `assistant`: Inject a message as if the AI said it. This would appear as an AI response in the conversation history. The AI would treat this as its own previous response when generating future replies.
      """)
    @example("system")
    role: "system" | "user" | "assistant";

    @doc("""
      The text content that will be sent to the AI.
      """)
    @example("You are now in expert mode. Provide detailed technical responses.")
    message_text: string;
  };
}

// ============================================
// Live Transcribe Commands
// ============================================

alias TranscribeDirection = "local-caller" | "remote-caller";
alias SpeechEngine = "deepgram" | "google";
alias SupportedAIModels = "gpt-4o-mini" | "gpt-4.1-mini" | "gpt-4.1-nano";

@summary("Start")
model LiveTranscribeStartAction {
  @doc("Starts live transcription of the call.")
  start: {
    @doc("The language to transcribe (e.g., 'en-US', 'es-ES').")
    @example("en-US")
    lang: string;

    @doc("The direction(s) of the call to transcribe.")
    @example(#["local-caller", "remote-caller"])
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
    @example("deepgram")
    speech_engine?: SpeechEngine = "deepgram";

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

@summary("Summarize")
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

@summary("Stop")
@doc("Stops the live transcription session.")
enum LiveTranscribeStopAction {
  stop,
}

alias LiveTranscribeAction = LiveTranscribeStartAction | LiveTranscribeSummarizeAction | LiveTranscribeStopAction;

@summary("Live Transcribe")
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

@summary("Filter Presets")
@doc("""
Preset translation filter values that adjust the tone or style of translated speech.

- `polite` - Translates to a polite version, removing anything insulting while maintaining sentiment
- `rude` - Translates to a rude and insulting version while maintaining sentiment
- `professional` - Translates to sound professional, removing slang or lingo
- `shakespeare` - Translates to sound like Shakespeare, speaking in iambic pentameter
- `gen-z` - Translates to use Gen-Z slang and expressions
""")
enum TranslationFilterPreset {
  polite,
  rude,
  professional,
  shakespeare,
  `gen-z`,
}

@summary("Custom Filter")
@doc("Custom translation filter with a prompt prefix. Use `prompt:` followed by your custom instructions (e.g., `prompt:Use formal business language`).")
@pattern("^prompt:.+$")
scalar CustomTranslationFilter extends string;

alias TranslationFilter = TranslationFilterPreset | CustomTranslationFilter;

@summary("Start")
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
    @example(#["local-caller", "remote-caller"])
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
    @example("deepgram")
    speech_engine?: SpeechEngine = "deepgram";

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

@summary("Summarize")
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

@summary("Inject")
model LiveTranslateInjectAction {
  @doc("Inject a message into the conversation to be translated and spoken.")
  inject: {
    @doc("The text message to inject and translate.")
    @example("Please hold while I transfer you to a specialist.")
    message: string;

    @doc("The direction to send the translated message.")
    @example("remote-caller")
    direction: TranscribeDirection;
  };
}

@summary("Stop")
@doc("Stops the live translation session.")
enum LiveTranslateStopAction {
  stop,
}

alias LiveTranslateAction = LiveTranslateStartAction | LiveTranslateSummarizeAction | LiveTranslateInjectAction | LiveTranslateStopAction;

@summary("Live Translate")
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
  };
}

@summary("Create call")
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
    | "ended")[];
}

@summary("Create call (URL)")
model CallCreateParamsURL is CallCreateParamsBase {
  @doc("""
    The URL to handle the call. This parameter allows you to specify a webhook or different route in your code containing SWML instructions for handling the call.
    Either `url` or `swml` must be included for a new call.
    """)
  @example(CallSWMLURLExample)
  url: string;
}

@summary("Create call (SWML)")
model CallCreateParamsSWML is CallCreateParamsBase {
  @doc("Inline SWML, passed as a string, containing SWML instructions for handling the call. Either `url` or `swml` must be included for a new call.")
  @example(CallSWMLExample)
  swml: string;
}

@summary("Update call")
model CallUpdateParamsBase {
  @doc(uuidDescription)
  @example(CallIdExample)
  id: string;

  @doc("""
    The Fallback URL to handle the call. 
    This parameter allows you to specify a backup webhook or different route in your code containing SWML instructions for handling the call.
    """)
  @example(CallFallbackURLExample)
  fallback_url?: string;

  @doc("Either `canceled` (to cancel a not yet connected call) or `completed` (to end a call that is in progress).")
  @example("canceled")
  status?: "canceled" | "completed";
}

@summary("Update call (SWML)")
model CallUpdateParamsSWML is CallUpdateParamsBase {
  @doc("Inline SWML, passed as a string, containing SWML instructions for handling the call. Either `url` or `swml` must be included for a new call.")
  @example(CallSWMLExample)
  swml: string;
}

@summary("Update call (URL)")
model CallUpdateParamsURL is CallUpdateParamsBase {
  @doc("""
    The URL to handle the call. This parameter allows you to specify a webhook or different route in your code containing SWML instructions for handling the call.
    Either `url` or `swml` must be included for a new call.
    """)
  @example(CallSWMLURLExample)
  url: string;
}

@summary("Update call")
model CallUpdateCurrentCallRequest {
  @doc(updateCommandDescription)
  @example("update")
  command: "update";

  @doc(paramsDescription)
  params: CallUpdateParamsAlias;
}

@discriminated(#{discriminatorPropertyName: "command", envelope: "none"})
@doc("""
Call request union for JSON-RPC style method dispatch. Use the `command` field to specify which call method to invoke:

- **`dial`** - Create and initiate a new outbound call to a destination. Returns immediately with call details while the call is being established in the background.

- **`update`** - Modify an active call's properties in real-time. Update call parameters such as routing, recording settings, or other call-specific configurations.

- **`calling.end`** - Terminate an active call immediately. Disconnects all parties and ends the call session. Cannot be reversed once executed.

- **`calling.ai_hold`** - Place an AI-powered call on hold. Pauses the AI conversation and typically plays hold music or a message to the caller. The AI agent becomes inactive until unhold.

- **`calling.ai_unhold`** - Resume an AI call from hold state. Reactivates the AI agent and continues the conversation from where it was paused.

- **`calling.ai_message`** - Inject a message into an active AI conversation. Allows you to dynamically add context, instructions, or system messages to guide the AI agent's behavior during the call.

- **`calling.live_transcribe`** - Control live transcription on an active call. Start real-time speech-to-text transcription, stop transcription, or request an on-demand AI summary of the conversation.

- **`calling.live_translate`** - Control live translation on an active call. Start real-time language translation between call participants, stop translation, request summaries, or inject messages to be translated and spoken.
""")
union CallRequest {
  dial: CallCreateRequest,
  update: CallUpdateCurrentCallRequest,
  `calling.end`: CallHangupRequest,
  `calling.ai_hold`: CallHoldRequest,
  `calling.ai_unhold`: CallUnholdRequest,
  `calling.ai_message`: CallAIMessageRequest,
  `calling.live_transcribe`: CallLiveTranscribeRequest,
  `calling.live_translate`: CallLiveTranslateRequest,
}
