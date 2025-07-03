import "../../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[#{
    type: "validation_error",
    code: "invalid_parameter",
    message: "Ciphers are invalid",
    attribute: "ciphers",
    url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#invalid_parameter"
  }],
})
model SipEndpointCreateStatusCode422 is StatusCode422;

model SipEndpointUpdateStatusCode422 is SipEndpointCreateStatusCode422;

