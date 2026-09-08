import "@typespec/json-schema";
import "./ai_languages.tsp";
import "./ai_multilingual.tsp";
import "./prompt";
import "./ai_pronounce.tsp";
import "./ai_params.tsp";
import "./swaig";
import "./ai_hints.tsp";
import "./_shared/global_data.tsp";
using TypeSpec.JsonSchema;

namespace SWML.Calling;

const aiDescription: string = """
  Creates an AI agent that conducts voice conversations using automatic speech recognition (ASR),
  large language models (LLMs), and text-to-speech (TTS) synthesis.
  The agent processes caller speech in real-time, generates contextually appropriate responses,
  and can execute custom functions to interact with external systems through SignalWire AI Gateway (SWAIG).
  """;

const aiGlobalDataDescription: string = """
  A key-value object for storing data that persists throughout the AI session.
  Can be set initially in the SWML script or modified during the conversation using the set_global_data action.
  The global_data object is accessible everywhere in the AI session: prompts, AI parameters,
  and SWML returned from SWAIG functions. Access properties using template strings (e.g. \${global_data.property_name}).
  """;

const aiHintsDescription: string = "Hints help the AI agent understand certain words or phrases better. Words that can commonly be misinterpreted can be added to the hints to help the AI speak more accurately.";

const aiLanguagesDescription: string = """
  An array of JSON objects defining supported languages in the conversation.
  Mutually exclusive with `multilingual`: if both are set, `multilingual` is used and
  this array is ignored.
  """;

const aiMultilingualDescription: string = """
  Configures a single agent to detect the caller's language and answer in it, switching
  as the caller switches. Use this instead of `languages` when one conversation may span
  several languages. Mutually exclusive with `languages`: if both are set, `multilingual`
  is used and `languages` is ignored.
  """;

const aiParamsDescription: string = "A JSON object containing parameters as key-value pairs.";

const aiPostPromptDescription: string = "The final set of instructions and configuration settings to send to the agent.";

const aiPostPromptUrlDescription: string = "The URL to which to send status callbacks and reports. Authentication can also be set in the url in the format of `username:password@url`.";

const aiPronounceDescription: string = "An array of JSON objects to clarify the AI's pronunciation of words or expressions.";

const aiPromptDescription: string = """
  Defines the AI agent's personality, goals, behaviors, and instructions for handling conversations.
  The prompt establishes how the agent should interact with callers, what information it should gather,
  and how it should respond to various scenarios. It is recommended to write prompts using markdown formatting.
  """;

const aiSwaigDescription: string = "An array of JSON objects to create user-defined functions/endpoints that can be executed during the dialogue.";

@summary("AI Object")
model AIObject {
  @doc(aiGlobalDataDescription)
  @example(#{ company_name: "Acme Corp", support_hours: "9am-5pm EST" })
  global_data?: GlobalData;

  @doc(aiHintsDescription)
  @example(#["pizza", "pepperoni"])
  hints?: (string | Hint)[];

  @doc(aiLanguagesDescription)
  languages?: Languages[];

  @doc(aiMultilingualDescription)
  multilingual?: Multilingual;

  @doc(aiParamsDescription)
  params?: AIParams;

  @doc(aiPostPromptDescription)
  post_prompt?: AIPostPrompt;

  @doc(aiPostPromptUrlDescription)
  @example("username:password@https://example.com")
  post_prompt_url?: url;

  @doc(aiPronounceDescription)
  pronounce?: Pronounce[];

  @doc(aiPromptDescription)
  prompt: AIPrompt;

  @doc(aiSwaigDescription)
  SWAIG?: SWAIG;
}

@summary("ai Method")
model AI {
  @doc(aiDescription)
  @summary("ai")
  ai: AIObject;
}
