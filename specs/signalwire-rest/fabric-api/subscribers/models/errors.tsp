import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[#{
    type: "validation_error",
    code: "missing_required_parameter",
    message: "Required parameter is missing",
    attribute: "password",
    url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#invalid_parameter"
  }],
})
model SubscriberCreateStatusCode422 is StatusCode422;

model SubscriberUpdateStatusCode422 is SubscriberCreateStatusCode422;

