import "../../../types";

using Types.StatusCodes;

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_resource_for_handler",
      message: "is not valid for a calling handler",
      attribute: "resource_id",
      url: "https://signalwire.com/docs/apis/error-codes",
    }
  ],
})
model WhatsAppRouteAssignStatusCode422 is StatusCode422;
