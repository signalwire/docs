import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model BindDigitRequest is JsonRpcRequest<"calling.bind_digit", BindDigitParams>;
@reply model BindDigitReply is JsonRpcResponse<BindDigitResult>;

@doc("Runs a call method automatically when the caller presses a specific DTMF digit sequence — for example, play a message when they press `*1`.")
@channel("calling.bind_digit")
@summary("Trigger a call method when a DTMF sequence is pressed")
op bindDigit(...BindDigitRequest): BindDigitReply;

model ClearDigitBindingsRequest is JsonRpcRequest<"calling.clear_digit_bindings", ClearDigitBindingsParams>;
@reply model ClearDigitBindingsReply is JsonRpcResponse<ClearDigitBindingsResult>;

@doc("Removes digit bindings previously set with `calling.bind_digit`. Clears every binding on the call, or only those in a given `realm`.")
@channel("calling.clear_digit_bindings")
@summary("Clear digit bindings")
op clearDigitBindings(...ClearDigitBindingsRequest): ClearDigitBindingsReply;
