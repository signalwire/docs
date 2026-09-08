import "../swml/calling";
import "../swml/messaging";
import "./fabric-api/_shared/const.tsp";

namespace SignalWireAPI;

@@example(SWML.Calling.SWMLObject, SWML_CONTENTS_EXAMPLE);

@@example(SWML.Messaging.SWMLObject, SWML_MESSAGING_CONTENTS_EXAMPLE);

union SWMLDocument {
  calling: SWML.Calling.SWMLObject,
  messaging: SWML.Messaging.SWMLObject,
}
