import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of conferences.")
model ConferenceListResponse {
  ...Pagination;

  @doc("The unique identifier for the account that created this conference.")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  account_sid?: string;

  @doc("List of conferences.")
  conferences?: Conference[];
}

@doc("Response containing a single conference.")
model ConferenceResponse {
  ...Conference;
}

@doc("Response containing a list of conference participants.")
model ConferenceParticipantListResponse {
  ...Pagination;

  @doc("The unique identifier for the account.")
  @format("uuid")
  account_sid?: string;

  @doc("The unique identifier for the conference.")
  @format("uuid")
  conference_sid?: string;

  @doc("List of participants.")
  participants?: ConferenceParticipant[];
}

@doc("Response containing a single conference participant.")
model ConferenceParticipantResponse {
  ...ConferenceParticipant;
}

@doc("Response containing a single conference stream.")
model ConferenceStreamResponse {
  ...ConferenceStream;
}
