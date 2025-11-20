import "../../../../types";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "username is required",
      attribute: "username",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-missing-required-parameter",
    }
  ],
})
model ResourceSubSipEndpointCreateStatusCode422 is StatusCode422;
