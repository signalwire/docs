import "@signalwire/typespec-asyncapi";

import "./models/core.tsp";
import "./operations/send/main.tsp";
import "./events/receive.tsp";
import "./events/state.tsp";

using SignalWire.AsyncAPI;

@doc("""
  Send SMS and MMS messages to phone numbers and react to incoming messages and
  delivery updates. Call `messaging.send` to send a message, then listen for
  `messaging.state` events to track delivery and `messaging.receive` events to
  handle replies. Messages are grouped by a **context** you choose, so you can
  route events for different parts of your app to different handlers.

  Use this from your server. Browser clients send messages through the REST API
  instead.
  """)
namespace Relay.Messaging;
