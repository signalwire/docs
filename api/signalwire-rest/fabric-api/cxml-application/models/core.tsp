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

model CxmlApplicationFabricResource {
  @doc("Unique ID of the cXML Application.")
  @example("a87db7ed-8ebe-42e4-829f-8ba5a4152f54")
  id: uuid;

  @doc("Unique ID of the Project.")
  @example("99151cf8-9548-4860-ba70-a8de824f3312")
  project_id: uuid;

  @doc("Display name of the cXML Application Fabric Resource")
  @example("Booking Assistant")
  display_name: string;

  @doc("Type of the Fabric Resource")
  @example("cxml_application")
  type: string;

  @doc("Date and time when the resource was created.")
  @example(utcDateTime.fromISO("2024-10-17T14:14:53Z"))
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(utcDateTime.fromISO("2024-10-17T14:14:53Z"))
  updated_at: utcDateTime;

  @doc("cXML Application data.")
  cxml_application: CxmlApplication;
}