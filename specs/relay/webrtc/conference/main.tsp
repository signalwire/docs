import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

/**
 * List the active conferences you can join. Each entry gives you the name,
 * extension, and `node_id` you need to join. Takes no arguments.
 */
@channel("conference.list")
@summary("List joinable conferences")
@opExample(#{
  parameters: #{},
  returnType: #{
    code: "200",
    message: "Success",
    data: #[
      #{
        node_id: "f1d2c3b4-a596-4877-8b1e-0123456789ab",
        conference_id: "9a8b7c6d-5e4f-4a3b-2c1d-0fedcba98765",
        name: "Awesome Room!",
        extension: "5551234",
        timestamp: 1234567.1234,
      },
    ],
  },
})
op conferenceList(...ConferenceListParams): ConferenceListResult;
