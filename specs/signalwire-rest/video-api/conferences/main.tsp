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
@tag(CONFERENCES_TAG)
namespace VideoAPI.Conferences {
  @post
  @operationId("create_video_conference")
  @summary("Create a Video Conference")
  @doc("Create a Video Conference.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op createVideoConference(@body body: CreateConferenceRequest): ConferenceResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;

  @get
  @operationId("list_video_conferences")
  @summary("List Video Conferences")
  @doc("List Video Conferences.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op listVideoConferences(
    @query
    @doc("Specifies whether or not to include information about the conference's active session (if any)")
    include_active_session?: boolean
  ): ListConferencesResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;
}

@route("/conferences/{id}")
@tag(CONFERENCES_TAG)
namespace VideoAPI.ConferencesById {
  @get
  @operationId("get_video_conference")
  @summary("Find a Video Conference by ID")
  @doc("Find a Video Conference by ID.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op getVideoConference(
    @path
    @doc("Unique ID of the video conference")
    id: string,

    @query
    @doc("Specifies whether or not to include information about the conference's active session (if any)")
    include_active_session?: boolean
  ): ConferenceResponse | StatusCode401 | StatusCode404 | StatusCode500;

  @put
  @operationId("update_video_conference")
  @summary("Update a Video Conference")
  @doc("Update a Video Conference.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op updateVideoConference(
    @path
    @doc("Unique ID of the video conference")
    id: string,

    @body body: UpdateConferenceRequest
  ): ConferenceResponse | StatusCode401 | StatusCode404 | VideoStatusCode422 | StatusCode500;

  @delete
  @operationId("delete_video_conference")
  @summary("Delete a Video Conference")
  @doc("Delete a Video Conference.\n\n#### Permissions\nThe API token must include the following scopes: _Video_.")
  op deleteVideoConference(
    @path
    @doc("Unique ID of the video conference")
    id: string
  ): {
    @statusCode statusCode: 204;
  } | StatusCode401 | StatusCode404 | StatusCode500;
}

@route("/conferences/{id}/streams")
@tag(STREAMS_TAG)
namespace VideoAPI.ConferenceStreams {
  @get
  @operationId("list_streams_by_conference_id")
  @summary("List Streams by Conference Id")
  @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
  op listStreamsByConferenceId(
    @path
    @doc("Unique id of a video conference")
    @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
    id: string
  ): ListStreamsResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;

  @post
  @operationId("create_stream_by_conference_id")
  @summary("Create a Stream for a Conference")
  @doc("#### Permissions\nThe API token must include the following scopes: _Video_.")
  op createStreamByConferenceId(
    @path
    @doc("Unique id of a video conference")
    @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
    id: string,

    @body body: CreateStreamRequest
  ): StreamResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;
}
