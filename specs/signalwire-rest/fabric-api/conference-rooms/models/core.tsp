import "../../../types";

using TypeSpec.Http;

model ConferenceRoomPathID {
  @doc("Unique ID of a Conference Room.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid
}

model ConferenceRoomID {
  @doc("Unique ID of a Conference Room.")
  conference_room_id: uuid
}

model ConferenceRoom {
  @doc("Display name of the Conference Room")
  @example("Reception")
  display_name: string;

  @doc("Maximum number of members allowed in the conference room")
  @example(30)
  max_members?: int32;

  @doc("Configuration settings for the conference room")
  config?: ConferenceRoomConfig;
}

model ConferenceRoomConfig {
  @doc("Whether to enable recording")
  @example(false)
  recording?: boolean;

  @doc("Whether to enable video")
  @example(true)
  video?: boolean;

  @doc("Whether to enable audio")
  @example(true)
  audio?: boolean;
}

model ConferenceRoomWithID {
  ...ConferenceRoomID,
  ...ConferenceRoom
}