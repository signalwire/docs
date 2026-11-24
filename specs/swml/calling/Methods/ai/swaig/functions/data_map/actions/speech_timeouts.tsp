namespace SWML.Calling;

@summary("end_of_speech_timeout Action")
model EndOfSpeechTimeoutAction {
  @doc("""
    Changes the agent's
    [`end_of_speech_timeout`](/docs/swml/reference/calling/ai/params#paramsend_of_speech_timeout).
    A number is milliseconds; a string can be a
    [duration](/docs/swml/reference/calling/ai/params#duration-values) such as `"1.5s"`. The value
    must be above `0`.
    """)
  @summary("end_of_speech_timeout")
  @example("1.5s")
  end_of_speech_timeout: integer | string;
}

@summary("speech_event_timeout Action")
model SpeechEventTimeoutAction {
  @doc("""
    Changes the agent's
    [`speech_event_timeout`](/docs/swml/reference/calling/ai/params#paramsspeech_event_timeout).
    A number is milliseconds; a string can be a
    [duration](/docs/swml/reference/calling/ai/params#duration-values) such as `"500ms"`. The value
    must be above `0`.
    """)
  @summary("speech_event_timeout")
  @example("500ms")
  speech_event_timeout: integer | string;
}
