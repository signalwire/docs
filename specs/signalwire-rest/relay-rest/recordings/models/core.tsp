import "../../../types";

using TypeSpec.Http;
using Types;

model RecordingPathID {
  @doc("Unique ID of the recording.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

@doc("Base recording properties shared by all recording types.")
model RecordingBase {
  @doc("Unique ID of the recording.")
  @example("d369a402-7b43-4512-8735-9d5e1f387814")
  id: uuid;

  @doc("Unique ID of the project.")
  @example("d369a402-7b43-4512-8735-9d5e1f387814")
  project_id: uuid;

  @doc("Date and time when the recording was created.")
  created_at: utcDateTime;

  @doc("Date and time when the recording was last updated.")
  updated_at: utcDateTime;

  @doc("Duration of the recording in seconds.")
  @example(2)
  duration_in_seconds: int32;

  @doc("Error code if the recording failed.")
  error_code?: string;

  @doc("Price of the recording.")
  @example(0.05)
  price: float64;

  @doc("Currency unit for the price.")
  @example("USD")
  price_unit: string;

  @doc("Status of the recording. A finished recording reports `finished`; one that captured nothing reports `no_input`, and a failed one carries an `error_code`.")
  @example("finished")
  status: string;

  @doc("""
    Path to the recording resource, relative to your Space. Requesting it returns this JSON
    metadata, not audio. Append a format suffix to download the media: `<url>.wav` or `<url>.mp3`.
    Those suffixed paths are API routes and always require your API credentials, whatever the
    project's Media URL protection setting. The recording's `calling.call.record` status callback
    carries a second, direct URL on `files.signalwire.com`; that one is the URL Media URL protection
    governs, and it is publicly fetchable while the setting is off.
    """)
  @example("/api/relay/rest/recordings/d369a402-7b43-4512-8735-9d5e1f387814")
  url: string;

  @doc("Indicates whether the recording is stereo.")
  @example(false)
  stereo: boolean;

  @doc("Size of the recording file in bytes.")
  @example(10)
  byte_size?: int32;

  @doc("Audio track of the recording.")
  @example("inbound")
  track: string;
}

@doc("Recording from a PSTN call leg.")
model PstnRecording {
  ...RecordingBase;

  @doc("Unique ID of the Relay conference the recording belongs to, if any.")
  @example("0089cc48-4f98-4a6b-90d8-61f8a5d1b0e3")
  relay_conference_id?: uuid;

  @doc("ID of the PSTN leg associated with the recording.")
  relay_pstn_leg_id: uuid;
}

@doc("Recording from a SIP call leg.")
model SipRecording {
  ...RecordingBase;

  @doc("Unique ID of the Relay conference the recording belongs to, if any.")
  @example("0089cc48-4f98-4a6b-90d8-61f8a5d1b0e3")
  relay_conference_id?: uuid;

  @doc("ID of the SIP leg associated with the recording.")
  relay_sip_leg_id: uuid;
}

@doc("Recording from a WebRTC call leg.")
model WebRtcRecording {
  ...RecordingBase;

  @doc("Unique ID of the Relay conference the recording belongs to, if any.")
  @example("0089cc48-4f98-4a6b-90d8-61f8a5d1b0e3")
  relay_conference_id?: uuid;

  @doc("ID of the WebRTC leg associated with the recording.")
  relay_webrtc_leg_id: uuid;
}

@doc("Recording from a Relay conference.")
model ConferenceRecording {
  ...RecordingBase;

  @doc("Unique ID of the Relay conference the recording belongs to.")
  @example("0089cc48-4f98-4a6b-90d8-61f8a5d1b0e3")
  relay_conference_id: uuid;
}

@doc("Recording model. A recording is associated with exactly one source type (PSTN, SIP, WebRTC, or Relay conference).")
union Recording {
  pstn: PstnRecording,
  sip: SipRecording,
  webrtc: WebRtcRecording,
  conference: ConferenceRecording,
}
