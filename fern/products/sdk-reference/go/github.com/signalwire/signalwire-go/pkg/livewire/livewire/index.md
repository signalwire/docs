---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire"
title: "livewire"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
---
# `livewire`

Package livewire provides a LiveKit-compatible API surface that runs on SignalWire's platform. Developers can use familiar LiveKit struct and function names — just change the import path to get SignalWire's infrastructure handling STT, TTS, VAD, LLM, and call control.

## Signature

```go
package livewire
```

## Functions

- [`NewAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-agent) — NewAgent creates a new Agent with the given instructions and options.
- [`NewAgentServer`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-agent-server) — NewAgentServer creates a new LiveServer.
- [`NewAgentSession`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-agent-session) — NewAgentSession creates a new AgentSession with the given options. Mirrors Python AgentSession.**init** which initializes \_history to \[] (line 480) and \_userdata to {} when not provided (line 460).
- [`NewCartesiaTTS`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-cartesia-tts) — NewCartesiaTTS creates a CartesiaTTS stub.
- [`NewChatContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-chat-context) — NewChatContext returns an empty ChatContext ready for use.
- [`NewDeepgramSTT`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-deepgram-stt) — NewDeepgramSTT creates a DeepgramSTT stub.
- [`NewElevenLabsTTS`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-eleven-labs-tts) — NewElevenLabsTTS creates an ElevenLabsTTS stub.
- [`NewGoogleSTT`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-google-stt) — NewGoogleSTT creates a GoogleSTT stub.
- [`NewInferenceLLM`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-inference-llm) — NewInferenceLLM creates an InferenceLLM stub with the given options.
- [`NewInferenceSTT`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-inference-stt) — NewInferenceSTT creates an InferenceSTT stub with the given options.
- [`NewInferenceTTS`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-inference-tts) — NewInferenceTTS creates an InferenceTTS stub with the given model hint. The model value is stored for compatibility but is otherwise unused.
- [`NewOpenAILLM`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-open-aillm) — NewOpenAILLM creates an OpenAILLM stub.
- [`NewOpenAITTS`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-open-aitts) — NewOpenAITTS creates an OpenAITTS stub.
- [`NewSileroVAD`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-silero-vad) — NewSileroVAD creates a SileroVAD stub. Mirrors Python SileroVAD(\*\*kwargs) — accepts functional options for LiveKit portability, matching the in-file convention for all other stubs.
- [`NewToolError`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/new-tool-error) — NewToolError constructs a ToolError with the given message.
- [`RunApp`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/run-app) — RunApp starts the LiveWire agent — prints the banner, a random tip, invokes the setup function (if any), calls the entrypoint, and starts the underlying SignalWire agent server.
- [`WithAgentName`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-agent-name) — WithAgentName sets the agent name for the RTC session.
- [`WithAllowInterruptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-allow-interruptions) — WithAllowInterruptions maps to barge configuration on SignalWire.
- [`WithDescription`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-description) — WithDescription sets the tool description.
- [`WithInferenceLLMModel`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-inference-llm-model) — WithInferenceLLMModel returns a functional option that sets the model string.
- [`WithInferenceSTTModel`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-inference-stt-model) — WithInferenceSTTModel returns a functional option that sets the model string.
- [`WithLLM`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-llm) — WithLLM sets the LLM model — this maps to SignalWire AI params.
- [`WithMaxEndpointingDelay`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-max-endpointing-delay) — WithMaxEndpointingDelay maps to AI params on SignalWire.
- [`WithMaxToolSteps`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-max-tool-steps) — WithMaxToolSteps sets the maximum tool call chain depth — noop on SignalWire.
- [`WithMCPServers`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-mcp-servers) — WithMCPServers is a LiveKit-compatible noop — MCP servers are not yet supported in LiveWire. Tools should be registered via FunctionTool. Mirrors Python Agent(mcp\_servers=...) which emits a one-time noop warning.
- [`WithMinEndpointingDelay`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-min-endpointing-delay) — WithMinEndpointingDelay maps to end\_of\_speech\_timeout on SignalWire.
- [`WithMinInterruptionDuration`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-min-interruption-duration) — WithMinInterruptionDuration sets the minimum interruption duration — noop on SignalWire where barge-in timing is handled automatically. Mirrors Python AgentSession(min\_interruption\_duration=0.5) (line 419).
- [`WithOnRequest`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-on-request) — WithOnRequest accepts a request callback — noop on SignalWire. Mirrors Python AgentServer.rtc\_session(on\_request=...) which silently ignores the parameter for LiveKit portability.
- [`WithOnSessionEnd`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-on-session-end) — WithOnSessionEnd accepts a session-end callback — noop on SignalWire. Mirrors Python AgentServer.rtc\_session(on\_session\_end=...) which silently ignores the parameter for LiveKit portability.
- [`WithParameters`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-parameters) — WithParameters sets explicit JSON-Schema parameters for a tool.
- [`WithPreemptiveGeneration`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-preemptive-generation) — WithPreemptiveGeneration enables or disables preemptive generation — noop on SignalWire. Mirrors Python AgentSession(preemptive\_generation=False) (line 423).
- [`WithRecord`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-record) — WithRecord enables call recording for the session. Mirrors Python AgentSession.start(record=False) keyword-only param (line 504).
- [`WithReplyInstructions`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-reply-instructions) — WithReplyInstructions sets the instructions for the generated reply.
- [`WithRoom`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-room) — WithRoom sets the room for the session start. Mirrors Python AgentSession.start(room=...) keyword-only param (line 504).
- [`WithServerType`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-server-type) — WithServerType sets the server type ("room" or "publisher") — noop on SignalWire.
- [`WithSessionMCPServers`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-session-mcp-servers) — WithSessionMCPServers stores the MCP servers value on the session — noop on SignalWire. Mirrors Python AgentSession(mcp\_servers=...) which emits a one-time noop warning (lines 450–456).
- [`WithSessionTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-session-tools) — WithSessionTools appends session-level tools to the AgentSession. These are merged with the bound Agent's tools in Start(). Mirrors Python AgentSession(tools=...) which stores list(tools or \[]) on self.\_tools (line 459) and merges them in \_build\_sw\_agent() (line 591).
- [`WithSessionUserdata`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-session-userdata) — WithSessionUserdata attaches arbitrary user data to the session. Mirrors Python AgentSession(userdata=...) which stores the value as self.\_userdata (line 460).
- [`WithSTT`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-stt) — WithSTT sets the STT provider — noop on SignalWire (handled by the control plane).
- [`WithTools`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-tools) — WithTools is a LiveKit-compatible noop — use FunctionTool to register tools.
- [`WithTTS`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-tts) — WithTTS sets the TTS provider — noop on SignalWire (voice can be configured via languages).
- [`WithTurnDetection`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-turn-detection) — WithTurnDetection sets the turn detection mode — noop on SignalWire.
- [`WithUserdata`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-userdata) — WithUserdata attaches arbitrary user data to the agent.
- [`WithVAD`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-vad) — WithVAD sets the VAD provider — noop on SignalWire (handled by the control plane).

## Type Aliases

- [`AgentOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-option) — AgentOption configures an Agent during construction.
- [`ReplyOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/reply-option) — ReplyOption configures a GenerateReply call.
- [`RTCOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/rtc-option) — RTCOption configures an RTC session.
- [`SessionOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/session-option) — SessionOption configures an AgentSession.
- [`StartOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/start-option) — StartOption configures a Start() call.
- [`ToolOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/tool-option) — ToolOption configures a tool definition.

## Classes

- [`Agent`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent) — Agent mirrors a LiveKit Agent — it holds instructions and tool definitions.
- [`AgentHandoff`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-handoff) — AgentHandoff signals a handoff to another agent in multi-agent scenarios. Mirrors Python AgentHandoff(agent, \*, returns=None) (line 153).
- [`AgentSession`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/agent-session) — AgentSession mirrors a LiveKit AgentSession — it binds an Agent to the SignalWire platform and manages the call lifecycle.
- [`CartesiaTTS`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/cartesia-tts) — CartesiaTTS is a stub for the Cartesia TTS provider.
- [`ChatContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/chat-context) — ChatContext buffers a conversation as an ordered list of role/content messages. It mirrors the Python livewire.ChatContext stub which is API-compatible with the livekit-agents ChatContext shape.
- [`ChatMessage`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/chat-message) — ChatMessage holds a single role/content pair in a conversation history. The JSON tags match the dict keys produced by the Python ChatContext.append() implementation: {"role": ..., "content": ...}.
- [`DeepgramSTT`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/deepgram-stt) — DeepgramSTT is a stub for the Deepgram STT provider. On SignalWire, speech recognition is handled by the control plane.
- [`ElevenLabsTTS`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/eleven-labs-tts) — ElevenLabsTTS is a stub for the ElevenLabs TTS provider.
- [`GoogleSTT`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/google-stt) — GoogleSTT is a stub for the Google STT provider.
- [`InferenceLLM`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/inference-llm) — InferenceLLM is a stub for the SignalWire-hosted inference LLM. On SignalWire, the LLM pipeline is handled by the control plane; the Model field is forwarded to SignalWire AI parameters. Mirrors Python InferenceLLM(model="") (livewire/**init**.py:751).
- [`InferenceSTT`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/inference-stt) — InferenceSTT is a stub for the SignalWire-hosted inference STT provider. On SignalWire, speech recognition is handled by the control plane. Mirrors Python InferenceSTT(model="") (livewire/**init**.py:736).
- [`InferenceTTS`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/inference-tts) — InferenceTTS is a no-op stub providing LiveKit import compatibility. SignalWire's control plane handles text-to-speech; this type exists so code written for livekit/agents inference.TTS can be dropped in unchanged.
- [`JobContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/job-context) — JobContext mirrors a LiveKit JobContext — provides room and connection info.
- [`JobProcess`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/job-process) — JobProcess mirrors a LiveKit JobProcess — used for prewarm/setup.
- [`LiveServer`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/live-server) — LiveServer mirrors a LiveKit AgentServer — it registers entrypoints and starts the agent.
- [`OpenAILLM`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/open-aillm) — OpenAILLM is a stub for the OpenAI LLM provider.
- [`OpenAITTS`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/open-aitts) — OpenAITTS is a stub for the OpenAI TTS provider.
- [`Room`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/room) — Room is a stub — SignalWire doesn't use the LiveKit room abstraction.
- [`RunContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/run-context) — RunContext mirrors a LiveKit RunContext — available inside tool handlers.
- [`SileroVAD`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/silero-vad) — SileroVAD is a stub for the Silero VAD provider.
- [`StopResponse`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/stop-response) — StopResponse signals that a tool should not trigger another LLM reply.
- [`ToolError`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/tool-error) — ToolError signals a tool execution error. Return a \*ToolError from a tool handler to tell the framework the tool failed; the error message is forwarded to the LLM as a tool-failure notification rather than triggering a normal LLM reply. Parallel to StopResponse in this file.
