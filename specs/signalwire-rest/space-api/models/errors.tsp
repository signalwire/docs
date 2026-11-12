import "../../types/status-codes";

using Types.StatusCodes;

namespace SignalWireAPI.Space;

@doc("The request failed validation, for example a blank `name`.")
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "invalid_parameter",
      message: "Name can't be blank",
      attribute: "name",
      url: "https://signalwire.com/docs/apis/error-codes#invalid_parameter",
    }
  ],
})
model UpdateSpaceStatusCode422 is StatusCode422;

@doc("""
  `countries` was sent as something other than an array (`countries_must_be_array`), or
  none of the submitted countries are supported for this space (`no_supported_countries`).
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "no_supported_countries",
      message: "None of the submitted countries are supported for this space.",
      attribute: "countries",
      url: "https://signalwire.com/docs/apis/error-codes#no_supported_countries",
    }
  ],
})
model UpdateGeographicPermissionsStatusCode422 is StatusCode422;
