
model SmsStatusCallbackPayload {
  @doc("""
    The current status of the message at the time of the callback.
    One of: `queued`, `sending`, `sent`, `delivered`, `undelivered`, `failed`, `receiving`, `received`.
    """)
  @example("delivered")
  MessageStatus: "queued" | "sending" | "sent" | "delivered" | "undelivered" | "failed" | "receiving" | "received";

  @doc("If the message has failed or is undelivered, the error code may provide more information about what went wrong.")
  @example("30003")
  ErrorCode?: string;

  @doc("The unique ID of this message.")
  @example("b3877c40-da60-4998-90ad-b792e98472ms")
  MessageSid: string;

  @doc("The unique ID of this message. Always the same value as `MessageSid`.")
  @example("b3877c40-da60-4998-90ad-b792e98472ms")
  SmsSid: string;

  @doc("The unique ID of the project this message is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  AccountSid: string;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  ApiVersion: string;

  @doc("The From number of the message.")
  @example("+15551234567")
  From: string;

  @doc("The To number of the message.")
  @example("+15559876543")
  To: string;

  @doc("The body of the message.")
  @example("Hey, your order has shipped!")
  Body: string;

  @doc("The number of media files that were included with the message.")
  @example(0)
  NumMedia: int32;

  @doc("""
    The content type of the first media file, such as `image/png`. Present only when `NumMedia` is greater than 0.
    Each additional file adds a numbered parameter: `MediaContentType1`, `MediaContentType2`, and so on.
    """)
  @example("image/png")
  MediaContentType0?: string;

  @doc("""
    The URL of the first media file. Present only when `NumMedia` is greater than 0.
    Each additional file adds a numbered parameter: `MediaUrl1`, `MediaUrl2`, and so on, matching `MediaContentType{N}`.
    """)
  @example("https://example.signalwire.com/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Messages/b3877c40-da60-4998-90ad-b792e98472ms/Media/b3877c40-da60-4998-90ad-b792e984md01")
  MediaUrl0?: string;

  @doc("""
    The number of segments that make up the entire message.
    If the body exceeds 160 GSM-7 characters or 70 UCS-2 characters, it is automatically split into
    smaller segments that are annotated for reconstruction on the recipient handset.
    """)
  @example(1)
  NumSegments: int32;
}
