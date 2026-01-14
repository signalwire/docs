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

@route("/room_tokens")
@tag(ROOM_TOKENS_TAG)
namespace VideoAPI.RoomTokens {
  @post
  @operationId("create_room_token")
  @summary("Generate a new Video Room Token")
  @doc("Generate a Room Token allowing a client to join a Room.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op createRoomToken(@body body: CreateRoomTokenRequest): RoomTokenResponse | StatusCode401 | RoomTokenValidationError | StatusCode500;
}
