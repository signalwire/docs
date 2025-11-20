import "../../../types";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "phone_number is required",
      attribute: "phone_number",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-missing-required-parameter",
    }
  ],
})
model PhoneRouteCreateStatusCode422 is StatusCode422;
