import "../../../types";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "name is required",
      attribute: "name",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-missing-required-parameter",
    }
  ],
})
model DomainApplicationCreateStatusCode422 is StatusCode422;
