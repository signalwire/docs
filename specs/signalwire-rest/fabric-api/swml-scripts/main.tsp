import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";
import "../_shared/examples.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

const CreateCallingSwmlScriptExample = #{
  parameters: #{
    request: #{
      name: "Welcome Script",
      script_type: "calling",
      contents: SWML_CONTENTS_EXAMPLE,
    }
  },
  returnType: #{
    statusCode: 200,
    swml_script: CALLING_SWML_SCRIPT_RESPONSE_EXAMPLE,
  },
};

const CreateMessagingSwmlScriptExample = #{
  parameters: #{
    request: #{
      name: "Reply Bot",
      script_type: "messaging",
      contents: SWML_MESSAGING_CONTENTS_EXAMPLE,
    }
  },
  returnType: #{
    statusCode: 200,
    swml_script: MESSAGING_SWML_SCRIPT_RESPONSE_EXAMPLE,
  },
};

@route("/resources/swml_scripts")
namespace SignalWireAPI.Fabric.SwmlScripts {
  @tag(SWML_SCRIPTS_TAG)
  @friendlyName("SWML Scripts")
  interface SwmlScripts {
    @operationId("list_swml_scripts")
    @summary("List SWML Scripts")
    @doc("""
      A list of SWML Scripts
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        returnType: #[#{
          data: #[CALLING_SWML_SCRIPT_RESPONSE_EXAMPLE],
          links: #{
            self: "https://example.signalwire.com/api/fabric/resources/swml_scripts?page_number=0&page_size=50",
            first: "https://example.signalwire.com/api/fabric/resources/swml_scripts?page_number=0&page_size=50",
          },
        }],
      },
      #{
        title: "SWML Script list",
        description: "A page containing one compact Calling script.",
      }
    )
    list():
      | SwmlScriptListResponse[]
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_swml_script")
    @summary("Get SWML Script")
    @doc("""
      Returns a SWML Script by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        returnType: #{
          statusCode: 200,
          swml_script: CALLING_SWML_SCRIPT_RESPONSE_EXAMPLE,
        },
      },
      #{ title: "Calling script", description: "A Calling script that plays one audio file." }
    )
    @opExample(
      #{
        returnType: #{
          statusCode: 200,
          swml_script: MESSAGING_SWML_SCRIPT_RESPONSE_EXAMPLE,
        },
      },
      #{ title: "Messaging script", description: "A Messaging script that sends one reply." }
    )
    read(...SwmlScriptPathID):
      | {
          @statusCode statusCode: 200;
          @body swml_script: SwmlScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_swml_script")
    @summary("Create SWML Script")
    @doc("""
      Creates a SWML Script
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      CreateCallingSwmlScriptExample,
      #{
        title: "Simple calling script",
        description: "Create a Calling SWML Script that plays a single audio file.",
      }
    )
    @opExample(
      CreateMessagingSwmlScriptExample,
      #{
        title: "Simple messaging script",
        description: "Create a Messaging SWML Script that sends a single reply.",
      }
    )
    @post
    create(@body request: SwmlScriptCreateRequest):
      | {
          @statusCode statusCode: 200;
          @body swml_script: SwmlScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | SwmlScriptCreateStatusCode422
      | StatusCode500;

    @operationId("update_swml_script")
    @summary("Update SWML Script")
    @doc("""
      Updates a SWML Script by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @opExample(
      #{
        parameters: #{
          id: "993ed018-9e79-4e50-b97b-984bd5534095",
          request: #{
            display_name: "Updated Welcome Script",
            script_type: "calling",
            contents: SWML_CONTENTS_EXAMPLE,
          },
        },
        returnType: #{
          statusCode: 200,
          swml_script: CALLING_SWML_SCRIPT_RESPONSE_EXAMPLE,
        },
      },
      #{
        title: "Update a calling script",
        description: "Update a Calling script with a compact SWML document.",
      }
    )
    @opExample(
      #{
        parameters: #{
          id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          request: #{
            display_name: "Updated Reply Bot",
            script_type: "messaging",
            contents: SWML_MESSAGING_CONTENTS_EXAMPLE,
          },
        },
        returnType: #{
          statusCode: 200,
          swml_script: MESSAGING_SWML_SCRIPT_RESPONSE_EXAMPLE,
        },
      },
      #{
        title: "Update a messaging script",
        description: "Update a Messaging script with a compact SWML document.",
      }
    )
    @put
    update(...SwmlScriptPathID, @body request: SwmlScriptUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body swml_script: SwmlScriptResponse;
        }
      | StatusCode401
      | StatusCode404
      | SwmlScriptUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_swml_script")
    @summary("Delete SWML Script")
    @doc("""
      Deletes a SWML Script by ID
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...SwmlScriptPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
