import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/{id}/domain_applications")
namespace SignalWireAPI.Fabric.DomainApplications {
  @tag(FABRIC_DOMAIN_APPLICATIONS_TAG)
  interface DomainApplications {
    @operationId("assign_resource_domain_application")
    @summary("Assign domain application handler")
    @doc("""
      Assigns an existing resource as the calling handler for a SIP Domain Application, so inbound SIP calls to that Domain Application run the resource. Use it when the Domain Application already exists and its handler should be a Fabric resource such as an AI Agent, Call Flow, or SIP Gateway. Use [Create domain application](/docs/apis/rest/domain-applications/create-domain-application) to create and configure the SIP-facing Domain Application itself.
      <Note>
      Currently only supports `calling` as a handler and automatically defaults to it.
      </Note>
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    assign(
      ...DomainApplicationPathID,
      @body request: DomainApplicationAssignRequest,
    ):
      | {
          @statusCode statusCode: 200;
          @body domain_application: DomainApplicationResponse;
        }
      | StatusCode401
      | StatusCode404
      | DomainApplicationCreateStatusCode422
      | StatusCode500;
  }
}
