import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of calls.")
model CallListResponse {
  ...Pagination;

  @doc("The unique identifier for the account.")
  @format("uuid")
  account_sid?: string;

  @doc("List of calls.")
  calls?: Call[];
}

@doc("Response containing a single call.")
model CallResponse {
  ...Call;
}

@doc("Response containing a single call recording.")
model CallRecordingResponse {
  ...CallRecording;
}

@doc("Response containing a single call stream.")
model CallStreamResponse {
  ...CallStream;
}
