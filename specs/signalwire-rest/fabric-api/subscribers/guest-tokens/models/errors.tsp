import "../../../../types/status-codes";

using Types.StatusCodes;

@example(#{
  errors: #[#{
    type: "validation_error",
    code: "must_belong_to_project",
    message: "The addresses must belong to the project",
    attribute: "allowed_addresses",
    url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#must_belong_to_project"
  }],
})
model GuestTokenCreateStatusCode422 is StatusCode422;
