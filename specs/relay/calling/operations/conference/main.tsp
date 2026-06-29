import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/conference.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model JoinConferenceRequest is JsonRpcRequest<"calling.join_conference", JoinConferenceParams>;
@reply model JoinConferenceReply is JsonRpcResponse<JoinConferenceResult>;

@doc("Adds this call to an ad-hoc audio conference, creating the conference if it does not already exist. RELAY and cXML calls can share the same conference. Use this to bridge multiple callers together with options like recording, hold music, participant limits, and status callbacks.")
@channel("calling.join_conference")
@summary("Join an ad-hoc audio conference")
op joinConference(...JoinConferenceRequest): JoinConferenceReply | ConferenceEvent;

model LeaveConferenceRequest is JsonRpcRequest<"calling.leave_conference", LeaveConferenceParams>;
@reply model LeaveConferenceReply is JsonRpcResponse<LeaveConferenceResult>;

@doc("Removes this call from an audio conference it has joined. Use the `conference_id` you received from `calling.conference` events.")
@channel("calling.leave_conference")
@summary("Leave an audio conference")
op leaveConference(...LeaveConferenceRequest): LeaveConferenceReply | ConferenceEvent;
