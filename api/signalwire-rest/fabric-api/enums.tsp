@doc("DisplayTypes")
enum DisplayTypes {
  App: "app",
  Room: "room",
  Call: "call",
  Subscriber: "subscriber",
}

model AudioChannel {
  @doc("Audio Channel of Fabric Address")
  @example("/external/resource_name?channel=audio")
  audio: string;
}

model MessagingChannel {
  @doc("Messaging Channel of Fabric Address")
  @example("/external/resource_name?channel=messaging")
  messaging: string;
}

model VideoChannel {
  @doc("Video Channel of Fabric Address")
  @example("/external/resource_name?channel=video")
  video: string;
}

@doc("Sets the handler to handle incoming `calls` or `messages`.")
enum UsedForType {
  Calling: "calling",
  Messaging: "messaging",
}

@doc("The method type to use for the URL")
enum UrlMethodType {
  Get: "GET",
  Post: "POST",
}

union AddressChannel {
  AudioChannel,
  MessagingChannel,
  VideoChannel
}
