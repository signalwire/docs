import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/external_laml_handlers")
namespace FabricAPI.CXMLWebhooks {
  @tag("cXML Webhook")
  @friendlyName("cXML Webhooks")
  interface CXMLWebhooks {
    @summary("List cXML Webhooks")
    @doc("A list of cXML Webhooks")
    list():
      CXMLWebhookListResponse |
      StatusCode401 |
      StatusCode404;

    @summary("Get cXML Webhook")
    @doc("Returns an cXML Webhook by ID")
    read(...CXMLWebhookID): {
        @statusCode statusCode: 200;
        @body external_laml_handler: CXMLWebhookResponse;
      } |
      StatusCode401 |
      StatusCode404;

    @summary("Create cXML Webhook")
    @doc("Creates an cXML Webhook")
    @post create(...CXMLWebhookCreateRequest):
      { @statusCode statusCode: 201; @body external_laml_handler: CXMLWebhookResponse; } |
      StatusCode401 |
      StatusCode404 |
      CXMLWebhookCreateStatusCode422;

    @summary("Update cXML Webhook")
    @doc("Updates an cXML Webhook by ID")
    @patch update(...CXMLWebhookID, ...CXMLWebhookUpdateRequest): {
      @statusCode statusCode: 200; @body external_laml_handler: CXMLWebhookResponse;
    } |
      StatusCode401 |
      StatusCode404 |
      CXMLWebhookUpdateStatusCode422;

    @summary("Delete cXML Webhook")
    @doc("Deletes an cXML Webhook by ID")
    @delete delete(...CXMLWebhookID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}

