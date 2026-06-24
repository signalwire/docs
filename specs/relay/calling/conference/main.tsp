import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/conference.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/** Adds this call to an ad-hoc audio conference, creating the conference if it does not already exist. RELAY and cXML calls can share the same conference. Use this to bridge multiple callers together with options like recording, hold music, participant limits, and status callbacks. */
@channel("calling.join_conference")
@summary("Join an ad-hoc audio conference")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    name: "my_conference",
    muted: false,
    beep: "onEnter",
    start_on_enter: true,
    end_on_exit: false,
    wait_url: "https://hold_music.example/hold_music.wav",
    max_participants: 3,
    record: "record-from-start",
    region: "eu",
    trim: "do-not-trim",
    coach: "123-123-123-123",
    status_callback: "https://my_callback.example/update_conference_status",
    status_callback_event: "start end join leave",
    status_callback_method: "POST",
    recording_status_callback: "https://my_callback.example/update_recording_status",
    recording_status_callback_event: "in-progress completed",
    recording_status_callback_method: "POST",
    stream: #{
      url: "wss://example.com/conference-audio",
      name: "conference_bot",
      codec: "PCMU",
      authorization_bearer_token: "my-token",
      custom_parameters: #{ conference_name: "my_conference" },
    },
  },
  returnType: #{ code: "200", message: "Joining conference" },
})
op joinConference(...JoinConferenceParams): JoinConferenceResult | ConferenceEvent;

/** Removes this call from an audio conference it has joined. Use the `conference_id` you received from `calling.conference` events. */
@channel("calling.leave_conference")
@summary("Leave an audio conference")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    conference_id: "f2b9e8a1-...",
  },
  returnType: #{ code: "200", message: "Leaving conference" },
})
op leaveConference(...LeaveConferenceParams): LeaveConferenceResult | ConferenceEvent;
