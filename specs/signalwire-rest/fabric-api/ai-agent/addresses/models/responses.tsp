import "../../../_shared/fabric-address";

model AIAgentAddressListResponse {
  @example(#[#{
    id: "691af061-cd86-4893-a605-173f47afc4c2",
    name: "justice-league",
    display_name: "Justice League",
    type: DisplayTypes.App,
    cover_url: "https://coverurl.com",
    preview_url: "https://previewurl.com",
    channel: #{
      audio: "/external/ai_agent?channel=audio"
    },
    created_at: utcDateTime.fromISO("2024-05-06T12:20-12Z"),
    locked: false
  }])
  data: FabricAddress[];
  links: AIAgentAddressPaginationResponse;
}


@example(#{
  self: "https://{space_name}.signalwire.com/api/fabric/resources/ai_agents/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50",
  first: "https://{space_name}.signalwire.com/api/fabric/resources/ai_agents/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50",
  next: "https://{space_name}.signalwire.com/api/fabric/resources/ai_agents/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca",
  prev: "https://{space_name}.signalwire.com/api/fabric/resources/ai_agents/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca"
})
model AIAgentAddressPaginationResponse is FabricAddressPaginationResponse {}
