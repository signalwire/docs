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

@route("/registry/beta")
namespace SignalWireAPI.RelayRest.RegistryBeta {
  @route("/brands")
  @tag(CAMPAIGN_REGISTRY_BRANDS_TAG)
  @friendlyName("Brands")
  interface Brands {
    @operationId("list_brands")
    @summary("List brands")
    @doc("""
      Lists the project's US 10-digit long code (10DLC) brand registrations. Each brand represents the business identity that must be registered before its messaging use cases can become campaigns. Use [Get brand](/docs/apis/rest/campaign-registry/brands/retrieve-brand) when you already have the brand ID.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
      """)
    list(
      @query
      @doc("The name given to the brand. Will return all Brands containing this value as a substring.")
      filter_name?: string,

      @query
      @doc("The state of the brand in the registration process, such as pending or complete. Will return all Brands with this value.")
      filter_state?: string,
    ): BrandListResponse | StatusCode401 | StatusCode500;

    @operationId("create_brand")
    @summary("Create brand")
    @doc("""
      Submits a business identity for US 10-digit long code (10DLC) brand registration, or imports an approved self-registered Campaign Service Provider brand. Use it as the first Campaign Registry step before [Create campaign](/docs/apis/rest/campaign-registry/campaigns/create-campaign); creating a project or phone number does not register a 10DLC brand.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
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
    @summary("Get brand")
    @doc("""
      Retrieves one US 10-digit long code (10DLC) brand registration by ID so you can check its business identity and registration progress. Use [List brands](/docs/apis/rest/campaign-registry/brands/list-brands) to discover IDs or [List campaigns](/docs/apis/rest/campaign-registry/campaigns/list-campaigns) for messaging use cases registered under the brand.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
      """)
    read(...BrandPathID):
      | BrandResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }

  @route("/brands/{id}/campaigns")
  @tag(CAMPAIGN_REGISTRY_CAMPAIGNS_TAG)
  @friendlyName("Brand Campaigns")
  interface BrandCampaigns {
    @operationId("list_campaigns")
    @summary("List campaigns")
    @doc("""
      Lists the US 10-digit long code (10DLC) messaging campaigns registered under one brand. Each campaign represents an approved messaging use case to which project phone numbers can be assigned. Use [Get campaign](/docs/apis/rest/campaign-registry/campaigns/retrieve-campaign) when you already have a campaign ID.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
      """)
    @get
    listCampaigns(
      ...BrandPathID,

      @query
      @doc("The name given to the campaign. Will return all Campaigns containing this value as a substring.")
      filter_name?: string,

      @query
      @doc("The state of the campaign in the registration process, such as pending or complete. Will return all campaigns with this value.")
      filter_state?: string,
    ): CampaignListResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("create_campaign")
    @summary("Create campaign")
    @doc("""
      Submits a US 10-digit long code (10DLC) messaging use case under an existing brand, or imports an approved Campaign Service Provider campaign. Use it after brand registration and before assigning phone numbers. Once the campaign is ready, use [Create phone number assignment order](/docs/apis/rest/campaign-registry/phone-number-assignments/create-order) to bind project numbers to it.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
      """)
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
  @tag(CAMPAIGN_REGISTRY_CAMPAIGNS_TAG)
  @friendlyName("Campaigns")
  interface Campaigns {
    @operationId("retrieve_campaign")
    @summary("Get campaign")
    @doc("""
      Retrieves one US 10-digit long code (10DLC) campaign by ID so you can inspect its registered messaging use case and approval progress. Use [List campaigns](/docs/apis/rest/campaign-registry/campaigns/list-campaigns) to discover IDs or [List phone number assignments](/docs/apis/rest/campaign-registry/phone-number-assignments/list-number-assignments) for the numbers bound to it.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
      """)
    read(...CampaignPathID):
      | CampaignResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("update_campaign")
    @summary("Update campaign")
    @doc("""
      Changes the editable fields of an existing US 10-digit long code (10DLC) campaign by ID. Use it to maintain the campaign registration itself; phone numbers are added through [Create phone number assignment order](/docs/apis/rest/campaign-registry/phone-number-assignments/create-order) and removed through the assignment delete operation.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
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
  }

  @route("/campaigns/{id}/numbers")
  @tag(CAMPAIGN_REGISTRY_ASSIGNMENTS_TAG)
  @friendlyName("Campaign Numbers")
  interface CampaignNumbers {
    @operationId("list_number_assignments")
    @summary("List phone number assignments")
    @doc("""
      Lists the project phone numbers bound to one US 10-digit long code (10DLC) campaign. These assignments determine which numbers may send traffic for the registered use case. Use [List phone number assignment orders](/docs/apis/rest/campaign-registry/phone-number-assignments/list-orders) to monitor batch requests that create the bindings.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
      """)
    @get
    listNumbers(
      ...CampaignPathID,

      @query
      @doc("The state of the assignments in the registration process, such as pending or complete. Will return all assignments with this value.")
      filter_state?: string,
    ):
      | AssignedNumberListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }

  @route("/campaigns/{id}/orders")
  @tag(CAMPAIGN_REGISTRY_ASSIGNMENTS_TAG)
  @friendlyName("Campaign Orders")
  interface CampaignOrders {
    @operationId("list_orders")
    @summary("List phone number assignment orders")
    @doc("""
      Lists the batch requests submitted to bind project phone numbers to one US 10-digit long code (10DLC) campaign. Use it to monitor assignment processing; use [List phone number assignments](/docs/apis/rest/campaign-registry/phone-number-assignments/list-number-assignments) for the resulting bindings.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
      """)
    @get
    listOrders(
      ...CampaignPathID,

      @query
      @doc("The state of the orders in the registration process, such as pending or processed. Will return all orders with this value.")
      filter_state?: string,
    ): OrderListResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("create_order")
    @summary("Create phone number assignment order")
    @doc("""
      Submits a batch request to assign project phone numbers to one US 10-digit long code (10DLC) campaign. Use it after the brand and campaign are registered and the numbers are owned by the project. Monitor processing with [Get phone number assignment order](/docs/apis/rest/campaign-registry/phone-number-assignments/retrieve-order).

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
      """)
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
  @tag(CAMPAIGN_REGISTRY_ASSIGNMENTS_TAG)
  @friendlyName("Assigned Numbers")
  interface AssignedNumbers {
    @operationId("delete_number_assignment")
    @summary("Delete phone number assignment")
    @doc("""
      Removes one phone-number assignment from its US 10-digit long code (10DLC) campaign by assignment ID. Use it when the number should stop sending traffic for that campaign; this does not release the phone number from the project or delete the campaign.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
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
  @tag(CAMPAIGN_REGISTRY_ASSIGNMENTS_TAG)
  @friendlyName("Orders")
  interface Orders {
    @operationId("retrieve_order")
    @summary("Get phone number assignment order")
    @doc("""
      Retrieves one phone-number assignment order by ID so you can monitor a known batch request. Use [List phone number assignment orders](/docs/apis/rest/campaign-registry/phone-number-assignments/list-orders) to discover orders for a campaign or list assignments to inspect the resulting bindings.

      ${tokenPermissions<"_Messaging_ and _Numbers_">}
      """)
    read(...OrderPathID):
      | OrderResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
