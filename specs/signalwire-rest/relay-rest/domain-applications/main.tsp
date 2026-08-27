import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/domain_applications")
namespace SignalWireAPI.RelayRest.DomainApplications {
  @tag(SPACE_DOMAIN_APPLICATIONS_TAG)
  @friendlyName("Domain Applications")
  interface DomainApplications {
    @operationId("list_domain_applications")
    @summary("List domain applications")
    @doc("""
      Lists the SIP Domain Applications in your SignalWire project. A Domain Application gives inbound SIP traffic a project-specific domain and routes its calls to a configured handler. Use [Assign domain application handler](/docs/apis/rest/domain-applications/assign-resource-domain-application) when that handler is an existing Fabric resource. Results are sorted by creation date, most recent first.
      
      ${tokenPermissions<"_Voice_, _Messaging_, or _Fax_">}
      """)
    list(...ListDomainApplicationsQuery):
      | DomainApplicationListResponse
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("create_domain_application")
    @summary("Create domain application")
    @doc("""
      Creates a SIP Domain Application that accepts inbound SIP traffic on its generated domain and routes calls to the configured handler. Use it for inbound bring-your-own-carrier or other custom SIP-domain routing. If the handler is an already-created Fabric resource, create the Domain Application first, then use [Assign domain application handler](/docs/apis/rest/domain-applications/assign-resource-domain-application).
      
      ${tokenPermissions<"_Voice_, _Messaging_, or _Fax_">}
      """)
    @post
    create(@body body: CreateDomainApplicationRequest):
      | {
          @statusCode statusCode: 201;
          @body domain_application: DomainApplicationResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("retrieve_domain_application")
    @summary("Get domain application")
    @doc("""
      Retrieves one SIP Domain Application from your SignalWire project. Use [List domain applications](/docs/apis/rest/domain-applications/list-domain-applications) to find applications, or the Fabric assignment operation when you only need to attach an existing resource as its call handler.
      
      ${tokenPermissions<"_Voice_, _Messaging_, or _Fax_">}
      """)
    read(...DomainApplicationPathID):
      | DomainApplicationResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("update_domain_application")
    @summary("Update domain application")
    @doc("""
      Changes how a project SIP domain authenticates endpoints, handles media, or routes inbound calls. Use [Assign domain application handler](/docs/apis/rest/domain-applications/assign-resource-domain-application) when assigning an existing Fabric resource as the calling handler.
      
      ${tokenPermissions<"_Voice_, _Messaging_, or _Fax_">}
      """)
    @put
    update(
      ...DomainApplicationPathID,
      @body body: UpdateDomainApplicationRequest,
    ):
      | DomainApplicationResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_domain_application")
    @summary("Delete domain application")
    @doc("""
      Permanently deletes a SIP Domain Application by ID, stopping inbound SIP traffic to its domain. This does not delete a Fabric resource that was assigned as its handler; delete that resource through its typed endpoint if it is also no longer needed.
      
      ${tokenPermissions<"_Voice_, _Messaging_, or _Fax_">}
      """)
    @delete
    delete(...DomainApplicationPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
