import "../../../types";

using TypeSpec.Http;

model ResourcePathID {
  @doc("Unique ID of a Resource.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

model RemoteAIAgent {
  @doc("Unique ID of the Remote AI Agent.")
  @example("b2a4c6e8-1f3d-4a5b-9c7e-0d2f4a6b8c1e")
  id: uuid;

  @doc("Name of the Remote AI Agent.")
  @example("Support Agent")
  name: string;

  @doc("URL of the agent you host. SignalWire requests the SWML document for each call from this URL.")
  @example("https://agent.example.com/swml")
  primary_request_url: url;

  @doc("URL SignalWire requests the SWML document from if the primary URL cannot be reached or fails.")
  @example("https://agent.example.com/fallback")
  fallback_request_url: url | null;

  @doc("URL that receives a JSON event when a call to this agent completes, with details of the finished call.")
  @example("https://agent.example.com/status")
  status_callback_url: url | null;
}
