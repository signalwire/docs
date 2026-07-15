import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingJoinConference = "calling.join_conference";
const callingJoinConferenceResponse = "${callingJoinConference} response";

model JoinConferenceRequest is JsonRpcRequest<typeof callingJoinConference, JoinConferenceParams>;

@extension("x-fern-display-name", callingJoinConferenceResponse)
@reply model JoinConferenceReply is JsonRpcResponse<JoinConferenceResult>;

@doc("Adds this call to an ad-hoc audio conference, creating the conference if it does not already exist. Relay and cXML calls can share the same conference. Use this to bridge multiple callers together with options like recording, hold music, participant limits, and status callbacks.")
@channel(callingJoinConference)
@summary("Join an ad-hoc audio conference")
@extension("x-fern-display-name", callingJoinConference)
op joinConference(...JoinConferenceRequest): JoinConferenceReply | ConferenceEvent;

const callingLeaveConference = "calling.leave_conference";
const callingLeaveConferenceResponse = "${callingLeaveConference} response";

model LeaveConferenceRequest is JsonRpcRequest<typeof callingLeaveConference, LeaveConferenceParams>;

@extension("x-fern-display-name", callingLeaveConferenceResponse)
@reply model LeaveConferenceReply is JsonRpcResponse<LeaveConferenceResult>;

@doc("Removes this call from an audio conference it has joined. Use the `conference_id` you received from `calling.conference` events.")
@channel(callingLeaveConference)
@summary("Leave an audio conference")
@extension("x-fern-display-name", callingLeaveConference)
op leaveConference(...LeaveConferenceRequest): LeaveConferenceReply | ConferenceEvent;
