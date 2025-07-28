import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "contents is required",
      attribute: "contents",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#missing_required_parameter",
    }
  ],
})
model SwmlScriptCreateStatusCode422 is StatusCode422;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter_value",
      message: "contents must be valid SWML JSON",
      attribute: "contents",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#invalid_parameter_value",
    }
  ],
})
model SwmlScriptUpdateStatusCode422 is StatusCode422;
