import "../../../_shared/fabric-address/models/core.tsp";
import "../../../_shared/enums.tsp";
import "../../../../types";

using Types.StatusCodes;

model CXMLScriptAddressListResponse {
  @doc("List of cXML Script Addresses")
  @example(#[
    #{
      id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      name: "cxml-script-address",
      display_name: "cXML Script Address",
      type: DisplayTypes.App,
      cover_url: "https://example.com/cover.jpg",
      preview_url: "https://example.com/preview.jpg",
      locked: false,
      channel: #{
        audio: "/external/cxml_script?channel=audio"
      },
      created_at: utcDateTime.fromISO("2023-01-01T12:00:00Z")
    }
  ])
  data: FabricAddress[];
}