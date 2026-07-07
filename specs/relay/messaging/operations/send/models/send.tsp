import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

@summary("Send parameters")
model SendParams {
  @doc("The context that delivery and reply events for this message are sent to.")
  @example("office")
  context: string;

  @doc("Your own tags to attach to the message, so you can find it later in your SignalWire Dashboard.")
  @example(#["order-98765", "priority"])
  tags?: string[];

  @doc("""
    The region of the world to send the message from. If you leave this out,
    SignalWire picks one based on your account settings.
    """)
  @example("us")
  region?: string;

  @doc("The recipient's phone number, in E.164 format (for example, `+15551231234`).")
  @example("+15551230002")
  to_number: string;

  @doc("The phone number to send from, in E.164 format. Must be a number on your account.")
  @example("+15551230001")
  from_number: string;

  @doc("""
    The text of the message. You must include `body`, `media`, or both — at
    least one is required.
    """)
  @example("Your order has shipped!")
  body?: string;

  @doc("""
    One or more media URLs to send as an MMS. You must include `body`, `media`,
    or both — at least one is required.
    """)
  @example(#["https://example.com/receipt.png"])
  media?: string[];
}
