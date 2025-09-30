import "@typespec/json-schema";

using TypeSpec.JsonSchema;

alias SupportedAIModels = "gpt-4o-mini" | "gpt-4.1-mini" | "gpt-4.1-nano";

@minValue(10000)
@maxValue(600000)
scalar AttentionTimeout extends integer;

@summary("Direction enum")
enum Direction {
  @doc("Sets the direction of the call to `inbound` for the assistant.")
  inbound,

  @doc("Sets the direction of the call to `outbound` for the assistant.")
  outbound,
}

@summary("params object")
model AIParams {
  @doc("Instructs the agent to acknowledge crosstalk and confirm user input when the user speaks over the agent.")
  acknowledge_interruptions?: boolean | SWMLVar;

  @doc("The model to use for the AI. Allowed values are `gpt-4o-mini`, `gpt-4.1-mini`, and `gpt-4.1-nano`.")
  ai_model?: SupportedAIModels;

  @doc("Adjust the volume of the AI. Allowed values from `-50` - `50`.")
  @minValue(-50)
  @maxValue(50)
  ai_volume?: integer | SWMLVar;

  @doc("""
    If true, enables smart formatting in ASR (Automatic Speech Recognition).
    This improves the formatting of numbers, dates, times, and other entities in the transcript.
    **Default:** `false`
    """)
  asr_smart_format?: boolean | SWMLVar;

  @doc("Amount of time, in ms, to wait before prompting the user to respond. Allowed values from `10,000` - `600,000`. Set to `0` to disable. **Default:** `5000` ms.")
  attention_timeout?: AttentionTimeout | 0 | SWMLVar;

  @doc("A custom prompt that is fed into the AI when the attention_timeout is reached.")
  attention_timeout_prompt?: string;

  @doc("""
    If true, enables speaker diarization in ASR (Automatic Speech Recognition).
    This will break up the transcript into chunks, with each chunk containing a unique identity (e.g speaker1, speaker2, etc.)
    and the text they spoke.
    **Default:** `false`
    """)
  asr_diarize?: boolean | SWMLVar;

  @doc("""
    If true, will force the AI Agent to only respond to the speaker who reesponds to the AI Agent first.
    Any other speaker will be ignored.
    **Default:** `false`
    """)
  asr_speaker_affinity?: boolean | SWMLVar;

  @doc("If `true`, the AI will announce the function that is being executed on the call. The default is `false`.")
  audible_debug?: boolean | SWMLVar;

  @doc("If `true`, the AI will announce latency information during the call. Useful for debugging. The default is `false`.")
  audible_latency?: boolean | SWMLVar;

  @doc("URL of audio file to play in the background while AI plays in foreground.")
  background_file?: url;

  @doc("Maximum number of times to loop playing the background file. `undefined` means loop indefinitely.")
  background_file_loops?: integer | null | SWMLVar;

  @doc("Defines background_file volume within a range of `-50` to `50`.")
  @minValue(-50)
  @maxValue(50)
  background_file_volume?: integer | SWMLVar;

  @doc("""
    Controls the barge behavior. Allowed values are `"complete"`, `"partial"`, `"all"`, or boolean.
    **Default:** `"complete,partial"`
    """)
  enable_barge?: string | boolean | SWMLVar;

  @doc("""
    Takes a string, including a regular expression, defining barge behavior.
    For example, this param can direct the AI to stop when the word 'hippopotomus' is input.
    """)
  barge_match_string?: string;

  @doc("Defines the number of words that must be input before triggering barge behavior, in a range of `1-99`.")
  @minValue(1)
  @maxValue(99)
  barge_min_words?: integer | SWMLVar;

  @doc("If `true`, allows functions to be executed while the AI is being interrupted. The default is `true`.")
  barge_functions?: boolean | SWMLVar;

  @doc("If `true`, enables response caching for improved performance. The default is `false`.")
  cache_mode?: boolean | SWMLVar;

  @doc("Sets the prompt which binds the agent to its purpose.")
  conscience?: string;

  @doc("Used by `check_for_input` and `save_conversation` to identify an individual conversation.")
  conversation_id?: string;

  @doc("Sets the size of the sliding window for conversation history. This limits how much conversation history is sent to the AI model.")
  conversation_sliding_window?: integer | SWMLVar;

  @doc("Enables debugging to the set URL. Allowed values from `0` - `2`. Default is `1` if url is set.")
  @minValue(0)
  @maxValue(2)
  debug_webhook_level?: integer | SWMLVar;

  @doc("Each interaction between the AI and end user is posted in real time to the established URL.")
  debug_webhook_url?: url;

  @doc("Forces the direction of the call to the assistant. Valid values are `inbound` and `outbound`.")
  direction?: Direction | SWMLVar;

  @doc("DTMF digit, as a string, to signal the end of input (ex: '#')")
  digit_terminators?: string;

  @doc("Time, in ms, at the end of digit input to detect end of input. Allowed values from `0` - `30,000`. **Default:** `3000` ms.")
  @minValue(0)
  @maxValue(30000)
  digit_timeout?: integer | SWMLVar;

  @doc("Amount of silence, in ms, at the end of an utterance to detect end of speech. Allowed values from `250` - `10,000`. **Default:** `700` ms (Note: Documentation incorrectly lists 2000ms).")
  @minValue(250)
  @maxValue(10000)
  end_of_speech_timeout?: integer | SWMLVar;

  @doc("The stability slider determines how stable the voice is and the randomness between each generation. Lowering this slider introduces a broader emotional range for the voice.")
  @minValue(0.01)
  @maxValue(1.0)
  eleven_labs_stability?: float | SWMLVar;

  @doc("The similarity slider dictates how closely the AI should adhere to the original voice when attempting to replicate it. The higher the similarity, the closer the AI will sound to the original voice.")
  @minValue(0.01)
  @maxValue(1.0)
  eleven_labs_similarity?: float | SWMLVar;

  @doc("If `true`, enables usage accounting. The default is `false`.")
  enable_accounting?: boolean | SWMLVar;

  @doc("""
    Enables thinking output for the AI Agent. 
    When set to `true`, the AI Agent will be able to utilize thinking capabilities.
    **Important**: This may introduce a little bit of latency as the AI will use an additional turn in the conversation to think about the query.
    """)
  enable_thinking?: boolean | SWMLVar;

  @doc("""
    Enables visual input processing for the AI Agent. 
    When set to `true`, the AI Agent will be able to utilize visual processing capabilities, while leveraging the `get_visual_input` function.
    """)
  enable_vision?: boolean | SWMLVar;

  @doc("Amount of energy necessary for bot to hear you (in dB). Allowed values from `0.0` - `100.0`. **Default:** `52.0` dB.")
  @minValue(0.0)
  @maxValue(100.0)
  energy_level?: float | SWMLVar;

  @doc("Amount of time, in ms, to wait for the first word after speech is detected. Allowed values from `0` - `10,000`. Default is `1000` ms.")
  @minValue(0)
  @maxValue(10000)
  first_word_timeout?: integer | SWMLVar;

  @doc("""
    If `true`, the AI will wait for any `filler` to finish playing before executing a function. 
    If `false`, the AI will execute a function asynchronously as the `filler` plays. 
    Default is `false`.
    """)
  function_wait_for_talking?: boolean | SWMLVar;

  @doc("If `true`, functions can be executed when there is no user response after a timeout. The default is `false`.")
  functions_on_no_response?: boolean | SWMLVar;

  @doc("""
    A final prompt that is fed into the AI when the `hard_stop_time` is reached.
    """)
  hard_stop_prompt?: string;

  @doc("""
    Specifies the maximum duration fopr the AI Agent to remain active before it exists the session. 
    After the timeout, the AI will stop responding, and will proceed with the next SWML instruction.
    
    **Time Format:**
      - Seconds Format: `30s`
      - Minutes Format: `2m`
      - Hours Format: `1h`
      - Combined Format: `1h45m30s`
    """)
  @pattern("^(?:\\d+h)?(?:\\d+m)?(?:\\d+s)?$")
  hard_stop_time?: string | SWMLVar;

  @doc("A URL for the hold music to play, accepting WAV, mp3, and FreeSWITCH tone_stream.")
  hold_music?: url;

  @doc("Enables hold music during SWAIG processing.")
  hold_on_process?: boolean | SWMLVar;

  @doc("Amount of time, in ms, to wait before exiting the app due to inactivity. Allowed values from `10,000` - `3,600,000`. **Default:** `600000` ms (10 minutes).")
  @minValue(10000)
  @maxValue(3600000)
  inactivity_timeout?: integer | SWMLVar;

  @doc("Amount of time, in ms, to wait before starting the conversation. Allowed values from `0` - `300,000`.")
  @minValue(0)
  @maxValue(300000)
  initial_sleep_ms?: integer | SWMLVar;

  @doc("""
    Check for input function with check_for_input. 
    Example use case: Feeding an inbound SMS to AI on a voice call, eg., for collecting an email address or other complex information.
    """)
  input_poll_freq?: string;

  @doc("When enabled, barges agent upon any sound interruption longer than 1 second.")
  interrupt_on_noise?: boolean | SWMLVar;

  @doc("Provide a prompt for the agent to handle crosstalk.")
  interrupt_prompt?: string;

  @doc("Allows multilingualism when `true`.")
  languages_enabled?: boolean | SWMLVar;

  @doc("The local timezone setting for the AI. Value should use `IANA TZ ID`")
  local_tz?: string;

  @doc("""
    If true, the AI Agent will be involved with the diarization process.
    Users can state who they are at the start of the conversation and
    the AI Agent will be able to correctly identify them when they are speaking later in the conversation.
    **Default:** `false`
    """)
  llm_diarize_aware?: boolean | SWMLVar;

  @doc("Sets the maximum emotion intensity for the AI voice. Allowed values from `1` - `30`. Default is `30`.")
  @minValue(1)
  @maxValue(30)
  max_emotion?: integer | SWMLVar;

  @doc("The OpenAI ASR (Automatic Speech Recognition) engine to use. Allowed values are `nova-2` and `nova-3`. Defaults to `nova-3`.")
  openai_asr_engine?: "nova-2" | "nova-3";

  @doc("Sets a time duration for the outbound call recipient to respond to the AI agent before timeout, in a range from `10000` to `600000`. **Default:** `120000` ms (2 minutes).")
  @minValue(10000)
  @maxValue(600000)
  outbound_attention_timeout?: integer | SWMLVar;

  @doc("""
    Send a summary of the conversation after the call ends.
    This requires a `post_url` to be set in the ai parameters and the `conversation_id` defined below.
    This eliminates the need for a `post_prompt` in the ai parameters.
    """)
  save_conversation?: boolean | SWMLVar;

  @doc("Amount of time, in ms, to wait for a speech event. Allowed values from `0` - `10,000`. Default is `1400` ms.")
  @minValue(0)
  @maxValue(10000)
  speech_event_timeout?: integer | SWMLVar;

  @doc("Number of quick stops to generate for speech. Allowed values from `0` - `10`. Default is `3`.")
  @minValue(0)
  @maxValue(10)
  speech_gen_quick_stops?: integer | SWMLVar;

  @doc("Overall speech timeout, in ms. Allowed values from `0` - `600,000`. Default is `60000` ms.")
  @minValue(0)
  @maxValue(600000)
  speech_timeout?: integer | SWMLVar;

  @doc("The static greeting to play when the call is answered. This will always play at the beginning of the call.")
  static_greeting?: string;

  @doc("If `true`, the static greeting will not be interrupted by the user if they speak over the greeting. If `false`, the static greeting can be interrupted by the user if they speak over the greeting.")
  static_greeting_no_barge?: boolean | SWMLVar;

  @doc("Defines the mode for summary generation. Allowed values are `\"string\"` and `\"original\"`.")
  summary_mode?: "string" | "original" | SWMLVar;

  @doc("Allows tweaking any of the indicated settings, such as `barge_match_string`, using the returned SWML from the SWAIG function.")
  swaig_allow_settings?: boolean | SWMLVar;

  @doc("Allows your SWAIG to return SWML to be executed.")
  swaig_allow_swml?: boolean | SWMLVar;

  @doc("Post entire conversation to any SWAIG call.")
  swaig_post_conversation?: boolean | SWMLVar;

  @doc("Allows SWAIG to set global data that persists across calls.")
  swaig_set_global_data?: boolean | SWMLVar;

  @doc("The model to use for the AI's thinking capabilities. Allowed values are `gpt-4o-mini`, `gpt-4.1-mini`, and `gpt-4.1-nano`.")
  thinking_model?: SupportedAIModels | SWMLVar;

  @doc("""
    When enabled, the AI will not respond to the user's input when the user is speaking over the agent. 
    The agent will wait for the user to finish speaking before responding. 
    Additionally, any attempt the LLM makes to barge will be ignored and scraped from the conversation logs.
    """)
  transparent_barge?: boolean | SWMLVar;

  @doc("Maximum time, in ms, for transparent barge mode. Allowed values from `0` - `60,000`. Default is `3000` ms.")
  @minValue(0)
  @maxValue(60000)
  transparent_barge_max_time?: integer | SWMLVar;

  @doc("Pass a summary of a conversation from one AI agent to another. For example, transfer a call summary between support agents in two departments.")
  transfer_summary?: boolean | SWMLVar;

  @doc("""
    The format for the AI agent to reference phone numbers. 
    Allowed values are `international` and `national`. 
    Defaults to `international`.
    
    **Example:**
    - `international`: `+12345678901`
    - `national`: `(234) 567-8901`
    """)
  tts_number_format?: "international" | "national";

  @doc("Enable verbose logging.")
  verbose_logs?: boolean | SWMLVar;

  @doc("URL of a video file to play when AI is listening to the user speak. Only works for calls that support video.")
  video_listening_file?: url;

  @doc("URL of a video file to play when AI is idle. Only works for calls that support video.")
  video_idle_file?: url;

  @doc("URL of a video file to play when AI is talking. Only works for calls that support video.")
  video_talking_file?: url;

  @doc("The model to use for the AI's vision capabilities. Allowed values are `gpt-4o-mini`, `gpt-4.1-mini`, and `gpt-4.1-nano`.")
  vision_model?: SupportedAIModels | SWMLVar;

  @doc("When false, AI agent will initialize dialogue after call is setup. When true, agent will wait for the user to speak first.")
  wait_for_user?: boolean | SWMLVar;

  ...TypeSpec.Record<unknown>;
}
