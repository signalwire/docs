import "./data_map";
import "../../../../../../types";
import "./parameters.tsp";

@summary("functions")
model SWAIGFunction {
  @doc("A unique name for the function. For example, 'get_weather'.")
  @example("get_weather")
  function: string;

  @doc("A description of the context and purpose of the function, to explain to the agent when to use it.")
  @example("Get the weather information")
  description: string;

  @doc("A JSON object defining the input that should be passed to the function. The fields of this object are the following two parameters.")
  parameters?: FunctionParameters;

  @doc("Whether the function is active. Default is `true`.")
  active?: boolean;

  @doc("""
    A powerful and flexible environmental variable which can accept arbitrary data that is set initially in the SWML script or from the SWML set_meta_data action.
    This data can be referenced locally to the function.
    All contained information can be accessed and expanded within the prompt - for example, by using a template string.
    Default is not set.
    """)
  meta_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("Scoping token for meta_data. If not supplied, metadata will be scoped to function's `web_hook_url`. Default is set by SignalWire.")
  meta_data_token?: string;

  @doc("""
    An object containing properties to process or validate the input,
    perform actions based on the input, or connect to external APIs or services in a serverless fashion.
    """)
  data_map?: DataMap;

  @doc("Function-specific URL to send status callbacks and reports to. Takes precedence over a default setting. Authentication can also be set in the url in the format of `username:password@url`. Credentials embedded in the URL take precedence over `web_hook_auth_user` and `web_hook_auth_password`.")
  @example("https://username:password@example.com")
  web_hook_url?: string;

  @doc("Username for basic auth on this function's webhook. Falls back to `defaults.web_hook_auth_user`.")
  @example("username")
  web_hook_auth_user?: string;

  // The `web_hook_auth_pass` alias that SWML accepts on a SWAIG function is deliberately absent
  // here: this API stores only `web_hook_auth_password`.
  @doc("Password for basic auth on this function's webhook. Falls back to `defaults.web_hook_auth_password`.")
  @example("password")
  web_hook_auth_password?: string;

  @doc("A file to play while the function is running. `wait_file_loops` can specify the amount of times that files should continuously play. Default is not set.")
  @example("https://cdn.signalwire.com/default-music/welcome.mp3")
  wait_file?: url;

  @doc("The number of times to loop playing the file. Default is not set.")
  @example(5)
  wait_file_loops?: integer | string;
}
