import "../../../types/status-codes";

using Types.StatusCodes;

namespace SignalWireAPI.Project;


@doc("""
  The request failed validation. A `project_id` the Personal Access Token holder cannot
  reach returns `invalid_project_id`, and a `subproject_id` that is not a child of the
  resolved project returns `invalid_subproject_id`. A blank `name` or an empty
  `permissions` array returns a standard validation error.
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Name must be present",
      attribute: "name",
      url: "https://signalwire.com/docs/apis/error-codes",
    }
  ],
})
model TokenStatusCode422 is StatusCode422;
