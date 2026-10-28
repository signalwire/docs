import "@typespec/http";

using TypeSpec.Http;

// Creating and updating a template report errors in the same `errors[]` item
// shape as the Relay REST APIs (`detail`, `status`, `title`, `code`), not the
// `type`/`message`/`attribute`/`url` shape of `Types.StatusCodes.StatusCode422`,
// and add Meta's error fields when Meta rejects the template.
@doc("One reason the template was rejected.")
model WhatsAppTemplateErrorItem {
  @doc("What caused the error. For a field that failed validation, the full message, such as `Name is required`. When Meta rejects the template, Meta's user-facing error title, which Meta can omit.")
  @example("Name is required")
  detail?: string;

  @doc("The HTTP status code, as a string.")
  status: "422";

  @doc("`Invalid Attribute` for a field that failed validation, Meta's error message when Meta rejects the template, or `Unknown error` when the template couldn't be sent to Meta.")
  @example("Invalid Attribute")
  title: string;

  @doc("`422`, as a string, for a field that failed validation. A number otherwise: Meta's error code when Meta rejects the template, or `500` when the template couldn't be sent to Meta.")
  @example("422")
  code: string | int32;

  @doc("Meta's error subcode, present only when Meta rejects the template and returns one.")
  subcode?: int32;
}

@doc("The template failed validation, or Meta rejected it. See `errors` for details.")
@example(#{
  statusCode: 422,
  errors: #[
    #{
      detail: "Name is required",
      status: "422",
      title: "Invalid Attribute",
      code: "422",
    },
    #{
      detail: "Language is required",
      status: "422",
      title: "Invalid Attribute",
      code: "422",
    }
  ],
})
@error
model WhatsAppTemplateValidationError {
  @statusCode statusCode: 422;

  @doc("List of errors.")
  errors: WhatsAppTemplateErrorItem[];
}
