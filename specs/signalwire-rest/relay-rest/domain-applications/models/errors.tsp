import "@typespec/http";
import "../../../types/status-codes";

using TypeSpec.Http;
using Types.StatusCodes;

@doc("""
  A field failed validation. Each item in `errors` names one problem. For example, an `identifier` that makes the domain longer than 63 characters returns the error below.
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
