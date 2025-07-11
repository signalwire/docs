@minValue(10000)
@maxValue(600000)
scalar IntegerOrZero extends integer;

@summary("Direction enum")
enum Direction {
  @doc("Sets the direction of the call to `inbound` for the assistant.")
  "inbound",
  @doc("Sets the direction of the call to `outbound` for the assistant.")
  "outbound"
}

@summary("params object")
model AIParams {
  @doc("Instructs the agent to acknowledge crosstalk and confirm user input when the user speaks over the agent.")
  acknowledge_interruptions?: boolean;

  @doc("Adjust the volume of the AI. Allowed values from `-50` - `50`.")
  @minValue(-50)
  @maxValue(50)
  ai_volume?: integer;

  @doc("Amount of time, in ms, to wait before prompting the user to respond. Allowed values from `10,000` - `600,000`. Set to `0` to disable.")
  attention_timeout?: (IntegerOrZero | 0);

  @doc("A custom prompt that is fed into the AI when the attention_timeout is reached.")
  @example("Ask if the user would like you to repeat yourself, or if they need more time to respond.")
  attention_timeout_prompt?: string;

  @doc("URL of audio file to play in the background while AI plays in foreground.")
  @example("https://cdn.signalwire.com/default-music/welcome.mp3")
  background_file?: url;

  @doc("Maximum number of times to loop playing the background file. `undefined` means loop indefinitely.")
  @example(5)
  background_file_loops?: integer | null;

  @doc("Defines background_file volume within a range of `-50` to `50`.")
  @minValue(-50)
  @maxValue(50)
  background_file_volume?: integer;

  @doc("""
      Takes a string, including a regular expression, defining barge behavior.
      For example, this param can direct the AI to stop when the word 'hippopotomus' is input.
      """)
  @example("Cancel order")
  barge_match_string?: string;

  @doc("Defines the number of words that must be input before triggering barge behavior, in a range of `1-99`.")
  @minValue(1)
  @maxValue(99)
  barge_min_words?: integer;

  @doc("Sets the prompt which binds the agent to its purpose.")
  @example("Place an order")
  conscience?: string;

  @doc("Used by `check_for_input` and `save_conversation` to identify an individual conversation.")
  @example("Conversation ID")
  conversation_id?: string;

  @doc("Enables debugging to the set URL. Allowed values from `0` - `1`.")
  @minValue(0)
  @maxValue(1)
  debug_webhook_level?: integer;

  @doc("Each interaction between the AI and end user is posted in real time to the established URL.")
  @example("https://example.com")
  debug_webhook_url?: url;

  @doc("Forces the direction of the call to the assistant. Valid values are `inbound` and `outbound`.")
  direction?: Direction[];

  @doc("DTMF digit, as a string, to signal the end of input (ex: '#')")
  @example("#")
  digit_termiantors?: string;

  @doc("Time, in ms, at the end of digit input to detect end of input. Allowed values from `250` - `10,000`.")
  @minValue(250)
  @maxValue(10000)
  digit_timeout?: integer;

  @doc("Amount of silence, in ms, at the end of an utterance to detect end of speech. Allowed values from `250` - `10,000`.")
  @minValue(250)
  @maxValue(10000)
  end_of_speech_timeout?: integer;

  @doc("The stability slider determines how stable the voice is and the randomness between each generation. Lowering this slider introduces a broader emotional range for the voice.")
  eleven_labs_stability?: float;

  @doc("The similarity slider dictates how closely the AI should adhere to the original voice when attempting to replicate it. The higher the similarity, the closer the AI will sound to the original voice.")
  eleven_labs_similarity?: float;

  @doc("Amount of energy necessary for bot to hear you (in dB). Allowed values from `0.0` - `100.0`.")
  @minValue(0.0)
  @maxValue(100.0)
  energy_level?: float;

  @doc("A URL for the hold music to play, accepting WAV, mp3, and FreeSWITCH tone_stream.")
  @example("https://cdn.signalwire.com/default-music/welcome.mp3")
  hold_music?: url;

  @doc("Enables hold music during SWAIG processing.")
  hold_on_process?: boolean;

  @doc("Amount of time, in ms, to wait before exiting the app due to inactivity. Allowed values from `10,000` - `3,600,000`.")
  @minValue(10000)
  @maxValue(3600000)
  inactivity_timeout?: integer;

  @doc("""
      Check for input function with check_for_input.
      Example use case: Feeding an inbound SMS to AI on a voice call, eg., for collecting an email address or other complex information.
      """)
  input_poll_freq?: string;

  @doc("When enabled, barges agent upon any sound interruption longer than 1 second.")
  interrupt_on_noise?: boolean;

  @doc("Provide a prompt for the agent to handle crosstalk.")
  @example("Inform user that you can't hear anything")
  interrupt_prompt?: string;

  @doc("Allows multilingualism when `true`.")
  languages_enabled?: boolean;

  @doc("The local timezone setting for the AI. Value should use `IANA TZ ID`")
  @example("America/Ensenada")
  local_tz?: string;

  @doc("Sets a time duration for the outbound call recipient to respond to the AI agent before timeout, in a range from `10000` to `600000`.")
  @minValue(10000)
  @maxValue(600000)
  outbound_attention_timeout?: integer;

  @doc("""
      Send a summary of the conversation after the call ends.
      This requires a `post_url` to be set in the ai parameters and the `conversation_id` defined below.
      This eliminates the need for a `post_prompt` in the ai parameters.
      """)
  save_conversation?: boolean;

  @doc("Allows tweaking any of the indicated settings, such as `barge_match_string`, using the returned SWML from the SWAIG function.")
  swaig_allow_settings?: boolean;

  @doc("Allows your SWAIG to return SWML to be executed.")
  swaig_allow_swml?: boolean;

  @doc("Post entire conversation to any SWAIG call.")
  swaig_post_conversation?: boolean;

  @doc("Pass a summary of a conversation from one AI agent to another. For example, transfer a call summary between support agents in two departments.")
  transfer_summary?: boolean;

  @doc("Enable verbose logging.")
  verbose_logs?: boolean;

  @doc("When false, AI agent will initialize dialogue after call is setup. When true, agent will wait for the user to speak first.")
  wait_for_user?: boolean;
}
