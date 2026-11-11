import "./core.tsp";
import "../../_shared/const.tsp";
import "../../_shared/enums.tsp";

model CXMLScriptCreateRequest {
  @doc("Name of the cXML Script.")
  @example("Reception Script")
  name: string;

  @doc("The cXML script contents")
  @example(CXML_EXAMPLE)
  contents: string;

  @doc("URL to send status callbacks to")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;

  @doc("HTTP method to use for status callbacks")
  @example(RequestUrlMethodType.Get)
  status_callback_method?: RequestUrlMethodType;
}

model CXMLScriptUpdateRequest {
  @doc("Name of the cXML Script. Omit to keep the current name.")
  @example("Reception Script")
  name?: string;

  @doc("The cXML script contents")
  @example(CXML_EXAMPLE)
  contents?: string;

  @doc("URL to send status callbacks to")
  @example("https://example.com/status")
  @format("uri")
  status_callback_url?: url;

  @doc("HTTP method to use for status callbacks")
  @example(RequestUrlMethodType.Get)
  status_callback_method?: RequestUrlMethodType;
}
