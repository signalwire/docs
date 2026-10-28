import "../../../types/status-codes";

using Types.StatusCodes;

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
