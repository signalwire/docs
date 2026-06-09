import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";
import "../ai/_shared/global_data.tsp";
import "../live_transcribe";
import "./prompt.tsp";
import "./params.tsp";
import "./permissions.tsp";
import "./swaig";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarObject object")
model AISidecarObject {
  @doc("""
    The operator prompt that instructs the sidecar how to coach the agent. May be a plain string, a Prompt Object Model (POM), or a server-side file reference.
    SignalWire automatically adds built-in instructions for the sidecar's role, so your prompt only needs to describe the coaching behavior. When omitted, the sidecar uses a minimal default prompt, so setting one is strongly recommended.
    """)
  prompt?: AISidecarPrompt;

  @doc("The conversation language as a single BCP-47 tag. Sets the speech recognition language and is shared with the model as a hint.")
  @example(string("en-US"))
  @minLength(1)
  lang: string | SWMLVar;

  @doc("The model used for the sidecar's advice and its end-of-call summaries. Suggested values: `gpt-4o-mini`, `gpt-4.1-mini`, `gpt-4.1-nano`. **Default:** `gpt-4o-mini`.")
  @example("gpt-4.1-mini")
  `model`?: SupportedAIModels = "gpt-4o-mini";

  @doc("The call legs to observe. Both legs are required — a single-leg value is rejected. When omitted, both legs are observed. **Default:** both legs (`remote-caller` and `local-caller`).")
  @example(#[
    TranscribeDirection.`remote-caller`,
    TranscribeDirection.`local-caller`
  ])
  direction?: TranscribeDirection[] = #[
    TranscribeDirection.`remote-caller`,
    TranscribeDirection.`local-caller`
  ];

  @doc("Which leg is the customer, used as the turn-end trigger source. **Default:** `remote-caller`.")
  @example(TranscribeDirection.`remote-caller`)
  customer_role?: TranscribeDirection = TranscribeDirection.`remote-caller`;

  @doc("""
    The webhook URL the sidecar POSTs its callbacks to. Receives both transcription events and sidecar callbacks.
    When unset, callbacks are published only on the relay topic and no webhook POST is made.
    Basic auth can be embedded in the URL in the format `username:password@url`.
    """)
  @example("https://example.com/sidecar/events")
  url?: url;

  @doc("SWAIG functions and MCP servers available to the sidecar.")
  SWAIG?: AISidecarSWAIG;

  @doc("SWAIG permission overrides. Defaults to all permissions enabled.")
  permissions?: AISidecarPermissions;

  @doc("""
    A key-value object of data that is available throughout the sidecar session. You can reference it in the prompt with variable expansion, and it is included in the requests sent to your tools.
    It also persists across sessions on the same call leg.
    """)
  @example(#{ company_name: "Acme Corp" })
  global_data?: GlobalData;

  @doc("Hints that improve speech recognition of specific terms, such as product names, competitor names, jargon, or customer names. Strongly recommended.")
  @example(#["ACME", "Globex", "FedRAMP", "SOC 2"])
  @minItems(1)
  hints?: string[];

  @doc("Tuning options for the sidecar.")
  params?: AISidecarParams;

  @doc("""
    On-demand action dispatch. When `action.summarize` is present, the request summarizes the conversation and returns,
    instead of starting a new sidecar.
    """)
  action?: AISidecarSummarizeAction;
}

@summary("AISidecarSummarizeAction object")
model AISidecarSummarizeAction {
  @doc("""
    Routes the request to the sidecar's summarize path instead of starting a new sidecar.
    Generates a one-off summary of the conversation and delivers it to the webhook.
    """)
  summarize: {
    @doc("The webhook URL the summary is POSTed to. Defaults to the sidecar's configured `url`.")
    @example("https://example.com/summary-webhook")
    webhook?: string;

    @doc("The prompt used to generate the summary. Defaults to the configured `ai_summary_prompt`.")
    @example("Provide a brief summary of the conversation including the main topics discussed.")
    prompt?: string;
  };
}

@summary("ai_sidecar Method")
model AISidecar {
  @summary("ai_sidecar")
  @doc("""
    Attach a real-time AI observer that listens to a live call and streams agent-facing advice to your application as webhook callbacks.
    The sidecar does not participate in the call; it watches the conversation and produces structured callbacks your application can consume.
    """)
  ai_sidecar: AISidecarObject;
}
