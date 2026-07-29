import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@jsonSchema
@summary("SWAIG webhook request")
@doc("""
  The JSON document SignalWire POSTs to a SWAIG function's `web_hook_url` when the AI agent calls
  that function. See the [tool calling guide](/docs/platform/ai/tool-calling) for the surrounding
  protocol.
  """)
model SWAIGRequest {
  @doc("The unique identifier for the current call.")
  @example("b3f4e4e1-9d5c-4a1e-8e2a-3c9d1f0b7a52")
  call_id?: string;

  @doc("The unique identifier for the AI session.")
  @example("c960da54-3f09-4de6-8c84-49c1fcca704c")
  ai_session_id?: string;

  @doc("The project ID associated with the call.")
  project_id?: string;

  @doc("The Space ID associated with the call.")
  space_id?: string;

  @doc("Name of the caller.")
  caller_id_name?: string;

  @doc("Number of the caller.")
  @example("+15552340987")
  caller_id_num?: string;

  @doc("Global data set via the `set_global_data` action, as a key-value map.")
  global_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("Content disposition identifier.")
  @example("SWAIG Function")
  content_disposition?: string;

  @doc("Whether the channel is currently active.")
  channel_active?: boolean;

  @doc("Whether the channel is off-hook.")
  channel_offhook?: boolean;

  @doc("Whether the channel is ready.")
  channel_ready?: boolean;

  @doc("Type of content. The value is `text/swaig`.")
  @example("text/swaig")
  content_type?: string;

  @doc("Name of the application that originated the request.")
  app_name?: string;

  @doc("Name of the function that was invoked.")
  @example("check_order")
  function: string;

  @doc("""
    A key-value map of call-scoped metadata, set in the SWML document, by the `set_meta_data`
    action, or through the APIs when the call is created. Lives for the duration of the call.
    """)
  meta_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("Variables related to the SWML document executing the call.")
  SWMLVars?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("The deprecated `purpose` value declared for the function, when one was provided.")
  purpose?: string;

  @doc("The parameter schema declared for the function, describing the arguments the agent may send.")
  argument_desc?: string | {
    ...TypeSpec.Record<unknown>;
  };

  @doc("The argument the AI agent is providing to the function.")
  argument?: SWAIGRequestArgument;

  @doc("Version of the SWAIG payload.")
  @example("2.0")
  version?: string;

  ...TypeSpec.Record<unknown>;
}

@summary("SWAIG request argument")
model SWAIGRequestArgument {
  @doc("The argument parsed as JSON, when a JSON object is detected within it.")
  parsed?: unknown[];

  @doc("The raw argument provided by the AI agent.")
  @example("{\"order_number\":\"12345\"}")
  raw?: string;

  @doc("The argument provided by the AI agent, excluding any JSON.")
  substituted?: string;

  ...TypeSpec.Record<unknown>;
}

@jsonSchema
@summary("SWAIG webhook response")
@doc("""
  The JSON document your server returns from a SWAIG function. `response` is added to the AI agent's
  context; `action` carries SWML-compatible objects that change what the call does next. The
  accepted action objects are documented in the
  [tool calling guide](/docs/platform/ai/tool-calling).
  """)
model SWAIGResponse {
  @doc("Text that will be added to the AI agent's context. Markdown is supported.")
  @example("Order 12345 shipped Monday and arrives Thursday.")
  response: string;

  @doc("""
    A list of SWML-compatible objects that are executed when the function returns, such as
    `set_meta_data`, `toggle_functions`, `transfer`, or an inline `SWML` document.
    """)
  action?: {
    ...TypeSpec.Record<unknown>;
  }[];

  ...TypeSpec.Record<unknown>;
}
