using TypeSpec.Http;

@doc("Request body for creating a message.")
model CreateMessageRequest {
  @doc("The phone number in E.164 format that received the message.")
  @example("+15557654321")
  To: string;

  @doc("The phone number in E.164 format that sent the message.")
  @example("+15551234567")
  From: string;

  @doc("The text of the message. Up to 1600 characters long.")
  @example("Hello World!")
  Body: string;

  @doc("URL of media you wish to attach and send with the message.")
  MediaUrl?: string;

  @doc("When set to true, forces the message to be sent as an MMS.")
  @example(false)
  SendAsMms?: boolean;

  @doc("The SID of a SignalWire cXML bin used to configure the message's `MessageStatusCallback` attribute.")
  ApplicationSid?: string;

  @doc("The maximum price in USD acceptable for the message to be sent.")
  @example("0.0075")
  MaxPrice?: string;

  @doc("A URL endpoint to receive callbacks each time the status of the message changes.")
  StatusCallback?: string;

  @doc("The number of seconds a message will allow being queued before canceling. Default value is `14400`.")
  @example(14400)
  ValidityPeriod?: int32;

  @doc("If a number group was used when sending an outbound message, the number group's ID will be present.")
  MessagingServiceSid?: string;
}

@doc("Request body for updating a message.")
model UpdateMessageRequest {
  @doc("The text of the message.")
  @example("")
  Body: string;
}
