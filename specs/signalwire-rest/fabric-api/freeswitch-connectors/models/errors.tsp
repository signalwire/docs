import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "host is required",
      attribute: "host",
      url: "/rest/signalwire-rest/overview/error-codes#field-missing-required-parameter",
    }
  ],
})
model FreeswitchConnectorCreateStatusCode422 is StatusCode422;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter_value",
      message: "port must be between 1 and 65535",
      attribute: "port",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter",
    }
  ],
})
model FreeswitchConnectorUpdateStatusCode422 is StatusCode422;
