import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "token_expired",
      message: "Token has expired.",
      attribute: "refresh_token",
      url: "https://developer.signalwire.com/rest/overview/error-codes#token_expired"
    }
  ],
})
model RefreshTokenStatusCode422 is StatusCode422;
