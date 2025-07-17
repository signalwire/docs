import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "title is required",
      attribute: "title",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#missing_required_parameter",
    }
  ],
})
model CallFlowCreateStatusCode422 is StatusCode422;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter_value",
      message: "document_version must be greater than current version",
      attribute: "document_version",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#invalid_parameter_value",
    }
  ],
})
model CallFlowUpdateStatusCode422 is StatusCode422;
