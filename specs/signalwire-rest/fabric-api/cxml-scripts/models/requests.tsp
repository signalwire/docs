import "./core.tsp";

model CXMLScriptCreateRequest {
  @doc("Display name of the cXML Script")
  @example("Reception Script")
  display_name: string;

  @doc("The cXML script contents")
  @example("<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><Say>Hello World</Say></Response>")
  contents: string;

  @doc("Optional description of the cXML script")
  @example("Simple greeting script")
  description?: string;
}

model CXMLScriptUpdateRequest {
  @doc("Display name of the cXML Script")
  @example("Reception Script")
  display_name?: string;

  @doc("The cXML script contents")
  @example("<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><Say>Hello World</Say></Response>")
  contents?: string;

  @doc("Optional description of the cXML script")
  @example("Simple greeting script")
  description?: string;
}