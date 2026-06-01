---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/phone-call-handler"
title: "PhoneCallHandler"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "type_alias"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.PhoneCallHandler"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/call_handler.go"
---
# `PhoneCallHandler`

PhoneCallHandler is the value of the “call\_handler“ field accepted by phone\_numbers.Update.

Named PhoneCallHandler (not CallHandler) to avoid colliding with the RELAY client's inbound-call-handler callback type already present in the SDK (pkg/relay OnCallHandler).

Setting a phone number's call\_handler + the handler-specific companion field routes inbound calls and, for most values, auto-materializes the matching Fabric resource on the server. See the high-level helpers on PhoneNumbersNamespace (SetSwmlWebhook, SetCxmlWebhook, SetCxmlApplication, SetAiAgent, SetCallFlow, SetRelayApplication, SetRelayTopic).

```
Enum member       Companion field (required)    Auto-creates resource
RelayScript       call_relay_script_url         swml_webhook
LamlWebhooks      call_request_url              cxml_webhook
LamlApplication   call_laml_application_id      cxml_application
AiAgent           call_ai_agent_id              ai_agent
CallFlow          call_flow_id                  call_flow
RelayApplication  call_relay_application        relay_application
RelayTopic        call_relay_topic              (routes via RELAY)
RelayContext      call_relay_context            (legacy, prefer topic)
RelayConnector    (connector config)            (internal)
VideoRoom         call_video_room_id            (routes to Video API)
Dialogflow        call_dialogflow_agent_id      (none)
```

Note: LamlWebhooks (wire value "laml\_webhooks") produces a cXML handler, not a generic webhook. For SWML, use RelayScript.

## Signature

```go
type PhoneCallHandler alias
```

## Examples

**Example 1**

```go
Enum member       Companion field (required)    Auto-creates resource
RelayScript       call_relay_script_url         swml_webhook
LamlWebhooks      call_request_url              cxml_webhook
LamlApplication   call_laml_application_id      cxml_application
AiAgent           call_ai_agent_id              ai_agent
CallFlow          call_flow_id                  call_flow
RelayApplication  call_relay_application        relay_application
RelayTopic        call_relay_topic              (routes via RELAY)
RelayContext      call_relay_context            (legacy, prefer topic)
RelayConnector    (connector config)            (internal)
VideoRoom         call_video_room_id            (routes to Video API)
Dialogflow        call_dialogflow_agent_id      (none)
```

**Example 2**

```go
Enum member       Companion field (required)    Auto-creates resource
RelayScript       call_relay_script_url         swml_webhook
LamlWebhooks      call_request_url              cxml_webhook
LamlApplication   call_laml_application_id      cxml_application
AiAgent           call_ai_agent_id              ai_agent
CallFlow          call_flow_id                  call_flow
RelayApplication  call_relay_application        relay_application
RelayTopic        call_relay_topic              (routes via RELAY)
RelayContext      call_relay_context            (legacy, prefer topic)
RelayConnector    (connector config)            (internal)
VideoRoom         call_video_room_id            (routes to Video API)
Dialogflow        call_dialogflow_agent_id      (none)
```

## Source

[`pkg/rest/namespaces/call_handler.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/call_handler.go)

Line 38.
