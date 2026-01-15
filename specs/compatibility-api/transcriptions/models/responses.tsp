import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of transcriptions.")
model TranscriptionListResponse {
  ...Pagination;

  @doc("The unique identifier of this account.")
  @example("b3877c40-da60-4998-90ad-b792e98472ac")
  account_sid?: string;

  @doc("List of transcriptions.")
  transcriptions?: Transcription[];
}

@doc("Response containing a single transcription.")
model TranscriptionResponse {
  ...Transcription;
}
