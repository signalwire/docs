import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

model SendParams {
  /** The context that delivery and reply events for this message are sent to. */
  context: string;

  /** Your own labels to attach to the message, so you can search for it in the UI later. */
  tags?: string[];

  /**
   * The region of the world to send the message from. If you leave this out,
   * SignalWire picks one based on your account settings.
   */
  region?: string;

  /** The recipient's phone number, in E.164 format (for example, `+15551231234`). */
  to_number: string;

  /** The phone number to send from, in E.164 format. Must be a number on your account. */
  from_number: string;

  /**
   * The text of the message. You must include `body`, `media`, or both — at
   * least one is required.
   */
  body?: string;

  /**
   * One or more media URLs to send as an MMS. You must include `body`, `media`,
   * or both — at least one is required.
   */
  media?: string[];
}
