import "../../types/status-codes";

using Types.StatusCodes;

namespace SignalWireAPI.Projects;

@doc("""
  The request could not be processed. When creating a project while authenticated as a
  subproject, the response includes the `nested_subprojects_not_allowed` code. A blank or
  overly long `name` returns a standard validation error.
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "nested_subprojects_not_allowed",
      message: "Subprojects can only be created under a top-level project.",
      attribute: null,
      url: "https://signalwire.com/docs/apis/error-codes#nested_subprojects_not_allowed",
    }
  ],
})
model CreateProjectStatusCode422 is StatusCode422;

@doc("""
  The request could not be processed. Deleting a root/parent project returns
  `only_subprojects_can_be_deleted`, and deleting a project that still has phone numbers
  assigned returns `phone_numbers_must_be_removed`.
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "phone_numbers_must_be_removed",
      message: "All phone numbers must be removed from the project before it can be deleted.",
      attribute: null,
      url: "https://signalwire.com/docs/apis/error-codes#phone_numbers_must_be_removed",
    }
  ],
})
model DeleteProjectStatusCode422 is StatusCode422;

@doc("The request failed validation, for example a blank or overly long `name`.")
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Name must be present",
      attribute: "name",
      url: "https://signalwire.com/docs/apis/error-codes#invalid_parameter",
    }
  ],
})
model UpdateProjectStatusCode422 is StatusCode422;
