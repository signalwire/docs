import "../ai";

union BedrockPickedParams {
  "hard_stop_time",
  "hard_stop_prompt",
  "inactivity_timeout",
  "attention_timeout",
  "video_talking_file",
  "video_idle_file",
  "video_listening_file",
}

model BedrockParams {
  ...PickProperties<AIParams, BedrockPickedParams>;
  ...TypeSpec.Record<unknown>;
}
