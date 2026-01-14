import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "./models.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/conferences/{conference_id}/conference_tokens")
namespace VideoAPI.ConferenceTokensByConference {
  @tag(CONFERENCE_TOKENS_TAG)
  @friendlyName("Conference Tokens by Conference")
  interface ConferenceTokensByConference {
    @summary("List Conference Tokens")
    @doc("List conference tokens.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
    list(
      @path
      @doc("Unique id of a video conference")
      conference_id: string
    ): ListConferenceTokensResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;
  }
}

@route("/conference_tokens")
namespace VideoAPI.ConferenceTokens {
  @tag(CONFERENCE_TOKENS_TAG)
  @friendlyName("Conference Tokens")
  interface ConferenceTokens {
    @summary("Find a Conference Token by ID")
    @doc("Find a conference token by ID.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
    @route("/{id}")
    read(
      @path
      @doc("Unique ID of the Conference Token")
      id: string
    ): ConferenceTokenResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @summary("Reset a Conference Token by ID")
    @doc("Reset a conference token by ID.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
    @route("/{id}/reset")
    @post
    reset(
      @path
      @doc("Unique ID of the Conference Token")
      id: string
    ): ConferenceTokenResponse | StatusCode401 | StatusCode404 | StatusCode500;
  }
}
