import "@typespec/openapi";
import "./core.tsp";
import "../../_shared/const.tsp";

using TypeSpec.OpenAPI;

// One flat model per operation, not a Calling/Messaging union: `script_type` is optional
// (create defaults it to `calling`, update keeps the current type), so a body that omits
// it would match both variants of a `oneOf`.

@summary("Create SWML Script")
@doc("Request body to create a SWML Script. Set `script_type` to `messaging` for a Messaging Script that handles inbound SMS or MMS messages; omit it, or set it to `calling`, for a Calling Script that handles inbound or outbound calls. The script type determines whether the script can be assigned as a call handler or a message handler on a phone number.")
model SwmlScriptCreateRequest {
  @doc("Name of the SWML Script.")
  @example("Welcome Script")
  name: string;

  @doc("The kind of script to create. Defaults to `calling` when omitted, so set it to `messaging` explicitly to create a Messaging Script.")
  @example("calling")
  script_type?: "calling" | "messaging" = "calling";

  @doc("The SWML document, as a JSON object or as a string of JSON or YAML. A Calling Script uses [calling SWML methods](/docs/swml/reference/calling); a Messaging Script uses [messaging SWML methods](/docs/swml/reference/messaging).")
  @example(SWML_CONTENTS_EXAMPLE)
  contents: TypeSpec.Record<unknown> | string;

  @doc("URL that receives status callbacks for messages sent or calls made by this script.")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;
}

@summary("Update SWML Script")
@doc("Request body to update an existing SWML Script. All fields are optional — include only what you want to change.")
model SwmlScriptUpdateRequest {
  @doc("Name of the SWML Script.")
  @example("Welcome Script")
  name?: string;

  @doc("The kind of script. Omit to keep the script's current type.")
  @example("calling")
  script_type?: "calling" | "messaging";

  @doc("The SWML document, as a JSON object or as a string of JSON or YAML. A Calling Script uses [calling SWML methods](/docs/swml/reference/calling); a Messaging Script uses [messaging SWML methods](/docs/swml/reference/messaging).")
  @example(SWML_CONTENTS_EXAMPLE)
  contents?: TypeSpec.Record<unknown> | string;

  @doc("URL that receives status callbacks for messages sent or calls made by this script.")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;
}
