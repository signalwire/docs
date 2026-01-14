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
      @query @doc("The date, in RFC 2822 format, on which the message was created.") DateCreated?: string,
      @query @doc("The date, in RFC 2822 format, on which the message was sent.") DateSent?: string,
      @query @doc("The phone number, in E.164 format, that sent the message.") From?: string,
      @query @doc("The phone number, in E.164 format, that received the message.") To?: string,
    ): MessageListResponse | StatusCode401;

    @operationId("create_message")
    @summary("Create a Message")
    @doc("""
      Create a message.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @post
    create(...MessagesAccountSidPath, @body body: CreateMessageRequest): MessageResponse | StatusCode401 | StatusCode400;

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
    update(...MessagesAccountSidPath, ...MessageSidPath, @body body: UpdateMessageRequest): MessageResponse | StatusCode401 | StatusCode404;

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
    @operationId("list_message_media")
    @summary("List Message Media")
    @doc("""
      List all media for a message.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    list(...MessagesAccountSidPath, ...MessageSidPathForMedia): MessageMediaListResponse | StatusCode401;

    @operationId("get_message_media")
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
