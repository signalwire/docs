namespace SWML.Calling;

@summary("settings Action")
model SettingsAction {
  @doc("""
    Changes the AI model's settings for the rest of the call, as a key-value map. Only the keys you
    name change; every other setting, including one set on `prompt`, keeps its current value. A key
    the model doesn't accept is ignored. The change lasts across steps. Requires
    [`params.swaig_allow_settings`](/docs/swml/reference/calling/ai/params#paramsswaig_allow_settings),
    which is on by default.
    """)
  @summary("settings")
  @example(#{ temperature: 0.3 })
  settings: {
    ...TypeSpec.Record<unknown>;
  };
}
