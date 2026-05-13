import "./core.tsp";
import "../../_shared/enums.tsp";

model CxmlApplicationCreateRequest {
  @doc("Display name of the cXML Application")
  @example("Reception App")
  display_name: string;

  @doc("Project ID for the cXML Application")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  project_id?: uuid;

  @doc("URL to handle incoming calls")
  @example("https://example.com/voice/incoming")
  voice_url?: string;

  @doc("HTTP method for voice URL")
  @example(RequestUrlMethodType.Post)
  voice_method?: RequestUrlMethodType;

  @doc("Fallback URL for voice errors")
  @example("https://example.com/voice/fallback")
  voice_fallback_url?: string;

  @doc("HTTP method for voice fallback URL")
  @example(RequestUrlMethodType.Post)
  voice_fallback_method?: RequestUrlMethodType;

  @doc("URL to receive status callbacks")
  @example("https://example.com/voice/status")
  status_callback?: string;

  @doc("HTTP method for status callbacks")
  @example(RequestUrlMethodType.Post)
  status_callback_method?: RequestUrlMethodType;

  @doc("URL to handle incoming messages")
  @example("https://example.com/message/incoming")
  sms_url?: string;

  @doc("HTTP method for SMS URL")
  @example(RequestUrlMethodType.Post)
  sms_method?: RequestUrlMethodType;

  @doc("Fallback URL for SMS errors")
  @example("https://example.com/message/fallback")
  sms_fallback_url?: string;

  @doc("HTTP method for SMS fallback URL")
  @example(RequestUrlMethodType.Post)
  sms_fallback_method?: RequestUrlMethodType;

  @doc("URL to receive SMS status callbacks")
  @example("https://example.com/message/status")
  sms_status_callback?: string;

  @doc("HTTP method for SMS status callbacks")
  @example(RequestUrlMethodType.Post)
  sms_status_callback_method?: RequestUrlMethodType;
}

model CxmlApplicationUpdateRequest {
  @doc("Display name of the cXML Application")
  @example("Reception App")
  display_name?: string;

  @doc("Project ID for the cXML Application")
  @example("1313fe58-5e14-4c11-bbe7-6fdfa11fe780")
  account_sid?: uuid;

  @doc("URL to handle incoming calls")
  @example("https://example.com/voice/incoming")
  voice_url?: string;

  @doc("HTTP method for voice URL")
  @example(RequestUrlMethodType.Post)
  voice_method?: RequestUrlMethodType;

  @doc("Fallback URL for voice errors")
  @example("https://example.com/voice/fallback")
  voice_fallback_url?: string;

  @doc("HTTP method for voice fallback URL")
  @example(RequestUrlMethodType.Post)
  voice_fallback_method?: RequestUrlMethodType;

  @doc("URL to receive status callbacks")
  @example("https://example.com/voice/status")
  status_callback?: string;

  @doc("HTTP method for status callbacks")
  @example(RequestUrlMethodType.Post)
  status_callback_method?: RequestUrlMethodType;

  @doc("URL to handle incoming messages")
  @example("https://example.com/message/incoming")
  sms_url?: string;

  @doc("HTTP method for SMS URL")
  @example(RequestUrlMethodType.Post)
  sms_method?: RequestUrlMethodType;

  @doc("Fallback URL for SMS errors")
  @example("https://example.com/message/fallback")
  sms_fallback_url?: string;

  @doc("HTTP method for SMS fallback URL")
  @example(RequestUrlMethodType.Post)
  sms_fallback_method?: RequestUrlMethodType;

  @doc("URL to receive SMS status callbacks")
  @example("https://example.com/message/status")
  sms_status_callback?: string;

  @doc("HTTP method for SMS status callbacks")
  @example(RequestUrlMethodType.Post)
  sms_status_callback_method?: RequestUrlMethodType;
}
