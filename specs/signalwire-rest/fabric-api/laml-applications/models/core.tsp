import "../../../types";

using TypeSpec.Http;

model LamlApplicationPathID {
  @doc("Unique ID of a LAML Application.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid
}

model LamlApplicationID {
  @doc("Unique ID of a LAML Application.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  laml_application_id: uuid
}

model LamlApplication {
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

model LamlApplicationWithID {
  ...LamlApplicationID,
  ...LamlApplication
}