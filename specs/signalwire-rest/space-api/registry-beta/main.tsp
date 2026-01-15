import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/registry/beta")
namespace SpaceAPI.RegistryBeta {
  @route("/brands")
  @tag(CAMPAIGN_REGISTRY_TAG)
  @friendlyName("Brands")
  interface Brands {
    @operationId("list_brands")
    @summary("List all Brands")
    @doc("""
      Returns a list of your registered brands for 10DLC.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    list(
      @query
      @doc("The name given to the brand. Will return all Brands containing this value as a substring.")
      filter_name?: string,

      @query
      @doc("The state of the brand in the registration process, such as pending or complete. Will return all Brands with this value.")
      filter_state?: string
    ): BrandListResponse | StatusCode401 | StatusCode500;

    @operationId("create_brand")
    @summary("Create a Brand")
    @doc("""
      Creates a new brand for 10DLC registration.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @post
    create(@body body: CreateBrandRequest):
      | {
          @statusCode statusCode: 201;
          @body brand: BrandResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("retrieve_brand")
    @summary("Retrieve a Brand")
    @doc("""
      Retrieves the details of a brand.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    read(...BrandPathID): BrandResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("list_campaigns")
    @summary("List all Campaigns")
    @doc("""
      Returns a list of campaigns for a brand.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @route("/{id}/campaigns")
    @get
    listCampaigns(
      ...BrandPathID,

      @query
      @doc("The name given to the campaign. Will return all Campaigns containing this value as a substring.")
      filter_name?: string,

      @query
      @doc("The state of the campaign in the registration process, such as pending or complete. Will return all campaigns with this value.")
      filter_state?: string
    ): CampaignListResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("create_campaign")
    @summary("Create a Campaign")
    @doc("""
      Creates a new campaign for 10DLC registration.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @route("/{id}/campaigns")
    @post
    createCampaign(...BrandPathID, @body body: CreateCampaignRequest):
      | {
          @statusCode statusCode: 201;
          @body campaign: CampaignResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;
  }

  @route("/campaigns")
  @tag(CAMPAIGN_REGISTRY_TAG)
  @friendlyName("Campaigns")
  interface Campaigns {
    @operationId("retrieve_campaign")
    @summary("Retrieve a Campaign")
    @doc("""
      Retrieves the details of a campaign.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    read(...CampaignPathID): CampaignResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_campaign")
    @summary("Update a Campaign")
    @doc("""
      Updates a campaign.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @put
    update(...CampaignPathID, @body body: UpdateCampaignRequest):
      | {
          @statusCode statusCode: 200;
          @body campaign: CampaignResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("list_number_assignments")
    @summary("List all Phone Number Assignments")
    @doc("""
      Returns a list of phone numbers assigned to a campaign.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @route("/{id}/numbers")
    @get
    listNumbers(
      ...CampaignPathID,

      @query
      @doc("The state of the assignments in the registration process, such as pending or complete. Will return all assignments with this value.")
      filter_state?: string
    ): AssignedNumberListResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("list_orders")
    @summary("List all Phone Number Assignment Orders")
    @doc("""
      Returns a list of orders for a campaign.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @route("/{id}/orders")
    @get
    listOrders(
      ...CampaignPathID,

      @query
      @doc("The state of the orders in the registration process, such as pending or processed. Will return all orders with this value.")
      filter_state?: string
    ): OrderListResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("create_order")
    @summary("Create a Phone Number Assignment Order")
    @doc("""
      Creates a new order for a campaign.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @route("/{id}/orders")
    @post
    createOrder(...CampaignPathID, @body body: CreateOrderRequest):
      | {
          @statusCode statusCode: 200;
          @body order: OrderResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;
  }

  @route("/numbers")
  @tag(CAMPAIGN_REGISTRY_TAG)
  @friendlyName("Assigned Numbers")
  interface AssignedNumbers {
    @operationId("delete_number_assignment")
    @summary("Delete a Phone Number Assignment")
    @doc("""
      Removes a phone number from a campaign.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @delete
    delete(...AssignedNumberPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }

  @route("/orders")
  @tag(CAMPAIGN_REGISTRY_TAG)
  @friendlyName("Orders")
  interface Orders {
    @operationId("retrieve_order")
    @summary("Retrieve a Phone Number Assignment Order")
    @doc("""
      Retrieves the details of an order.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    read(...OrderPathID): OrderResponse | StatusCode401 | StatusCode404 | StatusCode500;
  }
}
