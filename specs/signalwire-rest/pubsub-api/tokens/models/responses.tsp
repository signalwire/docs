import "../../../types/status-codes";

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "not_a_valid_json",
      message: "Permissions must be valid JSON",
      attribute: "permissions",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#not_a_valid_json",
    }
  ],
})
model PubSubToken422Error is Types.StatusCodes.StatusCode422;
