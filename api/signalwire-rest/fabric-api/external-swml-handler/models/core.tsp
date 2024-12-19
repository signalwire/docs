import "./enums.tsp";
import "../../../types";

using TypeSpec.Http;

model ExternalSWMLHandlerID {
  @doc("Unique ID of a External SWML Handler.")
  @path
  id: uuid
}

model ExternalSWMLHandler {
  @doc("Unique ID of the External SWML Handler.")
  @example("a87db7ed-8ebe-42e4-829f-8ba5a4152f54")
  id: uuid;

  @doc("Name of the External SWML Handler.")
  @example("My External SWML Handler")
  name: string;

  @doc("Used for of the External SWML Handler.")
  @example(UsedForType.Calling)
  used_for: UsedForType.Calling;

  @doc("Primary request url of the External SWML Handler.")
  @example("https://primary.com")
  primary_request_url: string;

  @doc("Primary request method of the External SWML Handler.")
  @example(UrlMethodType.Get)
  primary_request_method: UrlMethodType;

  @doc("Fallback request url of the External SWML Handler.")
  @example("https://fallback.com")
  fallback_request_url: string;

  @doc("Fallback request method of the External SWML Handler.")
  @example(UrlMethodType.Get)
  fallback_request_method: UrlMethodType;

  @doc("Status callback url of the External SWML Handler.")
  @example("https://callback.com")
  status_callback_url: string;

  @doc("Status callback method of the External SWML Handler.")
  @example(UrlMethodType.Post)
  status_callback_method: UrlMethodType;
}
