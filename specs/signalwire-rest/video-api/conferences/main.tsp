import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "../streams/models.tsp";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/conferences")
namespace VideoAPI.Conferences {
  @tag(CONFERENCES_TAG)
  @friendlyName("Conferences")
  interface Conferences {
    @operationId("create_video_conference")
    @summary("Create a Video Conference")
    @doc("Create a Video Conference.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
    @post
    create(@body body: CreateConferenceRequest): ConferenceResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;

    @operationId("list_video_conferences")
    @summary("List Video Conferences")
    @doc("List Video Conferences.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
    list(
      @query
      @doc("Specifies whether or not to include information about the conference's active session (if any)")
      include_active_session?: boolean
    ): ListConferencesResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;

    @operationId("get_video_conference")
    @summary("Find a Video Conference by ID")
    @doc("Find a Video Conference by ID.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
    @route("/{id}")
    read(
      @path
      @doc("Unique ID of the video conference")
      id: string,

      @query
      @doc("Specifies whether or not to include information about the conference's active session (if any)")
      include_active_session?: boolean
    ): ConferenceResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_video_conference")
    @summary("Update a Video Conference")
    @doc("Update a Video Conference.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
    @route("/{id}")
    @put
    update(
      @path
      @doc("Unique ID of the video conference")
      id: string,

      @body body: UpdateConferenceRequest
    ): ConferenceResponse | StatusCode401 | StatusCode404 | VideoStatusCode422 | StatusCode500;

    @operationId("delete_video_conference")
    @summary("Delete a Video Conference")
    @doc("Delete a Video Conference.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
    @route("/{id}")
    @delete
    delete(
      @path
      @doc("Unique ID of the video conference")
      id: string
    ): {
      @statusCode statusCode: 204;
    } | StatusCode401 | StatusCode404 | StatusCode500;
  }
}

@route("/conferences/{id}/streams")
namespace VideoAPI.ConferenceStreams {
  @tag(STREAMS_TAG)
  @friendlyName("Conference Streams")
  interface ConferenceStreams {
    @operationId("list_conference_streams")
    @summary("List Streams by Conference")
    @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
    list(
      @path
      @doc("Unique id of a video conference")
      @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
      id: string
    ): ListStreamsResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;

    @operationId("create_conference_stream")
    @summary("Create a Stream for a Conference")
    @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
    @post
    create(
      @path
      @doc("Unique id of a video conference")
      @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
      id: string,

      @body body: CreateStreamRequest
    ): StreamResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;
  }
}
