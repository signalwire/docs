namespace SWML.Calling;

@summary("settings Action")
model SettingsAction {
  @doc("""
    Changes the AI model's settings for the rest of the conversation, as a key-value map.
    Only settings the selected model supports are applied. Requires
    [`params.swaig_allow_settings`](/docs/swml/reference/calling/ai/params#paramsswaig_allow_settings),
    which is on by default.
    """)
  @summary("settings")
  settings: {
    ...TypeSpec.Record<unknown>;
  };
}
