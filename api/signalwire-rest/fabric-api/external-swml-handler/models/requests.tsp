model ExternalSWMLHandlerCreateRequest {
  @doc("Name of the External SWML Handler.")
  @example("My External SWML Handler")
  name?: string;

  @doc("Used for of the External SWML Handler.")
  @example(UsedForType.Calling)
  used_for?: UsedForType.Calling = UsedForType.Calling;

  @doc("Primary request url of the External SWML Handler.")
  @example("https://primary.com")
  primary_request_url: string;

  @doc("Primary request method of the External SWML Handler.")
  @example("GET")
  primary_request_method?: "GET" | "POST" = "POST";

  @doc("Fallback request url of the External SWML Handler.")
  @example("https://fallback.com")
  fallback_request_url?: string;

  @doc("Fallback request method of the External SWML Handler.")
  @example("GET")
  fallback_request_method?: "GET" | "POST" = "POST";

  @doc("Status callback url of the External SWML Handler.")
  @example("https://callback.com")
  status_callback_url?: string;

  @doc("Status callback method of the External SWML Handler.")
  @example("POST")
  status_callback_method?: "GET" | "POST" = "POST";
}

model ExternalSWMLHandlerUpdateRequest {
  @doc("Name of the External SWML Handler.")
  @example("My External SWML Handler")
  name?: string;

  @doc("Used for of the External SWML Handler.")
  @example(UsedForType.Calling)
  used_for?: UsedForType.Calling = UsedForType.Calling;

  @doc("Primary request url of the External SWML Handler.")
  @example("https://primary.com")
  primary_request_url?: string;

  @doc("Primary request method of the External SWML Handler.")
  @example("GET")
  primary_request_method?: "GET" | "POST" = "POST";

  @doc("Fallback request url of the External SWML Handler.")
  @example("https://fallback.com")
  fallback_request_url?: string;

  @doc("Fallback request method of the External SWML Handler.")
  @example("GET")
  fallback_request_method?: "GET" | "POST" = "POST";

  @doc("Status callback url of the External SWML Handler.")
  @example("https://callback.com")
  status_callback_url?: string;

  @doc("Status callback method of the External SWML Handler.")
  @example("POST")
  status_callback_method?: "GET" | "POST" = "POST";
}
