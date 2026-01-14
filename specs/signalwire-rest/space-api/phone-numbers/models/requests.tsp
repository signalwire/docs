import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for purchasing a phone number.")
model PurchasePhoneNumberRequest {
  @doc("The phone number to purchase in E.164 format.")
  @example("+15551234567")
  number: string;

  @doc("The friendly name for the phone number.")
  @example("Main Office Line")
  name?: string;

  @doc("The address ID to associate with the phone number.")
  @format("uuid")
  address_id?: uuid;
}

@doc("Request body for updating a phone number.")
model UpdatePhoneNumberRequest {
  @doc("The friendly name for the phone number.")
  @example("Main Office Line")
  name?: string;

  @doc("The call handler for the phone number.")
  call_handler?: string;

  @doc("The call receive mode for the phone number.")
  call_receive_mode?: string;

  @doc("The call request URL for the phone number.")
  call_request_url?: string;

  @doc("The call request method for the phone number.")
  call_request_method?: "GET" | "POST";

  @doc("The call fallback URL for the phone number.")
  call_fallback_url?: string;

  @doc("The call fallback method for the phone number.")
  call_fallback_method?: "GET" | "POST";

  @doc("The call status callback URL for the phone number.")
  call_status_callback_url?: string;

  @doc("The call status callback method for the phone number.")
  call_status_callback_method?: "GET" | "POST";

  @doc("The message handler for the phone number.")
  message_handler?: string;

  @doc("The message receive mode for the phone number.")
  message_receive_mode?: string;

  @doc("The message request URL for the phone number.")
  message_request_url?: string;

  @doc("The message request method for the phone number.")
  message_request_method?: "GET" | "POST";

  @doc("The message fallback URL for the phone number.")
  message_fallback_url?: string;

  @doc("The message fallback method for the phone number.")
  message_fallback_method?: "GET" | "POST";
}

@doc("Request body for importing a phone number.")
model ImportPhoneNumberRequest {
  @doc("The phone number to import in E.164 format.")
  @example("+15551234567")
  number: string;

  @doc("The friendly name for the phone number.")
  @example("Imported Line")
  name?: string;
}
