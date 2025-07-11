import "@typespec/http";
import "@typespec/openapi3";


using TypeSpec.Http;
using TypeSpec.OpenAPI;



const CallSWMLExample = "{'version': '1.0.0', 'sections': { 'main': [{ 'answer': { 'max_duration': 60 }},{ 'play': { 'urls': ['silence:2', 'say:Hello from SignalWire!']}}]}}";

const CallFallbackURLExample = "https://example.com/fallback"; 

const CallSWMLURLExample = "https://example.com/swml";

const CallIdExample = "3fa85f64-5717-4562-b3fc-2c963f66afa6";

const updateCommandDescription = "The `update` command is used to update a existing call with a new dialplan.";

const uuidDescription = "The unique identifying ID of a existing call.";

const paramsDescription = "An object of parameters to that will be utilized by the active command.";

alias CallCreateRequestAlias = CallCreateParamsURL | CallCreateParamsSWML;


@summary("Hangup call")
model CallHangupRequest {
    @doc(uuidDescription)
    @example(CallIdExample)
    id: uuid;

    @doc("The `calling.end` command is used to hang up a call.")
    @example("calling.end")
    command: "calling.end";
    
    @doc(paramsDescription)
    params: {
        @doc("Set the reason why the call was hung up.")
        @example("hangup")
        reason?: "hangup" | "busy"
    };
}
@summary("Hold call")
model CallHoldRequest {
    @doc(uuidDescription)
    @example(CallIdExample)
    id: uuid;

    @doc("The `calling.ai_hold` command is used to hold a call.")
    @example("calling.ai_hold")
    command: "calling.ai_hold";

    @doc(paramsDescription)
    params: {}
}

@summary("Unhold call")
model CallUnholdRequest {
    @doc(uuidDescription)
    @example(CallIdExample)
    id: uuid;

    @doc("The `calling.ai_unhold` command is used to unhold a call.")
    @example("calling.ai_unhold")
    command: "calling.ai_unhold";

    @doc(paramsDescription)
    params: {};
}

@summary("Inject AI message")
model CallAIMessageRequest {
    @doc(uuidDescription)
    @example(CallIdExample)
    id: uuid;

    @doc("The `calling.ai_message` command is used to inject a message into the AI conversation.")
    @example("calling.ai_message")
    command: "calling.ai_message";

    @doc(paramsDescription)
    params: {
        @doc("""
        The role that the message is from. Each role type has a different purpose and will influence how the AI will interpret the message.
        - `system`: Inject instructions or context that modify the AI's behavior mid-conversation without the caller hearing it. This could change the AI's personality, add new constraints, provide context about the conversation, or give the AI information it should know going forward.
        - `user`: Inject a message as if the caller said it. This would appear in the conversation history as coming from the caller, and the AI would respond to it as if the caller just spoke it.
        - `assistant`: Inject a message as if the AI said it. This would appear as an AI response in the conversation history. The AI would treat this as its own previous response when generating future replies.
        """)
        @example("system")
        role: "system" | "user" | "assistant",


        @doc("""
        The text content that will be sent to the AI.
        """)
        @example("You are now in expert mode. Provide detailed technical responses.")
        message_text: string
    }
}



@summary("Create call")
model CallCreateRequest {
    @doc("The `dial` command is used to create a new call.")
    @example("dial")
    command: "dial";


    @doc(paramsDescription)
    params: CallCreateRequestAlias;
}

model CallCreateParamsBase {
    
    @doc("The address that initiated the call. Can be either a E.164 formatted number (`+xxxxxxxxxxx`), or a SIP endpoint (`sip:xxx@yyy.zzz`).")
    @example("sip:from-sip@example-112233445566.sip.signalwire.com")
    from: string;

    @doc("The address that received the call. Can be either a E.164 formatted number (`+xxxxxxxxxxx`), or a SIP endpoint (`sip:xxx@yyy.zzz`).")
    @example("sip:from-sip@example-112233445567.sip.signalwire.com")
    to: string;

    @doc("The number, in E.164 format, or identifier of the caller.")
    @example("+1234567890")
    caller_id?: string;

    @doc("The Fallback URL to handle the call. This parameter allows you to specify a backup webhook or different route in your code containing SWML instructions for handling the call.")
    @example(CallFallbackURLExample)
    fallback_url?: string;

}

@summary("Create call (URL)")
model CallCreateParamsURL is CallCreateParamsBase {
    
    @doc("""
        The URL to handle the call. This parameter allows you to specify a webhook or different route in your code containing SWML instructions for handling the call.
        Either `url` or `swml` must be included for a new call.
        """)
    @example(CallSWMLURLExample)
    url: string;

}

@summary("Create call (SWML)") 
model CallCreateParamsSWML is CallCreateParamsBase {
    
    @doc("Inline SWML, passed as a string, containing SWML instructions for handling the call. Either `url` or `swml` must be included for a new call.")
    @example(CallSWMLExample)
    swml: string;
}

@summary("Update call")
model CallUpdateParamsBase {

    @doc(uuidDescription)
    @example(CallIdExample)
    id: string;

    @doc("""
        The Fallback URL to handle the call. 
        This parameter allows you to specify a backup webhook or different route in your code containing SWML instructions for handling the call.
        """)
    @example(CallFallbackURLExample)
    fallback_url?: string;

    @doc("Either `canceled` (to cancel a not yet connected call) or `completed` (to end a call that is in progress).")
    @example("canceled")
    status?: "canceled" | "completed";

}


@summary("Update call (SWML)") 
model CallUpdateParamsSWML is CallUpdateParamsBase {
    
    @doc("Inline SWML, passed as a string, containing SWML instructions for handling the call. Either `url` or `swml` must be included for a new call.")
    @example(CallSWMLExample)
    swml: string;
}

@summary("Update call (URL)")
model CallUpdateParamsURL is CallUpdateParamsBase {
    
    @doc("""
        The URL to handle the call. This parameter allows you to specify a webhook or different route in your code containing SWML instructions for handling the call.
        Either `url` or `swml` must be included for a new call.
        """)
    @example(CallSWMLURLExample)
    url: string;

}

@summary("Update call")
@oneOf
union UpdateCurrentCallRequest {
    CallUpdateSWMLRequest;
    CallUpdateURLRequest;
}

union CallUpdateRequest {
    UpdateCurrentCallRequest;
    CallHangupRequest;
    CallHoldRequest;
    CallUnholdRequest;
    CallAIMessageRequest;
}


model CallUpdateRequestBase {
    @doc(updateCommandDescription)
    @example("update")
    command: "update";
}

@summary("Update call (SWML)")
model CallUpdateSWMLRequest is CallUpdateRequestBase {

    @doc(paramsDescription)
    params: CallUpdateParamsSWML;
}

@summary("Update call (URL)")
model CallUpdateURLRequest is CallUpdateRequestBase {

    @doc(paramsDescription)
    params: CallUpdateParamsURL;
}


