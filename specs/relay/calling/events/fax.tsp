import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.fax
// ─────────────────────────────────────────────────────────────────────────────

/** Whether the fax is being sent or received. */
union FaxDirection {
  "send",
  "receive",
}

/** Details of a fax event. The `type` field tells you which stage it describes. */
@discriminator("type")
model CallFax {
  type: string;
}

/** Fires each time a single fax page is sent or received, so you can track progress mid-transmission. */
model FaxPage extends CallFax {
  type: "page";
  params: {
    /** Whether this page was sent or received. */
    direction: FaxDirection;

    /** The page number that was just transmitted. */
    number: int32;
  };
}

/** Fires once the whole fax is done, with the final result and a link to the document. */
model FaxFinished extends CallFax {
  type: "finished";
  params: {
    /** Whether the fax was sent or received. */
    direction: FaxDirection;

    /** Your side's fax identity, typically an E.164 phone number. */
    identity?: string;

    /** The other party's fax identity, typically an E.164 phone number. */
    remote_identity?: string;

    /** Link to the transmitted fax document. */
    document?: url;

    /** Total number of pages sent or received. */
    pages?: int32;

    /** `true` if the fax completed successfully, `false` if it failed. */
    success?: boolean;

    /** Numeric fax result code (for example, `1231`). */
    result?: int32;

    /** Human-readable explanation of the fax result. */
    result_text?: string;
  };
}

/**
 * Fires if the fax fails. The payload here can vary; expect the same
 * `result` and `result_text` fields you get on a finished fax.
 */
model FaxError extends CallFax {
  type: "error";

  /** Error details. The exact fields can vary. */
  params?: Record<unknown>;
}

model CallFaxParams {
  ...CallAddress;

  /** The `control_id` of the fax this event belongs to. */
  control_id: string;

  /** The fax event details. Check `type` to see which stage it reports. */
  fax: CallFax;
}

// No `@example`: `fax` is a required `@discriminator` (CallFax) property, and an
// example value cannot narrow a discriminated base. Per-variant payloads are
// illustrated by the FaxPage/FaxFinished `type`/`params` fields above.
/** Sent as a fax progresses: one event per page, then a final event when it finishes or errors. */
@event("calling.call.fax")
model CallFaxEvent {
  ...CallFaxParams;
}
