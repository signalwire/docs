import "../../../types/status-codes";

using Types.StatusCodes;

namespace SignalWireAPI.Space;

@doc("The `role` filter is not a known role (`unknown_role`); `page_number` is above 0 without a `page_token` (`page_token_required_for_next_page`), or the `page_token` is not one this endpoint issued (`page_token_is_invalid`).")
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "unknown_role",
      message: "Role is not a known role.",
      attribute: "role",
      url: "https://signalwire.com/docs/apis/error-codes#unknown_role",
    }
  ],
})
model ListMembersStatusCode422 is StatusCode422;

@doc("""
  The invited email already belongs to a member of the space (`already_a_member`), the
  `role` is not `admin` or `employee` (`invalid_role`), or the `email` is not a valid
  address.
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "already_a_member",
      message: "This email address already belongs to a member of the space.",
      attribute: "email",
      url: "https://signalwire.com/docs/apis/error-codes#already_a_member",
    }
  ],
})
model CreateMemberStatusCode422 is StatusCode422;

@doc("""
  The `role` is not `admin` or `employee` (`invalid_role`), the `job_title` is not one of
  the allowed values (`invalid_job_title`), or the update tried to change the space
  owner's role (`cannot_change_the_owners_role`).
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "cannot_change_the_owners_role",
      message: "The owner's role cannot be changed.",
      attribute: "role",
      url: "https://signalwire.com/docs/apis/error-codes#cannot_change_the_owners_role",
    }
  ],
})
model UpdateMemberStatusCode422 is StatusCode422;

@doc("The delete targeted the space owner (`cannot_remove_the_owner`) or the calling token holder's own membership (`cannot_remove_yourself`).")
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "cannot_remove_the_owner",
      message: "The owner cannot be removed from the space.",
      attribute: null,
      url: "https://signalwire.com/docs/apis/error-codes#cannot_remove_the_owner",
    }
  ],
})
model DeleteMemberStatusCode422 is StatusCode422;

@doc("`page_number` is above 0 without a `page_token` (`page_token_required_for_next_page`), or the `page_token` is not one this endpoint issued (`page_token_is_invalid`).")
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "page_token_required_for_next_page",
      message: "The page token is required when the page number is passed and greater than 0.",
      attribute: "page_token",
      url: "https://signalwire.com/docs/apis/error-codes#page_token_required_for_next_page",
    }
  ],
})
model ListMemberProjectsStatusCode422 is StatusCode422;

@doc("The path named a subproject (`subproject_access_is_inherited_from_root`). The message names the root project to enable or disable instead.")
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "subproject_access_is_inherited_from_root",
      message: "Access to a subproject is inherited from its root project. Enable project 4d5e6f70-8192-4a3b-8c4d-5e6f70819234 instead.",
      attribute: "project_id",
      url: "https://signalwire.com/docs/apis/error-codes#subproject_access_is_inherited_from_root",
    }
  ],
})
model MemberProjectStatusCode422 is StatusCode422;
