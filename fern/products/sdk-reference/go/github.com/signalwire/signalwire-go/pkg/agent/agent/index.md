---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent"
title: "agent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
---
# `agent`

Package agent provides the core AgentBase type that wires together SWML rendering, tool dispatch, prompt management, AI configuration, and HTTP serving into a single self-contained AI agent.

## Signature

```go
package agent
```

## Constants

| Name                           | Type                           | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                           |
| ------------------------------ | ------------------------------ | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SupportedInternalFillerNames` | `SupportedInternalFillerNames` | yes      | —       | SupportedInternalFillerNames is the complete set of internal SWAIG function names that accept fillers, matching the SWAIGInternalFiller schema definition. Any name outside this set is silently ignored by the runtime — SetInternalFillers / AddInternalFiller warn if you pass an unknown name. Notable absences: change\_step, gather\_submit, and arbitrary user-defined SWAIG function names are NOT supported. |

## Functions

- [`NewAgentBase`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/new-agent-base) — NewAgentBase creates a new AgentBase with default values and applies the provided functional options.
- [`WithAgentID`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-agent-id) — WithAgentID sets a fixed agent ID. If not provided, a UUID is generated automatically in NewAgentBase.
- [`WithAIVerbName`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-ai-verb-name) — WithAIVerbName overrides the SWML verb name used for the AI section. The default is "ai". Set to "amazon\_bedrock" for BedrockAgent.
- [`WithAutoAnswer`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-auto-answer) — WithAutoAnswer controls whether the answer verb is emitted automatically.
- [`WithBasicAuth`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-basic-auth) — WithBasicAuth sets explicit basic-auth credentials.
- [`WithBullet`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-bullet) — WithBullet adds a single bullet point to an existing section. Python equivalent: bullet= param in prompt\_add\_to\_section
- [`WithBullets`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-bullets) — WithBullets adds multiple bullet points to an existing section. Python equivalent: bullets= param in prompt\_add\_to\_section
- [`WithCheckForInputOverride`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-check-for-input-override) — WithCheckForInputOverride enables the /check\_for\_input endpoint, which allows external systems to inject input into an active AI session.
- [`WithConfigFile`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-config-file) — WithConfigFile sets the path to an optional YAML/JSON service configuration file. When provided, the file is loaded at startup and its values are merged with (but do not override) explicit constructor parameters.
- [`WithDefaultWebhookURL`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-default-webhook-url) — WithDefaultWebhookURL sets the default webhook URL for all SWAIG functions. When set, this URL is used as the fallback for all tools that do not specify their own WebhookURL.
- [`WithEnablePostPromptOverride`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-enable-post-prompt-override) — WithEnablePostPromptOverride allows subclasses to override the post-prompt URL with a custom handler. When enabled, the agent registers a /post\_prompt\_override endpoint and routes summary callbacks through it.
- [`WithHost`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-host) — WithHost sets the HTTP listen address.
- [`WithName`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-name) — WithName sets the agent (and service) name.
- [`WithNativeFunctions`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-native-functions) — WithNativeFunctions sets the initial list of native (built-in) SWAIG function names to include in the SWAIG object on every rendered document.
- [`WithNumbered`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-numbered) — WithNumbered marks the section as numbered. Python equivalent: numbered=True in prompt\_add\_section
- [`WithNumberedBullets`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-numbered-bullets) — WithNumberedBullets marks the bullets list as numbered. Python equivalent: numbered\_bullets=True in prompt\_add\_section
- [`WithPort`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-port) — WithPort sets the HTTP listen port.
- [`WithRecordCall`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-record-call) — WithRecordCall enables or disables automatic call recording.
- [`WithRecordFormat`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-record-format) — WithRecordFormat sets the recording format (e.g. "mp4", "wav").
- [`WithRecordStereo`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-record-stereo) — WithRecordStereo enables or disables stereo recording.
- [`WithRoute`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-route) — WithRoute sets the HTTP route path the agent listens on.
- [`WithSchemaPath`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-schema-path) — WithSchemaPath sets the path to an optional SWML schema file used for validation. If empty, no schema validation is performed.
- [`WithSchemaValidation`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-schema-validation) — WithSchemaValidation controls whether the rendered SWML document is validated against the SWML schema before serving. Defaults to true. Can also be disabled via the SWML\_SKIP\_SCHEMA\_VALIDATION=1 environment variable.
- [`WithSigningKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-signing-key) — WithSigningKey sets the SignalWire Signing Key used to validate inbound webhook signatures. When non-empty, signed routes (POST /, /swaig, /post\_prompt, and any registered routing callbacks) are wrapped with security.WebhookMiddleware — unsigned or mis-signed requests are rejected with HTTP 403 before reaching the handler.
- [`WithSigningKeyTrustProxy`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-signing-key-trust-proxy) — WithSigningKeyTrustProxy enables X-Forwarded-Proto / X-Forwarded-Host honoring during URL reconstruction. Set true when AgentBase runs behind a reverse proxy / ngrok / load balancer that terminates TLS upstream; without it the validator sees the internal scheme/host and the signature will mismatch.
- [`WithSubsections`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-subsections) — WithSubsections attaches child sections to the parent section. Python equivalent: subsections=\[...] in prompt\_add\_section
- [`WithSuppressLogs`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-suppress-logs) — WithSuppressLogs disables verbose structured logging from the agent. When true, info-level agent lifecycle logs are suppressed.
- [`WithTokenExpiry`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-token-expiry) — WithTokenExpiry sets the token expiry time in seconds for secure tools.
- [`WithUsePom`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-use-pom) — WithUsePom controls whether Prompt Object Model (POM) mode is active. When true (default), structured prompt sections are used; when false, raw text from SetPromptText is used.

## Type Aliases

- [`AgentOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-option) — AgentOption configures an AgentBase during construction.
- [`DebugEventHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/debug-event-handler) — DebugEventHandler is called for debug events if enabled.
- [`DynamicConfigCallback`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/dynamic-config-callback) — DynamicConfigCallback is invoked on each request to mutate an ephemeral agent copy before rendering. Headers and body params give the callback full context about the inbound request.
- [`OnSwmlRequestHook`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/on-swml-request-hook) — OnSwmlRequestHook is the function-field hook that user code can set to override the default SWML-request customization behavior. Returning a non-nil map applies modifications to the rendered SWML; returning nil uses the default rendering unchanged.
- [`PromptAddToSectionOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/prompt-add-to-section-option) — PromptAddToSectionOption is a functional option for PromptAddToSection.
- [`PromptSectionOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/prompt-section-option) — PromptSectionOption is a functional option for PromptAddSection.
- [`SummaryCallback`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/summary-callback) — SummaryCallback is called when a post-prompt summary arrives.
- [`ToolHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/tool-handler) — ToolHandler is the signature for SWAIG function handlers.

## Classes

- [`AgentBase`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base) — AgentBase is the central agent struct. It embeds \*swml.Service so that Service's fields and methods (Name, Route, Host, Port, basic auth, the HTTP server, the tool registry, etc.) are promoted onto AgentBase. The agent-specific state below is layered on top.
- [`MCPServerConfig`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/mcp-server-config) — MCPServerConfig holds configuration for an external MCP server connection.
- [`ToolDefinition`](/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/tool-definition) — ToolDefinition describes a single SWAIG tool including its JSON Schema parameters and a Go handler function.
