import "../../../_shared/fabric-address";

model CXMLWebhookAddressListResponse {
  @example(#[#{
    id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    name: "cxml-webhook-address",
    display_name: "cXML Webhook Address",
    type: DisplayTypes.App,
    cover_url: "https://example.com/cover.jpg",
    preview_url: "https://example.com/preview.jpg",
    locked: false,
    channel: #{
      audio: "/external/cxml_webhook?channel=audio"
    },
    created_at: utcDateTime.fromISO("2023-01-01T12:00:00Z")
  }])
  data: FabricAddress[];
  links: CXMLWebhookAddressPaginationResponse;
}

@example(#{
  self: "https://{space_name}.signalwire.com/api/fabric/resources/cxml_webhooks/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50",
  first: "https://{space_name}.signalwire.com/api/fabric/resources/cxml_webhooks/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50",
  next: "https://{space_name}.signalwire.com/api/fabric/resources/cxml_webhooks/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca"
})
model CXMLWebhookAddressPaginationResponse is FabricAddressPaginationResponse {}
