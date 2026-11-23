namespace SWML.Calling;

@summary("no_barge_next_response Action")
model NoBargeNextResponseAction {
  @doc("""
    Makes the agent's next spoken reply play in full, such as a read-back the caller should hear
    completely before answering. Set it to `true` or a true string; a number such as `1` is ignored.
    It holds from the start of the next model request until a reply that speaks has played: the
    caller's words neither cut the reply nor cancel its request, and are delivered after it.
    `interrupt_on_noise` doesn't cut the reply; DTMF still does. It holds for at most 30 seconds
    while the agent isn't speaking, and a reply still playing then is held to its end. Not on
    realtime models.
    """)
  @summary("no_barge_next_response")
  @example(true)
  no_barge_next_response: boolean | string;
}
