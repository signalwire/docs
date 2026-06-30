import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

import "../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.fax
// ─────────────────────────────────────────────────────────────────────────────

@doc("Whether the fax is being sent or received.")
union FaxDirection {
  "send",
  "receive",
}

@doc("Details of a fax event. The `type` field tells you which stage it describes.")
@discriminator("type")
model CallFax {
  type: string;
}

@doc("Fires each time a single fax page is sent or received, so you can track progress mid-transmission.")
model FaxPage extends CallFax {
  type: "page";
  params: {
    @doc("Whether this page was sent or received.")
    direction: FaxDirection;

    @doc("The page number that was just transmitted.")
    number: int32;
  };
}

@doc("Fires once the whole fax is done, with the final result and a link to the document.")
model FaxFinished extends CallFax {
  type: "finished";
  params: {
    @doc("Whether the fax was sent or received.")
    direction: FaxDirection;

    @doc("Your side's fax identity, typically an E.164 phone number.")
    identity?: string;

    @doc("The other party's fax identity, typically an E.164 phone number.")
    remote_identity?: string;

    @doc("Link to the transmitted fax document.")
    document?: url;

    @doc("Document format, for example `tif` or `pdf`.")
    format?: string;

    @doc("Total number of pages sent or received.")
    pages?: int32;

    @doc("`true` if the fax completed successfully, `false` if it failed.")
    success?: boolean;

    @doc("Numeric fax result code (for example, `1231`).")
    result?: int32;

    @doc("Human-readable explanation of the fax result.")
    result_text?: string;
  };
}

model CallFaxParams {
  ...CallAddress;

  @doc("The `control_id` of the fax this event belongs to.")
  control_id: string;

  @doc("The fax event details. Check `type` to see which stage it reports.")
  fax: CallFax;
}

const callingCallFax = "calling.call.fax";
@doc("Sent as a fax progresses: one event per page, then a final event when it finishes.")
@summary(callingCallFax)
@extension("x-fern-display-name", callingCallFax)
model CallFaxEvent is SignalwireEvent<typeof callingCallFax, CallFaxParams>;
