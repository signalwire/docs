import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;
@summary("hangup Method")
model Hangup {
  @doc("End the call with an optional reason.")
  @summary("hangup")
  hangup: {
    @doc("""
      The reason for hanging up the call: `hangup`, `cancel`, `busy`, `noAnswer`, `decline` or `error`.
      Can also be a SWML variable reference that resolves to one of these values.
      
      The reason only affects calls that are inbound and not yet answered: when omitted,
      `hangup` or `busy`, the call is rejected as busy; any other value rejects it as declined.
      An answered call ends normally and an unanswered outbound call is canceled, whatever the reason.
      """)
    @example("busy")
    reason?:
      | "hangup"
      | "cancel"
      | "busy"
      | "noAnswer"
      | "decline"
      | "error"
      | SWMLVar;
  };
}
