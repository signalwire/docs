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

// Shared with the REST AI-agent model, which accepts string hints only, so the object form is
// described on `AIObject.hints` rather than here.
const aiHintsDescription: string = """
  Words and phrases that help the agent understand what the caller says. Each string is passed to speech
  recognition as a hint, making that word or phrase more likely to be recognized.
  Hints don't change how the agent speaks; use `pronounce` for that.
  """;

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

const aiPostPromptAuthUserDescription: string = "The username for basic authentication on `post_prompt_url`. A username embedded in the URL takes precedence.";

const aiPostPromptAuthPasswordDescription: string = "The password for basic authentication on `post_prompt_url`. A password embedded in the URL takes precedence.";

const aiVoiceDescription: string = """
  The voice the agent speaks with when neither `languages` nor `multilingual` is set.
  String format: `<engine id>.<voice id>`, with an optional `:<model id>` suffix for engines that offer a
  choice of model, the same format as `languages[].voice`. When `languages` or `multilingual` is set, the
  voices configured there are used instead.
  """;

const aiAgentDescription: string = """
  The ID of an AI agent saved in your SignalWire Space, such as the `agent_id` of an AI agent
  created with the REST API. The agent runs with its saved configuration. Other settings placed next
  to `agent` are ignored, so set `agent` on its own.
  Don't combine `agent` with `prompt`: if both are present, the inline configuration runs and `agent`
  is ignored.
  """;

const aiPronounceDescription: string = "An array of JSON objects to clarify the AI's pronunciation of words or expressions.";

const aiPromptDescription: string = """
  Defines the AI agent's personality, goals, behaviors, and instructions for handling conversations.
  The prompt establishes how the agent should interact with callers, what information it should gather,
  and how it should respond to various scenarios. It is recommended to write prompts using markdown formatting.
  """;

const aiSwaigDescription: string = "An object that configures the functions the agent can call during the dialogue: user-defined `functions`, shared `defaults`, `includes`, `native_functions`, `mcp_servers`, and `internal_fillers`.";

@summary("AI Object")
model AIObject {
  @doc(aiGlobalDataDescription)
  @example(#{ company_name: "Acme Corp", support_hours: "9am-5pm EST" })
  global_data?: GlobalData;

  @doc("""
    ${aiHintsDescription}
    An object can set a `hint`, a `pattern` and `replace` pair that rewrites matching text in what the agent
    hears before the AI reads it, or both.
    One hint list covers every language the agent uses; there are no per-language hints. When speech recognition
    runs in code-switching mode, because `multilingual` is set or a `languages` entry's `code` is `multi`,
    recognition hints are not used. That covers string entries and `hint` values, and no error is returned.
    Rewrite rules still apply to the transcript in every mode.
    """)
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

  @doc(aiPostPromptAuthUserDescription)
  @example("username")
  post_prompt_auth_user?: string;

  @doc(aiPostPromptAuthPasswordDescription)
  @example("password")
  post_prompt_auth_password?: string;

  @doc(aiPronounceDescription)
  pronounce?: Pronounce[];

  @doc(aiPromptDescription)
  prompt: AIPrompt;

  @doc(aiSwaigDescription)
  SWAIG?: SWAIG;

  @doc(aiVoiceDescription)
  @example("elevenlabs.rachel")
  voice?: string;
}

@doc("The ID of a saved AI agent.")
@format("uuid")
scalar AIAgentId extends string;

@summary("AI agent reference")
model AIAgentObject {
  @doc(aiAgentDescription)
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  agent: AIAgentId | SWMLVar;
}

@summary("ai Method")
model AI {
  @doc(aiDescription)
  @summary("ai")
  ai: AIObject | AIAgentObject;
}
