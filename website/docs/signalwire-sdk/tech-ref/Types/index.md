# Types

## Interfaces

### AddProfilesParams

Parameters for adding profiles

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **profiles** | Omit<[Profile](#profile), "id" \| "createdAt" \| "updatedAt" \| "lastUsed" \| "addressId">[] | Yes |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:93](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L93)

---

### BaseComponentOptions

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **customSagas**? | CustomSaga<any>[] | No |  |
| **store** | { channels: InternalChannels; instanceMap: InstanceMap; runSaga: (saga: Saga, args: { instance: [T](#call.default-config); runSaga: any }) => Task<any>; sessionEmitter: EventEmitter<ClientEvents, any> } | Yes |  |

**Source:** [packages/core/src/utils/interfaces.ts:146](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/utils/interfaces.ts#L146)

---

### CallCapabilitiesContract

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **device** | boolean | Yes |  |
| **end** | boolean | Yes |  |
| **lock** | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) | Yes |  |
| **member** | [MemberCapabilityContract](#membercapabilitycontract) | Yes |  |
| **screenshare** | boolean | Yes |  |
| **self** | [MemberCapabilityContract](#membercapabilitycontract) | Yes |  |
| **sendDigit** | boolean | Yes |  |
| **setLayout** | boolean | Yes |  |
| **vmutedHide** | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) | Yes |  |

**Source:** [packages/client/src/unified/interfaces/capabilities.ts:20](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/capabilities.ts#L20)

---

### CallConnectEventParams

call.connect

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **call_id** | string | Yes |  |
| **connect_state** | CallConnectStates | Yes |  |
| **node_id** | string | Yes |  |
| **peer**? | { call_id: string; device: CallDevice; node_id: string } | No |  |
| **room_session_id** | string | Yes |  |
| **segment_id** | string | Yes |  |

**Source:** [packages/core/src/types/fabricRoomSession.ts:716](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricRoomSession.ts#L716)

---

### CallLayoutChangedEventParams

layout.changed

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **layout** | InternalVideoLayout | Yes |  |
| **room_id** | string | Yes |  |
| **room_session_id** | string | Yes |  |

**Source:** [packages/core/src/types/fabricLayout.ts:15](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricLayout.ts#L15)

---

### CallLeftEventParams

call.left

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **call_id** | string | Yes |  |
| **member_id** | string | Yes |  |
| **origin_call_id** | string | Yes |  |
| **reason** | string | Yes |  |
| **room_id** | string | Yes |  |
| **room_session** | InternalCallSessionEntity | Yes |  |
| **room_session_id** | string | Yes |  |

**Source:** [packages/core/src/types/fabricRoomSession.ts:661](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricRoomSession.ts#L661)

---

### CallPlayEventParams

call.play

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **call_id** | string | Yes |  |
| **control_id** | string | Yes |  |
| **node_id** | string | Yes |  |
| **room_session_id** | string | Yes |  |
| **state** | CallPlayState | Yes |  |

**Source:** [packages/core/src/types/fabricRoomSession.ts:700](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricRoomSession.ts#L700)

---

### CallSession

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **active** | boolean | Yes | Whether the connection is currently active |
| readonly **callId** | string | Yes | The underlying connection id - callId |
| readonly **cameraConstraints** | null \| MediaTrackConstraints | Yes | The constraints applied to the video device, or null if not available |
| readonly **cameraId** | null \| string | Yes | The id of the video device, or null if not available |
| readonly **cameraLabel** | null \| string | Yes | The label of the video device, or null if not available |
| **currentLayout** | InternalVideoLayout | Yes | The layout returned from the `layout.changed` event based on the current room layout |
| **currentLayoutEvent** | [CallLayoutChangedEventParams](#calllayoutchangedeventparams) | Yes | The `layout.changed` event based on the current room layout |
| **currentPosition** | undefined \| VideoPosition | Yes | The current position of the member returned from the `layout.changed` event |
| **getMemberOverlay** | (memberId: string) => undefined \| [UserOverlay](#useroverlay) | Yes | Return the member overlay on top of the root element |
| readonly **id** | string | Yes | Unique id for this room session |
| readonly **leaveReason** | undefined \| "RECONNECTION_ATTEMPT_TIMEOUT" | Yes |  |
| readonly **localAudioTrack** | null \| MediaStreamTrack | Yes | Provides access to the local audio [MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack). |
| readonly **localStream** | undefined \| MediaStream | Yes | Provides access to the local [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream) |
| **localVideoOverlay** | undefined \| [LocalVideoOverlay](#localvideooverlay) | Yes | Local video overlay object that the SDK injects in the DOM element inside the MCU |
| readonly **localVideoTrack** | null \| MediaStreamTrack | Yes | Provides access to the local video [MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack). |
| readonly **memberId** | string | Yes | The id of the current member within the room |
| readonly **microphoneConstraints** | null \| MediaTrackConstraints | Yes | The constraints applied to the audio input device, or null if not available |
| readonly **microphoneId** | null \| string | Yes | The id of the audio input device, or null if not available |
| readonly **microphoneLabel** | null \| string | Yes | The label of the audio input device, or null if not available |
| readonly **options** | Record<any, any> | Yes | The BaseConnection options |
| **overlayMap** | undefined \| OverlayMap | Yes | A JS Map containing all the layers on top of the Root Element |
| readonly **previewUrl**? | string | No | The preview_url for the room. Only with "enable_room_previews: true" on Room configuration. |
| readonly **remoteStream** | undefined \| MediaStream | Yes | Provides access to the remote [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream) |
| readonly **roomId** | string | Yes | The unique identifier for the room |
| readonly **roomSessionId** | string | Yes | The unique identifier for the room session |
| **screenShareList** | [RoomSessionScreenShare](#roomsessionscreenshare)[] | Yes | List of screen share objects |
| readonly **withAudio** | boolean | Yes | Indicates if there is any receiving audio |
| readonly **withVideo** | boolean | Yes | Indicates if there is any receiving video |

**Source:** [packages/client/src/unified/CallSession.ts:37](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/CallSession.ts#L37)

---

### CallStateEventParams

call.state

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **answer_time** | number | Yes |  |
| **call_id** | string | Yes |  |
| **call_state** | CallStates | Yes |  |
| **device** | CallDevice | Yes |  |
| **direction** | CallDirection | Yes |  |
| **end_time** | number | Yes |  |
| **node_id** | string | Yes |  |
| **room_session_id** | string | Yes |  |
| **segment_id** | string | Yes |  |
| **start_time** | number | Yes |  |

**Source:** [packages/core/src/types/fabricRoomSession.ts:679](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricRoomSession.ts#L679)

---

### CallUpdatedEventParams

call.updated

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **room_id** | string | Yes |  |
| **room_session** | InternalCallSessionEntity | Yes |  |
| **room_session_id** | string | Yes |  |

**Source:** [packages/core/src/types/fabricRoomSession.ts:647](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricRoomSession.ts#L647)

---

### CapabilityOnOffStateContract

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **off** | boolean | Yes |  |
| **on** | boolean | Yes |  |

**Source:** [packages/client/src/unified/interfaces/capabilities.ts:1](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/capabilities.ts#L1)

---

### ClientFactoryContract

Contract for the ClientFactory

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:143](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L143)

---

### ConnectionOptions

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **additionalDevice**? | boolean | No |  |
| **attach**? | boolean | No |  |
| **audio**? | boolean \| MediaTrackConstraints | No | Audio constraints to use when joining the room. Default: `true`. |
| **autoApplyMediaParams**? | boolean | No |  |
| **callerName**? | string | No |  |
| **callerNumber**? | string | No |  |
| **camId**? | string | No |  |
| **camLabel**? | string | No |  |
| **connectionPoolSize**? | number | No | Number of connections to maintain in the connection pool. Set to 0 to disable connection pooling. Default: 3 |
| **destinationNumber**? | string | No |  |
| **disableUdpIceServers**? | boolean | No | Disable ICE UDP transport policy |
| **enableConnectionPool**? | boolean | No | Whether to enable connection pooling for faster call setup. When enabled, maintains pre-warmed RTCPeerConnections with gathered ICE candidates. Default: true |
| **fromCallAddressId**? | string | No |  |
| **googleMaxBitrate**? | number | No |  |
| **googleMinBitrate**? | number | No |  |
| **googleStartBitrate**? | number | No |  |
| **iceCandidatePoolSize**? | number | No | Size of the ICE candidate pool for reuse. Allows ICE candidates to be reused when tracks are replaced. Default: 10 |
| **iceGatheringTimeout**? | number | No |  |
| **iceServers**? | RTCIceServer[] | No | List of ICE servers. |
| **layout**? | string | No |  |
| **localStream**? | MediaStream | No |  |
| **maxConnectionStateTimeout**? | number | No |  |
| **maxIceGatheringTimeout**? | number | No |  |
| **micId**? | string | No |  |
| **micLabel**? | string | No |  |
| **msStreamsNumber**? | number | No |  |
| **negotiateAudio**? | boolean | No |  |
| **negotiateVideo**? | boolean | No |  |
| **nodeId**? | string | No |  |
| **pingSupported**? | boolean | No |  |
| **positions**? | VideoPositions | No |  |
| **prevCallId**? | string | No |  |
| **profileId**? | string | No |  |
| **recoverCall**? | boolean | No |  |
| **remoteCallerName**? | string | No |  |
| **remoteCallerNumber**? | string | No |  |
| **remoteSdp**? | string | No |  |
| **remoteStream**? | MediaStream | No |  |
| **requestTimeout**? | number | No |  |
| **rtcPeerConfig**? | object | No |  |
| **screenShare**? | boolean | No |  |
| **sfu**? | boolean | No |  |
| **shakenCheck**? | string | No |  |
| **shakenResult**? | string | No |  |
| **simulcast**? | boolean | No |  |
| **speakerId**? | string | No | Id of the speaker device to use for audio output. If undefined, picks a default speaker. |
| **userVariables**? | object | No |  |
| **useStereo**? | boolean | No |  |
| **video**? | boolean \| MediaTrackConstraints | No | Video constraints to use when joining the room. Default: `true`. |
| **watchMediaPackets**? | boolean | No |  |
| **watchMediaPacketsTimeout**? | number | No |  |

**Source:** [packages/webrtc/src/utils/interfaces.ts:8](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/interfaces.ts#L8)

---

### ConversationAPIGetMessagesParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **pageSize**? | number | No |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:142](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L142)

---

### ConversationAPISendMessageParams

Conversation API

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **fromAddressId** | string | Yes |  |
| **text** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:137](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L137)

---

### ConversationChatMessagesSubscribeParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **groupId** | string | Yes |  |
| **onMessage** | [ConversationChatSubscribeCallback](#call.conversationchatsubscribecallback) | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:68](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L68)

---

### ConversationContract

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **createdAt** | number | Yes |  |
| readonly **fromAddressId** | string | Yes |  |
| readonly **groupId** | string | Yes |  |
| readonly **lastMessageAt** | number | Yes |  |
| readonly **metadata** | Record<string, unknown> | Yes |  |
| readonly **name** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:7](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L7)

---

### ConversationMessage

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **details** | Record<string, unknown> | Yes |  |
| **from_fabric_address_id** | string | Yes |  |
| **group_id** | string | Yes |  |
| **id** | string | Yes |  |
| **kind**? | string | No |  |
| **metadata**? | Record<string, unknown> | No |  |
| **subtype** | string | Yes |  |
| **text**? | string | No |  |
| **ts** | number | Yes |  |
| **type** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:96](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L96)

---

### ConversationMessageEvent

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **event_channel** | string | Yes |  |
| **event_type** | "conversation.message" | Yes |  |
| **params** | [ConversationMessageEventParams](#conversationmessageeventparams) | Yes |  |
| **timestamp** | number | Yes |  |

**Source:** [packages/core/src/types/conversation.ts:29](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/conversation.ts#L29)

---

### ConversationMessageEventParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **details** | Record<string, unknown> | Yes |  |
| **from_fabric_address_id** | string | Yes |  |
| **group_id** | string | Yes |  |
| **hidden** | boolean | Yes |  |
| **id** | string | Yes |  |
| **kind**? | string | No |  |
| **metadata** | Record<string, unknown> | Yes |  |
| **subtype** | "chat" \| "update" | Yes |  |
| **text** | null \| string | Yes |  |
| **ts** | number | Yes |  |
| **type** | string | Yes |  |
| **user_name** | string | Yes |  |

**Source:** [packages/core/src/types/conversation.ts:5](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/conversation.ts#L5)

---

### ConversationResponse

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **created_at** | number | Yes |  |
| **from_fabric_address_id** | string | Yes |  |
| **group_id** | string | Yes |  |
| **last_message_at** | number | Yes |  |
| **metadata** | Record<string, unknown> | Yes |  |
| **name** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:43](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L43)

---

### ConversationSubscribeResult

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **unsubscribe** | () => void | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:64](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L64)

---

### CoreRoomEventParams

call.room

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **call_id** | string | Yes |  |
| **joined_status** | string | Yes |  |
| **node_id** | string | Yes |  |
| **room_session_id** | string | Yes |  |
| **segment_id** | string | Yes |  |

**Source:** [packages/core/src/types/fabricRoomSession.ts:737](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricRoomSession.ts#L737)

---

### DialParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **applyLocalVideoOverlay**? | boolean | No | Whether to apply the local-overlay on top of your video. Default: `true`. |
| **applyMemberOverlay**? | boolean | No | Whether to apply an overlay on top of each member. Default: `true`. |
| **audio**? | boolean \| MediaTrackConstraints | No | Audio constraints to use when joining the room. Default: `true`. |
| **disableUdpIceServers**? | boolean | No | Disable ICE UDP transport policy |
| **fromCallAddressId**? | string | No | Call address ID matching one of the subscriber’s addresses to attribute conversation API events in the INVITE. |
| **listen**? | Partial<CallListeners> | No | Optional event listeners for the call session |
| **mirrorLocalVideoOverlay**? | boolean | No | Whether to mirror the local video overlay. Default: `false`. |
| **negotiateAudio**? | boolean | No | Negotiate the incoming audio from the RTC. Default: `true`. |
| **negotiateVideo**? | boolean | No | Negotiate the incoming video from the RTC. Default: `true` for "video" channel. |
| **nodeId**? | string | No |  |
| **rootElement**? | null \| HTMLElement | No | HTML element in which to display the video stream |
| **stopCameraWhileMuted**? | boolean | No | Whether to stop the camera when the member is muted. Default: `true`. |
| **stopMicrophoneWhileMuted**? | boolean | No | Whether to stop the microphone when the member is muted. Default: `true`. |
| **to** | string | Yes |  |
| **userVariables**? | Record<string, any> | No | User & UserAgent metadata |
| **video**? | boolean \| MediaTrackConstraints | No | Video constraints to use when joining the room. Default: `true` for "video" channel. |

**Source:** [packages/client/src/unified/interfaces/wsClient.ts:127](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/wsClient.ts#L127)

---

### DisposeClientParams

Parameters for disposing a client instance

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **instanceId** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:136](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L136)

---

### EmitterContract

**Source:** [packages/core/src/types/index.ts:20](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/index.ts#L20)

---

### GetAddressByIdParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **id** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/address.ts:32](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/address.ts#L32)

---

### GetAddressByNameParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **name** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/address.ts:36](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/address.ts#L36)

---

### GetAddressesParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **displayName**? | string | No |  |
| **pageSize**? | number | No |  |
| **sortBy**? | "name" \| "created_at" | No |  |
| **sortOrder**? | "asc" \| "desc" | No |  |
| **type**? | string | No |  |

**Source:** [packages/client/src/unified/interfaces/address.ts:24](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/address.ts#L24)

---

### GetAddressResponse

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **channels** | { audio?: string; messaging?: string; video?: string } | Yes |  |
| **cover_url**? | string | No |  |
| **created_at** | string | Yes |  |
| **display_name** | string | Yes |  |
| **id** | string | Yes |  |
| **locked** | boolean | Yes |  |
| **name** | string | Yes |  |
| **preview_url**? | string | No |  |
| **resource_id** | string | Yes |  |
| **type** | [ResourceType](#call.resourcetype) | Yes |  |

**Source:** [packages/client/src/unified/interfaces/address.ts:5](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/address.ts#L5)

---

### GetClientParams

Parameters for getting a client instance

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **addressId**? | string | No | Address ID to find a suitable profile for. Used if profileId is not provided |
| **options** | [GetClientParamsOptions](#call.getclientparamsoptions) | Yes | Signalwire client options |
| **profileId**? | string | No | Profile ID to use for the client. Takes priority over addressId |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:115](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L115)

---

### GetClientResult

Result from getting a client instance

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **instance** | [ManagedInstance](#managedinstance) | Yes | Managed client instance information |
| **isNew** | boolean | Yes | Whether this is a newly created instance |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:127](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L127)

---

### GetConversationChatMessageParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **groupId** | string | Yes |  |
| **pageSize**? | number | No |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:116](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L116)

---

### GetConversationMessagesParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **groupId** | string | Yes |  |
| **pageSize**? | number | No |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:127](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L127)

---

### GetConversationMessagesResponse

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **data** | [ConversationMessage](#conversationmessage)[] | Yes |  |
| **links** | { first?: string; next?: string; prev?: string; self?: string } | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:124](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L124)

---

### GetConversationsParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **pageSize**? | number | No |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:39](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L39)

---

### GetMessagesParams

Conversation Messages

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **pageSize**? | number | No |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:92](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L92)

---

### GetSubscriberInfoResponse

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **app_settings**? | { display_name: string; scopes: string[] } | No |  |
| **company_name**? | string | No |  |
| **country**? | string | No |  |
| **display_name**? | string | No |  |
| **email** | string | Yes |  |
| **fabric_addresses** | [GetAddressResponse](#getaddressresponse)[] | Yes |  |
| **first_name**? | string | No |  |
| **id** | string | Yes |  |
| **job_title**? | string | No |  |
| **last_name**? | string | No |  |
| **push_notification_key** | string | Yes |  |
| **region**? | string | No |  |
| **time_zone**? | number | No |  |

**Source:** [packages/client/src/unified/interfaces/index.ts:67](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/index.ts#L67)

---

### HandlePushNotificationResult

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **resultType** | "inboundCall" | Yes |  |

**Source:** [packages/client/src/unified/interfaces/wsClient.ts:87](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/wsClient.ts#L87)

---

### IncomingCallHandlers

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **all**? | [IncomingCallHandler](#call.incomingcallhandler) | No |  |
| **pushNotification**? | [IncomingCallHandler](#call.incomingcallhandler) | No |  |
| **websocket**? | [IncomingCallHandler](#call.incomingcallhandler) | No |  |

**Source:** [packages/client/src/unified/interfaces/incomingCallManager.ts:32](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/incomingCallManager.ts#L32)

---

### IncomingCallNotification

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **invite** | { accept: (param: CallParams) => [CallSession](#callsession); details: [IncomingInvite](#incominginvite); reject: () => Promise<void> } | Yes |  |

**Source:** [packages/client/src/unified/interfaces/incomingCallManager.ts:21](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/incomingCallManager.ts#L21)

---

### IncomingInvite

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **callee_id_name** | string | Yes |  |
| **callee_id_number** | string | Yes |  |
| **caller_id_name** | string | Yes |  |
| **caller_id_number** | string | Yes |  |
| **callID** | string | Yes |  |
| **display_direction** | string | Yes |  |
| **nodeId** | string | Yes |  |
| **sdp** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/incomingCallManager.ts:6](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/incomingCallManager.ts#L6)

---

### IncomingInviteWithSource

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **callee_id_name** | string | Yes |  |
| **callee_id_number** | string | Yes |  |
| **caller_id_name** | string | Yes |  |
| **caller_id_number** | string | Yes |  |
| **callID** | string | Yes |  |
| **display_direction** | string | Yes |  |
| **nodeId** | string | Yes |  |
| **sdp** | string | Yes |  |
| **source** | [IncomingInviteSource](#call.incominginvitesource) | Yes |  |

**Source:** [packages/client/src/unified/interfaces/incomingCallManager.ts:17](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/incomingCallManager.ts#L17)

---

### InstanceManagerContract

Contract for the InstanceManager

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:284](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L284)

---

### JoinConversationParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **addressIds** | string[] | Yes |  |
| **fromAddressId** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:76](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L76)

---

### JoinConversationResponse

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **addressIds** | string[] | Yes |  |
| **from_fabric_address_id** | string | Yes |  |
| **group_id** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:81](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L81)

---

### ManagedInstance

Managed client instance information

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **client** | [SignalWireContract](#signalwirecontract) | Yes | The actual SignalWire client instance |
| **createdAt** | Date | Yes | Timestamp when the instance was created |
| **id** | string | Yes | Unique identifier for the instance |
| **lastAccessedAt** | Date | Yes | Timestamp when the instance was last accessed |
| **profileId** | string | Yes | Profile ID used to create this instance |
| **usageCount** | number | Yes | Number of times this instance has been accessed |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:70](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L70)

---

### MemberCapabilityContract

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **audioFlags** | boolean | Yes |  |
| **deaf** | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) | Yes |  |
| **meta** | boolean | Yes |  |
| **microphoneSensitivity** | boolean | Yes |  |
| **microphoneVolume** | boolean | Yes |  |
| **muteAudio** | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) | Yes |  |
| **muteVideo** | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) | Yes |  |
| **position** | boolean | Yes |  |
| **raisehand** | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) | Yes |  |
| **remove** | boolean | Yes |  |
| **speakerVolume** | boolean | Yes |  |

**Source:** [packages/client/src/unified/interfaces/capabilities.ts:6](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/capabilities.ts#L6)

---

### MemberJoinedEventParams

member.joined

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **member** | InternalMemberEntity | Yes |  |
| **room_id** | string | Yes |  |
| **room_session_id** | string | Yes |  |

**Source:** [packages/core/src/types/fabricMember.ts:159](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricMember.ts#L159)

---

### MemberLeftEventParams

member.left

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **member** | InternalMemberEntity | Yes |  |
| **reason** | string | Yes |  |
| **room_id** | string | Yes |  |
| **room_session_id** | string | Yes |  |

**Source:** [packages/core/src/types/fabricMember.ts:187](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricMember.ts#L187)

---

### MemberTalkingEventParams

member.talking

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **member** | { member_id: string; node_id: string; talking: boolean } | Yes |  |
| **room_id** | string | Yes |  |
| **room_session_id** | string | Yes |  |

**Source:** [packages/core/src/types/fabricMember.ts:202](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricMember.ts#L202)

---

### MemberUpdatedEventParams

member.updated

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **member** | InternalMemberEntityUpdated | Yes |  |
| **room_id** | string | Yes |  |
| **room_session_id** | string | Yes |  |

**Source:** [packages/core/src/types/fabricMember.ts:173](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/fabricMember.ts#L173)

---

### MicrophoneAnalyzer

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:703](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L703)

---

### OnlineParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **incomingCallHandlers** | [IncomingCallHandlers](#incomingcallhandlers) | Yes |  |

**Source:** [packages/client/src/unified/interfaces/wsClient.ts:64](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/wsClient.ts#L64)

---

### PaginatedResponse

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **data** | [T](#call.default-config)[] | Yes |  |
| **links** | { first?: string; next?: string; prev?: string; self?: string } | Yes |  |

**Source:** [packages/client/src/unified/interfaces/index.ts:43](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/index.ts#L43)

---

### PaginatedResult

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **data** | [T](#call.default-config)[] | Yes |  |
| **hasNext** | boolean | Yes |  |
| **hasPrev** | boolean | Yes |  |

**Source:** [packages/client/src/unified/interfaces/index.ts:53](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/index.ts#L53)

---

### Profile

Authentication profile for SignalWire client instances

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **addressDetails**? | { channels?: number; displayName?: string; name: string; type: [ResourceType](#call.resourcetype) } | No |  |
| **addressId** | string | Yes |  |
| **createdAt** | number | Yes |  |
| **credentials** | [SignalWireCredentials](#signalwirecredentials) | Yes | Public type for authentication credentials |
| **credentialsId** | string | Yes |  |
| **id** | string | Yes |  |
| **lastUsed**? | number | No |  |
| **type** | [ProfileType](#profiletype) | Yes | Types of authentication profiles |
| **updatedAt** | number | Yes |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:43](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L43)

---

### ProfileManagerContract

Contract for the ProfileManager

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:200](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L200)

---

### ReattachParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **applyLocalVideoOverlay**? | boolean | No | Whether to apply the local-overlay on top of your video. Default: `true`. |
| **applyMemberOverlay**? | boolean | No | Whether to apply an overlay on top of each member. Default: `true`. |
| **audio**? | boolean \| MediaTrackConstraints | No | Audio constraints to use when joining the room. Default: `true`. |
| **disableUdpIceServers**? | boolean | No | Disable ICE UDP transport policy |
| **fromCallAddressId**? | string | No | Call address ID matching one of the subscriber’s addresses to attribute conversation API events in the INVITE. |
| **listen**? | Partial<CallListeners> | No | Optional event listeners for the call session |
| **mirrorLocalVideoOverlay**? | boolean | No | Whether to mirror the local video overlay. Default: `false`. |
| **negotiateAudio**? | boolean | No | Negotiate the incoming audio from the RTC. Default: `true`. |
| **negotiateVideo**? | boolean | No | Negotiate the incoming video from the RTC. Default: `true` for "video" channel. |
| **nodeId**? | string | No |  |
| **rootElement**? | null \| HTMLElement | No | HTML element in which to display the video stream |
| **stopCameraWhileMuted**? | boolean | No | Whether to stop the camera when the member is muted. Default: `true`. |
| **stopMicrophoneWhileMuted**? | boolean | No | Whether to stop the microphone when the member is muted. Default: `true`. |
| **to**? | string | No |  |
| **userVariables**? | Record<string, any> | No | User & UserAgent metadata |
| **video**? | boolean \| MediaTrackConstraints | No | Video constraints to use when joining the room. Default: `true` for "video" channel. |

**Source:** [packages/client/src/unified/interfaces/wsClient.ts:134](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/wsClient.ts#L134)

---

### RegisterDeviceParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **deviceToken** | string | Yes |  |
| **deviceType** | [RegisterDeviceType](#call.registerdevicetype) | Yes |  |

**Source:** [packages/client/src/unified/interfaces/device.ts:3](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/device.ts#L3)

---

### RegisterDeviceResponse

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **date_registered** | Date | Yes |  |
| **device_name**? | string | No |  |
| **device_token** | string | Yes |  |
| **device_type** | [RegisterDeviceType](#call.registerdevicetype) | Yes |  |
| **id** | string | Yes |  |
| **push_notification_key** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/device.ts:12](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/device.ts#L12)

---

### RemoveProfilesParams

Parameters for removing profiles

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **profileIds** | string[] | Yes |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:103](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L103)

---

### RoomSessionDevice

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **active** | boolean | Yes | Whether the connection is currently active |
| readonly **callId** | string | Yes | The underlying connection id - callId |
| readonly **cameraConstraints** | null \| MediaTrackConstraints | Yes | The constraints applied to the video device, or null if not available |
| readonly **cameraId** | null \| string | Yes | The id of the video device, or null if not available |
| readonly **cameraLabel** | null \| string | Yes | The label of the video device, or null if not available |
| readonly **id** | string | Yes | Unique id for this room session |
| readonly **leaveReason** | undefined \| "RECONNECTION_ATTEMPT_TIMEOUT" | Yes |  |
| readonly **localAudioTrack** | null \| MediaStreamTrack | Yes | Provides access to the local audio [MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack). |
| readonly **localStream** | undefined \| MediaStream | Yes | Provides access to the local [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream) |
| readonly **localVideoTrack** | null \| MediaStreamTrack | Yes | Provides access to the local video [MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack). |
| readonly **memberId** | string | Yes | The id of the current member within the room |
| readonly **microphoneConstraints** | null \| MediaTrackConstraints | Yes | The constraints applied to the audio input device, or null if not available |
| readonly **microphoneId** | null \| string | Yes | The id of the audio input device, or null if not available |
| readonly **microphoneLabel** | null \| string | Yes | The label of the audio input device, or null if not available |
| readonly **options** | Record<any, any> | Yes | The BaseConnection options |
| readonly **previewUrl**? | string | No | The preview_url for the room. Only with "enable_room_previews: true" on Room configuration. |
| readonly **remoteStream** | undefined \| MediaStream | Yes | Provides access to the remote [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream) |
| readonly **roomId** | string | Yes | The unique identifier for the room |
| readonly **roomSessionId** | string | Yes | The unique identifier for the room session |
| **runWorker** | (name: string, def: SDKWorkerDefinition<Hooks>) => Task<any> | Yes |  |
| readonly **withAudio** | boolean | Yes | Indicates if there is any receiving audio |
| readonly **withVideo** | boolean | Yes | Indicates if there is any receiving video |

**Source:** [packages/client/src/RoomSessionDevice.ts:25](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/RoomSessionDevice.ts#L25)

---

### RoomSessionScreenShare

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **active** | boolean | Yes | Whether the connection is currently active |
| readonly **callId** | string | Yes | The underlying connection id - callId |
| readonly **cameraConstraints** | null \| MediaTrackConstraints | Yes | The constraints applied to the video device, or null if not available |
| readonly **cameraId** | null \| string | Yes | The id of the video device, or null if not available |
| readonly **cameraLabel** | null \| string | Yes | The label of the video device, or null if not available |
| readonly **id** | string | Yes | Unique id for this room session |
| readonly **leaveReason** | undefined \| "RECONNECTION_ATTEMPT_TIMEOUT" | Yes |  |
| readonly **localAudioTrack** | null \| MediaStreamTrack | Yes | Provides access to the local audio [MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack). |
| readonly **localStream** | undefined \| MediaStream | Yes | Provides access to the local [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream) |
| readonly **localVideoTrack** | null \| MediaStreamTrack | Yes | Provides access to the local video [MediaStreamTrack](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack). |
| readonly **memberId** | string | Yes | The id of the current member within the room |
| readonly **microphoneConstraints** | null \| MediaTrackConstraints | Yes | The constraints applied to the audio input device, or null if not available |
| readonly **microphoneId** | null \| string | Yes | The id of the audio input device, or null if not available |
| readonly **microphoneLabel** | null \| string | Yes | The label of the audio input device, or null if not available |
| readonly **options** | Record<any, any> | Yes | The BaseConnection options |
| readonly **previewUrl**? | string | No | The preview_url for the room. Only with "enable_room_previews: true" on Room configuration. |
| readonly **remoteStream** | undefined \| MediaStream | Yes | Provides access to the remote [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream) |
| readonly **roomId** | string | Yes | The unique identifier for the room |
| readonly **roomSessionId** | string | Yes | The unique identifier for the room session |
| **runWorker** | (name: string, def: SDKWorkerDefinition<Hooks>) => Task<any> | Yes |  |
| readonly **withAudio** | boolean | Yes | Indicates if there is any receiving audio |
| readonly **withVideo** | boolean | Yes | Indicates if there is any receiving video |

**Source:** [packages/client/src/RoomSessionScreenShare.ts:25](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/RoomSessionScreenShare.ts#L25)

---

### SendConversationMessageParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **details**? | Record<string, unknown> | No |  |
| **fromAddressId** | string | Yes |  |
| **groupId** | string | Yes |  |
| **metadata**? | Record<string, unknown> | No |  |
| **text** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/conversation.ts:22](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/conversation.ts#L22)

---

### SignalWireClientParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **apiRequestRetriesDelay**? | number | No | Initial retry delay |
| **apiRequestRetriesDelayIncrement**? | number | No | Increment step for each retry delay |
| **contexts**? | string[] | No |  |
| **debug**? | { logWsTraffic?: boolean } | No |  |
| **devTools**? | boolean | No |  |
| **host**? | string | No |  |
| **incomingCallHandlers**? | [IncomingCallHandlers](#incomingcallhandlers) | No | Call back function to receive the incoming call |
| **instanceMap**? | InstanceMap | No |  |
| **logger**? | SDKLogger | No |  |
| **logLevel**? | "debug" \| "trace" \| "info" \| "warn" \| "error" \| "silent" | No | logging level |
| **maxApiRequestRetries**? | number | No | Max API request retry, set to 0 disable retries |
| **profileId**? | string | No | Optional profileId ID for multi-instance support. Defaults to 'default' |
| **project**? | string | No | SignalWire project id, e.g. `a10d8a9f-2166-4e82-56ff-118bc3a4840f` |
| **rootElement**? | null \| HTMLElement | No | HTML element in which to display the video stream |
| **sessionChannel**? | SessionChannel | No |  |
| **shouldDisconnect**? | () => boolean | No |  |
| **storage**? | [SignalWireStorageContract](#signalwirestoragecontract) | No | Optional storage implementation for persisting client data |
| **token** | string | Yes | SignalWire project token, e.g. `PT9e5660c101cd140a1c93a0197640a369cf5f16975a0079c9` |
| **topics**? | string[] | No | An alias for contexts - Topics has more priority over contexts |
| **userVariables**? | Record<string, any> | No | User & UserAgent metadata |

**Source:** [packages/client/src/unified/interfaces/index.ts:7](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/index.ts#L7)

---

### SignalWireContract

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **address** | Pick<HTTPClientContract, "getAddresses" \| "getAddress" \| "getMyAddresses"> | Yes |  |
| **chat** | { getMessages: (params: [GetConversationChatMessageParams](#getconversationchatmessageparams)) => Promise<[GetConversationChatMessageResult](#call.getconversationchatmessageresult)>; join: (params: [JoinConversationParams](#joinconversationparams)) => Promise<[JoinConversationResponse](#joinconversationresponse)>; sendMessage: (params: [SendConversationMessageParams](#sendconversationmessageparams)) => Promise<[SendConversationMessageResponse](#call.sendconversationmessageresponse)>; subscribe: (params: [ConversationChatMessagesSubscribeParams](#conversationchatmessagessubscribeparams)) => Promise<[ConversationSubscribeResult](#conversationsubscriberesult)> } | Yes |  |
| **conversation** | { getConversationMessages: (params: [GetConversationMessagesParams](#getconversationmessagesparams)) => Promise<[GetConversationMessagesResult](#call.getconversationmessagesresult)>; getConversations: (params: [GetConversationsParams](#getconversationsparams)) => Promise<[GetConversationsResult](#call.getconversationsresult)>; getMessages: (params: [GetMessagesParams](#getmessagesparams)) => Promise<[GetMessagesResult](#call.getmessagesresult)>; join: (params: [JoinConversationParams](#joinconversationparams)) => Promise<[JoinConversationResponse](#joinconversationresponse)>; sendMessage: (params: [SendConversationMessageParams](#sendconversationmessageparams)) => Promise<[SendConversationMessageResponse](#call.sendconversationmessageresponse)>; subscribe: (callback: [ConversationSubscribeCallback](#call.conversationsubscribecallback)) => Promise<[ConversationSubscribeResult](#conversationsubscriberesult)> } | Yes |  |

**Source:** [packages/client/src/unified/interfaces/index.ts:16](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/index.ts#L16)

---

### SignalWireCredentials

Public type for authentication credentials

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **host** | string | Yes |  |
| **satRefreshPayload** | Record<string, any> | Yes | Custom payload for refresh request |
| **satRefreshResultMapper** | RefreshMapper | Yes | String identifier for predefined mapper function |
| **satRefreshURL** | string | Yes | URL for refresh token endpoint |
| **satToken** | string | Yes | The current SAT token |
| **tokenExpiry** | number | Yes | Token expiry timestamp |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:9](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L9)

---

### SignalWireStorageContract

Contract for SignalWire storage implementations.
Provides both persistent and session storage capabilities.

**Source:** [packages/core/src/types/SignalwireStorageContract.ts:16](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/SignalwireStorageContract.ts#L16)

---

### StorageInfo

Storage information about the underlying storage implementation

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **isAvailable** | boolean | Yes |  |
| **isPersistent** | boolean | Yes |  |
| **quotaTotal**? | number | No |  |
| **quotaUsed**? | number | No |  |
| **type** | "localStorage" \| "sessionStorage" \| "memory" \| "custom" | Yes |  |

**Source:** [packages/core/src/types/SignalwireStorageContract.ts:4](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/SignalwireStorageContract.ts#L4)

---

### UnregisterDeviceParams

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **id** | string | Yes |  |

**Source:** [packages/client/src/unified/interfaces/device.ts:8](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/device.ts#L8)

---

### UserOptions

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **contexts**? | string[] | No |  |
| **debug**? | { logWsTraffic?: boolean } | No |  |
| **devTools**? | boolean | No |  |
| **host**? | string | No |  |
| **instanceMap**? | InstanceMap | No |  |
| **logger**? | SDKLogger | No |  |
| **logLevel**? | "debug" \| "trace" \| "info" \| "warn" \| "error" \| "silent" | No | logging level |
| **profileId**? | string | No |  |
| **project**? | string | No | SignalWire project id, e.g. `a10d8a9f-2166-4e82-56ff-118bc3a4840f` |
| **sessionChannel**? | SessionChannel | No |  |
| **token** | string | Yes | SignalWire project token, e.g. `PT9e5660c101cd140a1c93a0197640a369cf5f16975a0079c9` |
| **topics**? | string[] | No | An alias for contexts - Topics has more priority over contexts |

**Source:** [packages/core/src/utils/interfaces.ts:122](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/utils/interfaces.ts#L122)

---

### VideoLayout

Base Interface for a VideoLayout entity

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **id** | string | Yes |  |
| **layers** | VideoLayoutLayer[] | Yes |  |
| **name** | string | Yes |  |
| **roomId** | string | Yes |  |
| **roomSessionId** | string | Yes |  |

**Source:** [packages/core/src/types/videoLayout.ts:28](https://github.com/signalwire/signalwire-js/blob/main/packages/core/src/types/videoLayout.ts#L28)

---

## Enums

### ProfileType

Types of authentication profiles

**Values:**

- **DYNAMIC** = "dynamic" - Dynamic profile that exists only in memory.
Used for shared resource access or temporary authentication.
- **STATIC** = "static" - Static profile with credentials that are persisted to storage.
Typically used for subscriber authentication.

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:26](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L26)

---

## Constants

### Call.SignalWire

Legacy singleton SignalWire function - kept for backward compatibility

**Type:** (params: [SignalWireClientParams](#signalwireclientparams)) => Promise<[SignalWireContract](#signalwirecontract)>

**Source:** [packages/client/src/unified/SignalWire.ts:21](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/SignalWire.ts#L21)

---

### DEFAULT_CONFIG

Default configuration values

**Type:** {
  INSTANCE_ACCESS_UPDATE_INTERVAL: 5000,
  MAX_INSTANCES_PER_PROFILE: 1
}

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:347](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L347)

---

### STORAGE_KEYS

Storage keys used by the ClientFactory system

**Type:** {
  CONFIG: "swcf:config",
  CREDENTIALS: (id: string) => string,
  DEVICE_REGISTRATION: "swcf:device:registration",
  INSTANCE_STATE: (id: string) => string,
  PROFILE: (id: string) => string,
  PROFILES: "swcf:profiles"
}

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:335](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L335)

---

## Functions

### buildVideoElement

**Signature:** (params: BuildVideoElementParams) => Promise<BuildVideoElementReturnType>

Build Video Element

**Source:** [packages/client/src/buildVideoElement.ts:34](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/buildVideoElement.ts#L34)

---

### createSignalWireClient

**Signature:** (params: [SignalWireClientParams](#signalwireclientparams)) => Promise<[SignalWireContract](#signalwirecontract)>

Create a new SignalWire client instance (multi-instance support)
This function is used internally by the ClientFactory for creating multiple instances

**Source:** [packages/client/src/unified/SignalWire.ts:47](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/SignalWire.ts#L47)

---

### getClientFactory

**Signature:** () => [ClientFactory](#clientfactory)

Get the singleton ClientFactory instance

**Source:** [packages/client/src/unified/ClientFactory.ts:553](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/ClientFactory.ts#L553)

---

### isCallSession

**Signature:** (room: unknown) => room

**Source:** [packages/client/src/unified/CallSession.ts:438](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/CallSession.ts#L438)

---

### WebRTC.checkCameraPermissions

**Signature:** () => Promise<null | boolean>

Asynchronously returns whether we have permissions to access the camera.

**Source:** [packages/webrtc/src/utils/permissions.ts:67](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/permissions.ts#L67)

---

### WebRTC.checkMicrophonePermissions

**Signature:** () => Promise<null | boolean>

Asynchronously returns whether we have permissions to access the microphone.

**Source:** [packages/webrtc/src/utils/permissions.ts:78](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/permissions.ts#L78)

---

### WebRTC.checkPermissions

**Signature:** (name?: DevicePermissionName) => Promise<null | boolean>

Asynchronously returns whether we have permissions to access the specified
resource. Some common parameter values for `name` are `"camera"`,
`"microphone"`, and `"speaker"`. In those cases, prefer the dedicated methods
checkCameraPermissions, checkMicrophonePermissions, and
checkSpeakerPermissions.

**Source:** [packages/webrtc/src/utils/permissions.ts:36](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/permissions.ts#L36)

---

### WebRTC.checkSpeakerPermissions

**Signature:** () => Promise<null | boolean>

Asynchronously returns whether we have permissions to access the speakers.

**Source:** [packages/webrtc/src/utils/permissions.ts:89](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/permissions.ts#L89)

---

### WebRTC.createCameraDeviceWatcher

**Signature:** () => Promise<EventEmitter<DeviceWatcherEvents, any>>

Asynchronously returns an event emitter that notifies changes in all camera
devices. This is equivalent to calling
`createDeviceWatcher({ targets: ['camera'] })`, so refer to
createDeviceWatcher for additional information about the returned
event emitter.

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:654](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L654)

---

### WebRTC.createDeviceWatcher

**Signature:** (options: CreateDeviceWatcherOptions) => Promise<EventEmitter<DeviceWatcherEvents, any>>

Asynchronously returns an event emitter that notifies changes in the devices.
The possible events are:

 - "added": a device has been added
 - "removed": a device has been removed
 - "updated": a device has been updated
 - "changed": any of the previous events occurred

In all cases, your event handler gets as parameter an object `e` with the
following keys:

 - `e.changes`: the changed devices. For "added", "removed", and "updated"
   event handlers, you only get the object associated to the respective event
   (i.e., only a list of added devices, removed devices, or updated devices).
   For "changed" event handlers, you get all three lists.
 - `e.devices`: the new list of devices

For device-specific helpers, see createCameraDeviceWatcher,
createMicrophoneDeviceWatcher, and createSpeakerDeviceWatcher.

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:563](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L563)

---

### WebRTC.createMicrophoneAnalyzer

**Signature:** (options: string | MediaStream | MediaTrackConstraints) => Promise<[MicrophoneAnalyzer](#microphoneanalyzer)>

Initializes a microphone analyzer. You can use a MicrophoneAnalyzer to track
the input audio volume.

To stop the analyzer, plase call the `destroy()` method on the object
returned by this method.

The returned object emits the following events:

  - `volumeChanged`: instantaneous volume from 0 to 100
  - `destroyed`: the object has been destroyed. You get a parameter
    describing the reason, which can be `null` (if you called `destroy()`),
    `"error"` (in case of errors), or `"disconnected"` (if the device was
    disconnected).

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:745](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L745)

---

### WebRTC.createMicrophoneDeviceWatcher

**Signature:** () => Promise<EventEmitter<DeviceWatcherEvents, any>>

Asynchronously returns an event emitter that notifies changes in all
microphone devices. This is equivalent to calling
`createDeviceWatcher({ targets: ['microphone'] })`, so refer to
createDeviceWatcher for additional information about the returned
event emitter.

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:634](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L634)

---

### WebRTC.createSpeakerDeviceWatcher

**Signature:** () => Promise<EventEmitter<DeviceWatcherEvents, any>>

Asynchronously returns an event emitter that notifies changes in all speaker
devices. This is equivalent to calling
`createDeviceWatcher({ targets: ['speaker'] })`, so refer to
createDeviceWatcher for additional information about the returned
event emitter.

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:644](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L644)

---

### WebRTC.enumerateDevices

**Signature:** () => Promise<MediaDeviceInfo[]>

Enumerates the media input and output devices available on this device.

> 📘
> Depending on the browser, some information (such as the `label` and
> `deviceId` attributes) could be hidden until permission is granted, for
> example by calling getUserMedia.

**Source:** [packages/webrtc/src/utils/enumerateDevices.ts:25](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/enumerateDevices.ts#L25)

---

### WebRTC.enumerateDevicesByKind

**Signature:** (filterByKind?: MediaDeviceKind) => Promise<MediaDeviceInfo[]>

**Source:** [packages/webrtc/src/utils/enumerateDevices.ts:29](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/enumerateDevices.ts#L29)

---

### WebRTC.getCameraDevices

**Signature:** () => Promise<MediaDeviceInfo[]>

Returns an array of camera devices that can be accessed on this device (for which we have permissions).

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:213](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L213)

---

### WebRTC.getCameraDevicesWithPermissions

**Signature:** () => Promise<MediaDeviceInfo[]>

After prompting the user for permission, returns an array of camera devices.

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:79](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L79)

---

### WebRTC.getDevices

**Signature:** (name?: DevicePermissionName, fullList: boolean) => Promise<MediaDeviceInfo[]>

Enumerates the media input and output devices available on this machine. If
`name` is provided, only the devices of the specified kind are returned.
Possible values of the `name` parameters are `"camera"`, `"microphone"`, and
`"speaker"`, which respectively correspond to functions
getCameraDevices, getMicrophoneDevices, and
getSpeakerDevices.

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:169](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L169)

---

### WebRTC.getDevicesWithPermissions

**Signature:** (kind?: DevicePermissionName, fullList: boolean) => Promise<MediaDeviceInfo[]>

After prompting the user for permission, returns an array of media input and
output devices available on this machine. If `kind` is not null, only the
devices of the specified kind are returned. Possible values of the `kind`
parameters are `"camera"`, `"microphone"`, and `"speaker"`, which
respectively correspond to functions
getCameraDevicesWithPermissions,
getMicrophoneDevicesWithPermissions, and
getSpeakerDevicesWithPermissions.

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:57](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L57)

---

### WebRTC.getDisplayMedia

**Signature:** (constraints?: MediaStreamConstraints) => Promise<MediaStream>

Prompts the user to share the screen and asynchronously returns a
[MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream)
object associated with a display or part of it.

**Source:** [packages/webrtc/src/utils/getDisplayMedia.ts:18](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/getDisplayMedia.ts#L18)

---

### WebRTC.getMicrophoneDevices

**Signature:** () => Promise<MediaDeviceInfo[]>

Returns an array of microphone devices that can be accessed on this device (for which we have permissions).

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:231](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L231)

---

### WebRTC.getMicrophoneDevicesWithPermissions

**Signature:** () => Promise<MediaDeviceInfo[]>

After prompting the user for permission, returns an array of microphone devices.

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:99](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L99)

---

### WebRTC.getSpeakerDevices

**Signature:** () => Promise<MediaDeviceInfo[]>

Returns an array of speaker devices that can be accessed on this device (for which we have permissions).

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:249](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L249)

---

### WebRTC.getSpeakerDevicesWithPermissions

**Signature:** () => Promise<MediaDeviceInfo[]>

After prompting the user for permission, returns an array of speaker devices.

**Source:** [packages/webrtc/src/utils/deviceHelpers.ts:119](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/deviceHelpers.ts#L119)

---

### WebRTC.getSupportedConstraints

**Signature:** () => MediaTrackSupportedConstraints

Returns a dictionary whose fields specify the constrainable properties the user agent understands.

**Source:** [packages/webrtc/src/utils/primitives.ts:42](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/primitives.ts#L42)

---

### WebRTC.getUserMedia

**Signature:** (constraints: MediaStreamConstraints) => Promise<MediaStream>

Prompts the user to share one or more media devices and asynchronously
returns an associated [MediaStream](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream)
object.

For more information, see [`MediaDevices.getUserMedia()`](https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia).

**Source:** [packages/webrtc/src/utils/getUserMedia.ts:70](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/getUserMedia.ts#L70)

---

### WebRTC.requestPermissions

**Signature:** (constraints: MediaStreamConstraints) => Promise<void>

Prompts the user to grant permissions for the devices matching the specified set of constraints.

**Source:** [packages/webrtc/src/utils/requestPermissions.ts:29](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/requestPermissions.ts#L29)

---

### WebRTC.setMediaElementSinkId

**Signature:** (el: null | HTMLMediaElement, deviceId: string) => Promise<undefined>

Assigns the specified audio output device to the specified HTMLMediaElement.
The device with id `deviceId` must be an audio output device. Asynchronously
returns whether the operation had success.

> 📘
> Some browsers do not support output device selection. You can check by
> calling [`supportsMediaOutput`](supportsMediaOutput).

**Source:** [packages/webrtc/src/utils/primitives.ts:77](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/primitives.ts#L77)

---

### WebRTC.stopStream

**Signature:** (stream?: MediaStream) => void

**Source:** [packages/webrtc/src/utils/primitives.ts:109](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/primitives.ts#L109)

---

### WebRTC.stopTrack

**Signature:** (track: MediaStreamTrack) => void

**Source:** [packages/webrtc/src/utils/primitives.ts:115](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/primitives.ts#L115)

---

### WebRTC.supportsGetDisplayMedia

**Signature:** () => boolean

Returns whether the current environment supports `getDisplayMedia`.

**Source:** [packages/webrtc/src/utils/primitives.ts:35](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/primitives.ts#L35)

---

### WebRTC.supportsGetUserMedia

**Signature:** () => boolean

Returns whether the current environment supports `getUserMedia`.

**Source:** [packages/webrtc/src/utils/primitives.ts:28](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/primitives.ts#L28)

---

### WebRTC.supportsMediaDevices

**Signature:** () => boolean

Returns whether the current environment supports the media devices API.

**Source:** [packages/webrtc/src/utils/primitives.ts:10](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/primitives.ts#L10)

---

### WebRTC.supportsMediaOutput

**Signature:** () => boolean

Returns whether the current environment supports the selection of a media output device.

**Source:** [packages/webrtc/src/utils/primitives.ts:52](https://github.com/signalwire/signalwire-js/blob/main/packages/webrtc/src/utils/primitives.ts#L52)

---

## Classes

### ClientFactory

Singleton factory for managing SignalWire client instances and authentication profiles.
Provides a centralized way to create, manage, and dispose of client instances.

**Source:** [packages/client/src/unified/ClientFactory.ts:29](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/ClientFactory.ts#L29)

---

### ClientFactoryError

Error types for ClientFactory operations

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **code** | string | Yes |  |
| readonly **context**? | Record<string, unknown> | No |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:355](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L355)

---

### CredentialExpiredError

Error types for ClientFactory operations

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **code** | string | Yes |  |
| readonly **context**? | Record<string, unknown> | No |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:408](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L408)

---

### CredentialRefreshError

Error types for ClientFactory operations

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **code** | string | Yes |  |
| readonly **context**? | Record<string, unknown> | No |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:398](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L398)

---

### InstanceInUseError

Error types for ClientFactory operations

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **code** | string | Yes |  |
| readonly **context**? | Record<string, unknown> | No |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:388](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L388)

---

### InstanceManager

Manages the lifecycle of SignalWire client instances.
Handles creation, disposal, and tracking of active instances.

**Source:** [packages/client/src/unified/InstanceManager.ts:13](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/InstanceManager.ts#L13)

---

### InstanceNotFoundError

Error types for ClientFactory operations

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **code** | string | Yes |  |
| readonly **context**? | Record<string, unknown> | No |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:372](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L372)

---

### LocalStorageAdapter

Browser-based storage adapter using localStorage and sessionStorage

**Source:** [packages/client/src/unified/storage/LocalStorageAdapter.ts:6](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/storage/LocalStorageAdapter.ts#L6)

---

### LocalVideoOverlay

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **id** | string | Yes |  |

**Source:** [packages/client/src/VideoOverlays.ts:68](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/VideoOverlays.ts#L68)

---

### ProfileExistsError

Error types for ClientFactory operations

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **code** | string | Yes |  |
| readonly **context**? | Record<string, unknown> | No |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:380](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L380)

---

### ProfileManager

Manages authentication profiles for SignalWire client instances.
Handles both persistent (static) and memory-only (dynamic) profiles.

**Source:** [packages/client/src/unified/ProfileManager.ts:22](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/ProfileManager.ts#L22)

---

### ProfileNotFoundError

Error types for ClientFactory operations

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| readonly **code** | string | Yes |  |
| readonly **context**? | Record<string, unknown> | No |  |

**Source:** [packages/client/src/unified/interfaces/clientFactory.ts:366](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/interfaces/clientFactory.ts#L366)

---

### StorageWrapper

A wrapper that adds client-specific prefixing to any storage implementation.
All keys are automatically prefixed with `swcf:${profileId}:` to ensure isolation
between different client instances.

**Source:** [packages/client/src/unified/utils/StorageWrapper.ts:8](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/unified/utils/StorageWrapper.ts#L8)

---

### UserOverlay

| Property | Type | Required | Description |
| --- | --- | --- | --- |
| **id** | string | Yes |  |

**Source:** [packages/client/src/VideoOverlays.ts:14](https://github.com/signalwire/signalwire-js/blob/main/packages/client/src/VideoOverlays.ts#L14)

---

