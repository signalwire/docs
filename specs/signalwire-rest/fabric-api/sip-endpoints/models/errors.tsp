import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "username is required",
      attribute: "username",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#missing_required_parameter",
    }
  ],
})
model ResourceSipEndpointCreateStatusCode422 is StatusCode422;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter_value",
      message: "encryption must be one of: disabled, optional, required",
      attribute: "encryption",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#invalid_parameter_value",
    }
  ],
})
model ResourceSipEndpointUpdateStatusCode422 is StatusCode422;
