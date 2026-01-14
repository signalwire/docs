import "@typespec/http";
import "../_shared/models.tsp";

using TypeSpec.Http;

@doc("Conference token response object.")
model ConferenceTokenResponse {
  @doc("Unique ID of the Conference Token")
  @example("c22d24f6-5a47-4597-9a23-c7d01e696b92")
  id?: string;

  @doc("Name of the Conference Token")
  @example("My First Token")
  name?: string;

  @doc("Conference Token's randomly generated sequence")
  @example("vpt_62c65414de4d067d07415a7ced8183be")
  token?: string;

  @doc("List of permissions")
  @example(#["room.member.audio_mute"])
  scopes?: string[];
}

@doc("List conference tokens response.")
model ListConferenceTokensResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of conference tokens.")
  data?: ConferenceTokenResponse[];
}
