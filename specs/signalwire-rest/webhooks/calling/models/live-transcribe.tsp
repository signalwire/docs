import "../../../types";
import "../../ai/models/common.tsp";

namespace SignalWireAPI.Webhooks.Calling;

alias LiveTranscribeRole = "remote-caller" | "local-caller";

@doc("""
  Identifies the call and the event. Read `content_disposition` to tell the three live
  transcription events apart, since they all arrive at the same `webhook` URL.
  """)
model LiveTranscribeChannelData {
  @doc("Your project ID. Included when available.")
  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
  project_id?: uuid;

  @doc("Your Space ID. Included when available.")
  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
  space_id?: uuid;

  @doc("The content type of the POST body. Always `text/json`.")
  @example("text/json")
  content_type: "text/json";

  @doc("""
    Which event this is:

    - `transcribe.utterance`: one utterance was transcribed.
    - `transcribe.live_summarize`: the summary you requested with the `summarize` action.
    - `transcribe.conversation_log`: the transcription session ended.
    """)
  @example("transcribe.utterance")
  content_disposition:
    | "transcribe.utterance"
    | "transcribe.live_summarize"
    | "transcribe.conversation_log";

  @doc("ID of the call being transcribed.")
  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
  call_id: uuid;

  @doc("When the call was created, as a Unix timestamp in microseconds.")
  @example(1777565690123456)
  call_start_date?: int64;

  @doc("When the call was answered, as a Unix timestamp in microseconds. `0` if it hasn't been answered.")
  @example(1777565691234567)
  call_answer_date?: int64;

  @doc("When the call ended, as a Unix timestamp in microseconds. `0` while the call is still up.")
  @example(0)
  call_end_date?: int64;

  @doc("The caller's name. Included when the call has one.")
  @example("Jane Doe")
  caller_id_name?: string;

  @doc("The caller's number. Included when the call has one.")
  @example("+15555550100")
  caller_id_number?: string;

  @doc("SWML variables for the call. Included when the call carries SWML state.")
  SWMLVars?: Record<unknown>;

  @doc("SWML call state. Included when the call carries SWML state.")
  SWMLCall?: Record<unknown>;
}

@doc("One transcribed utterance, as sent in a `transcribe.utterance` event.")
model LiveTranscribeUtterance {
  @doc("""
    Which side of the call spoke, matching the `direction` values you passed to `start`.
    `remote-caller` is the audio SignalWire receives from the call, and `local-caller` is the
    audio SignalWire sends to it.
    """)
  @example("remote-caller")
  role: LiveTranscribeRole;

  @doc("The transcribed text.")
  @example("Hi, I'd like to book a ride to the airport.")
  content: string;

  @doc("The transcription language.")
  @example("en-US")
  lang: string;

  @doc("An estimate of the number of tokens in `content`.")
  @example(11)
  tokens: integer;

  @doc("When the utterance was transcribed, as a Unix timestamp in microseconds.")
  @example(1777565701562391)
  timestamp: int64;

  @doc("Unique ID for this utterance.")
  @example("9b3c1f0e-7a52-4c8e-b0d4-3f6a2e1d9c57")
  utterance_id: uuid;

  @doc("The number of characters in `content`.")
  @example(43)
  char_count: integer;

  @doc("The number of words in `content`.")
  @example(9)
  word_count: integer;

  @doc("""
    Milliseconds since the previous utterance from the same side of the call. Omitted on that
    side's first utterance.
    """)
  @example(1840)
  silence_before_ms?: integer;

  @doc("The speech engine's confidence in the transcription, from `0` to `1`. Omitted when it's `0` or the speech engine didn't report one.")
  @example(0.97)
  confidence?: float64;
}

@doc("One utterance in the conversation log, in the order it was spoken.")
model LiveTranscribeLogEntry {
  @doc("Which side of the call spoke.")
  @example("remote-caller")
  role: LiveTranscribeRole;

  @doc("The transcribed text.")
  @example("Hi, I'd like to book a ride to the airport.")
  content: string;

  @doc("The speech engine's confidence in the transcription, from `0` to `1`. Omitted when it's `0` or the speech engine didn't report one.")
  @example(0.97)
  confidence?: float64;

  @doc("The transcription language.")
  @example("en-US")
  language?: string;
}

@doc("Totals for the whole session. The counts are `0` when nothing was transcribed.")
model LiveTranscribeMetrics {
  @doc("The number of utterances transcribed.")
  @example(14)
  total_utterances: integer;

  @doc("When the first utterance was transcribed, as a Unix timestamp in microseconds. Omitted when nothing was transcribed.")
  @example(1777565701562391)
  first_utterance_ts?: int64;

  @doc("When the last utterance was transcribed, as a Unix timestamp in microseconds. Omitted when nothing was transcribed.")
  @example(1777565788902114)
  last_utterance_ts?: int64;

  @doc("The number of utterances from the `remote-caller` side.")
  @example(8)
  remote_caller_turns: integer;

  @doc("The number of utterances from the `local-caller` side.")
  @example(6)
  local_caller_turns: integer;

  @doc("The number of words spoken on the `remote-caller` side.")
  @example(96)
  remote_caller_words: integer;

  @doc("The number of words spoken on the `local-caller` side.")
  @example(71)
  local_caller_words: integer;

  @doc("The average confidence on the `remote-caller` side. Omitted when no utterance on that side had a confidence above `0`.")
  @example(0.95)
  remote_caller_avg_confidence?: float64;

  @doc("The average confidence on the `local-caller` side. Omitted when no utterance on that side had a confidence above `0`.")
  @example(0.96)
  local_caller_avg_confidence?: float64;
}

model LiveTranscribeUtteranceWebhookPayload {
  @doc("""
    Identifies the call. `project_id` and `space_id` are included when available. Its
    `content_disposition` is always `post_data`; read `channel_data.content_disposition` to tell the
    events apart.
    """)
  call_info: SignalWireAPI.Webhooks.AI.AICallInfo;

  @doc("The speech engine's confidence for this utterance, or `null` when it didn't report one. Unlike `utterance.confidence`, it is included when the confidence is `0`.")
  @example(0.97)
  confidence: float64 | null;

  @doc("Identifies the call and the event. `content_disposition` is `transcribe.utterance`.")
  channel_data: LiveTranscribeChannelData;

  @doc("The utterance that was transcribed.")
  utterance: LiveTranscribeUtterance;
}

model LiveTranscribeSummaryWebhookPayload {
  @doc("""
    Identifies the call. `project_id` and `space_id` are included when available. Its
    `content_disposition` is always `post_data`; read `channel_data.content_disposition` to tell the
    events apart.
    """)
  call_info: SignalWireAPI.Webhooks.AI.AICallInfo;

  @doc("Identifies the call and the event. `content_disposition` is `transcribe.live_summarize`.")
  channel_data: LiveTranscribeChannelData;

  @doc("Every utterance transcribed so far, in order.")
  conversation_log: LiveTranscribeLogEntry[];

  @doc("The AI summary of the conversation so far. `Error creating summary` when no summary could be produced.")
  @example("The caller asked to book a ride to the airport at 6 AM tomorrow and confirmed the pickup address.")
  conversation_summary: string;
}

model LiveTranscribeConversationLogWebhookPayload {
  @doc("""
    Identifies the call. `project_id` and `space_id` are included when available. Its
    `content_disposition` is always `post_data`; read `channel_data.content_disposition` to tell the
    events apart.
    """)
  call_info: SignalWireAPI.Webhooks.AI.AICallInfo;

  @doc("Identifies the call and the event. `content_disposition` is `transcribe.conversation_log`.")
  channel_data: LiveTranscribeChannelData;

  @doc("Every utterance transcribed in the session, in order.")
  conversation_log: LiveTranscribeLogEntry[];

  @doc("""
    The AI summary of the whole conversation. Included when you started the session with
    `ai_summary` set to `true` and a summary was produced.
    """)
  @example("The caller booked a ride to the airport for 6 AM tomorrow from 120 Harbor Street.")
  conversation_summary?: string;

  @doc("Totals for the session.")
  metrics: LiveTranscribeMetrics;
}
