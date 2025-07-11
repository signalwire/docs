import "./core.tsp";
import "../../_shared/const.tsp";

model CXMLScriptCreateRequest {
  @doc("Display name of the cXML Script")
  @example("Reception Script")
  display_name: string;

  @doc("The cXML script contents")
  @example(CXML_EXAMPLE)
  contents: string;

}

model CXMLScriptUpdateRequest {
  @doc("Display name of the cXML Script")
  @example("Reception Script")
  display_name?: string;

  @doc("The cXML script contents")
  @example(CXML_EXAMPLE)
  contents?: string;
}