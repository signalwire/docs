import "./core.tsp";
import "../../_shared/const.tsp";

model SwmlScriptCreateRequest {
  @doc("Display name of the SWML Script")
  @example("Welcome Script")
  name: string;

  @doc("Indicates whether this SWML Script handles inbound calls or inbound messages. Determines the shape of `contents`: `calling` scripts must use [calling SWML methods](/docs/swml/reference/calling); `messaging` scripts must use [messaging SWML methods](/docs/swml/reference/messaging).")
  @example("calling")
  script_type?: "calling" | "messaging" = "calling";

  @doc("The SWML document executed when this script runs. The shape is discriminated by `script_type` — `calling` scripts contain a [calling SWML object](/docs/swml/reference/calling); `messaging` scripts contain a [messaging SWML object](/docs/swml/reference/messaging).")
  @example(SWML_CONTENTS_EXAMPLE)
  contents: SwmlScriptContents;

  @doc("URL to send status callbacks to")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;
}

model SwmlScriptUpdateRequest {
  @doc("Display name of the SWML Script")
  @example("Welcome Script")
  display_name?: string;

  @doc("Indicates whether this SWML Script handles inbound calls or inbound messages. Determines the shape of `contents`: `calling` scripts must use [calling SWML methods](/docs/swml/reference/calling); `messaging` scripts must use [messaging SWML methods](/docs/swml/reference/messaging).")
  @example("calling")
  script_type?: "calling" | "messaging";

  @doc("The SWML document executed when this script runs. The shape is discriminated by `script_type` — `calling` scripts contain a [calling SWML object](/docs/swml/reference/calling); `messaging` scripts contain a [messaging SWML object](/docs/swml/reference/messaging).")
  contents?: SwmlScriptContents;

  @doc("URL to send status callbacks to")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;
}
