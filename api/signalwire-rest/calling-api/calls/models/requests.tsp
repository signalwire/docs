import "@typespec/http";
import "@typespec/openapi3";
import "../../../"


using TypeSpec.Http;
using TypeSpec.OpenAPI;



const CallSWMLExample = "{'version': '1.0.0', 'sections': { 'main': [{ 'answer': { 'max_duration': 60 }},{ 'play': { 'urls': ['silence:2', 'say:Hello from SignalWire!']}}]}}";

const CallFallbackURLExample = "https://example.com/fallback"; 

const CallSWMLURLExample = "https://example.com/swml";

const CallIdExample = "3fa85f64-5717-4562-b3fc-2c963f66afa6";

alias CallCreateRequestAlias = CallCreateParamsURL | CallCreateParamsSWML;


union CallingRequest {
    CallCreateRequest;

}


model CallHangupRequest {
    id: uuid;
    command: "calling.end";
    params: {
        reason?: "hangup" | "busy"
    };
}

model CallHoldRequest {
    id: uuid;
    command: "calling.ai_hold";
    params: {}
}

model CallUnholdRequest {
    id: uuid;
    command: "calling.ai_unhold";
    params: {};
}

model CallTransferRequest {
    id: uuid;
    command: "calling.transfer";
    params: {
    }

}




model CallCreateRequest {
    command: "dial";
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

@summary("Create a call with a URL")
model CallCreateParamsURL is CallCreateParamsBase {
    
    @doc("""
        The URL to handle the call. This parameter allows you to specify a webhook or different route in your code containing SWML instructions for handling the call.
        Either `url` or `swml` must be included for a new call.
        """)
    @example(CallSWMLURLExample)
    url: string;

}

@summary("Create a call with SWML") 
model CallCreateParamsSWML is CallCreateParamsBase {
    
    @doc("Inline SWML, passed as a string, containing SWML instructions for handling the call. Either `url` or `swml` must be included for a new call.")
    @example(CallSWMLExample)
    swml: string;
}

model CallUpdateParamsBase {

    @doc("The id of an existing call.")
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


@summary("Update a call with SWML") 
model CallUpdateParamsSWML is CallUpdateParamsBase {
    
    @doc("Inline SWML, passed as a string, containing SWML instructions for handling the call. Either `url` or `swml` must be included for a new call.")
    @example(CallSWMLExample)
    swml: string;
}

@summary("Update a call with a URL")
model CallUpdateParamsURL is CallUpdateParamsBase {
    
    @doc("""
        The URL to handle the call. This parameter allows you to specify a webhook or different route in your code containing SWML instructions for handling the call.
        Either `url` or `swml` must be included for a new call.
        """)
    @example(CallSWMLURLExample)
    url: string;

}

model CallUpdateRequest {
    command: "update";
    @oneOf
    params: CallUpdateParamsURL | CallUpdateParamsSWML;
}


