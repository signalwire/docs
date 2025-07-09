import "./enums.tsp";
import "../../../types";

using TypeSpec.Http;

model CXMLWebhookID {
  @doc("Unique ID of a CXML Webhook.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid
}

model CXMLWebhook {
  @doc("Unique ID of the CXML Webhook.")
  @example("a87db7ed-8ebe-42e4-829f-8ba5a4152f54")
  id: uuid;

  @doc("Name of the CXML Webhook.")
  @example("My CXML Webhook")
  name: string;

  @doc("Used for of the CXML Webhook.")
  @example(UsedForType.Calling)
  used_for: UsedForType;

  @doc("Primary request url of the CXML Webhook.")
  @example("https://primary.com")
  primary_request_url: string;

  @doc("Primary request method of the CXML Webhook.")
  @example(UrlMethodType.Get)
  primary_request_method: UrlMethodType;

  @doc("Fallback request url of the CXML Webhook.")
  @example("https://fallback.com")
  fallback_request_url: string;

  @doc("Fallback request method of the CXML Webhook.")
  @example(UrlMethodType.Get)
  fallback_request_method: UrlMethodType;

  @doc("Status callback url of the CXML Webhook.")
  @example("https://callback.com")
  status_callback_url: string;

  @doc("Status callback method of the CXML Webhook.")
  @example(UrlMethodType.Post)
  status_callback_method: UrlMethodType;
}
