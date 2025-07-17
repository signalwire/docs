import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "token is required",
      attribute: "token",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#missing_required_parameter",
    }
  ],
})
model EmbedTokenCreateStatusCode422 is StatusCode422;
