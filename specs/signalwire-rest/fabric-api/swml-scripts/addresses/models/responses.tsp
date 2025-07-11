import "../../../_shared/fabric-address";
import "../../../_shared/enums.tsp";
import "../../../../types";

using Types.StatusCodes;

model SWMLScriptAddressListResponse {
  @doc("List of SWML Script Addresses")
  @example(#[
    #{
      id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      name: "swml-script-address",
      display_name: "SWML Script Address",
      type: DisplayTypes.App,
      cover_url: "https://example.com/cover.jpg",
      preview_url: "https://example.com/preview.jpg",
      locked: false,
      channel: #{
        audio: "/external/swml_script?channel=audio"
      },
      created_at: utcDateTime.fromISO("2023-01-01T12:00:00Z")
    }
  ])
  data: FabricAddress[];
}