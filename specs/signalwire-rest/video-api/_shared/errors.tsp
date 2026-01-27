import "../../types/status-codes";

using Types.StatusCodes;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Name must be present",
      attribute: "name",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter",
    }
  ],
})
model VideoStatusCode422 is StatusCode422;
