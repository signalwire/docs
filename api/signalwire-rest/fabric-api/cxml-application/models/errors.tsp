import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
    errors: #[#{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "Name is required",
      attribute: "name",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#missing_required_parameter"
    }],
  })
  model CxmlApplicationCreateStatusCode422 is StatusCode422;

  model CxmlApplicationUpdateStatusCode422 is CxmlApplicationCreateStatusCode422;
