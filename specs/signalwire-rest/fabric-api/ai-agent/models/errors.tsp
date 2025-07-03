import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
    errors: #[#{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "Name can't be blank",
      attribute: "name",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#missing_required_parameter"
    }],
  })
  model AIAgentCreateStatusCode422 is StatusCode422;

  model AIAgentUpdateStatusCode422 is AIAgentCreateStatusCode422;
