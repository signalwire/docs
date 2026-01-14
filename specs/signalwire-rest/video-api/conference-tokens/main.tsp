import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/conferences/{id}/conference_tokens")
@tag(CONFERENCE_TOKENS_TAG)
namespace VideoAPI.ConferenceTokensByConference {
  @get
  @operationId("list_conference_tokens")
  @summary("List Conference Tokens")
  @doc("List conference tokens.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op listConferenceTokens(
    @path
    @doc("Unique id of a video conference")
    id: string
  ): ListConferenceTokensResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;
}

@route("/conference_tokens/{id}")
@tag(CONFERENCE_TOKENS_TAG)
namespace VideoAPI.ConferenceTokens {
  @get
  @operationId("get_conference_token")
  @summary("Find a Conference Token by ID")
  @doc("Find a conference token by ID.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op getConferenceToken(
    @path
    @doc("Unique ID of the Conference Token")
    id: string
  ): ConferenceTokenResponse | StatusCode401 | StatusCode404 | StatusCode500;
}

@route("/conference_tokens/{id}/reset")
@tag(CONFERENCE_TOKENS_TAG)
namespace VideoAPI.ConferenceTokensReset {
  @post
  @operationId("reset_conference_token")
  @summary("Reset a Conference Token by ID")
  @doc("Reset a conference token by ID.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op resetConferenceToken(
    @path
    @doc("Unique ID of the Conference Token")
    id: string
  ): ConferenceTokenResponse | StatusCode401 | StatusCode404 | StatusCode500;
}
