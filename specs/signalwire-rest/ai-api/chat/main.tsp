import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/examples.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/chat")
namespace SignalWireAPI.AI.Chat {
  @tag(AI_CHAT_TAG)
  @friendlyName("Chat")
  interface AIChat {
    @summary("Send AI chat methods")
    @doc("""
      Hold a text conversation with an AI agent. All six methods travel over this endpoint in a
      JSON-RPC 2.0 body. Put the method name in `method` and its arguments in `params`.

      Your agent is an SWML document you serve, and `config_url` is where you serve it. A
      conversation is a series of turns addressed by an `id` you choose. A turn is one user message
      and the agent's reply, including any tool calls made along the way. One request runs one turn.

      ## Methods

      | Method | Description |
      |---|---|
      | `create_conversation` | Create a conversation, or reset an existing one |
      | `chat` | Send a message and receive the agent's reply |
      | `end_conversation` | End the conversation and trigger post-processing |
      | `delete` | Remove the conversation, with no post-processing |
      | `chat_log` | Read the conversation back |
      | `summarize` | Generate a summary on demand |

      ## Errors arrive under HTTP 200

      JSON-RPC carries failures in the body, and the service commits `200` before a turn's outcome
      is known. **Check for an `error` key, not the status code.** A `200` with `{"error": {...}}`
      is a failed call. Every code and its meaning is documented under
      [AI chat errors](/docs/apis/error-codes#ai-chat).

      ## One turn at a time

      A conversation runs one turn at a time. A second concurrent request on the same conversation
      returns `-32007`. That is the contract rather than a transient failure, so retrying
      immediately fails again. Wait for the first turn to return. Different conversations are
      independent and run in parallel.

      ## A slow response may begin with whitespace

      A slow turn is padded with keepalive whitespace so intermediaries do not sever the connection
      mid-answer. This is valid JSON and standard parsers handle it. It breaks code that inspects
      the first byte, and code that assumes the whole body arrives in one read. Read to completion,
      then parse.

      ${tokenPermissions<"_Chat_">}
      """)
    @opExample(
      #{ parameters: createConversationExample },
      #{
        title: "create_conversation",
        description: "Create a conversation against your agent's SWML",
      }
    )
    @opExample(
      #{ parameters: chatExample },
      #{ title: "chat", description: "Send a message and receive the agent's reply" }
    )
    @opExample(
      #{ parameters: chatLogExample },
      #{ title: "chat_log", description: "Read the conversation back" }
    )
    @opExample(
      #{ parameters: summarizeExample },
      #{ title: "summarize", description: "Summarize the conversation on demand" }
    )
    @opExample(
      #{ parameters: endConversationExample },
      #{
        title: "end_conversation",
        description: "End the conversation and trigger post-processing",
      }
    )
    @opExample(
      #{ parameters: deleteConversationExample },
      #{ title: "delete", description: "Remove the conversation without post-processing" }
    )
    @post
    @operationId("chat_methods")
    chatMethod(@body request: ChatRequest):
      | {
          @statusCode statusCode: 200;
          @body response: ChatResponse;
        }
      | StatusCode401
      | ChatServiceUnavailableError;
  }
}
