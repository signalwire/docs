import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("Whether the fax is being sent or received.")
union FaxDirection {
  "send",
  "receive",
}

@doc("Details of a fax event. The `type` field tells you which stage it describes.")
@summary("Fax event")
@discriminator("type")
model CallFax {
  type: "finished" | "page";
}

@doc("Fires each time a single fax page is sent or received, so you can track progress mid-transmission.")
@summary("Fax page event")
model FaxPage extends CallFax {
  @example("page")
  type: "page";

  params: {
    @doc("Whether this page was sent or received.")
    @example("send")
    direction: FaxDirection;

    @doc("The page number that was just transmitted.")
    @example(1)
    number: int32;
  };
}

@doc("Fires once the whole fax is done, with the final result and a link to the document.")
@summary("Fax finished event")
model FaxFinished extends CallFax {
  @example("finished")
  type: "finished";

  params: {
    @doc("Whether the fax was sent or received.")
    @example("send")
    direction: FaxDirection;

    @doc("Your side's fax identity, typically an E.164 phone number.")
    @example("+15551230001")
    identity?: string;

    @doc("The other party's fax identity, typically an E.164 phone number.")
    @example("+15551230002")
    remote_identity?: string;

    @doc("Link to the transmitted fax document.")
    @example("https://example.com/my_doc_to_fax.pdf")
    document?: url;

    @doc("Document format, for example `tif` or `pdf`.")
    format?: string;

    @doc("Total number of pages sent or received.")
    @example(1)
    pages?: int32;

    @doc("`true` if the fax completed successfully, `false` if it failed.")
    @example(true)
    success?: boolean;

    @doc("Numeric fax result code. `0` means the fax succeeded; a non-zero code indicates why it failed. For example, `0`.")
    @example(0)
    result?: int32;

    @doc("Human-readable explanation of the fax result.")
    @example("OK")
    result_text?: string;
  };
}

@summary("Fax event details")
model CallFaxParams {
  ...CallEventAddress;

  @doc("The `control_id` of the fax this event belongs to.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("The fax event details. Check `type` to see which stage it reports.")
  fax: CallFax;
}

const callingCallFax = "calling.call.fax";
@doc("Sent as a fax progresses: one event per page, then a final event when it finishes.")
@summary(callingCallFax)
@extension("x-fern-display-name", callingCallFax)
model CallFaxEvent is SignalwireEvent<typeof callingCallFax, CallFaxParams>;
