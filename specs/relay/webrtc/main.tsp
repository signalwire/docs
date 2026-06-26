import "@signalwire/typespec-asyncapi";

import "./operations/message/main.tsp";
import "./events/message.tsp";

using SignalWire.AsyncAPI;

@doc("""
  The Relay **WebRTC** service carries WebRTC signaling. You use the `webrtc.verto`
  method to send a Verto frame between your client and SignalWire — this is how
  you place, answer, and modify peer calls. The service runs over a connection
  you've already established with `signalwire.connect`.

  You build and read Verto frames yourself (`verto.invite`/`verto.answer`/
  `verto.bye`/`verto.modify`, `dialogParams`, conference control). The frame
  payload is passed through as-is; the full set of Verto methods and their
  `params` is documented separately in `verto_messages.md`.

  **Audience:** client-side. The browser SDK exposes this for peer (Verto)
  calling; server-side code uses the `calling` service instead. Authenticate
  with a `jwt_token`.
  """)
namespace Relay.WebRTC;
