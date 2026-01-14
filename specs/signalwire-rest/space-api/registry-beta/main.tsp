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
    @operationId("list_registry_brands")
    @summary("List all Brands")
    @doc("""
      Returns a list of your registered brands for 10DLC.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    list(): BrandListResponse | StatusCode401 | StatusCode500;

    @operationId("create_registry_brand")
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

    @operationId("get_registry_brand")
    @summary("Retrieve a Brand")
    @doc("""
      Retrieves the details of a brand.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    read(...BrandPathID): BrandResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_registry_brand")
    @summary("Update a Brand")
    @doc("""
      Updates a brand.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @put
    update(...BrandPathID, @body body: UpdateBrandRequest):
      | {
          @statusCode statusCode: 200;
          @body brand: BrandResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_registry_brand")
    @summary("Delete a Brand")
    @doc("""
      Deletes a brand.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @delete
    delete(...BrandPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }

  @route("/campaigns")
  @tag(CAMPAIGN_REGISTRY_TAG)
  @friendlyName("Campaigns")
  interface Campaigns {
    @operationId("list_registry_campaigns")
    @summary("List all Campaigns")
    @doc("""
      Returns a list of your registered campaigns for 10DLC.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    list(): CampaignListResponse | StatusCode401 | StatusCode500;

    @operationId("create_registry_campaign")
    @summary("Create a Campaign")
    @doc("""
      Creates a new campaign for 10DLC registration.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @post
    create(@body body: CreateCampaignRequest):
      | {
          @statusCode statusCode: 201;
          @body campaign: CampaignResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("get_registry_campaign")
    @summary("Retrieve a Campaign")
    @doc("""
      Retrieves the details of a campaign.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    read(...CampaignPathID): CampaignResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_registry_campaign")
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

    @operationId("delete_registry_campaign")
    @summary("Delete a Campaign")
    @doc("""
      Deletes a campaign.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @delete
    delete(...CampaignPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }

  @route("/numbers")
  @tag(CAMPAIGN_REGISTRY_TAG)
  @friendlyName("Assigned Numbers")
  interface AssignedNumbers {
    @operationId("list_registry_numbers")
    @summary("List all Assigned Numbers")
    @doc("""
      Returns a list of phone numbers assigned to campaigns.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    list(
      @query
      @doc("Filter by campaign ID.")
      campaign_id?: string
    ): AssignedNumberListResponse | StatusCode401 | StatusCode500;

    @operationId("assign_registry_number")
    @summary("Assign a Number to a Campaign")
    @doc("""
      Assigns a phone number to a campaign.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @post
    create(@body body: AssignNumberRequest):
      | {
          @statusCode statusCode: 201;
          @body assigned_number: AssignedNumberResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("get_registry_number")
    @summary("Retrieve an Assigned Number")
    @doc("""
      Retrieves the details of an assigned number.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    read(...AssignedNumberPathID): AssignedNumberResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("unassign_registry_number")
    @summary("Unassign a Number from a Campaign")
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
    @operationId("list_registry_orders")
    @summary("List all Orders")
    @doc("""
      Returns a list of campaign registry orders.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    list(): OrderListResponse | StatusCode401 | StatusCode500;

    @operationId("get_registry_order")
    @summary("Retrieve an Order")
    @doc("""
      Retrieves the details of an order.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    read(...OrderPathID): OrderResponse | StatusCode401 | StatusCode404 | StatusCode500;
  }
}
