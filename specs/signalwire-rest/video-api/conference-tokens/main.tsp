import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "./models.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/conferences/{id}/conference_tokens")
namespace VideoAPI.ConferenceTokensByConference {
  @tag(CONFERENCE_TOKENS_TAG)
  @friendlyName("Conference Tokens by Conference")
  interface ConferenceTokensByConference {
    @operationId("list_conference_tokens")
    @summary("List Conference Tokens")
    @doc("List conference tokens.\n\n${tokenPermissions<"_Video_">}")
    list(
      @path
      @doc("Unique id of a video conference")
      id: string
    ): ListConferenceTokensResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;
  }
}

@route("/conference_tokens")
namespace VideoAPI.ConferenceTokens {
  @tag(CONFERENCE_TOKENS_TAG)
  @friendlyName("Conference Tokens")
  interface ConferenceTokens {
    @operationId("get_conference_token")
    @summary("Find a Conference Token by ID")
    @doc("Find a conference token by ID.\n\n${tokenPermissions<"_Video_">}")
    @route("/{id}")
    read(
      @path
      @doc("Unique ID of the Conference Token")
      id: string
    ): ConferenceTokenResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("reset_conference_token")
    @summary("Reset a Conference Token by ID")
    @doc("Reset a conference token by ID.\n\n${tokenPermissions<"_Video_">}")
    @route("/{id}/reset")
    @post
    reset(
      @path
      @doc("Unique ID of the Conference Token")
      id: string
    ): ConferenceTokenResponse | StatusCode401 | StatusCode404 | StatusCode500;
  }
}
