import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;
@summary("execute_rpc Method")
model ExecuteRpc {
  @doc("""
    Sends a call control command from the running SWML script, either to another call in the same project or to start a new outbound call.
    The commands are the ones the REST Calling API's [Send call commands](/docs/apis/rest/calls/call-commands) endpoint accepts, named without the `calling.` prefix.
    The script continues with the next method whether or not the command succeeds; check `last_api_code` and `last_api_message` for the result.
    This method doesn't answer the call.
    """)
  execute_rpc: {
    @doc("""
      The command to run, without the `calling.` prefix: for example `ai_message`, `ai_hold`, `ai_unhold`, `user_event`, `transfer`, or `dial`.
      Most commands need `call_id`. `dial` starts a new call and doesn't take one.
      """)
    @example("ai_message")
    method: string;

    @doc("""
      ID of the call to send the command to. The call must belong to the same project as this script.
      Most commands need it. Omit it for `dial`, which starts a new call and can't target an existing one.
      """)
    @example("6a1f8c2e-4b7d-4e0a-9c3f-2d8e5b1a7c90")
    call_id?: string;

    @doc("ID of the node handling the target call, as reported in that call's events. Optional: SignalWire finds the call from `call_id` when this is omitted.")
    @example("a0d4e6e5-5d07-413d-9668-55542992eec0")
    node_id?: string;

    @doc("""
      The command's parameters. For every command except `dial`, these are the same as the `params` object of the matching REST Calling API command.
      For `dial`, pass `devices` (the call's destination) and, optionally, `dest_swml`, the SWML document or URL to run on the new call when it's answered.
      Variable references anywhere in this object are expanded before the command is sent.
      """)
    @example(#{
      role: "system",
      message_text: "No agent is available. Offer to take a message.",
    })
    params?: TypeSpec.Record<unknown>;
  };
}
