import "./core.tsp";

@doc("Response containing a list of conferences.")
model ConferencesResponse {
  @doc("A list of conference logs.")
  data: VideoRoomSessionConference[];
}
