import "../../../types/status-codes";

@example(#{
    errors: #[#{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "A required parameter is missing from the request. Please refer to the technical reference for a complete list of parameters.",
      attribute: "ttl",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#missing_required_parameter"
    }],
  })
model ChatToken422Error is Types.StatusCodes.StatusCode422;