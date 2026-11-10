import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/room_tokens")
namespace SignalWireAPI.Video.RoomTokens {
  @tag(ROOM_TOKENS_TAG)
  @friendlyName("Room Tokens")
  interface RoomTokens {
    @operationId("create_room_token")
    @summary("Create room token")
    @doc("""
      Creates a Room Token that a client consumes to join a named Video Room with the supplied identity, permissions, join window, and media settings. Call this operation from your server when granting a user access to an SDK-based room; never expose the project API token used to create it. Managed Video Conferences use their own [Conference Tokens](/docs/apis/rest/video/conference-tokens/list-conference-tokens).

      ${tokenPermissions<"_Video_">}
      """)
    @post
    create(@body body: CreateRoomTokenRequest):
      | RoomTokenResponse
      | StatusCode400
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;
  }
}
