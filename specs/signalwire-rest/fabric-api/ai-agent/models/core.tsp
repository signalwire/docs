import "./enums.tsp";
import "../../../types";
import "../../../../swml/calling/Methods/ai/main.tsp";

using TypeSpec.Http;

model AIAgentPathID {
  @doc("Unique ID of an AI Agent.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

@summary("AI Agent")
@doc("""
  ${SWML.Calling.aiDescription}

  See the [SWML `ai` method reference](/docs/swml/reference/calling/ai) for the complete configuration contract.
  """)
model AIAgent {
  @doc("""
    ${SWML.Calling.aiGlobalDataDescription}

    See [`ai.global_data` in the SWML reference](/docs/swml/reference/calling/ai).
    """)
  @example(#{ company_name: "Acme Corp", support_hours: "9am-5pm EST" })
  global_data?: TypeSpec.Record<unknown>;

  @doc("""
    ${SWML.Calling.aiHintsDescription}

    See [`ai.hints` in the SWML reference](/docs/swml/reference/calling/ai).
    """)
  @example(#["pizza", "pepperoni"])
  hints?: (string | TypeSpec.Record<unknown>)[];

  @doc("""
    ${SWML.Calling.aiLanguagesDescription}

    See the [SWML `ai.languages` reference](/docs/swml/reference/calling/ai/languages).
    """)
  @example(#[#{ name: "English", code: "en-US", voice: "rime.spore" }])
  languages?: TypeSpec.Record<unknown>[];

  @doc("""
    ${SWML.Calling.aiMultilingualDescription}

    See the [SWML `ai.multilingual` reference](/docs/swml/reference/calling/ai/multilingual).
    """)
  @example(#{
    languages: #[
      #{ language: "en", voice: "rime.spore" },
      #{ language: "es", voice: "elevenlabs.rachel:eleven_flash_v2_5" }
    ],
    allowed: #["en", "es"],
  })
  multilingual?: TypeSpec.Record<unknown>;

  @doc("""
    ${SWML.Calling.aiParamsDescription}

    See the [SWML `ai.params` reference](/docs/swml/reference/calling/ai/params).
    """)
  @example(#{ ai_model: "gpt-4o-mini", wait_for_user: true })
  params?: TypeSpec.Record<unknown>;

  @doc("""
    ${SWML.Calling.aiPostPromptDescription}

    See [`ai.post_prompt` in the SWML reference](/docs/swml/reference/calling/ai).
    """)
  @example(#{
    text: "Summarize the conversation and provide any follow-up action items.",
  })
  post_prompt?: TypeSpec.Record<unknown>;

  @doc("""
    ${SWML.Calling.aiPostPromptUrlDescription}

    See [`ai.post_prompt_url` in the SWML reference](/docs/swml/reference/calling/ai#post_prompt_url-callback).
    """)
  @example("username:password@https://example.com")
  post_prompt_url?: url;

  @doc("""
    ${SWML.Calling.aiPronounceDescription}

    See [`ai.pronounce` in the SWML reference](/docs/swml/reference/calling/ai).
    """)
  @example(#[#{ replace: "SWML", with: "swim-el", ignore_case: true }])
  pronounce?: TypeSpec.Record<unknown>[];

  @doc("""
    ${SWML.Calling.aiPromptDescription}

    See the [SWML `ai.prompt` reference](/docs/swml/reference/calling/ai/prompt).
    """)
  @example(#{ text: "You are a helpful customer support assistant." })
  prompt: TypeSpec.Record<unknown>;

  @doc("""
    ${SWML.Calling.aiSwaigDescription}

    See the [SWML `ai.SWAIG` reference](/docs/swml/reference/calling/ai/swaig).
    """)
  @example(#{ native_functions: #["check_time"] })
  SWAIG?: TypeSpec.Record<unknown>;

  @doc("Unique ID of an AI Agent.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  agent_id: uuid;

  @doc("Name of the AI Agent.")
  @example("My AI Agent")
  name: string;
}
