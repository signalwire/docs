using TypeSpec.Http;

@doc("Request body for creating an application.")
model CreateApplicationRequest {
  @doc("A named unique identifier for the resource. Allowed characters: `A-Za-z0-9_-`. Maximum of 100 characters.")
  @example("My Friendly Name")
  FriendlyName: string;

  @doc("If a message's `ApplicationSid` is set to this Application's `Sid`, when a message receives a status change, SignalWire will send a `POST` request to this URL with the message's details.")
  @example("http://www.example.com/sms-status-callback")
  MessageStatusCallback?: string;

  @doc("Whether the request to `SmsFallbackUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  SmsFallbackMethod?: "GET" | "POST" = "POST";

  @doc("The URL SignalWire will request if errors occur when fetching the `SmsUrl`.")
  @example("http://www.example.com/sms-fallback")
  SmsFallbackUrl?: string;

  @doc("Whether the request to `SmsUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  SmsMethod?: "GET" | "POST" = "POST";

  @doc("If a message's `ApplicationSid` is set to this Application's `Sid`, when a message receives a status change, SignalWire will send a `POST` request to this URL with the message's details.")
  @example("http://www.example.com/sms-status-callback")
  SmsStatusCallback?: string;

  @doc("The URL to request when an SMS is received.")
  @example("http://example.com")
  SmsUrl?: string;

  @doc("The URL to pass status updates to the Application.")
  @example("http://example.com")
  StatusCallback?: string;

  @doc("Whether the request to the `StatusCallback` URL is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  StatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("Whether or not to look up a caller's ID from the database. Possible values are `true` or `false`. Default is `false`.")
  @example(false)
  VoiceCallerIdLookup?: boolean = false;

  @doc("Whether the request to `VoiceFallbackUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  VoiceFallbackMethod?: "GET" | "POST" = "POST";

  @doc("The URL SignalWire will request if errors occur when fetching the `Url`.")
  @example("http://example.com")
  VoiceFallbackUrl?: string;

  @doc("Whether the request to `VoiceUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  VoiceMethod?: "GET" | "POST" = "POST";

  @doc("The URL to request when a phone number receives a call or fax.")
  @example("http://example.com")
  VoiceUrl?: string;
}

@doc("Request body for updating an application.")
model UpdateApplicationRequest {
  @doc("A named unique identifier for the resource. Allowed characters: `A-Za-z0-9_-`. Maximum of 100 characters.")
  @example("My Friendly Name")
  FriendlyName?: string;

  @doc("If a message's `ApplicationSid` is set to this Application's `Sid`, when a message receives a status change, SignalWire will send a `POST` request to this URL with the message's details.")
  @example("http://www.example.com/sms-status-callback")
  MessageStatusCallback?: string;

  @doc("Whether the request to `SmsFallbackUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  SmsFallbackMethod?: "GET" | "POST" = "POST";

  @doc("The URL SignalWire will request if errors occur when fetching the `SmsUrl`.")
  @example("http://www.example.com/sms-fallback")
  SmsFallbackUrl?: string;

  @doc("Whether the request to `SmsUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  SmsMethod?: "GET" | "POST" = "POST";

  @doc("If a message's `ApplicationSid` is set to this Application's `Sid`, when a message receives a status change, SignalWire will send a `POST` request to this URL with the message's details.")
  @example("http://www.example.com/sms-status-callback")
  SmsStatusCallback?: string;

  @doc("The URL to request when an SMS is received.")
  @example("http://example.com")
  SmsUrl?: string;

  @doc("The URL to pass status updates to the Application.")
  @example("http://example.com")
  StatusCallback?: string;

  @doc("Whether the request to the `StatusCallback` URL is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  StatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("Whether or not to look up a caller's ID from the database. Possible values are `true` or `false`. Default is `false`.")
  @example(false)
  VoiceCallerIdLookup?: boolean = false;

  @doc("Whether the request to `VoiceFallbackUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  VoiceFallbackMethod?: "GET" | "POST" = "POST";

  @doc("The URL SignalWire will request if errors occur when fetching the `Url`.")
  @example("http://example.com")
  VoiceFallbackUrl?: string;

  @doc("Whether the request to `VoiceUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  VoiceMethod?: "GET" | "POST" = "POST";

  @doc("The URL to request when a phone number receives a call or fax.")
  @example("http://example.com")
  VoiceUrl?: string;
}
