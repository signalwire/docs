import "./const.tsp";
import "./enums.tsp";

const FABRIC_RESOURCE_ID_EXAMPLE = "993ed018-9e79-4e50-b97b-984bd5534095";
const FABRIC_PROJECT_ID_EXAMPLE = "1313fe58-5e14-4c11-bbe7-6fdfa11fe780";
const FABRIC_CREATED_AT_EXAMPLE = utcDateTime.fromISO("2024-05-06T12:20:00Z");
const FABRIC_UPDATED_AT_EXAMPLE = utcDateTime.fromISO("2024-05-06T12:25:00Z");

const AI_AGENT_REQUEST_EXAMPLE = #{
  prompt: #{ text: "You are a helpful customer support assistant." },
  name: "Support Assistant",
};

const AI_AGENT_EXAMPLE = #{
  prompt: #{ text: "You are a helpful customer support assistant." },
  agent_id: "a87db7ed-8ebe-42e4-829f-8ba5a4152f54",
  name: "Support Assistant",
};

const AI_AGENT_RESPONSE_EXAMPLE = #{
  id: FABRIC_RESOURCE_ID_EXAMPLE,
  project_id: FABRIC_PROJECT_ID_EXAMPLE,
  display_name: "Support Assistant",
  type: FabricResponseType.AiAgent,
  created_at: FABRIC_CREATED_AT_EXAMPLE,
  updated_at: FABRIC_UPDATED_AT_EXAMPLE,
  ai_agent: AI_AGENT_EXAMPLE,
};

const CALL_FLOW_EXAMPLE = #{
  id: FABRIC_RESOURCE_ID_EXAMPLE,
  title: "Welcome Call Flow",
  flow_data: #{},
  relayml: SWML_CONTENTS_EXAMPLE,
  document_version: 1,
};

const CALL_FLOW_RESPONSE_EXAMPLE = #{
  id: FABRIC_RESOURCE_ID_EXAMPLE,
  project_id: FABRIC_PROJECT_ID_EXAMPLE,
  display_name: "Welcome Call Flow",
  type: FabricResponseType.CallFlow,
  created_at: FABRIC_CREATED_AT_EXAMPLE,
  updated_at: FABRIC_UPDATED_AT_EXAMPLE,
  call_flow: CALL_FLOW_EXAMPLE,
};

const CALL_FLOW_VERSION_EXAMPLE = #{
  id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  version: "1.0.0",
  created_at: "2024-05-06T12:20:00Z",
  updated_at: "2024-05-06T12:25:00Z",
  flow_data: #{},
  relayml: SWML_CONTENTS_EXAMPLE,
};

const CALLING_SWML_SCRIPT_EXAMPLE = #{
  id: FABRIC_RESOURCE_ID_EXAMPLE,
  display_name: "Welcome Script",
  script_type: "calling",
  request_url: "https://example.signalwire.com/api/fabric/resources/swml_scripts/993ed018-9e79-4e50-b97b-984bd5534095",
  contents: SWML_CONTENTS_EXAMPLE,
};

const MESSAGING_SWML_SCRIPT_EXAMPLE = #{
  id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  display_name: "Reply Bot",
  script_type: "messaging",
  request_url: "https://example.signalwire.com/api/fabric/resources/swml_scripts/3fa85f64-5717-4562-b3fc-2c963f66afa6",
  contents: SWML_MESSAGING_CONTENTS_EXAMPLE,
};

const CALLING_SWML_SCRIPT_RESPONSE_EXAMPLE = #{
  id: FABRIC_RESOURCE_ID_EXAMPLE,
  project_id: FABRIC_PROJECT_ID_EXAMPLE,
  display_name: "Welcome Script",
  type: FabricResponseType.SwmlScript,
  created_at: FABRIC_CREATED_AT_EXAMPLE,
  updated_at: FABRIC_UPDATED_AT_EXAMPLE,
  swml_script: CALLING_SWML_SCRIPT_EXAMPLE,
};

const MESSAGING_SWML_SCRIPT_RESPONSE_EXAMPLE = #{
  id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  project_id: FABRIC_PROJECT_ID_EXAMPLE,
  display_name: "Reply Bot",
  type: FabricResponseType.SwmlScript,
  created_at: FABRIC_CREATED_AT_EXAMPLE,
  updated_at: FABRIC_UPDATED_AT_EXAMPLE,
  swml_script: MESSAGING_SWML_SCRIPT_EXAMPLE,
};

const RESOURCE_AI_EXAMPLE = #{
  id: FABRIC_RESOURCE_ID_EXAMPLE,
  project_id: FABRIC_PROJECT_ID_EXAMPLE,
  display_name: "Support Assistant",
  created_at: FABRIC_CREATED_AT_EXAMPLE,
  updated_at: FABRIC_UPDATED_AT_EXAMPLE,
  type: FabricResponseType.AiAgent,
  ai_agent: AI_AGENT_EXAMPLE,
};

const RESOURCE_CALL_FLOW_EXAMPLE = #{
  id: FABRIC_RESOURCE_ID_EXAMPLE,
  project_id: FABRIC_PROJECT_ID_EXAMPLE,
  display_name: "Welcome Call Flow",
  created_at: FABRIC_CREATED_AT_EXAMPLE,
  updated_at: FABRIC_UPDATED_AT_EXAMPLE,
  type: FabricResponseType.CallFlow,
  call_flow: CALL_FLOW_EXAMPLE,
};

const RESOURCE_CALLING_SWML_SCRIPT_EXAMPLE = #{
  id: FABRIC_RESOURCE_ID_EXAMPLE,
  project_id: FABRIC_PROJECT_ID_EXAMPLE,
  display_name: "Welcome Script",
  created_at: FABRIC_CREATED_AT_EXAMPLE,
  updated_at: FABRIC_UPDATED_AT_EXAMPLE,
  type: FabricResponseType.SwmlScript,
  swml_script: CALLING_SWML_SCRIPT_EXAMPLE,
};

const RESOURCE_MESSAGING_SWML_SCRIPT_EXAMPLE = #{
  id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  project_id: FABRIC_PROJECT_ID_EXAMPLE,
  display_name: "Reply Bot",
  created_at: FABRIC_CREATED_AT_EXAMPLE,
  updated_at: FABRIC_UPDATED_AT_EXAMPLE,
  type: FabricResponseType.SwmlScript,
  swml_script: MESSAGING_SWML_SCRIPT_EXAMPLE,
};
