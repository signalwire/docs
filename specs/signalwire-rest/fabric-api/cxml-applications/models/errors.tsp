import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "display_name is required",
      attribute: "display_name",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#missing_required_parameter",
    }
  ],
})
model CxmlApplicationCreateStatusCode422 is StatusCode422;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter_value",
      message: "voice_url must be a valid URL",
      attribute: "voice_url",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#invalid_parameter_value",
    }
  ],
})
model CxmlApplicationUpdateStatusCode422 is StatusCode422;
