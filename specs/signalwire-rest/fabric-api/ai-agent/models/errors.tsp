import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "Name can't be blank",
      attribute: "name",
      url: "/rest/signalwire-rest/overview/error-codes#field-missing-required-parameter",
    }
  ],
})
model AIAgentCreateStatusCode422 is StatusCode422;

model AIAgentUpdateStatusCode422 is AIAgentCreateStatusCode422;
