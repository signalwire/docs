import "../../../types/status-codes";

using Types.StatusCodes;

@example(#{
    errors: #[#{
      type: "validation_error",
      code: "http_url_required",
      message: "This value must be an HTTP or HTTPS URL.",
      attribute: "status_callback_url",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes/#http_url_required"
    }],
  })
  model SwmlWebhookCreateStatusCode422 is StatusCode422;

  model SwmlWebhookUpdateStatusCode422 is SwmlWebhookCreateStatusCode422;
