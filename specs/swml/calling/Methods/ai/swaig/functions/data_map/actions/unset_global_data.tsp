namespace SWML.Calling;
@summary("unset_global_data Action")
model UnsetGlobalDataAction {
  @summary("unset_global_data")
  @doc("The key to remove from `global_data`, or an array of keys to remove.")
  @example("session_id")
  unset_global_data: string | string[];
}
