model CxmlApplicationCreateRequest {
  @doc("Name of the cXML Application.")
  @example("My cXML Application")
  name: string;

  @doc("Indicates whether the call will be handled by a script or an external URL.")
  @example(HandleCallsUsing.Script)
  used_for?: HandleCallsUsing;

  @doc("Call handler URL")
  @example("https://example.com/cxml")
  call_handler_url?: string;

  @doc("Call handler URL method")
  @example(UrlMethodType.Get)
  call_handler_method?: UrlMethodType = UrlMethodType.Post;

  @doc("Call handler callback URL.")
  @example("https://example.com/cxml")
  call_handler_fallback_url?: string;

  @doc("Call handler fallback method.")
  @example(UrlMethodType.Get)
  call_handler_fallback_method?: UrlMethodType = UrlMethodType.Post;

  @doc("Call status callback URL")
  @example("https://callback.com")
  call_status_callback_url?: string;

  @doc("Call status callback method.")
  @example(UrlMethodType.Get)
  call_status_callback_method?: UrlMethodType = UrlMethodType.Post;

  @doc("Script to handle to call.")
  @example("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response>\n    <Play loop=\"15\">https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3</Play>\n</Response>")
  call_handler_script: string;
}

model CxmlApplicationUpdateRequest {
  @doc("Name of the cXML Application.")
  @example("My cXML Application")
  name?: string;

  @doc("Indicates whether the call will be handled by a script or an external URL.")
  @example(HandleCallsUsing.Script)
  used_for?: HandleCallsUsing;

  @doc("Call handler URL")
  @example("https://example.com/cxml")
  call_handler_url?: string;

  @doc("Call handler URL method")
  @example(UrlMethodType.Get)
  call_handler_method?: UrlMethodType = UrlMethodType.Post;

  @doc("Call handler callback URL.")
  @example("https://example.com/cxml")
  call_handler_fallback_url?: string;

  @doc("Call handler fallback method.")
  @example(UrlMethodType.Get)
  call_handler_fallback_method?: UrlMethodType = UrlMethodType.Post;

  @doc("Call status callback URL")
  @example("https://callback.com")
  call_status_callback_url?: string;

  @doc("Call status callback method.")
  @example(UrlMethodType.Get)
  call_status_callback_method?: UrlMethodType = UrlMethodType.Post;

  @doc("Script to handle to call.")
  @example("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response>\n    <Play loop=\"15\">https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3</Play>\n</Response>")
  call_handler_script: string;
}
