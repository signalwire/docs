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
    @doc("""
      Returns the outbound RTMP or RTMPS streams created for one Video Room. Use it to discover the stream IDs associated with a known room before retrieving, changing, or stopping a stream. For live voice-call audio sent over WebSocket, use the Compatibility API's [Create stream](/docs/compatibility-api/rest/streams/create-stream) operation instead.

      ${tokenPermissions<"_Video_">}
      """)
    list(...RoomPathID):
      | ListStreamsResponse
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;

    @operationId("create_room_stream")
    @summary("Create room stream")
    @doc("""
      Starts an outbound RTMP or RTMPS stream from a Video Room to the supplied ingest URL. Use it to broadcast a room to an external streaming destination. For live voice-call audio sent over WebSocket, use the Compatibility API's [Create stream](/docs/compatibility-api/rest/streams/create-stream) operation instead.

      ${tokenPermissions<"_Video_">}
      """)
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
    @doc("""
      Retrieves one outbound Video stream by its stream ID. Use it when you need the current destination or state of a known room or conference stream; use the room- or conference-specific list operation when you need to discover its ID.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}")
    read(...StreamPathID):
      | StreamResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("update_stream")
    @summary("Update stream")
    @doc("""
      Changes the RTMP or RTMPS destination URL for an existing Video stream identified by ID. Use it to redirect an active room or conference broadcast without creating a second stream.

      ${tokenPermissions<"_Video_">}
      """)
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
    @doc("""
      Stops and deletes an outbound Video stream by its stream ID. Use it when a room or conference should no longer broadcast to the configured RTMP or RTMPS destination.

      ${tokenPermissions<"_Video_">}
      """)
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
