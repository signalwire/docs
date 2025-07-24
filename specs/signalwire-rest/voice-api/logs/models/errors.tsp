import "../../../types/status-codes/main.tsp";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Parameter value is invalid",
      attribute: "page_size",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#invalid_parameter",
    }
  ],
})
model VoiceLogsListStatusCode422 is StatusCode422;
