import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_channels",
      message: "contains an invalid channel selection",
      attribute: "channels",
      url: "https://signalwire.com/docs/apis/error-codes#invalid_channels",
    }
  ],
})
model AliasAddressCreateStatusCode422 is StatusCode422;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "taken",
      message: "has already been taken",
      attribute: "name",
      url: "https://signalwire.com/docs/apis/error-codes#taken",
    }
  ],
})
model AliasAddressUpdateStatusCode422 is StatusCode422;

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
model AliasAddressListStatusCode422 is StatusCode422;
