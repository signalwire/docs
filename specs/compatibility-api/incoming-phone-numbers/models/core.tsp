using TypeSpec.Http;

model IncomingPhoneNumbersAccountSidPath {
  @doc("The unique identifier for the account that is associated with this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  AccountSid: string;
}

model IncomingPhoneNumberSidPath {
  @doc("The unique identifier of the phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472pn")
  @format("uuid")
  @path
  Sid: string;
}

@doc("Address requirements.")
enum AddressRequirements {
  None: "none",
  Any: "any",
  Local: "local",
  Foreign: "foreign",
}

@doc("Emergency status.")
enum EmergencyStatus {
  Active: "active",
  Inactive: "inactive",
}

@doc("Phone number origin.")
enum PhoneNumberOrigin {
  SignalWire: "signalwire",
  Hosted: "hosted",
}

@doc("Phone number capabilities.")
model IncomingPhoneNumberCapabilities {
  @doc("Whether or not voice is enabled.")
  Voice?: boolean;

  @doc("Whether or not SMS is enabled.")
  SMS?: boolean;

  @doc("Whether or not MMS is enabled.")
  MMS?: boolean;

  @doc("Whether or not fax is enabled.")
  Fax?: boolean;
}

@doc("Incoming phone number model.")
model IncomingPhoneNumber {
  @doc("The unique identifier for the account that is associated with this phone number.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472ac")
  account_sid?: string;

  @doc("Whether or not a registered address with SignalWire is required.")
  @example("none")
  address_requirements?: AddressRequirements;

  @doc("The unique identifier for the address associated with this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472ad")
  address_sid?: string;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version?: string;

  @doc("New numbers on SignalWire are marked as beta.")
  beta?: boolean;

  @doc("Whether or not a number can receive calls and messages.")
  capabilities?: IncomingPhoneNumberCapabilities;

  @doc("The date, in RFC 2822 format, this phone number was created.")
  @example("Tue, 25 Sept 2018 23:00:00 +0000")
  date_created?: string;

  @doc("The date, in RFC 2822 format, this phone number was updated.")
  @example("Wed, 26 Sept 2018 22:00:00 +0000")
  date_updated?: string;

  @doc("The unique identifier of the address associated with E911 for this phone number.")
  emergency_address_sid?: string;

  @doc("Whether the phone route has an active E911 address associated.")
  @example("active")
  emergency_status?: EmergencyStatus;

  @doc("A formatted version of the number.")
  @example("310-338-6745")
  friendly_name?: string;

  @doc("The unique identifier for the identity associated with this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472ri")
  identity_sid?: string;

  @doc("The origin of the phone number.")
  @example("signalwire")
  origin?: PhoneNumberOrigin;

  @doc("The incoming number in E.164 format.")
  @example("+13103386745")
  phone_number?: string;

  @doc("The unique identifier for this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472pn")
  sid?: string;

  @doc("The unique identifier for the application associated with SMS handling on this phone number.")
  sms_application_sid?: string;

  @doc("Whether the request to `SmsFallbackUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  sms_fallback_method?: string;

  @doc("The URL to request if errors occur when fetching SmsUrl.")
  sms_fallback_url?: string;

  @doc("Whether the request to SmsUrl is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  sms_method?: string;

  @doc("The URL to request when an incoming SMS is received.")
  sms_url?: string;

  @doc("The URL to request to pass status updates to.")
  @example("example.com")
  status_callback?: string;

  @doc("Whether the request to StatusCallback is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  status_callback_method?: string;

  @doc("The unique identifier for the Trunk associated with this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472tr")
  trunk_sid?: string;

  @doc("The URI for this number.")
  uri?: string;

  @doc("The unique identifier for the application associated with call handling on this phone number.")
  voice_application_sid?: string;

  @doc("Whether or not to look up a caller's name in the database.")
  voice_caller_id_lookup?: boolean;

  @doc("Whether the request to VoiceFallbackUrl is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  voice_fallback_method?: string;

  @doc("The URL to request if errors occur when fetching `Url`.")
  @example("example.com")
  voice_fallback_url?: string;

  @doc("Whether the request to Url is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  voice_method?: string;

  @doc("The URL to request when an incoming call is received.")
  @example("http://your-application.com/docs/voice.xml")
  voice_url?: string;
}
