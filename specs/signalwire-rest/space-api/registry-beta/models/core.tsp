import "../../../types";

using TypeSpec.Http;
using Types;

model BrandPathID {
  @doc("Unique ID of the brand.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

model CampaignPathID {
  @doc("Unique ID of the campaign.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

model AssignedNumberPathID {
  @doc("Unique ID of the assigned number.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

model OrderPathID {
  @doc("Unique ID of the order.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

@doc("Brand status.")
enum BrandStatus {
  Pending: "pending",
  Approved: "approved",
  Rejected: "rejected",
  Suspended: "suspended",
}

@doc("Campaign status.")
enum CampaignStatus {
  Pending: "pending",
  Approved: "approved",
  Rejected: "rejected",
  Suspended: "suspended",
}

@doc("Order status.")
enum OrderStatus {
  Pending: "pending",
  Processing: "processing",
  Completed: "completed",
  Failed: "failed",
}

@doc("Brand model for 10DLC registration.")
model Brand {
  @doc("The unique identifier of the brand.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The name of the brand.")
  @example("Acme Corp")
  name: string;

  @doc("The display name of the brand.")
  @example("Acme Corporation")
  display_name?: string;

  @doc("The entity type of the brand.")
  @example("PRIVATE_PROFIT")
  entity_type?: string;

  @doc("The EIN/Tax ID of the brand.")
  @example("12-3456789")
  ein?: string;

  @doc("The country of the brand.")
  @example("US")
  country?: string;

  @doc("The status of the brand.")
  status?: BrandStatus;

  @doc("The brand ID from the campaign registry.")
  csp_brand_id?: string;

  @doc("Timestamp when the brand was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the brand was last updated.")
  updated_at?: utcDateTime;
}

@doc("Campaign model for 10DLC registration.")
model Campaign {
  @doc("The unique identifier of the campaign.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The brand ID associated with the campaign.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  brand_id: uuid;

  @doc("The name of the campaign.")
  @example("Marketing Campaign")
  name: string;

  @doc("The description of the campaign.")
  @example("Marketing messages for promotions")
  description?: string;

  @doc("The use case of the campaign.")
  @example("MARKETING")
  use_case?: string;

  @doc("Sample messages for the campaign.")
  sample_messages?: string[];

  @doc("The status of the campaign.")
  status?: CampaignStatus;

  @doc("The campaign ID from the campaign registry.")
  csp_campaign_id?: string;

  @doc("Timestamp when the campaign was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the campaign was last updated.")
  updated_at?: utcDateTime;
}

@doc("Assigned number model for campaign registration.")
model AssignedNumber {
  @doc("The unique identifier of the assigned number.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The campaign ID associated with the number.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  campaign_id: uuid;

  @doc("The phone number in E.164 format.")
  @example("+15551234567")
  phone_number: string;

  @doc("The phone number ID.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  phone_number_id?: uuid;

  @doc("Timestamp when the assignment was created.")
  created_at?: utcDateTime;
}

@doc("Order model for campaign registry operations.")
model Order {
  @doc("The unique identifier of the order.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The type of order.")
  @example("brand_registration")
  order_type?: string;

  @doc("The status of the order.")
  status?: OrderStatus;

  @doc("The associated resource ID.")
  @format("uuid")
  resource_id?: uuid;

  @doc("Error message if the order failed.")
  error_message?: string;

  @doc("Timestamp when the order was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the order was last updated.")
  updated_at?: utcDateTime;
}
