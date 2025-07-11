import "@typespec/http";

using TypeSpec.Http;

model ResourceSipEndpointPathID {
  @doc("The unique identifier of the Resource.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

model ResourceSipEndpoint {
  @doc("The unique identifier of the SIP endpoint.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The name for the SIP endpoint.")
  @example("sip_user")
  name: string;

  @doc("The Resource type")
  @example("room")
  type: "room";

  @doc("The cover URL for the SIP endpoint.")
  @example("https://example.com/cover.jpg")
  cover_url?: url;


  @doc("The preview URL for the SIP endpoint.")
  @example("https://example.com/preview.jpg")
  preview_url?: url;

  channels: {

    @doc("The SIP endpoint's address with video capabilities.")
    @example("/public/reception?channel=video")
    video: url;

    @doc("The SIP endpoint's address with audio capabilities.")
    @example("/public/reception?channel=audio")
    audio: url;

    @doc("The SIP endpoint's address with messaging capabilities.")
    @example("/public/reception?channel=messaging")
    messaging: url;
  }

}