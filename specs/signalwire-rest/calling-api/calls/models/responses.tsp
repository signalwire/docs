import "./core.tsp";
import "../../../types/status-codes";

using Types.StatusCodes;
using TypeSpec.Http;

model CallResponse {
  ...Call;
}

@example(#{
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "url must be a valid http or https url",
      attribute: "url",
      url: "https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#http_url_required",
    }
  ],
})
model CallCreate422Error is Types.StatusCodes.StatusCode422;

model CallUpdate422Error is CallCreate422Error;
