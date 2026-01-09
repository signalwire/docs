@summary("StopAction object")
model StopAction {
  @summary("stop")
  @doc("Whether to stop the conversation.")
  @example(true)
  stop: boolean | SWMLVar;
}
