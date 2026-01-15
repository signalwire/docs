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

@route("/rooms/{id}/streams")
namespace VideoAPI.RoomStreams {
  @tag(STREAMS_TAG)
  @friendlyName("Room Streams")
  interface RoomStreams {
    @operationId("list_streams_by_room_id")
    @summary("List Streams by Room Id")
    @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
    list(
      @path
      @doc("Unique id of a video room")
      @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
      id: string
    ): ListStreamsResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;

    @operationId("create_stream_by_room_id")
    @summary("Create a Stream for a Room")
    @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
    @post
    create(
      @path
      @doc("Unique id of a video room")
      @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
      id: string,

      @body body: CreateStreamRequest
    ): StreamResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;
  }
}

@route("/streams")
namespace VideoAPI.Streams {
  @tag(STREAMS_TAG)
  @friendlyName("Streams")
  interface Streams {
    @operationId("get_stream")
    @summary("Find a Stream by ID")
    @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
    @route("/{id}")
    read(
      @path
      @doc("Unique ID of the stream")
      id: string
    ): StreamResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_stream")
    @summary("Update a Stream")
    @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
    @route("/{id}")
    @put
    update(
      @path
      @doc("Unique ID of the stream")
      id: string,

      @body body: UpdateStreamRequest
    ): StreamResponse | StatusCode401 | StatusCode404 | VideoStatusCode422 | StatusCode500;

    @operationId("delete_stream")
    @summary("Delete a Stream")
    @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
    @route("/{id}")
    @delete
    delete(
      @path
      @doc("Unique ID of the stream")
      id: string
    ): {
      @statusCode statusCode: 204;
    } | StatusCode401 | StatusCode404 | StatusCode500;
  }
}
