import "../../../types";

using TypeSpec.Http;
using Types;

model PhoneNumberPathID {
  @doc("Unique ID of the phone number.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

model E164NumberPath {
  @doc("The phone number in E.164 format.")
  @example("+15551234567")
  @path
  e164_number: string;
}

@doc("Phone number model.")
model PhoneNumber {
  @doc("The unique identifier of the phone number.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The phone number in E.164 format.")
  @example("+15551234567")
  number: string;

  @doc("The friendly name for the phone number.")
  @example("Main Office Line")
  name?: string;

  @doc("The capabilities of the phone number.")
  capabilities?: PhoneNumberCapabilities;

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

  @doc("Timestamp when the phone number was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the phone number was last updated.")
  updated_at?: utcDateTime;
}

@doc("Phone number capabilities.")
model PhoneNumberCapabilities {
  @doc("Whether the phone number can receive voice calls.")
  voice?: boolean;

  @doc("Whether the phone number can send/receive SMS.")
  sms?: boolean;

  @doc("Whether the phone number can send/receive MMS.")
  mms?: boolean;

  @doc("Whether the phone number can send/receive fax.")
  fax?: boolean;
}

@doc("Available phone number for purchase.")
model AvailablePhoneNumber {
  @doc("The phone number in E.164 format.")
  @example("+15551234567")
  number: string;

  @doc("The region of the phone number.")
  @example("CA")
  region?: string;

  @doc("The city of the phone number.")
  @example("Los Angeles")
  city?: string;

  @doc("The rate center of the phone number.")
  rate_center?: string;

  @doc("The LATA of the phone number.")
  lata?: string;

  @doc("The capabilities of the phone number.")
  capabilities?: PhoneNumberCapabilities;
}

@doc("Phone number lookup result.")
model PhoneNumberLookup {
  @doc("The phone number in E.164 format.")
  @example("+15551234567")
  e164: string;

  @doc("The carrier information.")
  carrier?: CarrierInfo;

  @doc("The caller name information.")
  caller_name?: CallerNameInfo;
}

@doc("Carrier information.")
model CarrierInfo {
  @doc("The carrier name.")
  @example("Verizon")
  name?: string;

  @doc("The carrier type.")
  @example("mobile")
  type?: string;

  @doc("The mobile country code.")
  mobile_country_code?: string;

  @doc("The mobile network code.")
  mobile_network_code?: string;
}

@doc("Caller name information.")
model CallerNameInfo {
  @doc("The caller name.")
  @example("John Doe")
  caller_name?: string;

  @doc("The caller type.")
  @example("CONSUMER")
  caller_type?: string;
}
