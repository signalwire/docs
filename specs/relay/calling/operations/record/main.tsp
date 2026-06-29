import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/record.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model RecordCallRequest is JsonRpcRequest<"calling.record", RecordParams>;
@reply model RecordCallReply is JsonRpcResponse<RecordResult>;

@doc("Records the audio of an active call. The result confirms recording started and the recording's URL arrives on a recording event when it finishes. You can run several recordings on the same call at once — give each its own `control_id`.")
@channel("calling.record")
@summary("Record a call")
op recordCall(...RecordCallRequest): RecordCallReply | CallRecordEvent;

model RecordPauseRequest is JsonRpcRequest<"calling.record.pause", RecordPauseParams>;
@reply model RecordPauseReply is JsonRpcResponse<RecordPauseResult>;

@doc("Pauses a recording you started with `calling.record`, identified by its `control_id`. Audio captured while paused is either dropped or kept as silence depending on `behavior`. Resume it later with `calling.record.resume`.")
@channel("calling.record.pause")
@summary("Pause an active recording")
op recordPause(...RecordPauseRequest): RecordPauseReply;

model RecordResumeRequest is JsonRpcRequest<"calling.record.resume", RecordResumeParams>;
@reply model RecordResumeReply is JsonRpcResponse<RecordResumeResult>;

@doc("Resumes a recording you paused with `calling.record.pause`, identified by its `control_id`. Audio capture picks back up where it left off.")
@channel("calling.record.resume")
@summary("Resume a paused recording")
op recordResume(...RecordResumeRequest): RecordResumeReply;

model RecordStopRequest is JsonRpcRequest<"calling.record.stop", RecordStopParams>;
@reply model RecordStopReply is JsonRpcResponse<RecordStopResult>;

@doc("Stops a recording you started with `calling.record`, identified by its `control_id`. Once stopped, the recording is finalized and its URL becomes available on the recording event.")
@channel("calling.record.stop")
@summary("Stop an active recording")
op recordStop(...RecordStopRequest): RecordStopReply;
