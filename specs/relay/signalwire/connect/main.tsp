import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

/**
 * Authenticate and open your Relay connection. Call this first, before any other
 * Relay command: send your credentials and protocol version, and you get back your
 * `identity`, `authorization`, the `protocol` to use on later requests, and ICE
 * servers for media. Right after a successful connect you also receive a
 * `signalwire.authorization.state` event — save its `authorization_state` so you
 * can restore your session if you need to reconnect.
 */
@channel("signalwire.connect")
@summary("Authenticate and establish a Relay connection")
@opExample(#{
  parameters: #{
    version: #{ major: 3, minor: 0, revision: 0 },
    authentication: #{ jwt_token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...." },
    agent: "somesdk-1.2.3",
    protocol: "signalwire_........",
    authorization_state: "<encryptedAuthStateBase64>:<tagBase64>",
    contexts: #["office"],
  },
  returnType: #{
    identity: "c1a2b3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d",
    authorization: #{},
    protocol: "signalwire_........",
    ice_servers: #[
      #{
        urls: #["turn1.signalwire.com", "turn2.signalwire.com"],
        credential: "<HMACSHA1Base64>",
        credentialType: "password",
        username: "<expiration>:<projectid>",
      }
    ],
  },
})
op connect(...ConnectParams): ConnectResult | AuthorizationStateEvent;
