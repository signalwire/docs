import "../../../types/status-codes";

using Types.StatusCodes;

namespace SignalWireAPI.Message;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_from_number",
      message: "From must be a valid purchased phone number or WhatsApp business number from your SignalWire project.",
      attribute: "from",
      url: "https://developer.signalwire.com/rest/overview/error-codes/#invalid_from_number",
    }
  ],
})
model MessagesCreateStatusCode422 is StatusCode422;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "body_must_be_empty",
      message: "must be an empty string to redact the message",
      attribute: "body",
      url: "https://developer.signalwire.com/rest/overview/error-codes/#body_must_be_empty",
    },
    #{
      type: "validation_error",
      code: "cannot_redact_in_progress_message",
      message: "Cannot redact a message that is in progress.",
      attribute: "base",
      url: "https://developer.signalwire.com/rest/overview/error-codes/#cannot_redact_in_progress_message",
    }
  ],
})
model MessagesUpdateStatusCode422 is StatusCode422;
