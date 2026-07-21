import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes/main.tsp";
import "../tags.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./models/webhooks.tsp";
import "./models/whatsapp.tsp";
import "../../../_shared/alias/token-permissions.tsp";
import "../../../_shared/webhook/decorator.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@webhook("messageStatusCallback", MessageStatusCallbackPayload, MESSAGES_TAG)
@route("/messages")
namespace SignalWireAPI.Message.Messages {
  @tag(MESSAGES_TAG)
  @friendlyName("Messages")
  interface Messages {
    @operationId("create_message")
    @summary("Send a message")
    @doc("""
      Create and queue an outbound message for delivery. The channel is determined by the `from` number:

      - **SMS/MMS** when `from` is a purchased SignalWire phone number or shortcode. The message is MMS when `media` is present or `send_as_mms` is set, otherwise SMS.
      - **WhatsApp** when `from` is a `whatsapp:`-prefixed [WhatsApp number](/docs/platform/messaging/whatsapp/send-messages). Set `message_type` for a content message, or `template_id` for an [approved template](/docs/platform/messaging/whatsapp/message-templates). Free-form WhatsApp content is only allowed within the 24-hour customer service window.

      ${tokenPermissions<"_Messaging_">}
      """)
    @post
    create(@body body: SendMessageRequest):
      | CreateMessageResponse
      | StatusCode400
      | StatusCode401
      | MessagesCreateStatusCode422
      | StatusCode500;

    @operationId("update_message")
    @summary("Redact a message")
    @doc("""
      Redact the body of a previously sent message. This endpoint clears the message body for compliance, privacy, or moderation purposes — it does not support arbitrary updates to message attributes. The only accepted value for `body` is an empty string (`""`); any other value is rejected.
      
      Messages that are still in progress (`queued` or `initiated`) cannot be redacted. Messages in terminal states such as `delivered`, `undelivered`, or `failed` are eligible. Once redacted, the original body is overwritten and cannot be recovered.
      
      The `:message_id` path parameter is the message segment ID — the same ID returned by the create endpoint and shown in `/api/messaging/logs`.
      
      ${tokenPermissions<"_Messaging_">}
      """)
    @patch(#{ implicitOptionality: false })
    update(...MessagePathID, ...UpdateMessageRequest):
      | UpdateMessageResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | MessagesUpdateStatusCode422
      | StatusCode500;
  }
}
