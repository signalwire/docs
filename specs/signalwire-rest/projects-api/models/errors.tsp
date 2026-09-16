import "../../types/status-codes";

using Types.StatusCodes;

namespace SignalWireAPI.Projects;

@doc("""
  The request could not be processed. Creating while authenticated as a subproject, or
  naming a subproject as `parent_project_id`, returns `nested_subprojects_not_allowed`.
  A `parent_project_id` the caller cannot reach returns `invalid_parent_project_id`. A
  blank or overly long `name` returns a standard validation error.
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
  The request could not be processed. Deleting a root project with a project API token
  returns `only_subprojects_can_be_deleted`. Deleting a project that still has
  subprojects returns `subprojects_must_be_removed`, one that still has phone numbers
  returns `phone_numbers_must_be_removed`, and the last project in a space returns
  `last_project_cannot_be_deleted`.
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
