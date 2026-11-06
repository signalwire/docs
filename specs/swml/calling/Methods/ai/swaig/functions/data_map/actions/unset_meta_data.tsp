namespace SWML.Calling;
@summary("unset_meta_data Action")
model UnsetMetaDataAction {
  @summary("unset_meta_data")
  @doc("The key to remove from the function's `meta_data`, or an array of keys to remove.")
  @example("temp_data")
  unset_meta_data: string | string[];
}
