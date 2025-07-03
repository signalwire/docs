import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[#{
    type: "validation_error",
    code: "invalid_parameter",
    message: "Invalid chunking_strategy",
    attribute: "chunking_strategy",
    url: "https://developer.signalwire.com/rest/overview/error-codes#{code}"
  }],
})
model CreateStatusCode422 is StatusCode422;

@example(#{
  errors: #[#{
    type: "validation_error",
    code: "invalid_parameter",
    message: "Invalid tags",
    attribute: "tags",
    url: "https://developer.signalwire.com/rest/overview/error-codes#{code}"
  }],
})
model SearchStatusCode422 is StatusCode422;
