import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  statusCode: 422,
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

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "account_error",
      code: "exceeds_history_logs_limit",
      message: "The value exceeds the 2025-02-09 date limit.",
      attribute: "created_at",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#exceeds_history_logs_limit",
    }
  ],
})
model MessageLogShowStatusCode422 is StatusCode422;
