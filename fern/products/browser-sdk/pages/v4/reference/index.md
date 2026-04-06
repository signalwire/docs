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
| [Participant](classes/Participant.md) | Represents a participant in a call. |
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
| [AuthenticateContext](interfaces/AuthenticateContext.md) | Context provided by the SDK when calling [CredentialProvider.authenticate](interfaces/CredentialProvider.md#authenticate). |
| [Call](interfaces/Call.md) | Public interface for an active WebRTC call. |
| [CallAddress](interfaces/CallAddress.md) | Minimal address interface for call context Avoids circular dependency with full Address class |
| [CallCapabilitiesState](interfaces/CallCapabilitiesState.md) | Call-level capabilities state |
| [CallError](interfaces/CallError.md) | Structured error emitted on `call.errors$`. |
| [CallOptions](interfaces/CallOptions.md) | Configuration options for creating a call. |
| [CallParticipant](interfaces/CallParticipant.md) | Base participant interface for call participants Defines the full public contract for participant objects exposed by Call |
| [CallSelfParticipant](interfaces/CallSelfParticipant.md) | Self participant interface with control methods Extends CallParticipant with methods for controlling the local participant |
| [CallState](interfaces/CallState.md) | Observable state of a call (status, recording, participants, etc.). |
| [CredentialProvider](interfaces/CredentialProvider.md) | Provides authentication credentials to the SDK. |
| [DeviceController](interfaces/DeviceController.md) | Interface for media device management. |
| [DialOptions](interfaces/DialOptions.md) | Options for [SignalWire.dial](classes/SignalWire.md#dial). Extends [MediaOptions](interfaces/MediaOptions.md) with dial-specific settings. |
| [Directory](interfaces/Directory.md) | Directory interface for managing addresses |
| [JSONRPCErrorResponse](interfaces/JSONRPCErrorResponse.md) | - |
| [JSONRPCRequest](interfaces/JSONRPCRequest.md) | - |
| [JSONRPCSuccessResponse](interfaces/JSONRPCSuccessResponse.md) | - |
| [LayoutLayer](interfaces/LayoutLayer.md) | - |
| [MediaDirections](interfaces/MediaDirections.md) | Audio and video directions "inactive" | "recvonly" | "sendonly" | "sendrecv" | "stopped" |
| [MediaOptions](interfaces/MediaOptions.md) | Options controlling which media tracks to send and receive. |
| [MemberCapabilities](interfaces/MemberCapabilities.md) | Member-level capabilities for self or other members |
| [NodeSocketAdapter](interfaces/NodeSocketAdapter.md) | There's a difference in `searchParams` between URL from `lib` and URL from `url` (node) that makes using the same not possible for us. |
| [OnOffCapability](interfaces/OnOffCapability.md) | Represents an on/off capability state Both `on` and `off` can be true if the parent permission grants both |
| [PendingRPCOptions](interfaces/PendingRPCOptions.md) | - |
| [SATClaims](interfaces/SATClaims.md) | SAT claims returned by /api/fabric/subscriber/info. |
| [SDKCredential](interfaces/SDKCredential.md) | Authentication credentials for the SDK. |
| [SessionState](interfaces/SessionState.md) | Extended session interface that adds call management and authentication state on top of the narrow ClientSession contract. |
| [SignalWireOptions](interfaces/SignalWireOptions.md) | Options for constructing a [SignalWire](classes/SignalWire.md). |
| [Storage](interfaces/Storage.md) | Key-value storage interface for persisting SDK preferences and state. |
| [TextMessage](interfaces/TextMessage.md) | Text message from conversation Contains a reference to the sender address as an observable |
| [TransferOptions](interfaces/TransferOptions.md) | - |
| [WebRTCApiProvider](interfaces/WebRTCApiProvider.md) | Provides custom WebRTC API implementations for non-standard environments. |
| [WebRTCMediaDevices](interfaces/WebRTCMediaDevices.md) | Subset of the `MediaDevices` interface actually used by the SDK. |

## Type Aliases

| Type Alias | Description |
| ------ | ------ |
| [CallErrorKind](type-aliases/CallErrorKind.md) | Semantic category of a call-lifecycle error. |
| [CallStatus](type-aliases/CallStatus.md) | Lifecycle status of a call. |
| [ExecuteMethod](type-aliases/ExecuteMethod.md) | Callback type for executing call methods Injected to avoid circular dependency with Call class |
| [JSONRPCResponse](type-aliases/JSONRPCResponse.md) | - |
| [MediaDirection](type-aliases/MediaDirection.md) | WebRTC transceiver direction for a single media kind. |
| [VideoPosition](type-aliases/VideoPosition.md) | Position of a participant's video within the layout canvas. |
| [WebSocketAdapter](type-aliases/WebSocketAdapter.md) | Browser-compatible WebSocket constructor type. |

## Variables

### ready

> `const` **ready**: `boolean` = `true`

Defined in: [index.ts:158](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/index.ts#L158)

Flag indicating the library has been loaded and is ready to use.
For UMD builds: `window.SignalWire.ready`
For ES modules: `import { ready } from '@signalwire/js'`

***

### version

> `const` **version**: `string` = `__VERSION__`

Defined in: [index.ts:151](https://github.com/signalwire/browser-sdk/blob/22134db25f9e6e53565f0e7df00bf7f13ab479c3/packages/main/src/index.ts#L151)

Library version from package.json, injected at build time.

## Functions

| Function | Description |
| ------ | ------ |
| [embeddableCall](functions/embeddableCall.md) | Creates a call using an embed token for simple, embeddable integrations. |
| [getLogger](functions/getLogger.md) | - |
| [isSelfParticipant](functions/isSelfParticipant.md) | Type guard that checks if a participant is the local [SelfParticipant](classes/SelfParticipant.md). |
| [setLogger](functions/setLogger.md) | - |
