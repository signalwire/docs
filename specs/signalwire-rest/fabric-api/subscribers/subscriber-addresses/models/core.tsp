import "../../../../types";
import "@typespec/http";

using TypeSpec.Http;

model SubscriberAddressID {
  @doc("Unique ID of a Subscriber Address.")
  @path
  id: uuid
}


model SubscriberAddress {
  @doc("Unique ID of a Subscriber Address.")
  @example("acaa5c49-be5e-4477-bce0-48f4b23b7720")
  id: uuid;

  @doc("Unique ID of a Subscriber Address.")
  @example("acaa5c49-be5e-4477-bce0-48f4b23b7720")
  resource_id: uuid;

  @doc("Name of the Subscriber Address.")
  @example("reception")
  name: string;

  @doc("Display Name of the Subscriber Address.")
  @example("Reception")
  display_name: string;

  @doc("Type of the Subscriber Address.")
  @example("room")
  type: string;

  @doc("Cover URL of the Subscriber Address.")
  @example("https://example.com/cover.webp")
  cover_url: url;

  @doc("Preview URL of the Subscriber Address.")
  @example("https://example.com/preview.webp")
  preview_url: url;

  channels: {
    @doc("Video Channel of the Subscriber Address.")
    @example("/public/reception?channel=video")
    video: string;

    @doc("Audio Channel of the Subscriber Address.")
    @example("/public/reception?channel=audio")
    audio: string;

    @doc("Messaging Channel of the Subscriber Address.")
    @example("/public/reception?channel=messaging")
    messaging: string;
  }







  
  
}

