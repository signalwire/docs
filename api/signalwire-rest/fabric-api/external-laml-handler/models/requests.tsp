model ExternalLAMLHandlerCreateRequest {
  @doc("Name of the External LAML Handler.")
  @example("My External LAML Handler")
  name?: string;

  @doc("Used for of the External LAML Handler.")
  @example("calling")
  used_for?: "calling" | "messaging" = "calling";

  @doc("Primary request url of the External LAML Handler.")
  @example("https://primary.com")
  primary_request_url: string;

  @doc("Primary request method of the External LAML Handler.")
  @example("GET")
  primary_request_method?: "GET" | "POST" = "POST";

  @doc("Fallback request url of the External LAML Handler.")
  @example("https://fallback.com")
  fallback_request_url?: string;

  @doc("Fallback request method of the External LAML Handler.")
  @example("GET")
  fallback_request_method?: "GET" | "POST" = "POST";

  @doc("Status callback url of the External LAML Handler.")
  @example("https://callback.com")
  status_callback_url?: string;

  @doc("Status callback method of the External LAML Handler.")
  @example("POST")
  status_callback_method?: "GET" | "POST" = "POST";
}

model ExternalLAMLHandlerUpdateRequest {
  @doc("Name of the External LAML Handler.")
  @example("My External LAML Handler")
  name?: string;

  @doc("Used for of the External LAML Handler.")
  @example("calling")
  used_for?: "calling" | "messaging" = "calling";

  @doc("Primary request url of the External LAML Handler.")
  @example("https://primary.com")
  primary_request_url?: string;

  @doc("Primary request method of the External LAML Handler.")
  @example("GET")
  primary_request_method?: "GET" | "POST" = "POST";

  @doc("Fallback request url of the External LAML Handler.")
  @example("https://fallback.com")
  fallback_request_url?: string;

  @doc("Fallback request method of the External LAML Handler.")
  @example("GET")
  fallback_request_method?: "GET" | "POST" = "POST";

  @doc("Status callback url of the External LAML Handler.")
  @example("https://callback.com")
  status_callback_url?: string;

  @doc("Status callback method of the External LAML Handler.")
  @example("POST")
  status_callback_method?: "GET" | "POST" = "POST";
}
