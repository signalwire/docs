import "./enums.tsp";
import "./ai/main.tsp";

import "../../../types";

using TypeSpec.Http;

model AIAgentPathID {
  @doc("Unique ID of an AI Agent.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid
}

model AIAgentID {
  @doc("Unique ID of an AI Agent.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  agent_id: uuid
}

model AIAgent {
  @doc("Name of the AI Agent.")
  @example("My AI Agent")
  name: string;

  @doc("Establishes the initial set of instructions and settings to configure the agent.")
  prompt?: AIPrompt;

  @doc("The final set of instructions and configuration settings to send to the agent.")
  post_prompt?: AIPostPrompt;

  @doc("A JSON object containing parameters as key-value pairs.")
  params?: AIParams;

  @doc("An array of JSON objects to clarify the AI's pronunciation of words or expressions.")
  pronounce?: Pronounce[];

  @doc("An array of hints (as strings) to provide context to the dialogue.")
  @example(#["One Hint", "Two Hint"])
  hints?: string[];

  @doc("An array of JSON objects defining supported languages in the conversation.")
  languages?: Languages[];

  @doc("A JSON object to create user-defined functions/endpoints that can be executed during the dialogue.")
  SWAIG?: SWAIG;
}

model AIAgentWithID {
  ...AIAgentID,
  ...AIAgent
}
