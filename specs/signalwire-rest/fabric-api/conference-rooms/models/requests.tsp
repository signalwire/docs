import "./core.tsp";

model ConferenceRoomCreateRequest {
  @doc("Display name of the Conference Room")
  @example("Reception")
  display_name: string;

  @doc("Maximum number of members allowed in the conference room")
  @example(30)
  max_members?: int32;

  @doc("Configuration settings for the conference room")
  config?: ConferenceRoomConfig;
}

model ConferenceRoomUpdateRequest {
  @doc("Display name of the Conference Room")
  @example("Reception")
  display_name?: string;

  @doc("Maximum number of members allowed in the conference room")
  @example(30)
  max_members?: int32;

  @doc("Configuration settings for the conference room")
  config?: ConferenceRoomConfig;
}
