import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/errors.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/conferences/{id}/conference_tokens")
namespace SignalWireAPI.Video.ConferenceTokensByConference {
  @tag(CONFERENCE_TOKENS_TAG)
  @friendlyName("Conference Tokens by Conference")
  interface ConferenceTokensByConference {
    @operationId("list_conference_tokens")
    @summary("List conference tokens")
    @doc("""
      Lists the guest and moderator access tokens issued for one managed Video Conference. These credentials grant access to the hosted conference experience; use [Create room token](/docs/apis/rest/video/room-tokens/create-room-token) for an SDK-based Video Room instead.

      ${tokenPermissions<"_Video_">}
      """)
    list(...ConferencePathID, ...ListConferenceTokensRequest):
      | ListConferenceTokensResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | VideoStatusCode422
      | StatusCode500;
  }
}

@route("/conference_tokens")
namespace SignalWireAPI.Video.ConferenceTokens {
  @tag(CONFERENCE_TOKENS_TAG)
  @friendlyName("Conference Tokens")
  interface ConferenceTokens {
    @operationId("get_conference_token")
    @summary("Get conference token")
    @doc("""
      Retrieves one Video Conference access token by ID. Use it after listing a conference's tokens when you need one specific guest or moderator credential; Room Tokens are issued through [Create room token](/docs/apis/rest/video/room-tokens/create-room-token) instead.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}")
    read(...ConferenceTokenPathID):
      | ConferenceTokenResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("reset_conference_token")
    @summary("Reset conference token")
    @doc("""
      Replaces a Video Conference access token identified by ID, invalidating the previous token. The role and permissions carry over, but the response contains a new token value and a new token ID, so update any stored reference to either. Use it when a guest or moderator credential has been exposed or should no longer grant access; this operation does not reset Room Tokens.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}/reset")
    @post
    reset(...ConferenceTokenPathID):
      | ConferenceTokenResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
