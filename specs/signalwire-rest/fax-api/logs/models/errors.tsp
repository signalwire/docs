import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Name must be present",
      attribute: "name",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#invalid_parameter",
    }
  ],
})
model FaxLogsListStatusCode422 is StatusCode422;