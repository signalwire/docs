import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "datetime_required",
      message: "This value must be a DateTime",
      attribute: "created_before",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#datetime_required",
    }
  ],
})
model MessageLogsListStatusCode422 is StatusCode422;
