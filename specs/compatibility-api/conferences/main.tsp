import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

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
      The ability to read all of the conferences that are associated with your Account. This will be returned as a list of conferences.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(
      ...ConferencesAccountSidPath,
      @query @doc("Shows conferences that were created on the date provided.") DateCreated?: string,
      @query @doc("Shows conferences that were updated on the date provided.") DateUpdated?: string,
      @query @doc("A description, up to 64 characters, of the conference room.") FriendlyName?: string,
      @query @doc("The status of this conference.") @example("completed") Status?: string,
    ): ConferenceListResponse | StatusCode401;

    @operationId("retrieve_conference")
    @summary("Retrieve a Conference")
    @doc("""
      Retrieve a single conference.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{Sid}")
    read(...ConferencesAccountSidPath, ...ConferenceSidPath): ConferenceResponse | StatusCode401 | StatusCode404;

    @operationId("update_conference")
    @summary("Update Conference")
    @doc("""
      Allows you to modify the properties of a conference.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    @route("/{Sid}")
    update(...ConferencesAccountSidPath, ...ConferenceSidPath, @body body: UpdateConferenceRequest): ConferenceResponse | StatusCode401 | StatusCode404;
  }

  @tag(CONFERENCE_PARTICIPANTS_TAG)
  @friendlyName("Conference Participants")
  @route("/{ConferenceSid}/Participants")
  interface ConferenceParticipants {
    @operationId("list_all_participants")
    @summary("List all active Participants")
    @doc("""
      The ability to read all of the active participants that are associated with this conference call. This will be returned as a list of participants.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(
      ...ConferencesAccountSidPath,
      ...ConferenceSidPathForParticipant,
      @query @doc("Whether or not a participant is muted.") Muted?: boolean,
      @query @doc("Whether or not a participant is on hold.") Hold?: boolean,
    ): ConferenceParticipantListResponse | StatusCode401;

    @operationId("retrieve_participant")
    @summary("Retrieve a Participant")
    @doc("""
      Retrieve a single participant.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{CallSid}")
    read(...ConferencesAccountSidPath, ...ConferenceSidPathForParticipant, ...ParticipantCallSidPath): ConferenceParticipantResponse | StatusCode401 | StatusCode404;

    @operationId("update_participant")
    @summary("Update a Participant")
    @doc("""
      Update a participant.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    @route("/{CallSid}")
    update(...ConferencesAccountSidPath, ...ConferenceSidPathForParticipant, ...ParticipantCallSidPath, @body body: UpdateConferenceParticipantRequest): ConferenceParticipantResponse | StatusCode401 | StatusCode404;

    @operationId("delete_participant")
    @summary("Delete a Participant")
    @doc("""
      Deleting a participant will take them out of a conference call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    @route("/{CallSid}")
    delete(...ConferencesAccountSidPath, ...ConferenceSidPathForParticipant, ...ParticipantCallSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }

  @tag(CONFERENCE_STREAMS_TAG)
  @friendlyName("Conference Streams")
  @route("/{ConferenceSid}/Streams")
  interface ConferenceStreams {
    @operationId("list_conference_streams")
    @summary("List Conference Streams")
    @doc("""
      List all streams for a conference.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(...ConferencesAccountSidPath, ...ConferenceSidPathForParticipant): ConferenceStreamListResponse | StatusCode401;

    @operationId("create_conference_stream")
    @summary("Create a Conference Stream")
    @doc("""
      Create a stream for a conference.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    create(...ConferencesAccountSidPath, ...ConferenceSidPathForParticipant, @body body: CreateConferenceStreamRequest): ConferenceStreamResponse | StatusCode401 | StatusCode400;

    @operationId("get_conference_stream")
    @summary("Retrieve a Conference Stream")
    @doc("""
      Retrieve a stream for a conference.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{Sid}")
    read(...ConferencesAccountSidPath, ...ConferenceSidPathForParticipant, ...ConferenceSidPath): ConferenceStreamResponse | StatusCode401 | StatusCode404;

    @operationId("delete_conference_stream")
    @summary("Delete a Conference Stream")
    @doc("""
      Delete a stream for a conference.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    @route("/{Sid}")
    delete(...ConferencesAccountSidPath, ...ConferenceSidPathForParticipant, ...ConferenceSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }
}
