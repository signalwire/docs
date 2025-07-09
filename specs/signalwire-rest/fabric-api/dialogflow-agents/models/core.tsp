import "../../../types";

using TypeSpec.Http;

model DialogflowAgentPathID {
  @doc("Unique ID of a Dialogflow Agent.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid
}

model DialogflowAgentID {
  @doc("Unique ID of a Dialogflow Agent.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  dialogflow_agent_id: uuid
}

model DialogflowAgent {
  @doc("Whether to enable the 'say' feature")
  @example(true)
  say_enabled?: boolean;

  @doc("Default message to say")
  @example("Welcome to the Booking Assistant")
  say?: string;

  @doc("Voice to use for speech")
  @example("en-US-Wavenet-D")
  voice?: string;

  @doc("Display name of the Dialogflow Agent")
  @example("Booking Assistant")
  display_name?: string;

  @doc("Dialogflow reference ID")
  @example("12345678-1234-1234-1234-1234567890ab")
  dialogflow_reference_id?: uuid;

  @doc("Dialogflow reference name")
  @example("my dialogflow agent")
  dialogflow_reference_name?: string;
}

model DialogflowAgentWithID {
  ...DialogflowAgentID,
  ...DialogflowAgent
}