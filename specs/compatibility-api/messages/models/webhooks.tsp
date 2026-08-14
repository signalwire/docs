
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

  @doc("The unique ID of the project this message is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  AccountSid: string;

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
    The number of segments that make up the entire message.
    If the body exceeds 160 GSM-7 characters or 70 UCS-2 characters, it is automatically split into
    smaller segments that are annotated for reconstruction on the recipient handset.
    """)
  @example(1)
  NumSegments: int32;
}
