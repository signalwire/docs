import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "../_shared/models.tsp";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/rooms/{id}/streams")
@tag(STREAMS_TAG)
namespace VideoAPI.RoomStreams {
  @get
  @operationId("list_streams_by_room_id")
  @summary("List Streams by Room Id")
  @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
  op listStreamsByRoomId(
    @path
    @doc("Unique id of a video room")
    @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
    id: string
  ): ListStreamsResponse | VideoError;

  @post
  @operationId("create_stream_by_room_id")
  @summary("Create a Stream for a Room")
  @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
  op createStreamByRoomId(
    @path
    @doc("Unique id of a video room")
    @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
    id: string,

    @body body: CreateStreamRequest
  ): StreamResponse | VideoError;
}

@route("/streams/{id}")
@tag(STREAMS_TAG)
namespace VideoAPI.Streams {
  @get
  @operationId("get_stream")
  @summary("Find a Stream by ID")
  @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
  op getStream(
    @path
    @doc("Unique ID of the stream")
    id: string
  ): StreamResponse | VideoError;

  @put
  @operationId("update_stream")
  @summary("Update a Stream")
  @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
  op updateStream(
    @path
    @doc("Unique ID of the stream")
    id: string,

    @body body: UpdateStreamRequest
  ): StreamResponse | VideoError;

  @delete
  @operationId("delete_stream")
  @summary("Delete a Stream")
  @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
  op deleteStream(
    @path
    @doc("Unique ID of the stream")
    id: string
  ): {
    @statusCode statusCode: 204;
  } | VideoError;
}
