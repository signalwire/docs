import "../../../types";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "phone_number is required",
      attribute: "phone_number",
      url: "/rest/signalwire-rest/overview/error-codes#field-missing-required-parameter",
    }
  ],
})
model PhoneRouteCreateStatusCode422 is StatusCode422;
