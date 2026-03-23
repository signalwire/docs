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

@route("/rooms/{id}/streams")
namespace SignalWireAPI.Video.RoomStreams {
  @tag(STREAMS_TAG)
  @friendlyName("Room Streams")
  interface RoomStreams {
    @operationId("list_room_streams")
    @summary("List room streams")
    @doc("${tokenPermissions<"_Video_">}")
    list(...RoomPathID):
      | ListStreamsResponse
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;

    @operationId("create_room_stream")
    @summary("Create room stream")
    @doc("${tokenPermissions<"_Video_">}")
    @post
    create(...RoomPathID, @body body: CreateStreamRequest):
      | StreamCreatedResponse
      | StatusCode401
      | StatusCode404
      | VideoStatusCode422
      | StatusCode500;
  }
}

@route("/streams")
namespace SignalWireAPI.Video.Streams {
  @tag(STREAMS_TAG)
  @friendlyName("Streams")
  interface Streams {
    @operationId("get_stream")
    @summary("Get stream")
    @doc("${tokenPermissions<"_Video_">}")
    @route("/{id}")
    read(...StreamPathID):
      | StreamResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("update_stream")
    @summary("Update stream")
    @doc("${tokenPermissions<"_Video_">}")
    @route("/{id}")
    @put
    update(...StreamPathID, @body body: UpdateStreamRequest):
      | StreamResponse
      | StatusCode401
      | StatusCode404
      | VideoStatusCode422
      | StatusCode500;

    @operationId("delete_stream")
    @summary("Delete stream")
    @doc("${tokenPermissions<"_Video_">}")
    @route("/{id}")
    @delete
    delete(...StreamPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
