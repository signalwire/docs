import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "Name is required",
      attribute: "name",
      url: "https://signalwire.com/docs/apis/error-codes#missing_required_parameter",
    }
  ],
})
model SipAddressCreateStatusCode422 is StatusCode422;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Encryption must be one of: required, optional, forbidden",
      attribute: "encryption",
      url: "https://signalwire.com/docs/apis/error-codes#invalid_parameter",
    }
  ],
})
model SipAddressUpdateStatusCode422 is StatusCode422;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "page_token_is_invalid",
      message: "Page token is invalid",
      attribute: null,
      url: "https://signalwire.com/docs/apis/error-codes#page_token_is_invalid",
    }
  ],
})
model SipAddressListStatusCode422 is StatusCode422;
