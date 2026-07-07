import "@signalwire/typespec-asyncapi";
import "@typespec/openapi";

import "../../events/shared.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("""
  Receive-only. Fires when a new inbound call arrives on a context you're
  subscribed to (subscribe via the `contexts` you pass to `signalwire.connect`).
  This is how your application learns about incoming calls it can answer and
  control — you don't send anything to receive it. The payload tells you who is
  calling and on which context.
  """)
@channel(callingCallReceive)
@summary("Receive inbound calls on a subscribed context")
@extension("x-fern-display-name", callingCallReceive)
op receiveCall(): CallReceiveEvent;

@doc("""
  Receive-only. Fires every time a call changes state — created, ringing, answered,
  ending, ended — both for calls you place and for inbound calls on your subscribed
  contexts. Track a call through its lifecycle here, and match `tag` to the call you
  placed.
  """)
@channel(callingCallState)
@summary("Receive call-state changes")
@extension("x-fern-display-name", callingCallState)
op callState(): CallStateEvent;
