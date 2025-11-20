import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "contents is required",
      attribute: "contents",
      url: "/rest/signalwire-rest/overview/error-codes#field-missing-required-parameter",
    }
  ],
})
model CXMLScriptCreateStatusCode422 is StatusCode422;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter_value",
      message: "contents must be valid cXML",
      attribute: "contents",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter",
    }
  ],
})
model CXMLScriptUpdateStatusCode422 is StatusCode422;
