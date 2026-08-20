import "../swml/calling";
import "../swml/messaging";

namespace SignalWireAPI;

union SWMLDocument {
  calling: SWML.Calling.SWMLObject,
  messaging: SWML.Messaging.SWMLObject,
}
