namespace SWML.Calling;

@summary("wait_for_user Action")
model WaitForUserAction {
  @doc("""
    Whether the agent waits for the caller to speak before it takes its turn. Set after the caller
    has spoken, the agent waits up to
    [`attention_timeout`](/docs/swml/reference/calling/ai/params#paramsattention_timeout), and when
    that runs out it takes its turn as after any silence. Set before the caller's first words, it
    waits up to
    [`outbound_attention_timeout`](/docs/swml/reference/calling/ai/params#paramsoutbound_attention_timeout)
    and ends the call when that runs out.
    """)
  @summary("wait_for_user")
  @example(true)
  wait_for_user: boolean;
}
