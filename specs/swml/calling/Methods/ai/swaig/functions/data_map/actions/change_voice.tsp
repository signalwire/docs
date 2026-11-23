namespace SWML.Calling;

@summary("change_voice object")
model ChangeVoiceObject {
  @doc("The voice, or an array of up to 8 voices, in the same form as the `voice` string forms.")
  @example(#["cartesia.efa653e5-314d-46ca-9f90-70ac7d6ca71e", "elevenlabs.adam"])
  voice: string | string[];
}

@summary("change_voice Action")
model ChangeVoiceAction {
  @doc("""
    Changes the current language's voice for the rest of the call. Takes a voice string such as
    `elevenlabs.adam`, an array of up to 8 voice strings, or an object with `voice` set to either.
    In an array, the first voice speaks and the rest become its fallbacks, replacing the language's
    own; with one voice, the language keeps its fallbacks. Either way, the fallbacks start over from
    the first.
    """)
  @summary("change_voice")
  @example("elevenlabs.adam")
  change_voice: string | string[] | ChangeVoiceObject;
}
