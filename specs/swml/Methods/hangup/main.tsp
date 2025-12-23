@summary("Hangup object")
model Hangup {
  @doc("Hangup the call.")
  @summary("hangup")
  hangup: {
    @doc("The reason for hanging up the call.")
    reason?: "hangup" | "busy" | "decline";
  };
}
