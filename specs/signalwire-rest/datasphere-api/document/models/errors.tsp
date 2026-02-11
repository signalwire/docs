import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Invalid chunking_strategy",
      attribute: "chunking_strategy",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter",
    }
  ],
})
model CreateStatusCode422 is StatusCode422;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Invalid tags",
      attribute: "tags",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter",
    }
  ],
})
model SearchStatusCode422 is StatusCode422;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Invalid tags",
      attribute: "tags",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter",
    }
  ],
})
model UpdateStatusCode422 is StatusCode422;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Invalid page_token",
      attribute: "page_token",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter",
    }
  ],
})
model ListStatusCode422 is StatusCode422;
