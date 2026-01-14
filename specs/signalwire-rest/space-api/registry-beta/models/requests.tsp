import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for creating a brand.")
model CreateBrandRequest {
  @doc("The name of the brand.")
  @example("Acme Corp")
  name: string;

  @doc("The display name of the brand.")
  @example("Acme Corporation")
  display_name?: string;

  @doc("The entity type of the brand.")
  @example("PRIVATE_PROFIT")
  entity_type: string;

  @doc("The EIN/Tax ID of the brand.")
  @example("12-3456789")
  ein?: string;

  @doc("The country of the brand.")
  @example("US")
  country?: string;

  @doc("The street address of the brand.")
  street?: string;

  @doc("The city of the brand.")
  city?: string;

  @doc("The state of the brand.")
  state?: string;

  @doc("The postal code of the brand.")
  postal_code?: string;

  @doc("The website of the brand.")
  website?: string;

  @doc("The vertical/industry of the brand.")
  vertical?: string;
}

@doc("Request body for updating a brand.")
model UpdateBrandRequest {
  @doc("The display name of the brand.")
  @example("Acme Corporation")
  display_name?: string;

  @doc("The website of the brand.")
  website?: string;
}

@doc("Request body for creating a campaign.")
model CreateCampaignRequest {
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
  use_case: string;

  @doc("Sample messages for the campaign.")
  sample_messages?: string[];

  @doc("Whether the campaign includes embedded links.")
  has_embedded_links?: boolean;

  @doc("Whether the campaign includes embedded phone numbers.")
  has_embedded_phone?: boolean;

  @doc("Whether the campaign includes age-gated content.")
  age_gated?: boolean;

  @doc("Whether the campaign is for direct lending.")
  direct_lending?: boolean;

  @doc("Whether subscribers opted in.")
  subscriber_optin?: boolean;

  @doc("Whether subscribers can opt out.")
  subscriber_optout?: boolean;

  @doc("Whether subscriber help is available.")
  subscriber_help?: boolean;
}

@doc("Request body for updating a campaign.")
model UpdateCampaignRequest {
  @doc("The description of the campaign.")
  @example("Marketing messages for promotions")
  description?: string;

  @doc("Sample messages for the campaign.")
  sample_messages?: string[];
}

@doc("Request body for assigning a number to a campaign.")
model AssignNumberRequest {
  @doc("The phone number ID to assign.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  phone_number_id: uuid;
}
