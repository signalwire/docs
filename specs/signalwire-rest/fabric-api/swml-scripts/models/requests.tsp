import "@typespec/openapi";
import "./core.tsp";
import "../../_shared/const.tsp";

using TypeSpec.OpenAPI;

@summary("Create Calling Script")
@doc("Request body to create a SWML Script that handles inbound or outbound calls.")
model CallingSwmlScriptCreateRequest {
  @doc("Display name of the SWML Script")
  @example("Welcome Script")
  name: string;

  @doc("Set to `calling` for SWML Scripts that handle inbound or outbound calls. Optional — when omitted, the script kind is inferred from the shape of `contents`.")
  @example("calling")
  script_type?: "calling" = "calling";

  @doc("The calling SWML document. Uses [calling SWML methods](/docs/swml/reference/calling).")
  @example(SWML_CONTENTS_EXAMPLE)
  contents: SWML.Calling.SWMLObject;

  @doc("URL that receives status callbacks for messages sent or calls made by this script.")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;
}

@summary("Create Messaging Script")
@doc("Request body to create a SWML Script that handles inbound SMS or MMS messages.")
model MessagingSwmlScriptCreateRequest {
  @doc("Display name of the SWML Script")
  @example("Reply Bot")
  name: string;

  @doc("Set to `messaging` for SWML Scripts that handle inbound SMS or MMS messages. Optional — when omitted, the script kind is inferred from the shape of `contents`.")
  @example("messaging")
  script_type?: "messaging" = "messaging";

  @doc("The messaging SWML document. Uses [messaging SWML methods](/docs/swml/reference/messaging).")
  @example(SWML_MESSAGING_CONTENTS_EXAMPLE)
  contents: SWML.Messaging.SWMLObject;

  @doc("URL that receives status callbacks for messages sent or calls made by this script.")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;
}

@summary("Create SWML Script")
@doc("Body shape for creating a SWML Script. Choose a [Calling Script](#schema/CallingSwmlScriptCreateRequest) for inbound or outbound calls or a [Messaging Script](#schema/MessagingSwmlScriptCreateRequest) for inbound SMS or MMS messages. Setting `script_type` (`\"calling\"` or `\"messaging\"`) is recommended for clarity, but it is optional — when omitted, the script kind is inferred from the shape of `contents`.")
@oneOf
union SwmlScriptCreateRequest {
  CallingSwmlScriptCreateRequest,
  MessagingSwmlScriptCreateRequest,
}

@summary("Update Calling Script")
@doc("Request body to update an existing calling SWML Script. All fields are optional — include only what you want to change.")
model CallingSwmlScriptUpdateRequest {
  @doc("Display name of the SWML Script")
  @example("Welcome Script")
  display_name?: string;

  @doc("Set to `calling` for SWML Scripts that handle inbound or outbound calls. Optional — when omitted, the script kind is inferred from the shape of `contents`.")
  @example("calling")
  script_type?: "calling" = "calling";

  @doc("The calling SWML document. Uses [calling SWML methods](/docs/swml/reference/calling).")
  @example(SWML_CONTENTS_EXAMPLE)
  contents?: SWML.Calling.SWMLObject;

  @doc("URL that receives status callbacks for messages sent or calls made by this script.")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;
}

@summary("Update Messaging Script")
@doc("Request body to update an existing messaging SWML Script. All fields are optional — include only what you want to change.")
model MessagingSwmlScriptUpdateRequest {
  @doc("Display name of the SWML Script")
  @example("Reply Bot")
  display_name?: string;

  @doc("Set to `messaging` for SWML Scripts that handle inbound SMS or MMS messages. Optional — when omitted, the script kind is inferred from the shape of `contents`.")
  @example("messaging")
  script_type?: "messaging" = "messaging";

  @doc("The messaging SWML document. Uses [messaging SWML methods](/docs/swml/reference/messaging).")
  @example(SWML_MESSAGING_CONTENTS_EXAMPLE)
  contents?: SWML.Messaging.SWMLObject;

  @doc("URL that receives status callbacks for messages sent or calls made by this script.")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;
}

@summary("Update SWML Script")
@doc("Body shape for updating an existing SWML Script. All fields are optional — include only what you want to change. Setting `script_type` (`\"calling\"` for a [Calling Script](#schema/CallingSwmlScriptUpdateRequest) or `\"messaging\"` for a [Messaging Script](#schema/MessagingSwmlScriptUpdateRequest)) is recommended for clarity; when omitted, the script kind is inferred from the shape of `contents`.")
@oneOf
union SwmlScriptUpdateRequest {
  CallingSwmlScriptUpdateRequest,
  MessagingSwmlScriptUpdateRequest,
}
