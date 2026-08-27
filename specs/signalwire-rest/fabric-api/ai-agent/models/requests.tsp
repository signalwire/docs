model AIAgentCreateRequest {
  // agent_id is server-generated and ignored when supplied by clients.
  ...OmitProperties<AIAgent, "agent_id">;
}

model AIAgentUpdateRequest {
  // agent_id is server-generated and ignored when supplied by clients.
  ...OmitProperties<AIAgent, "agent_id">;
}
