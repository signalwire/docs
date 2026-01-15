import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/Messages")
namespace CompatibilityAPI.Messages {
  @tag(MESSAGES_TAG)
  @friendlyName("Messages")
  interface Messages {
    @operationId("list_messages")
    @summary("List all Messages")
    @doc("""
      List all messages.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    list(
      ...MessagesAccountSidPath,
      @query @doc("Only return messages sent on this particular date, formatted as YYYY-MM-DD in UTC. You can also append `<` or `>` to return a range of messages.") DateSent?: string,
      @query @doc("The phone number in E.164 format. For inbound messages, this will be the remote phone number who sent the message. For outbound messages, this will be one of your SignalWire phone numbers.") From?: string,
      @query @doc("The phone number in E.164 format that received the message. For inbound messages, this is one of your SignalWire phone numbers; for outbound messages, this is the remote phone number that received the message.") To?: string,
      @query @doc("Current status of the message.") Status?: "queued" | "sending" | "sent" | "delivered" | "undelivered" | "failed" | "receiving" | "received",
      @query @doc("Specify the number of results to return on a single page. The default page size is `50` and the maximum is `1000`.") PageSize?: int32,
    ): MessageListResponse | StatusCode401;

    @operationId("create_message")
    @summary("Create a Message")
    @doc("""
      Create a message.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @post
    create(
      ...MessagesAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateMessageRequest,
    ): MessageResponse | StatusCode401 | StatusCode400;

    @operationId("retrieve_message")
    @summary("Retrieve a Message")
    @doc("""
      Retrieve a single message.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @route("/{Sid}")
    read(...MessagesAccountSidPath, ...MessageSidPath): MessageResponse | StatusCode401 | StatusCode404;

    @operationId("update_message")
    @summary("Update a Message")
    @doc("""
      Update a message body after it has been sent. Useful for removing sensitive information from the body after the message has been received.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @post
    @route("/{Sid}")
    update(
      ...MessagesAccountSidPath,
      ...MessageSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateMessageRequest,
    ): MessageResponse | StatusCode401 | StatusCode404;

    @operationId("delete_message")
    @summary("Delete a Message")
    @doc("""
      Delete a message.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @delete
    @route("/{Sid}")
    delete(...MessagesAccountSidPath, ...MessageSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }

  @tag(MESSAGE_MEDIA_TAG)
  @friendlyName("Message Media")
  @route("/{MessageSid}/Media")
  interface MessageMedia {
    @operationId("list_media")
    @summary("List Message Media")
    @doc("""
      List all media for a message.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    list(
      ...MessagesAccountSidPath,
      ...MessageSidPathForMedia,
      @query @doc("The date and time the message was sent in RFC 2822 format.") DateCreated?: string,
      @query @doc("Specify the number of results to return on a single page. The default page size is `50` and the maximum is `1000`.") PageSize?: int32,
    ): MessageMediaListResponse | StatusCode401;

    @operationId("retrieve_media")
    @summary("Retrieve Message Media")
    @doc("""
      Retrieve media for a message.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @route("/{Sid}")
    read(...MessagesAccountSidPath, ...MessageSidPathForMedia, ...MessageSidPath): MessageMediaResponse | StatusCode401 | StatusCode404;

    @operationId("delete_message_media")
    @summary("Delete Message Media")
    @doc("""
      Delete media for a message.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @delete
    @route("/{Sid}")
    delete(...MessagesAccountSidPath, ...MessageSidPathForMedia, ...MessageSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }
}
