import "./core.tsp";
import "../../../types/status-codes";

using Types.StatusCodes;
using TypeSpec.Http;

namespace SignalWireAPI.Calling;


@doc("""
  The current status of the call. As a call is placed and progresses, it moves through `queued`,
  `initiated`, `created`, `ringing`, `answered`, `ending`, and `ended`, though it can skip some of
  them, such as `answered` for a call that is never answered. `ended` is the final
  status of every call that was placed, however it ended; the `end_reason` in the
  [call state callback](/docs/apis/rest/webhooks/call-state-status-callback) for `ended` says why,
  such as `busy` or `noAnswer`.

  Three statuses are outcomes rather than steps: `failed`, `canceled`, and `completed`. A call
  that is never placed has one of these instead of `ended`, and no call state callback is sent
  for it.
  """)
enum CallResponseStatus {
  @doc("The call has been accepted and is waiting to be placed.")
  queued,

  @doc("SignalWire has started placing the call.")
  initiated,

  @doc("The call has been set up and is being placed.")
  created,

  @doc("The call is ringing at the destination.")
  ringing,

  @doc("The call has been answered and is in progress.")
  answered,

  @doc("The call is hanging up. A call passes through this status on its way to `ended`.")
  ending,

  @doc("The call has ended, however it ended. Check `end_reason` in the `ended` call state callback for the cause.")
  ended,

  @doc("The call couldn't be placed, for example because the destination is blocked, the call was flagged as spam, the destination has no registered SIP endpoint, or a temporary error occurred. No call state callback is sent.")
  failed,

  @doc("The call was canceled with the `update` command while it was still `queued`, so it was never placed. No call state callback is sent.")
  canceled,

  @doc("The call was ended with the `update` command while it was still `queued`, so it was never placed. No call state callback is sent.")
  completed,
}

@summary("Call Response")
@doc("The response varies based on the type of call. A standard call returns a Call Leg, while a Fabric subscriber call returns a Fabric Device Leg.")
union CallResponse {
  CallLeg,
  FabricDeviceLeg,
}

@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "url must be a valid http or https url",
      attribute: "url",
      url: "https://signalwire.com/docs/apis/error-codes",
    }
  ],
})
model CallCreate422Error is Types.StatusCodes.StatusCode422;
