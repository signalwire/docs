import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "./models.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/room_tokens")
namespace VideoAPI.RoomTokens {
  @tag(ROOM_TOKENS_TAG)
  @friendlyName("Room Tokens")
  interface RoomTokens {
    @summary("Generate a new Video Room Token")
    @doc("Generate a Room Token allowing a client to join a Room.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
    @post
    create(@body body: CreateRoomTokenRequest): RoomTokenResponse | StatusCode401 | RoomTokenValidationError | StatusCode500;
  }
}
