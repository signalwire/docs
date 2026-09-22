import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes";
import "../tags.tsp";
import "../_shared/models.tsp";
import "../_shared/errors.tsp";
import "../streams/models/core.tsp";
import "../streams/models/requests.tsp";
import "../streams/models/responses.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/conferences")
namespace SignalWireAPI.Video.Conferences {
  @tag(VIDEO_CONFERENCES_TAG)
  @friendlyName("Conferences")
  interface Conferences {
    @operationId("create_video_conference")
    @summary("Create video conference")
    @doc("""
      Creates a managed Video Conference in the project with hosted guest and moderator access. Use it when SignalWire should provide the conference experience as well as the video session. For a custom client built with Room Tokens and a SignalWire client SDK, use [Create room](/docs/apis/rest/video/rooms/create-room).

      ${tokenPermissions<"_Video_">}
      """)
    @post
    create(@body body: CreateConferenceRequest):
      | ConferenceResponse
      | StatusCode400
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;

    @operationId("list_video_conferences")
    @summary("List video conferences")
    @doc("""
      Lists the project's managed Video Conferences. These configurations provide hosted guest and moderator access and define when each conference can be joined. Use [Get video conference](/docs/apis/rest/video/video-conferences/get-video-conference) when you already have the conference ID.

      ${tokenPermissions<"_Video_">}
      """)
    list(...ListConferencesRequest):
      | ListConferencesResponse
      | StatusCode400
      | StatusCode401
      | VideoStatusCode422
      | StatusCode500;

    @operationId("get_video_conference")
    @summary("Get video conference")
    @doc("""
      Retrieves one managed Video Conference by ID so you can inspect its hosted experience and current activity. Use [List video conferences](/docs/apis/rest/video/video-conferences/list-video-conferences) to discover conference IDs.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}")
    read(
      ...ConferencePathID,

      @query
      @doc("Specifies whether to include information about the conference's active session (if any).")
      @example(true)
      include_active_session?: boolean,
    ):
      | ConferenceResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | VideoStatusCode422
      | StatusCode500;

    @operationId("update_video_conference")
    @summary("Update video conference")
    @doc("""
      Changes how a managed Video Conference is presented and runs for subsequent joins while preserving the same project resource and access links.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}")
    @put
    update(
      ...ConferencePathID,

      @body body: UpdateConferenceRequest,
    ):
      | ConferenceResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | VideoStatusCode422
      | StatusCode500;

    @operationId("delete_video_conference")
    @summary("Delete video conference")
    @doc("""
      Deletes a managed Video Conference by ID so it can no longer be joined. This removes the conference configuration; use the Room Recordings endpoints when you need to find or delete recorded media.

      ${tokenPermissions<"_Video_">}
      """)
    @route("/{id}")
    @delete
    delete(
      ...ConferencePathID,
    ):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}

@route("/conferences/{id}/streams")
namespace SignalWireAPI.Video.ConferenceStreams {
  @tag(STREAMS_TAG)
  @friendlyName("Conference Streams")
  interface ConferenceStreams {
    @operationId("list_conference_streams")
    @summary("List conference streams")
    @doc("""
      Returns the outbound RTMP or RTMPS streams created for one Video Conference. Use it to discover stream IDs for a known conference before retrieving, changing, or stopping a broadcast. For live voice-conference audio sent over WebSocket, use [Create conference stream](/docs/compatibility-api/rest/conference-streams/create-conference-stream) in the Compatibility API instead.

      ${tokenPermissions<"_Video_">}
      """)
    list(
      @path
      @doc("Unique id of a video conference")
      @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
      id: string,
    ): ListStreamsResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;

    @operationId("create_conference_stream")
    @summary("Create conference stream")
    @doc("""
      Starts an outbound RTMP or RTMPS stream from a Video Conference to the supplied ingest URL. Use it to broadcast a conference to an external streaming destination. For live voice-conference audio sent over WebSocket, use [Create conference stream](/docs/compatibility-api/rest/conference-streams/create-conference-stream) in the Compatibility API instead.

      ${tokenPermissions<"_Video_">}
      """)
    @post
    create(
      @path
      @doc("Unique id of a video conference")
      @example("fe4093d9-58c2-4931-b4b9-5679f82652c6")
      id: string,

      @body body: CreateStreamRequest,
    ): StreamResponse | StatusCode401 | VideoStatusCode422 | StatusCode500;
  }
}
