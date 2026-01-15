using TypeSpec.Http;

model ConferencesAccountSidPath {
  @doc("The unique identifier for the account that created this conference.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  AccountSid: string;
}

model ConferenceSidPath {
  @doc("The unique identifier for this conference.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  Sid: string;
}

model ConferenceSidPathForParticipant {
  @doc("The unique identifier for the conference this participant is in.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  ConferenceSid: string;
}

model ParticipantCallSidPath {
  @doc("The unique identifier for the Participant call connected to this conference.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  CallSid: string;
}

@doc("Conference region.")
enum ConferenceRegion {
  Us1: "us1",
  Us2: "us2",
  Ie1: "ie1",
  De1: "de1",
  Sg1: "sg1",
  Br1: "br1",
  Au1: "au1",
  Jp1: "jp1",
}

@doc("Conference status.")
enum ConferenceStatus {
  Init: "init",
  InProgress: "in-progress",
  Completed: "completed",
}

@doc("Conference participant status.")
enum ParticipantStatus {
  Completed: "completed",
  InProgress: "in-progress",
}

@doc("Conference subresource URIs.")
model ConferenceSubresourceUris {
  @doc("Links to the participants.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Conferences/b3877c40-da60-4998-90ad-b792e98472cf/Participants.json")
  participants?: string;

  @doc("Links to the recordings.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Conferences/b3877c40-da60-4998-90ad-b792e98472cf/Recordings.json")
  recordings?: string;
}

@doc("Conference model.")
model Conference {
  @doc("The unique identifier for the account that created this conference.")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  account_sid?: string;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version?: string;

  @doc("The date, in RFC 2822 format, this conference was created.")
  @example("Mon, 24 Sept 2018 21:00:00 +0000")
  date_created?: string;

  @doc("The date, in RFC 2822 format, this conference was updated.")
  @example("Tue, 25 Sept 2018 20:00:00 +0000")
  date_updated?: string;

  @doc("A description, up to 64 characters, of the conference room.")
  @example("My Conference Room")
  friendly_name?: string;

    @doc("The region where this conference audio was mixed.")
    region?: ConferenceRegion;

    @doc("The unique identifier for this conference.")
    @example("b3877c40-da60-4998-90ad-b792e98472cf")
    sid?: string;

    @doc("The status of this conference.")
    status?: ConferenceStatus;

  @doc("The URI for this conference.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Conferences/b3877c40-da60-4998-90ad-b792e98472cf.json")
  uri?: string;

  @doc("The links to associated subresources.")
  subresource_uris?: ConferenceSubresourceUris;
}

@doc("Conference participant model.")
model ConferenceParticipant {
  @doc("The unique identifier for the account that created this conference.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  account_sid?: string;

  @doc("The unique identifier for the Participant call connected to this conference.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  call_sid?: string;

  @doc("The unique identifier of the participant who is being coached.")
  @format("uuid")
  call_sid_to_coach?: string;

  @doc("Whether the participant is coaching another call.")
  @example(false)
  coaching?: boolean;

  @doc("The unique identifier for the conference this participant is in.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472cf")
  conference_sid?: string;

  @doc("The date, in RFC 2822 format, this conference participant was created.")
  @example("Mon, 24 Sept 2018 21:00:00 +0000")
  date_created?: string;

  @doc("The status of the conference call.")
  status?: ParticipantStatus;

  @doc("The date, in RFC 2822 format, this conference participant was updated.")
  @example("Tue, 25 Sept 2018 20:00:00 +0000")
  date_updated?: string;

  @doc("Whether or not a conference ends when a participant leaves the conference call.")
  @example(false)
  end_conference_on_exit?: boolean;

  @doc("Whether or not a participant is muted.")
  @example(false)
  muted?: boolean;

  @doc("Whether or not a participant is on hold.")
  @example(false)
  hold?: boolean;

  @doc("Whether or not a conference will begin when this participant enters the conference call.")
  @example(true)
  start_conference_on_enter?: boolean;

  @doc("The URI for this conference participant.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Conferences/b3877c40-da60-4998-90ad-b792e98472cf/Participants/b3877c40-da60-4998-90ad-b792e98472ca.json")
  uri?: string;
}

@doc("Conference stream model.")
model ConferenceStream {
  @doc("The unique identifier for the account.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  account_sid?: string;

  @doc("The unique identifier for the conference.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472cf")
  conference_sid?: string;

  @doc("The date, in RFC 2822 GMT format, this stream was created.")
  @example("Mon, 24 Sept 2018 21:00:00 +0000")
  date_created?: string;

  @doc("The date, in RFC 2822 GMT format, this stream was updated.")
  @example("Tue, 25 Sept 2018 20:00:00 +0000")
  date_updated?: string;

  @doc("The name of the stream.")
  @example("my_conference_stream")
  name?: string;

  @doc("The unique identifier for the stream.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472st")
  sid?: string;

  @doc("The status of the stream.")
  @example("in-progress")
  status?: string;

  @doc("The URI for the stream.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Conferences/b3877c40-da60-4998-90ad-b792e98472cf/Streams/b3877c40-da60-4998-90ad-b792e98472st.json")
  uri?: string;
}
