import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes/main.tsp";
import "../tags.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/messages")
namespace SignalWireAPI.Message.Messages {
  @tag(MESSAGES_TAG)
  @friendlyName("Messages")
  interface Messages {
    @operationId("create_message")
    @summary("Send a message")
    @doc("""
      Create and queue an outbound SMS or MMS message for delivery. The system determines whether the message is SMS or MMS based on the presence of `media` or the `send_as_mms` flag. The `from` number must be a purchased SignalWire phone number on the authenticated project.
      
      ${tokenPermissions<"_Messaging_">}
      """)
    @post
    create(...CreateMessageRequest):
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
      
      The `:message_id` path parameter accepts either a `MessageSegment` ID (the ID returned by the create endpoint and shown in `/api/messaging/logs`) or the underlying `RelayMessage` ID.
      
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
