import "../../../types/status-codes";

using Types.StatusCodes;

namespace SignalWireAPI.Project;


@doc("""
  The request failed validation. A `project_id` the Personal access token holder cannot
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

@doc("""
  A pagination parameter is invalid. A `page_token` that is not a cursor from a previous
  response returns `page_token_is_invalid`, and a `page_number` above 0 without a
  `page_token` returns `page_token_required_for_next_page`. A `page_size` outside 1 to
  1000, a `page_number` that is negative or not an integer, or a `project_id` that is
  not a single value returns `invalid_parameter`.
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "page_token_is_invalid",
      message: "The provided page token is not valid.",
      attribute: "page_token",
      url: "https://signalwire.com/docs/apis/error-codes#page_token_is_invalid",
    }
  ],
})
model ListTokensStatusCode422 is StatusCode422;
