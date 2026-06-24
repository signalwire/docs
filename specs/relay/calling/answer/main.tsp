import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/** Answers an incoming call so audio begins flowing and you can start controlling it. */
@channel("calling.answer")
@summary("Answer an incoming call")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    codecs: #["PCMU", "PCMA"],
  },
  returnType: #{ code: "200", message: "Answered" },
})
op answer(...AnswerParams): AnswerResult;
