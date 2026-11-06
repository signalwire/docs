import "../ai";

namespace SWML.Calling;

// Bedrock supports its own set of params, separate from `ai`. Every param it supports is
// declared here rather than picked from `AIParams`, because each one behaves differently:
// - `attention_timeout` accepts 0 or 1000-60000 ms (the `ai` ceiling is 600000).
// - `inactivity_timeout` reminds the caller after the agent stops speaking instead of ending
//   the session. Its range happens to match the `ai` one, so it reuses `InactivityTimeout`;
//   declare a Bedrock scalar if the `ai` bounds change.
// - `hard_stop_time` and `hard_stop_prompt` end the conversation after one final instruction,
//   with a Bedrock-specific default message.
// - the video files are used only as a talking + idle pair.
@summary("Bedrock attention timeout")
@minValue(1000)
@maxValue(60000)
scalar BedrockAttentionTimeout extends integer;

model BedrockParams {
  @doc("""
    Amount of time, in ms, to wait for the caller to respond before the agent is prompted to get their attention.
    Allowed values: `0` (to disable) or `1,000` - `60,000`. **Default:** `5000` ms.
    """)
  @example(10000)
  attention_timeout?: BedrockAttentionTimeout | 0 = 5000;

  @doc("""
    Amount of time, in ms, to wait for the caller to respond after the agent finishes speaking. When it passes,
    the agent is prompted to check whether the caller is still there; the session does not end.
    Allowed values: `0` (to disable) or `10,000` - `3,600,000`. **Default:** `600000` ms (10 minutes).
    """)
  @example(600000)
  inactivity_timeout?: InactivityTimeout | 0 = 600000;

  @doc("""
    The maximum time the agent stays active. When it has passed, the agent receives `hard_stop_prompt` as a final
    instruction and the conversation is scheduled to end. The agent's reply to that instruction is not guaranteed
    to finish before the conversation ends.
    
    **Time format:** `HH:MM:SS`, `MM:SS`, or a whole number of seconds, greater than zero. Always pass the value as
    a string, for example `"30:00"` or `"1800"`, both 30 minutes. In the colon forms, minutes and seconds go up to `59`.
    """)
  @pattern("^\\d+(?::\\d+){0,2}$")
  @example("30:00")
  hard_stop_time?: string;

  @doc("""
    The final instruction the agent receives when `hard_stop_time` is reached, before the conversation ends.
    Used only when `hard_stop_time` is set.
    """)
  @example("Thank you for calling. The maximum call time has been reached. Goodbye!")
  hard_stop_prompt?: string = "The time limit for this call has been reached. Please wrap up the conversation.";

  @doc("""
    URL of a video file to play while the agent is talking. Only works for calls that support video, and only
    together with `video_idle_file`: the agent's video plays only when both are set.
    """)
  @example("https://example.com/talking.mp4")
  video_talking_file?: url;

  @doc("""
    URL of a video file to play while the agent is idle. Only works for calls that support video, and only
    together with `video_talking_file`: the agent's video plays only when both are set.
    """)
  @example("https://example.com/idle.mp4")
  video_idle_file?: url;

  @doc("""
    URL of a video file to play while the caller is speaking. Used only when `video_talking_file` and
    `video_idle_file` are both set; when omitted, `video_idle_file` plays while the caller speaks.
    """)
  @example("https://example.com/listening.mp4")
  video_listening_file?: url;

  ...TypeSpec.Record<unknown>;
}
