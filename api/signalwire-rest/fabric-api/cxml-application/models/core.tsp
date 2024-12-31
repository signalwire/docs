import "./enums.tsp";
import "../../../types";

using TypeSpec.Http;

model CxmlApplicationID {
  @doc("Unique ID of a cXML Application.")
  @path
  id: uuid
}

model CxmlApplication {
  @doc("Unique ID of the cXML Application.")
  @example("a87db7ed-8ebe-42e4-829f-8ba5a4152f54")
  id: uuid;

  @doc("Name of the cXML Application.")
  @example("My cXML Application")
  name: string;

  @doc("Indicates whether the call will be handled by a script or an external URL.")
  @example(HandleCallsUsing.Script)
  used_for: HandleCallsUsing;

  @doc("Call handler URL")
  @example("https://example.com/cxml")
  call_handler_url: string;

  @doc("Call handler URL method")
  @example(UrlMethodType.Get)
  call_handler_method: UrlMethodType;

  @doc("Call handler callback URL.")
  @example("https://example.com/cxml")
  call_handler_fallback_url: string;

  @doc("Call handler fallback method.")
  @example(UrlMethodType.Get)
  call_handler_fallback_method: UrlMethodType;

  @doc("Call status callback URL")
  @example("https://callback.com")
  call_status_callback_url: string;

  @doc("Call status callback method.")
  @example(UrlMethodType.Post)
  call_status_callback_method: UrlMethodType;
}
