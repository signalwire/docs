import "@typespec/http";
import "../../../types/status-codes";

using TypeSpec.Http;
using Types.StatusCodes;

@doc("""
  A field failed validation. Each item in `errors` names one problem, for example:

  - `identifier` makes the domain longer than 63 characters.
  - `identifier` is longer than 50 characters, contains a character other than a letter, digit, or hyphen, starts or ends with a hyphen, or contains two hyphens in a row.
  - `identifier` makes a domain that another Space already uses.
  - `identifier` is already used with the same `user` in your Space.
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      detail: "Identifier makes the domain longer than 63 characters",
      status: "422",
      title: "Invalid Attribute",
      code: "422",
    }
  ],
})
model DomainApplicationStatusCode422 is ValidationError;
