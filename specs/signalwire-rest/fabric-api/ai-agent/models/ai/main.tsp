import "./ai_languages.tsp";
import "./prompt";
import "./ai_pronounce.tsp";
import "./ai_params.tsp";
import "./swaig";

@summary("AI object")
model AI {
  @doc("Create a new AI agent.")
  @summary("ai")
  ai: {
    @doc("""
      A powerful and flexible environmental variable which can accept arbitrary data that is set initially in the SWML script
      or from the SWML `set_global_data` action. This data can be referenced `globally`.
      All contained information can be accessed and expanded within the prompt - for example, by using a template string.
      """)
    global_data?: {
      ...TypeSpec.Record<unknown>;
    };

    @doc("An array of hints (as strings) to provide context to the dialogue.")
    @example(#["pizza", "pepperoni"])
    hints?: string[];

    @doc("An array of JSON objects defining supported languages in the conversation.")
    languages?: Languages[];

    @doc("A JSON object containing parameters as key-value pairs.")
    params?: AIParams;

    @doc("The final set of instructions and configuration settings to send to the agent.")
    post_prompt?: AIPostPrompt;

    @doc("The URL to which to send status callbacks and reports. Authentication can also be set in the url in the format of `username:password@url`.")
    @example("username:password@https://example.com")
    post_prompt_url?: url;

    @doc("An array of JSON objects to clarify the agent's pronunciation of words or expressions.")
    pronounce?: Pronounce[];

    @doc("Establishes the initial set of instructions and settings to configure the agent.")
    prompt: AIPrompt;

    @doc("An array of JSON objects to create user-defined functions/endpoints that can be executed during the dialogue.")
    SWAIG?: SWAIG;
  };
}
