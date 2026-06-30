import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingBindDigit = "calling.bind_digit";
const callingBindDigitResponse = "${callingBindDigit} response";

model BindDigitRequest is JsonRpcRequest<typeof callingBindDigit, BindDigitParams>;

@extension("x-fern-display-name", callingBindDigitResponse)
@reply model BindDigitReply is JsonRpcResponse<BindDigitResult>;

@doc("Runs a call method automatically when the caller presses a specific DTMF digit sequence — for example, play a message when they press `*1`.")
@channel(callingBindDigit)
@summary("Trigger a call method when a DTMF sequence is pressed")
@extension("x-fern-display-name", callingBindDigit)
op bindDigit(...BindDigitRequest): BindDigitReply;

const callingClearDigitBindings = "calling.clear_digit_bindings";
const callingClearDigitBindingsResponse = "${callingClearDigitBindings} response";

model ClearDigitBindingsRequest is JsonRpcRequest<typeof callingClearDigitBindings, ClearDigitBindingsParams>;

@extension("x-fern-display-name", callingClearDigitBindingsResponse)
@reply model ClearDigitBindingsReply is JsonRpcResponse<ClearDigitBindingsResult>;

@doc("Removes digit bindings previously set with `calling.bind_digit`. Clears every binding on the call, or only those in a given `realm`.")
@channel(callingClearDigitBindings)
@summary("Clear digit bindings")
@extension("x-fern-display-name", callingClearDigitBindings)
op clearDigitBindings(...ClearDigitBindingsRequest): ClearDigitBindingsReply;
