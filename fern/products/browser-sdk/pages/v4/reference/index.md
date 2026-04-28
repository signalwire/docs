# SignalWire Browser SDK

## Classes

| Class | Description |
| ------ | ------ |
| [Address](classes/Address.md) | Represents a contact or room in the directory. |
| [CallCreateError](classes/CallCreateError.md) | - |
| [ClientPreferences](classes/ClientPreferences.md) | Public preferences API for configuring SDK behavior. |
| [CollectionFetchError](classes/CollectionFetchError.md) | - |
| [DeviceTokenError](classes/DeviceTokenError.md) | - |
| [DPoPInitError](classes/DPoPInitError.md) | - |
| [EmbedTokenCredentialProvider](classes/EmbedTokenCredentialProvider.md) | Credential provider that exchanges an embed token for a SAT via the host's token endpoint. |
| [InvalidCredentialsError](classes/InvalidCredentialsError.md) | - |
| [MediaTrackError](classes/MediaTrackError.md) | - |
| [MessageParseError](classes/MessageParseError.md) | - |
| [OverconstrainedFallbackError](classes/OverconstrainedFallbackError.md) | Error thrown when getUserMedia fails with OverconstrainedError and all fallback levels have been exhausted. |
| [Participant](classes/Participant.md) | Represents a participant in a call. |
| [PreflightError](classes/PreflightError.md) | Error thrown when the preflight connectivity test fails. |
| [RecoveryError](classes/RecoveryError.md) | Error thrown when a recovery attempt fails. |
| [SelfCapabilities](classes/SelfCapabilities.md) | SelfCapabilities manages the capability state for the self participant. |
| [SelfParticipant](classes/SelfParticipant.md) | The local participant in a call, with additional device and media control. |
| [SignalWire](classes/SignalWire.md) | Main entry point for the SignalWire Browser SDK. |
| [StaticCredentialProvider](classes/StaticCredentialProvider.md) | Credential provider that returns a fixed set of credentials. |
| [Subscriber](classes/Subscriber.md) | Authenticated subscriber profile. |
| [TokenRefreshError](classes/TokenRefreshError.md) | - |
| [UnexpectedError](classes/UnexpectedError.md) | - |
| [VertoPongError](classes/VertoPongError.md) | - |
| [WebRTCCall](classes/WebRTCCall.md) | Concrete WebRTC call implementation. |

## Interfaces

| Interface | Description |
| ------ | ------ |
| [AddressHistory](interfaces/AddressHistory.md) | Address history entry from conversation messages Contains a reference to the sender address as an observable |
| [AudioConstraintsEvent](interfaces/AudioConstraintsEvent.md) | Event emitted when audio constraints change on a call. |
| [AuthenticateContext](interfaces/AuthenticateContext.md) | Context provided by the SDK when calling [CredentialProvider.authenticate](interfaces/CredentialProvider.md#authenticate). |
| [Call](interfaces/Call.md) | Public interface for an active WebRTC call. |
| [CallAddress](interfaces/CallAddress.md) | Minimal address interface for call context Avoids circular dependency with full Address class |
| [CallCapabilitiesState](interfaces/CallCapabilitiesState.md) | Call-level capabilities state |
| [CallDiagnosticSummary](interfaces/CallDiagnosticSummary.md) | Quality summary for a single call in the diagnostic bundle. |
| [CallError](interfaces/CallError.md) | Structured error emitted on `call.errors$`. |
| [CallNetworkIssue](interfaces/CallNetworkIssue.md) | - |
| [CallNetworkMetrics](interfaces/CallNetworkMetrics.md) | - |
| [CallOptions](interfaces/CallOptions.md) | Configuration options for creating a call. |
| [CallParticipant](interfaces/CallParticipant.md) | Base participant interface for call participants Defines the full public contract for participant objects exposed by Call |
| [CallSelfParticipant](interfaces/CallSelfParticipant.md) | Self participant interface with control methods Extends CallParticipant with methods for controlling the local participant |
| [CallState](interfaces/CallState.md) | Observable state of a call (status, recording, participants, etc.). |
| [ConstraintFallbackEvent](interfaces/ConstraintFallbackEvent.md) | Event emitted when getUserMedia falls back to looser constraints. |
| [CredentialProvider](interfaces/CredentialProvider.md) | Provides authentication credentials to the SDK. |
| [DebugOptions](interfaces/DebugOptions.md) | Debug options that control verbose SDK logging. |
| [DeviceController](interfaces/DeviceController.md) | Interface for media device management. |
| [DeviceRecoveryEvent](interfaces/DeviceRecoveryEvent.md) | Event emitted when the SDK auto-switches a device. |
| [DiagnosticEvent](interfaces/DiagnosticEvent.md) | A single diagnostic event in the session timeline. |
| [DialOptions](interfaces/DialOptions.md) | Options for [SignalWire.dial](classes/SignalWire.md#dial). Extends [MediaOptions](interfaces/MediaOptions.md) with dial-specific settings. |
| [Directory](interfaces/Directory.md) | Directory interface for managing addresses |
| [JSONRPCErrorResponse](interfaces/JSONRPCErrorResponse.md) | - |
| [JSONRPCRequest](interfaces/JSONRPCRequest.md) | - |
| [JSONRPCSuccessResponse](interfaces/JSONRPCSuccessResponse.md) | - |
| [LayoutLayer](interfaces/LayoutLayer.md) | - |
| [MediaDirections](interfaces/MediaDirections.md) | Audio and video directions "inactive" | "recvonly" | "sendonly" | "sendrecv" | "stopped" |
| [MediaOptions](interfaces/MediaOptions.md) | Options controlling which media tracks to send and receive. |
| [MediaParamsEvent](interfaces/MediaParamsEvent.md) | Event emitted when server-pushed media params are applied. |
| [MemberCapabilities](interfaces/MemberCapabilities.md) | Member-level capabilities for self or other members |
| [NodeSocketAdapter](interfaces/NodeSocketAdapter.md) | There's a difference in `searchParams` between URL from `lib` and URL from `url` (node) that makes using the same not possible for us. |
| [OnOffCapability](interfaces/OnOffCapability.md) | Represents an on/off capability state Both `on` and `off` can be true if the parent permission grants both |
| [PendingRPCOptions](interfaces/PendingRPCOptions.md) | - |
| [PermissionResult](interfaces/PermissionResult.md) | Result of a media permissions request (Section 5.10). |
| [PlatformCapabilities](interfaces/PlatformCapabilities.md) | Browser/platform WebRTC capability flags. |
| [PreflightOptions](interfaces/PreflightOptions.md) | Options for the preflight connectivity test. |
| [PreflightResult](interfaces/PreflightResult.md) | Results of a preflight connectivity test. |
| [RecoveryEvent](interfaces/RecoveryEvent.md) | Event emitted when a recovery action is taken on a call. |
| [SATClaims](interfaces/SATClaims.md) | SAT claims returned by /api/fabric/subscriber/info. |
| [SDKCredential](interfaces/SDKCredential.md) | Authentication credentials for the SDK. |
| [SDKLogger](interfaces/SDKLogger.md) | Logger interface that consumers can implement to replace the built-in logger. All methods accept variadic arguments matching the browser console API. |
| [SelectDeviceOptions](interfaces/SelectDeviceOptions.md) | Options for selecting a media device. |
| [SessionDiagnostics](interfaces/SessionDiagnostics.md) | Structured diagnostic bundle for a session. |
| [SessionState](interfaces/SessionState.md) | Extended session interface that adds call management and authentication state on top of the narrow ClientSession contract. |
| [SignalWireOptions](interfaces/SignalWireOptions.md) | Options for constructing a [SignalWire](classes/SignalWire.md). |
| [Storage](interfaces/Storage.md) | Key-value storage interface for persisting SDK preferences and state. |
| [StoredDevicePreference](interfaces/StoredDevicePreference.md) | Serializable subset of MediaDeviceInfo for persistence. |
| [TextMessage](interfaces/TextMessage.md) | Text message from conversation Contains a reference to the sender address as an observable |
| [TransferOptions](interfaces/TransferOptions.md) | - |
| [WebRTCApiProvider](interfaces/WebRTCApiProvider.md) | Provides custom WebRTC API implementations for non-standard environments. |
| [WebRTCMediaDevices](interfaces/WebRTCMediaDevices.md) | Subset of the `MediaDevices` interface actually used by the SDK. |

## Type Aliases

| Type Alias | Description |
| ------ | ------ |
| [CallDirection](type-aliases/CallDirection.md) | Whether the call is inbound (received) or outbound (initiated). |
| [CallErrorKind](type-aliases/CallErrorKind.md) | Semantic category of a call-lifecycle error. |
| [CallStatus](type-aliases/CallStatus.md) | Lifecycle status of a call. |
| [Capability](type-aliases/Capability.md) | Feature capability string that controls what actions a participant can perform. |
| [ExecuteMethod](type-aliases/ExecuteMethod.md) | Callback type for executing call methods Injected to avoid circular dependency with Call class |
| [JSONRPCResponse](type-aliases/JSONRPCResponse.md) | - |
| [LogLevel](type-aliases/LogLevel.md) | Log level names supported by the SDK. |
| [MediaDirection](type-aliases/MediaDirection.md) | WebRTC transceiver direction for a single media kind. |
| [QualityLevel](type-aliases/QualityLevel.md) | Simplified quality level for UI indicators, derived from MOS score. |
| [RecoveryState](type-aliases/RecoveryState.md) | State of the recovery pipeline state machine (Section 19.7). |
| [ResilienceCallStatus](type-aliases/ResilienceCallStatus.md) | Extended call status that includes the 'recovering' state. |
| [ScreenShareStatus](type-aliases/ScreenShareStatus.md) | - |
| [SubscriberPresence](type-aliases/SubscriberPresence.md) | Subscriber online presence state. |
| [VideoPosition](type-aliases/VideoPosition.md) | Position of a participant's video within the layout canvas. |
| [WebSocketAdapter](type-aliases/WebSocketAdapter.md) | Browser-compatible WebSocket constructor type. |

## Variables

### ready

> `const` **ready**: `boolean` = `true`

Defined in: [index.ts:196](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/index.ts#L196)

Flag indicating the library has been loaded and is ready to use.
For UMD builds: `window.SignalWire.ready`
For ES modules: `import { ready } from '@signalwire/js'`

***

### version

> `const` **version**: `string` = `__VERSION__`

Defined in: [index.ts:189](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/index.ts#L189)

Library version from package.json, injected at build time.

## Functions

| Function | Description |
| ------ | ------ |
| [embeddableCall](functions/embeddableCall.md) | Creates a call using an embed token for simple, embeddable integrations. |
| [getLogger](functions/getLogger.md) | - |
| [isSelfParticipant](functions/isSelfParticipant.md) | Type guard that checks if a participant is the local [SelfParticipant](classes/SelfParticipant.md). |
| [setDebugOptions](functions/setDebugOptions.md) | Configure debug options (e.g., `{ logWsTraffic: true }`). |
| [setLogger](functions/setLogger.md) | Replace the built-in logger with a custom implementation. Pass `null` to restore defaults. |
| [setLogLevel](functions/setLogLevel.md) | Set the log level for the built-in logger. Has no effect when a custom logger is set via `setLogger()`. |

## References

### NetworkIssue

Renames and re-exports [CallNetworkIssue](interfaces/CallNetworkIssue.md)

***

### NetworkMetrics

Renames and re-exports [CallNetworkMetrics](interfaces/CallNetworkMetrics.md)
