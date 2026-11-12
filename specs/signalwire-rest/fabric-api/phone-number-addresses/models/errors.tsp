import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "already_assigned",
      message: "is already assigned to a calling handler",
      attribute: "phone_number_id",
      url: "https://signalwire.com/docs/apis/error-codes#already_assigned",
    }
  ],
})
model PhoneNumberAddressCreateStatusCode422 is StatusCode422;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Name is invalid",
      attribute: "name",
      url: "https://signalwire.com/docs/apis/error-codes#invalid_parameter",
    }
  ],
})
model PhoneNumberAddressUpdateStatusCode422 is StatusCode422;

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
model PhoneNumberAddressListStatusCode422 is StatusCode422;
