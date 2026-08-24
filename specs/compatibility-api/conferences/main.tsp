import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";
import "../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/Conferences")
namespace CompatibilityAPI.Conferences {
  @tag(CONFERENCES_TAG)
  @friendlyName("Conferences")
  interface Conferences {
    @operationId("list_all_conferences")
    @summary("List All Conferences")
    @doc("""
      Lists the account's voice conferences. Each conference has a SID used for live participant, recording, or stream management. Use [Conference logs](/docs/apis/rest/conference-logs/list-conferences) for cross-product history, or [Video Conferences](/docs/apis/rest/video/video-conferences/list-video-conferences) for hosted video configurations.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list(
      ...ConferencesAccountSidPath,

      @query
      @doc("Shows conferences that were created on the date provided. Format: YYYY-MM-DD.")
      @example("2024-01-15")
      DateCreated?: string,

      @query("DateCreated<")
      @doc("Shows conferences that were created before the date provided. Format: YYYY-MM-DD.")
      @example("2024-01-15")
      DateCreatedBefore?: string,

      @query("DateCreated>")
      @doc("Shows conferences that were created after the date provided. Format: YYYY-MM-DD.")
      @example("2024-01-01")
      DateCreatedAfter?: string,

      @query
      @doc("Shows conferences that were updated on the date provided. Format: YYYY-MM-DD.")
      @example("2024-01-15")
      DateUpdated?: string,

      @query("DateUpdated<")
      @doc("Shows conferences that were updated before the date provided. Format: YYYY-MM-DD.")
      @example("2024-01-15")
      DateUpdatedBefore?: string,

      @query("DateUpdated>")
      @doc("Shows conferences that were updated after the date provided. Format: YYYY-MM-DD.")
      @example("2024-01-01")
      DateUpdatedAfter?: string,

      @query
      @doc("A description, up to 64 characters, of the conference room.")
      @maxLength(64)
      @example("My Conference Room")
      FriendlyName?: string,

      @query
      @doc("The status of this conference.")
      @example(ConferenceStatus.InProgress)
      Status?: ConferenceStatus,

      @query
      @doc("The page number to retrieve. Page numbers are zero-indexed, so the first page is 0.")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results to return per page. The default is 50, and the maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("A token used to retrieve a specific page of results. Must start with PA or PB.")
      @example("PAb3877c40da6049989ad0b792e98472cf")
      PageToken?: string,
    ):
      | ConferenceListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("retrieve_conference")
    @summary("Retrieve a Conference")
    @doc("""
      Retrieves one voice conference by SID so you can inspect a known conference and its current activity. Use [List All Conferences](/docs/compatibility-api/rest/conferences/list-all-conferences) to discover SIDs; Video Conferences are separate hosted video resources.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{Sid}")
    read(...ConferencesAccountSidPath, ...ConferenceSidPath):
      | ConferenceResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("update_conference")
    @summary("Update Conference")
    @doc("""
      Ends a voice conference or plays an announcement into it by updating the conference SID. Use participant operations to mute, hold, coach, announce to, or remove one caller; Video Conference configuration uses the separate Video API.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    @route("/{Sid}")
    update(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body?: UpdateConferenceRequest,
    ):
      | ConferenceResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422
      | CompatibilityStatusCode503;
  }

  @tag(CONFERENCE_PARTICIPANTS_TAG)
  @friendlyName("Conference Participants")
  @route("/{ConferenceSid}/Participants")
  interface ConferenceParticipants {
    @operationId("list_all_participants")
    @summary("List all active Participants")
    @doc("""
      Lists the callers currently participating in a voice conference. Each participant is identified by the Call SID used for individual control. Video conference participants belong to Video Rooms and are not returned here.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,

      @query
      @doc("Whether or not a participant is muted.")
      @example(false)
      Muted?: boolean,

      @query
      @doc("Whether or not a participant is on hold.")
      @example(false)
      Hold?: boolean,

      @query
      @doc("The page number to retrieve. Page numbers are zero-indexed, so the first page is 0.")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results to return per page. The default is 50, and the maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("A token used to retrieve a specific page of results. Must start with PA or PB.")
      @example("PAb3877c40da6049989ad0b792e98472ca")
      PageToken?: string,
    ):
      | ConferenceParticipantListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;

    @operationId("retrieve_participant")
    @summary("Retrieve a Participant")
    @doc("""
      Retrieves one active voice-conference participant by the call SID used to join the conference. Use [List all active Participants](/docs/compatibility-api/rest/conference-participants/list-all-participants) to discover Call SIDs; this operation does not retrieve Video Room participants.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{CallSid}")
    read(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,
      ...ParticipantCallSidPath,
    ):
      | ConferenceParticipantResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("update_participant")
    @summary("Update a Participant")
    @doc("""
      Changes an active voice-conference participant's mute, hold, coaching, wait-audio, or announcement settings by Call SID. Use [Update Conference](/docs/compatibility-api/rest/conferences/update-conference) to end or announce to the entire conference, and delete the participant to remove only that caller.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    @route("/{CallSid}")
    update(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,
      ...ParticipantCallSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateConferenceParticipantRequest,
    ):
      | ConferenceParticipantResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;

    @operationId("delete_participant")
    @summary("Delete a Participant")
    @doc("""
      Removes one caller from an active voice conference by Call SID. This disconnects that participant from the conference without ending the conference for everyone else; use [Update Conference](/docs/compatibility-api/rest/conferences/update-conference) to complete the full conference.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @delete
    @route("/{CallSid}")
    delete(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,
      ...ParticipantCallSidPath,
    ):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;
  }

  @tag(CONFERENCE_RECORDINGS_TAG)
  @friendlyName("Conference Recordings")
  @route("/{ConferenceSid}/Recordings")
  interface ConferenceRecordings {
    @operationId("list_conference_recordings")
    @summary("List Conference Recordings")
    @doc("""
      Lists the saved voice recordings associated with one conference. Use the account-level [Recordings](/docs/compatibility-api/rest/recordings/list-recordings) collection to browse media across calls and conferences, or Video [Room Recordings](/docs/apis/rest/video/room-recordings/list-room-recordings) for video-room media.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,

      @query
      @doc("Shows recordings that were created on the date provided. Format: YYYY-MM-DD.")
      @example("2024-01-15")
      DateCreated?: string,

      @query("DateCreated<")
      @doc("Shows recordings that were created before the date provided. Format: YYYY-MM-DD.")
      @example("2024-01-15")
      DateCreatedBefore?: string,

      @query("DateCreated>")
      @doc("Shows recordings that were created after the date provided. Format: YYYY-MM-DD.")
      @example("2024-01-01")
      DateCreatedAfter?: string,

      @query
      @doc("The page number to retrieve. Page numbers are zero-indexed, so the first page is 0.")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results to return per page. The default is 50, and the maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("A token used to retrieve a specific page of results. Must start with PA or PB.")
      @example("PA19e436af56884307b03bbdb2b42b8142")
      PageToken?: string,
    ):
      | ConferenceRecordingListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;

    @operationId("get_conference_recording")
    @summary("Get a Conference Recording")
    @doc("""
      Retrieves one voice-conference recording by conference SID and recording SID. Use [List Conference Recordings](/docs/compatibility-api/rest/conference-recordings/list-conference-recordings) to discover recording SIDs; Video Room recordings are separate media resources.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{Sid}")
    read(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,
      ...ConferenceRecordingSidPath,
    ):
      | ConferenceRecordingResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("update_conference_recording")
    @summary("Update a Conference Recording")
    @doc("""
      Pauses, resumes, or stops an in-progress voice-conference recording. When pausing, choose whether the elapsed interval becomes silence in the media or is skipped. This controls recording state; use [Get a Conference Recording](/docs/compatibility-api/rest/conference-recordings/get-conference-recording) to retrieve saved recording details.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    @route("/{Sid}")
    update(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,
      ...ConferenceRecordingSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateConferenceRecordingRequest,
    ):
      | ConferenceRecordingResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422StringArray
      | CompatibilityStatusCode503;

    @operationId("delete_conference_recording")
    @summary("Delete a Conference Recording")
    @doc("""
      Deletes one saved voice-conference recording by conference SID and recording SID, returning no body on success. This removes recording media without changing the conference or its participants. Video Room recordings have a separate delete operation.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @delete
    @route("/{Sid}")
    delete(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,
      ...ConferenceRecordingSidPath,
    ):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;
  }

  @tag(CONFERENCE_STREAMS_TAG)
  @friendlyName("Conference Streams")
  @route("/{ConferenceSid}/Streams")
  interface ConferenceStreams {
    @operationId("create_conference_stream")
    @summary("Create a Conference Stream")
    @doc("""
      Starts sending selected audio tracks from an active voice conference to a secure WebSocket endpoint. Use it for live conference-audio processing; use [Call Streams](/docs/compatibility-api/rest/streams/create-stream) for one call or [Video Room Streams](/docs/apis/rest/video/streams/list-room-streams) for RTMP video broadcasts.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    create(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateConferenceStreamRequest,
    ):
      | ConferenceStreamResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422StringArray;

    @operationId("update_conference_stream")
    @summary("Update Conference Stream")
    @doc("""
      Stops an active WebSocket audio stream for a voice conference by stream SID. This ends media delivery without ending the conference. Call audio streams and Video RTMP streams use separate operations.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    @route("/{Sid}")
    update(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,
      ...ConferenceStreamSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateConferenceStreamRequest,
    ):
      | ConferenceStreamResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422StringArray;
  }
}
