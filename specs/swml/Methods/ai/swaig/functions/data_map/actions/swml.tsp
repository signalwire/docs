import "../../../../../../../swml";

@summary("SWML Action")
model SWMLAction {
  @summary("SWML")
  @doc("A SWML object to be executed.")
  SWML: SWMLObject;

  @summary("transfer")
  @doc("When `true`, ends the AI session and hard-transfers the call to the sibling `SWML` payload. When omitted or `false`, the SWML executes inline and the AI session continues afterward.")
  @example(true)
  transfer?: boolean | SWMLVar;
}
