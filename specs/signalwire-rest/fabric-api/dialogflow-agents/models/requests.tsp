import "./core.tsp";

model DialogflowAgentCreateRequest {
  @doc("Display name of the Dialogflow Agent")
  @example("Customer Service Agent")
  display_name: string;

  @doc("Dialogflow project ID")
  @example("my-project-12345")
  project_id: string;

  @doc("Dialogflow agent language code")
  @example("en-US")
  language_code: string;

  @doc("Initial event name to trigger")
  @example("welcome")
  initial_event?: string;

  @doc("Optional session parameters")
  session_params?: Record<string>;
}

model DialogflowAgentUpdateRequest {
  @doc("Name of the Dialogflow Agent")
  @example("Booking Assistant")
  name?: string;

  @doc("Whether to enable the 'say' feature")
  @example(true)
  say_enabled?: boolean;

  @doc("Default message to say")
  @example("Welcome to the Booking Assistant")
  say?: string;

  @doc("Voice to use for speech")
  @example("en-US-Wavenet-D")
  voice?: string;
}
