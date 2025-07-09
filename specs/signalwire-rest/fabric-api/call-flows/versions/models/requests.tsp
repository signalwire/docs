import "@typespec/http";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@oneOf
union CallFlowVersionDeployRequest {
  @doc("Deploy using document version number")
  documentVersion: CallFlowVersionDeployByDocumentVersion;
  
  @doc("Deploy using call flow version ID")
  versionId: CallFlowVersionDeployByVersionId;
}

model CallFlowVersionDeployByDocumentVersion {
  @doc("The current revision of the call flow.")
  @example(2)
  document_version: int32;
}

model CallFlowVersionDeployByVersionId {
  @doc("Any call flow version ID for this call flow.")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  call_flow_version_id: string;
}