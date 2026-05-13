import "@typespec/openapi";
import "../../../types";
import "../../_shared/const.tsp";
import "../../_shared/enums.tsp";
import "../../../../swml/calling";
import "../../../../swml/messaging";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

model SwmlScriptPathID {
  @doc("Unique ID of a SWML Script.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

@summary("Calling Script")
@doc("A SWML Script that handles inbound or outbound calls. The `contents` field carries a [calling SWML document](/docs/swml/reference/calling).")
model CallingSwmlScript {
  @doc("Unique ID of a SWML Script.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  id: uuid;

  @doc("The displayed name of the SWML script.")
  @example("Booking Assistant")
  display_name: string;

  @doc("Set to `calling` for SWML Scripts that handle inbound or outbound calls.")
  @example("calling")
  script_type: "calling";

  @doc("URL where this SWML Script is hosted.")
  @example("https://example.com/swml_script")
  request_url: url;

  @doc("The calling SWML document executed when this script runs. Uses [calling SWML methods](/docs/swml/reference/calling).")
  @example(SWML_CONTENTS_EXAMPLE)
  contents: SWML.Calling.SWMLObject;

  @doc("URL that receives status callbacks for messages sent or calls made by this script.")
  @example("https://website.com/status")
  @format("uri")
  status_callback_url?: url;

  @doc("HTTP method used for status callbacks.")
  @example(RequestUrlMethodType.Post)
  status_callback_method?: RequestUrlMethodType.Post;
}

@summary("Messaging Script")
@doc("A SWML Script that handles inbound SMS or MMS messages. The `contents` field carries a [messaging SWML document](/docs/swml/reference/messaging).")
model MessagingSwmlScript {
  @doc("Unique ID of a SWML Script.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  id: uuid;

  @doc("The displayed name of the SWML script.")
  @example("Reply Bot")
  display_name: string;

  @doc("Set to `messaging` for SWML Scripts that handle inbound SMS or MMS messages.")
  @example("messaging")
  script_type: "messaging";

  @doc("URL where this SWML Script is hosted.")
  @example("https://example.com/swml_script")
  request_url: url;

  @doc("The messaging SWML document executed when this script runs. Uses [messaging SWML methods](/docs/swml/reference/messaging).")
  @example(SWML_MESSAGING_CONTENTS_EXAMPLE)
  contents: SWML.Messaging.SWMLObject;
}

@summary("SWML Script")
@doc("""
  A SWML Script — either a [Calling Script](#schema/CallingSwmlScript) for inbound or
  outbound calls, or a [Messaging Script](#schema/MessagingSwmlScript) for inbound SMS or
  MMS messages. The `script_type` field on each script (`"calling"` or `"messaging"`)
  identifies which kind it is.
  """)
@oneOf
union SwmlScript {
  CallingSwmlScript,
  MessagingSwmlScript,
}
