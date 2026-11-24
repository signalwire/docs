namespace SWML.Calling;

@summary("extensive_data Action")
model ExtensiveDataAction {
  @doc("""
    How long the model keeps this function's result. Without this action, a result over 1024 bytes
    is available to the model for the rest of its turn, including the tool calls and retries after
    it. Once the caller speaks after a reply that played out, the model sees
    `The appropriate answer was provided.` in its place. A smaller result stays for the whole call.

    - `true`: the result is available for its turn only, whatever its size.
    - `false`: the result stays for the whole call, whatever its size.

    Also works from a `post_process` response. Not on realtime models.
    """)
  @summary("extensive_data")
  @example(true)
  extensive_data: boolean;
}
