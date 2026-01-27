import "@typespec/openapi";

using TypeSpec.OpenAPI;

const ROOMS_TAG = "Rooms";
const ROOMS_TAG_METADATA = #{
  description: "Manage video rooms",
};

const STREAMS_TAG = "Streams";
const STREAMS_TAG_METADATA = #{
  description: "Manage video streams",
};

const ROOM_SESSIONS_TAG = "Room Sessions";
const ROOM_SESSIONS_TAG_METADATA = #{
  description: "Manage room sessions",
};

const ROOM_TOKENS_TAG = "Room Tokens";
const ROOM_TOKENS_TAG_METADATA = #{
  description: "Manage room tokens",
};

const ROOM_RECORDINGS_TAG = "Room Recordings";
const ROOM_RECORDINGS_TAG_METADATA = #{
  description: "Manage room recordings",
};

const CONFERENCES_TAG = "Conferences";
const CONFERENCES_TAG_METADATA = #{
  description: "Manage video conferences",
};

const CONFERENCE_TOKENS_TAG = "Conference Tokens";
const CONFERENCE_TOKENS_TAG_METADATA = #{
  description: "Manage conference tokens",
};

const LOGS_TAG = "Logs";
const LOGS_TAG_METADATA = #{
  description: "View video logs",
};
