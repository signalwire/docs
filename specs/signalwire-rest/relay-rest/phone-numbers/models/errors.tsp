import "../../../types/status-codes";

using Types.StatusCodes;

@doc("""
  A search parameter is invalid. Each item in `errors` names one problem, for example:

  - `max_results` isn't a whole number of at least 1, or is above the toll-free limit.
  - `areacode` isn't a three-digit area code starting with 2 through 9.
  - `starts_with`, `contains`, or `ends_with` isn't 3 to 7 letters or digits, or more than one of them is sent.
  - `region` isn't a supported US or Canadian region code.
  - `city` is sent without `region`, or `region` or `city` is sent with a toll-free search.
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      detail: "Areacode is not a valid area code.",
      status: "422",
      title: "Invalid Attribute",
      code: "422",
    }
  ],
})
model PhoneNumberSearchStatusCode422 is ValidationError;

@example(#{
  statusCode: 503,
  errors: #[
    #{
      detail: "Service number search could not be completed, please try again.",
      status: "422",
      title: "Invalid Attribute",
      code: "422",
    }
  ],
})
model PhoneNumberSearchStatusCode503 is SpaceApiServiceUnavailableError;

@example(#{
  statusCode: 503,
  errors: #[
    #{
      detail: "Service cannot process the request right now.",
      status: "422",
      title: "Invalid Attribute",
      code: "422",
    }
  ],
})
model PhoneNumberLookupStatusCode503 is SpaceApiServiceUnavailableError;
