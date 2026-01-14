using TypeSpec.Http;

model MessagesAccountSidPath {
  @doc("The unique identifier of the project that sent or received this message.")
  @example("ea108133-d6b3-407c-9536-9fad8a929a6a")
  @format("uuid")
  @path
  AccountSid: string;
}

model MessageSidPath {
  @doc("A unique ID that identifies this specific message.")
  @example("0a059168-ead0-41af-9d1f-343dae832527")
  @format("uuid")
  @path
  Sid: string;
}

model MessageSidPathForMedia {
  @doc("A unique ID that identifies this specific message.")
  @example("0a059168-ead0-41af-9d1f-343dae832527")
  @format("uuid")
  @path
  MessageSid: string;
}

@doc("Message status.")
enum MessageStatus {
  Queued: "queued",
  Sending: "sending",
  Sent: "sent",
  Delivered: "delivered",
  Undelivered: "undelivered",
  Failed: "failed",
  Receiving: "receiving",
  Received: "received",
}

@doc("Message direction.")
enum MessageDirection {
  Inbound: "inbound",
  OutboundApi: "outbound-api",
  OutboundCall: "outbound-call",
  OutboundReply: "outbound-reply",
}

@doc("Message subresource URIs.")
model MessageSubresourceUris {
  @doc("The URI for media.")
  media?: string;
}

@doc("Message model.")
model Message {
  @doc("The unique identifier of the project that sent or received this message.")
  @format("uuid")
  @example("ea108133-d6b3-407c-9536-9fad8a929a6a")
  account_sid?: string;

  @doc("The version number of the SignalWire cXML REST API used to handle this message.")
  @example("2010-04-01")
  api_version?: string;

  @doc("The text of the message. Up to 1600 characters long.")
  @example("Hello World!")
  body?: string;

  @doc("The number of segments that make up the entire message.")
  @example(1)
  num_segments?: int32;

  @doc("The number of media files that were included with the message.")
  @example("1")
  num_media?: string;

  @doc("The date and time the message was created in RFC 2822 format.")
  @example("Mon, 13 Aug 2018 21:38:46 +0000")
  date_created?: string;

  @doc("The date and time the message was sent in RFC 2822 format.")
  date_sent?: string;

  @doc("The date and time the message was last updated in RFC 2822 format.")
  @example("Mon, 13 Aug 2018 21:38:46 +0000")
  date_updated?: string;

  @doc("The direction of the message.")
  @example("outbound-api")
  direction?: string;

  @doc("If an error has occurred on the message, the error code will give you a specific code.")
  error_code?: string;

  @doc("A human readable description of the error that occurred.")
  error_message?: string;

  @doc("The phone number in E.164 format that sent the message.")
  @example("+15551234567")
  from?: string;

  @doc("The cost of the individual message billed to your project.")
  @example(0.005)
  price?: float32;

  @doc("The currency in which `price` is charged as.")
  @example("USD")
  price_unit?: string;

  @doc("A unique ID that identifies this specific message.")
  @example("0a059168-ead0-41af-9d1f-343dae832527")
  sid?: string;

  @doc("Current status of the message.")
  @example("sent")
  status?: string;

  @doc("The phone number in E.164 format that received the message.")
  @example("+15557654321")
  to?: string;

  @doc("If a number group was used when sending an outbound message, the number group's ID will be present.")
  messaging_service_sid?: string;

  @doc("The URI of this particular message.")
  uri?: string;

  @doc("The URIs for any subresources associated with this message.")
  subresource_uris?: MessageSubresourceUris;
}

@doc("Message media model.")
model MessageMedia {
  @doc("The unique identifier for the account.")
  account_sid?: string;

  @doc("The content type of the media.")
  content_type?: string;

  @doc("The date, in RFC 2822 GMT format, this media was created.")
  date_created?: string;

  @doc("The date, in RFC 2822 GMT format, this media was updated.")
  date_updated?: string;

  @doc("The unique identifier for the message.")
  parent_sid?: string;

  @doc("The unique identifier for the media.")
  sid?: string;

  @doc("The URI for the media.")
  uri?: string;
}
