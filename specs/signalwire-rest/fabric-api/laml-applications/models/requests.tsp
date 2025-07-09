import "./core.tsp";

model LamlApplicationCreateRequest {
  @doc("Display name of the LAML Application")
  @example("Reception App")
  display_name: string;

  @doc("Account SID for the LAML Application")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  account_sid?: uuid;

  @doc("URL to handle incoming calls")
  @example("https://example.com/voice/incoming")
  voice_url?: string;

  @doc("HTTP method for voice URL")
  @example("POST")
  voice_method?: "GET" | "POST";

  @doc("Fallback URL for voice errors")
  @example("https://example.com/voice/fallback")
  voice_fallback_url?: string;

  @doc("HTTP method for voice fallback URL")
  @example("POST")
  voice_fallback_method?: "GET" | "POST";

  @doc("URL to receive status callbacks")
  @example("https://example.com/voice/status")
  status_callback?: string;

  @doc("HTTP method for status callbacks")
  @example("POST")
  status_callback_method?: "GET" | "POST";

  @doc("URL to handle incoming messages")
  @example("https://example.com/message/incoming")
  sms_url?: string;

  @doc("HTTP method for SMS URL")
  @example("POST")
  sms_method?: "GET" | "POST";

  @doc("Fallback URL for SMS errors")
  @example("https://example.com/message/fallback")
  sms_fallback_url?: string;

  @doc("HTTP method for SMS fallback URL")
  @example("POST")
  sms_fallback_method?: "GET" | "POST";

  @doc("URL to receive SMS status callbacks")
  @example("https://example.com/message/status")
  sms_status_callback?: string;

  @doc("HTTP method for SMS status callbacks")
  @example("POST")
  sms_status_callback_method?: "GET" | "POST";
}

model LamlApplicationUpdateRequest {
  @doc("Display name of the LAML Application")
  @example("Reception App")
  display_name?: string;

  @doc("Account SID for the LAML Application")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  account_sid?: uuid;

  @doc("URL to handle incoming calls")
  @example("https://example.com/voice/incoming")
  voice_url?: string;

  @doc("HTTP method for voice URL")
  @example("POST")
  voice_method?: "GET" | "POST";

  @doc("Fallback URL for voice errors")
  @example("https://example.com/voice/fallback")
  voice_fallback_url?: string;

  @doc("HTTP method for voice fallback URL")
  @example("POST")
  voice_fallback_method?: "GET" | "POST";

  @doc("URL to receive status callbacks")
  @example("https://example.com/voice/status")
  status_callback?: string;

  @doc("HTTP method for status callbacks")
  @example("POST")
  status_callback_method?: "GET" | "POST";

  @doc("URL to handle incoming messages")
  @example("https://example.com/message/incoming")
  sms_url?: string;

  @doc("HTTP method for SMS URL")
  @example("POST")
  sms_method?: "GET" | "POST";

  @doc("Fallback URL for SMS errors")
  @example("https://example.com/message/fallback")
  sms_fallback_url?: string;

  @doc("HTTP method for SMS fallback URL")
  @example("POST")
  sms_fallback_method?: "GET" | "POST";

  @doc("URL to receive SMS status callbacks")
  @example("https://example.com/message/status")
  sms_status_callback?: string;

  @doc("HTTP method for SMS status callbacks")
  @example("POST")
  sms_status_callback_method?: "GET" | "POST";
}