using TypeSpec.Http;

@doc("Request body for creating an incoming phone number.")
model CreateIncomingPhoneNumberRequest {
  @doc("The area code of your new number.")
  @example("310")
  AreaCode?: string;

  @doc("The incoming number in E.164 format.")
  @example("+13103386745")
  PhoneNumber?: string;

  @doc("The unique identifier for the address associated with this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472ad")
  AddressSid?: string;

  @doc("A formatted version of the number.")
  @example("310-338-6745")
  FriendlyName?: string;

  @doc("The unique identifier for the identity associated with this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472ri")
  IdentitySid?: string;

  @doc("The unique identifier for the application associated with SMS handling on this phone number.")
  SmsApplicationSid?: string;

  @doc("Whether the request to `SmsFallbackUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  SmsFallbackMethod?: "GET" | "POST" = "POST";

  @doc("The URL to request if errors occur when fetching SmsUrl.")
  SmsFallbackUrl?: string;

  @doc("Whether the request to SmsUrl is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  SmsMethod?: "GET" | "POST" = "POST";

  @doc("The URL to request when an incoming SMS is received.")
  SmsUrl?: string;

  @doc("The URL to request to pass status updates to.")
  @example("example.com")
  StatusCallback?: string;

  @doc("Whether the request to StatusCallback is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  StatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("The unique identifier for the Trunk associated with this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472tr")
  TrunkSid?: string;

  @doc("The unique identifier for the application associated with call handling on this phone number.")
  VoiceApplicationSid?: string;

  @doc("Whether or not to look up a caller's name in the database.")
  @example(false)
  VoiceCallerIdLookup?: boolean;

  @doc("Whether the request to VoiceFallbackUrl is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  VoiceFallbackMethod?: "GET" | "POST" = "POST";

  @doc("The URL to request if errors occur when fetching `Url`.")
  @example("example.com")
  VoiceFallbackUrl?: string;

  @doc("Whether the request to Url is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  VoiceMethod?: "GET" | "POST" = "POST";

  @doc("Whether this number can receive calls or fax. Default is voice.")
  @example("voice")
  VoiceReceiveMode?: "voice" | "fax" = "voice";

  @doc("The URL to request when an incoming call is received.")
  @example("http://your-application.com/docs/voice.xml")
  VoiceUrl?: string;
}

@doc("Request body for updating an incoming phone number.")
model UpdateIncomingPhoneNumberRequest {
  @doc("The unique identifier for the address associated with this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472ad")
  AddressSid?: string;

  @doc("A formatted version of the number.")
  @example("310-338-6745")
  FriendlyName?: string;

  @doc("The unique identifier for the application associated with SMS handling on this phone number.")
  SmsApplicationSid?: string;

  @doc("Whether the request to `SmsFallbackUrl` is a `GET` or a `POST`.")
  @example("POST")
  SmsFallbackMethod?: "GET" | "POST";

  @doc("The URL to request if errors occur when fetching SmsUrl.")
  SmsFallbackUrl?: string;

  @doc("Whether the request to SmsUrl is a `GET` or a `POST`.")
  @example("POST")
  SmsMethod?: "GET" | "POST";

  @doc("The URL to request when an incoming SMS is received.")
  SmsUrl?: string;

  @doc("The URL to request to pass status updates to.")
  @example("example.com")
  StatusCallback?: string;

  @doc("Whether the request to StatusCallback is a `GET` or a `POST`.")
  @example("POST")
  StatusCallbackMethod?: "GET" | "POST";

  @doc("The unique identifier for the Trunk associated with this phone number.")
  TrunkSid?: string;

  @doc("The unique identifier for the application associated with call handling on this phone number.")
  VoiceApplicationSid?: string;

  @doc("Whether or not to look up a caller's name in the database.")
  @example(false)
  VoiceCallerIdLookup?: boolean;

  @doc("Whether the request to VoiceFallbackUrl is a `GET` or a `POST`.")
  @example("POST")
  VoiceFallbackMethod?: "GET" | "POST";

  @doc("The URL to request if errors occur when fetching `Url`.")
  @example("example.com")
  VoiceFallbackUrl?: string;

  @doc("Whether the request to Url is a `GET` or a `POST`.")
  @example("POST")
  VoiceMethod?: "GET" | "POST";

  @doc("The URL to request when an incoming call is received.")
  @example("http://your-application.com/docs/voice.xml")
  VoiceUrl?: string;
}
