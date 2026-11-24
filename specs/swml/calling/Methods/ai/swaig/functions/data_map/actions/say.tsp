
namespace SWML.Calling;
@summary("say Action")
model SayAction {
  @doc("""
    Text for the agent to speak. The caller can interrupt it, as they can a reply. The model receives
    the text as the agent's own words, right after the result of the function call it came from: in
    full when it played, cut where the caller stopped hearing it when it was interrupted, and as `…`
    alone when it never played. So the function's `response` doesn't need to repeat it. On realtime
    models, the model speaks the text itself.
    """)
  @summary("say")
  @example("Welcome to Franklin's Pizza.")
  say: string;
}
