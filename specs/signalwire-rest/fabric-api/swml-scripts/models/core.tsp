import "@typespec/openapi";
import "../../../types";
import "../../_shared/const.tsp";
import "../../_shared/enums.tsp";
import "../../../../swml/calling";
import "../../../../swml/messaging";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@oneOf
union SwmlScriptContents {
  @summary("Calling SWML object")
  calling: SWML.Calling.SWMLObject,

  @summary("Messaging SWML object")
  messaging: SWML.Messaging.SWMLObject,
}

model SwmlScriptPathID {
  @doc("Unique ID of a SWML Script.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

model SwmlScript {
  @doc("Unique ID of a SWML Script.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  id: uuid;

  @doc("The displayed name of the SWML script.")
  @example("Booking Assistant")
  display_name: string;

  @doc("Indicates whether this SWML Script handles inbound calls or inbound messages. Determines the shape of `contents`: `calling` scripts must use [calling SWML methods](/docs/swml/reference/calling); `messaging` scripts must use [messaging SWML methods](/docs/swml/reference/messaging).")
  @example("calling")
  script_type: "calling" | "messaging";

  @doc("The url where the SWML script is hosted at.")
  @example("https://example.com/swml_script")
  request_url: url;

  @doc("The SWML document executed when this script runs. The shape is discriminated by `script_type` — `calling` scripts contain a [calling SWML object](/docs/swml/reference/calling); `messaging` scripts contain a [messaging SWML object](/docs/swml/reference/messaging).")
  @example(SWML_CONTENTS_EXAMPLE)
  contents: SwmlScriptContents;

  @doc("URL to send status callbacks to")
  @example("https://website.com/status")
  @format("uri")
  status_callback_url?: url;

  @doc("HTTP method to use for status callbacks")
  @example(RequestUrlMethodType.Post)
  status_callback_method?: RequestUrlMethodType.Post;
}
