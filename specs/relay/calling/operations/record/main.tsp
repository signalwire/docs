import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingRecord = "calling.record";
const callingRecordResponse = "${callingRecord} response";

model RecordCallRequest is JsonRpcRequest<typeof callingRecord, RecordParams>;
@extension("x-fern-display-name", callingRecordResponse)
@reply model RecordCallReply is JsonRpcResponse<RecordResult>;

@doc("Records the audio of an active call. The result confirms recording started and the recording's URL arrives on a recording event when it finishes. You can run several recordings on the same call at once — give each its own `control_id`.")
@channel(callingRecord)
@summary("Record a call")
@extension("x-fern-display-name", callingRecord)
op recordCall(...RecordCallRequest): RecordCallReply | CallRecordEvent;

const callingRecordPause = "calling.record.pause";
const callingRecordPauseResponse = "${callingRecordPause} response";

model RecordPauseRequest is JsonRpcRequest<typeof callingRecordPause, RecordPauseParams>;
@extension("x-fern-display-name", callingRecordPauseResponse)
@reply model RecordPauseReply is JsonRpcResponse<RecordPauseResult>;

@doc("Pauses a recording you started with `calling.record`, identified by its `control_id`. Audio captured while paused is either dropped or kept as silence depending on `behavior`. Resume it later with `calling.record.resume`.")
@channel(callingRecordPause)
@summary("Pause an active recording")
@extension("x-fern-display-name", callingRecordPause)
op recordPause(...RecordPauseRequest): RecordPauseReply;

const callingRecordResume = "calling.record.resume";
const callingRecordResumeResponse = "${callingRecordResume} response";

model RecordResumeRequest is JsonRpcRequest<typeof callingRecordResume, RecordResumeParams>;
@extension("x-fern-display-name", callingRecordResumeResponse)
@reply model RecordResumeReply is JsonRpcResponse<RecordResumeResult>;

@doc("Resumes a recording you paused with `calling.record.pause`, identified by its `control_id`. Audio capture picks back up where it left off.")
@channel(callingRecordResume)
@summary("Resume a paused recording")
@extension("x-fern-display-name", callingRecordResume)
op recordResume(...RecordResumeRequest): RecordResumeReply;

const callingRecordStop = "calling.record.stop";
const callingRecordStopResponse = "${callingRecordStop} response";

model RecordStopRequest is JsonRpcRequest<typeof callingRecordStop, RecordStopParams>;
@extension("x-fern-display-name", callingRecordStopResponse)
@reply model RecordStopReply is JsonRpcResponse<RecordStopResult>;

@doc("Stops a recording you started with `calling.record`, identified by its `control_id`. Once stopped, the recording is finalized and its URL becomes available on the recording event.")
@channel(callingRecordStop)
@summary("Stop an active recording")
@extension("x-fern-display-name", callingRecordStop)
op recordStop(...RecordStopRequest): RecordStopReply;
