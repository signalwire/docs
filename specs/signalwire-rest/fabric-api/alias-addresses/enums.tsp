@doc("Channels an alias address can accept.")
enum AliasAddressChannel {
  Audio: "audio",
  Messaging: "messaging",
  Video: "video",
}

@doc("Access context an alias address lives in.")
enum AliasAddressContext {
  Public: "public",
  Private: "private",
}
