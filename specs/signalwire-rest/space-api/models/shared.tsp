import "@typespec/http";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

namespace SignalWireAPI.Space;

// ============================================================================
// Pagination
// ============================================================================

@doc("Cursor pagination links. Filters given on the request are preserved in every link.")
model SpacePaginationLinks {
  @doc("The link to the current page.")
  @example("/api/space/members?page_number=0&page_size=50")
  self: string;

  @doc("The link to the first page.")
  @example("/api/space/members?page_size=50")
  first: string;

  @doc("The link to the next page. Only present when more results exist.")
  @example("/api/space/members?page_number=1&page_size=50&page_token=PA9f8e7d6c-5b4a-4321-8765-fedcba987654")
  next?: string;

  @doc("The link to the previous page. Only present when a previous page exists.")
  @example("/api/space/members?page_number=0&page_size=50&page_token=PA9f8e7d6c-5b4a-4321-8765-fedcba987654")
  prev?: string;
}

@doc("Cursor pagination query parameters shared by the space list endpoints.")
model SpacePaginationQuery {
  @doc("The number of results per page.")
  @query
  @minValue(1)
  @maxValue(1000)
  page_size?: int32 = 50;

  @doc("The page index. Any value above 0 also requires `page_token`.")
  @query
  @minValue(0)
  page_number?: int32 = 0;

  @doc("The cursor for any page after the first, taken from the `links.next` URL of the previous response.")
  @query
  page_token?: string;
}

// ============================================================================
// Shared error responses
// ============================================================================

@doc("The standard validation error body.")
model SpaceErrorBody {
  @doc("List of validation errors.")
  errors: RestApiErrorItem[];
}

@doc("""
  The credential is missing, unknown, or revoked; its holder is not a member of the space in
  the subdomain; or the member is not an owner or admin. The body is the plain text
  `Unauthorized`.
  """)
@error
model SpaceUnauthorizedError {
  @statusCode statusCode: 401;
  @header contentType: "text/plain";
  @body body: "Unauthorized";
}

@doc("The space has not completed verification. Every endpoint under `/api/space` returns this until a phone number has been validated for the space.")
@error
model SpaceUnverifiedError {
  @statusCode statusCode: 401;
  @header contentType: "application/json";
  @body body: {
    @doc("How to make the space eligible to use this endpoint.")
    @example("Please validate a phone number to access your account.")
    message: string;
  };
}

@doc("""
  The credential is missing, unknown, or revoked; its holder is not a member of the space in
  the subdomain; the member is not an owner or admin; or billing for this space is not
  managed in the space itself, which is the case for a space purchased through a cloud
  marketplace and for a suspended or deactivated space. The body is the plain text
  `Unauthorized`.
  """)
@error
model SpaceBillingUnauthorizedError {
  @statusCode statusCode: 401;
  @header contentType: "text/plain";
  @body body: "Unauthorized";
}

@doc("The member, project, or payment method does not exist in this space. The body is the plain text `Not Found`.")
@error
model SpaceNotFoundError {
  @statusCode statusCode: 404;
  @header contentType: "text/plain";
  @body body: "Not Found";
}

@doc("The request body is not valid JSON.")
@example(#{
  statusCode: 400,
  errors: #[
    #{
      type: "validation_error",
      code: "not_a_valid_json",
      message: "JSON you submitted is not valid",
      attribute: null,
      url: "https://signalwire.com/docs/apis/error-codes#not_a_valid_json",
    }
  ],
})
@error
model SpaceInvalidJsonError {
  @statusCode statusCode: 400;
  ...SpaceErrorBody;
}

@doc("An upstream billing or usage reporting service was unavailable. The body is empty; retry later.")
@error
model SpaceUpstreamUnavailableError {
  @statusCode statusCode: 502;
}
