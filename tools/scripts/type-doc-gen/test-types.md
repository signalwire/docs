# API Types Documentation

Generated from TypeDoc JSON

## Table of Contents

- [Type Aliases](#type-aliases)
- [Enums](#enums)
- [Interfaces](#interfaces)

## Type Aliases

### <a id="address"></a>Address

**Type:** [GetAddressResponse](#getaddressresponse)

### <a id="baseconnectionoptions"></a>BaseConnectionOptions

**Type:** [ConnectionOptions](#connectionoptions) & [BaseComponentOptions](#basecomponentoptions)

### <a id="baseconnectionstate"></a>BaseConnectionState

**Type:** `active` \\\| `answering` \\\| `destroy` \\\| `early` \\\| `hangup` \\\| `held` \\\| `new` \\\| `purge` \\\| `recovering` \\\| `requesting` \\\| `ringing` \\\| `trying`

### <a id="calljoinedeventparams"></a>CallJoinedEventParams

**Type:** Object & Omit

### <a id="callsessioneventparams"></a>CallSessionEventParams

**Type:** [CallJoinedEventParams](#calljoinedeventparams) \\\| [CallUpdatedEventParams](#callupdatedeventparams) \\\| [CallLeftEventParams](#calllefteventparams) \\\| [CallStateEventParams](#callstateeventparams) \\\| [CallPlayEventParams](#callplayeventparams) \\\| [CallConnectEventParams](#callconnecteventparams) \\\| CallRoomEventParams

### <a id="callsessionevents"></a>CallSessionEvents

**Type:** \\{ \\[k in keyof CallSessionEventsHandlerMap\\]: CallSessionEventsHandlerMap\\[k\\] \\}

### <a id="clientevents"></a>ClientEvents

List of all the events the client can listen to.

**Type:** Record

### <a id="conversationchatmessage"></a>ConversationChatMessage

**Type:** Omit & Object

### <a id="conversationchatmessagessubscriberesult"></a>ConversationChatMessagesSubscribeResult

**Type:** [ConversationSubscribeResult](#conversationsubscriberesult)

### <a id="conversationchatsubscribecallback"></a>ConversationChatSubscribeCallback

**Type:** Function

### <a id="conversationevent"></a>ConversationEvent

**Type:** [ConversationMessageEvent](#conversationmessageevent)

### <a id="conversationeventparams"></a>ConversationEventParams

**Type:** [ConversationMessageEventParams](#conversationmessageeventparams)

### <a id="conversationmessageeventname"></a>ConversationMessageEventName

**Type:** `conversation.message`

### <a id="conversationsubscribecallback"></a>ConversationSubscribeCallback

**Type:** Function

### <a id="getaddressesresponse"></a>GetAddressesResponse

**Type:** [PaginatedResponse](#paginatedresponse)

### <a id="getaddressesresult"></a>GetAddressesResult

**Type:** [PaginatedResult](#paginatedresult)

### <a id="getaddressparams"></a>GetAddressParams

**Type:** [GetAddressByIdParams](#getaddressbyidparams) \\\| [GetAddressByNameParams](#getaddressbynameparams)

### <a id="getaddressresult"></a>GetAddressResult

**Type:** [GetAddressResponse](#getaddressresponse)

### <a id="getclientparamsoptions"></a>GetClientParamsOptions

**Type:** Omit

### <a id="getconversationchatmessageresult"></a>GetConversationChatMessageResult

**Type:** [PaginatedResult](#paginatedresult)

### <a id="getconversationmessagesresult"></a>GetConversationMessagesResult

**Type:** [PaginatedResult](#paginatedresult)

### <a id="getconversationsresponse"></a>GetConversationsResponse

**Type:** [PaginatedResponse](#paginatedresponse)

### <a id="getconversationsresult"></a>GetConversationsResult

**Type:** [PaginatedResult](#paginatedresult)

### <a id="getmessagesresult"></a>GetMessagesResult

**Type:** [PaginatedResult](#paginatedresult)

### <a id="getsubscriberinforesult"></a>GetSubscriberInfoResult

**Type:** [GetSubscriberInfoResponse](#getsubscriberinforesponse)

### <a id="handlepushnotificationparams"></a>HandlePushNotificationParams

**Type:** PushNotificationPayload & Object

### <a id="incomingcallhandler"></a>IncomingCallHandler

**Type:** Function

### <a id="incominginvitesource"></a>IncomingInviteSource

**Type:** `websocket` \\\| `pushNotification`

### <a id="internalmemberentity"></a>InternalMemberEntity

MemberEntity entity for internal usage \(converted to snake\_case\)

**Type:** \\{ \\[K in NonNullable\\<keyof [MemberEntity](#memberentity)\\> as CamelToSnakeCase\\<K\\>\\]: [MemberEntity](#memberentity)\\[K\\] \\}

### <a id="internalvideolayout"></a>InternalVideoLayout

**Type:** \\{ \\[K in Exclude\\<keyof [VideoLayout](#videolayout), "layers"\\> as CamelToSnakeCase\\<K\\>\\]: [VideoLayout](#videolayout)\\[K\\] \\} & Object

### <a id="joinconversationresult"></a>JoinConversationResult

**Type:** [JoinConversationResponse](#joinconversationresponse)

### <a id="memberentity"></a>MemberEntity

Member properties

**Type:** OnlyStateProperties

### <a id="membereventparams"></a>MemberEventParams

**Type:** [MemberJoinedEventParams](#memberjoinedeventparams) \\\| [MemberLeftEventParams](#memberlefteventparams) \\\| [MemberUpdatedEventParams](#memberupdatedeventparams) \\\| [MemberTalkingEventParams](#membertalkingeventparams)

### <a id="overlaymap"></a>OverlayMap

**Type:** Map

### <a id="registerdeviceresult"></a>RegisterDeviceResult

**Type:** [RegisterDeviceResponse](#registerdeviceresponse)

### <a id="registerdevicetype"></a>RegisterDeviceType

**Type:** `iOS` \\\| `Android` \\\| `Desktop`

### <a id="resourcetype"></a>ResourceType

**Type:** `app` \\\| `call` \\\| `room` \\\| `subscriber`

### <a id="roomeventnames"></a>RoomEventNames

List of all the events a RoomObject can listen to

**Type:** VideoRoomSessionEventNames \\\| VideoMemberEventNames \\\| VideoLayoutEventNames \\\| VideoRecordingEventNames \\\| VideoPlaybackEventNames \\\| VideoStreamEventNames \\\| [RTCTrackEventName](#rtctrackeventname)

### <a id="roomsessionobjectevents"></a>RoomSessionObjectEvents

**Type:** \\{ \\[k in keyof [RoomSessionObjectEventsHandlerMap](#roomsessionobjecteventshandlermap)\\]: [RoomSessionObjectEventsHandlerMap](#roomsessionobjecteventshandlermap)\\[k\\] \\}

### <a id="roomsessionobjecteventshandlermap"></a>RoomSessionObjectEventsHandlerMap

**Type:** Record & Record & Record & Record & Record & Record & Record & Record & Record & Record & Record & Record & Record & Record & Record & Record & Record & Record & Record

### <a id="rtctrackeventname"></a>RTCTrackEventName

**Type:** `track`

### <a id="sendconversationmessageresponse"></a>SendConversationMessageResponse

**Type:** unknown

### <a id="sendconversationmessageresult"></a>SendConversationMessageResult

**Type:** [SendConversationMessageResponse](#sendconversationmessageresponse)

### <a id="sessionevents"></a>SessionEvents

**Type:** \\`session.$\\{[SessionStatus](#sessionstatus)\\}\\`

### <a id="sessionstatus"></a>SessionStatus

**Type:** `unknown` \\\| `idle` \\\| `reconnecting` \\\| `connected` \\\| `disconnecting` \\\| `disconnected` \\\| `auth\\_error` \\\| `expiring`

### <a id="setaudioflagsparams"></a>SetAudioFlagsParams

**Type:** MemberCommandParams & AtLeastOne

### <a id="signalwireclient"></a>SignalWireClient

**Type:** [SignalWireContract](#signalwirecontract)

### <a id="startscreenshareoptions"></a>StartScreenShareOptions

**Type:** unknown

### <a id="videoposition"></a>VideoPosition

Each video layout has a number of positions which members can be assigned to.
This type enumerates all the available position names. Note that not all
these position names may be available within a given layout.

 \- \`auto\`: the position of the member in the layout is determined automatically.
 \- \`reserved\-n\`: the \_n\_\-th reserved position in the layout \(e.g. \`reserved\-3\`\).
 \- \`standard\-n\`: the \_n\_\-th standard position in the layout \(e.g. \`standard\-3\`\).
 \- \`off\-canvas\`: the member is hidden outside the layout.

**Type:** `auto` \\\| \\`reserved\\-$\\{number\\}\\` \\\| \\`standard\\-$\\{number\\}\\` \\\| `off\\-canvas` \\\| `playback` \\\| `full\\-screen`

### <a id="videopositions"></a>VideoPositions

An object whose keys represent member IDs, and values are chosen from
VideoPosition. Instead of a member ID, in some contexts you can use
the special keyword \`self\` if you don't know yet the ID of the member which
is going to be created.

For example:

\`\`\`js
\{
  "1bf4d4fb\-a3e4\-4d46\-80a8\-3ebfdceb2a60": "reserved\-1",
  "e0c5be44\-d6c7\-438f\-8cda\-f859a1a0b1e7": "auto"
\}
\`\`\`

Or:

\`\`\`js
\{
  "self": "reserved\-1"
\}
\`\`\`

**Type:** Record

## Enums

### <a id="profiletype"></a>ProfileType

Types of authentication profiles

| Member    | Value | Description                                                                                                  |
| --------- | ----- | ------------------------------------------------------------------------------------------------------------ |
| `DYNAMIC` |       | Dynamic profile that exists only in memory. Used for shared resource access or temporary authentication.     |
| `STATIC`  |       | Static profile with credentials that are persisted to storage. Typically used for subscriber authentication. |

## Interfaces

### <a id="addprofilesparams"></a>AddProfilesParams

Parameters for adding profiles

| Property   | Type   | Optional | Readonly | Description |
| ---------- | ------ | -------- | -------- | ----------- |
| `profiles` | Omit[] |          |          |             |

### <a id="basecomponentoptions"></a>BaseComponentOptions

| Property      | Type         | Optional | Readonly | Description |
| ------------- | ------------ | -------- | -------- | ----------- |
| `customSagas` | CustomSaga[] | ✓        |          |             |
| `store`       | Object       |          |          |             |

### <a id="callcapabilitiescontract"></a>CallCapabilitiesContract

| Property      | Type                                                          | Optional | Readonly | Description |
| ------------- | ------------------------------------------------------------- | -------- | -------- | ----------- |
| `device`      | boolean                                                       |          |          |             |
| `end`         | boolean                                                       |          |          |             |
| `lock`        | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) |          |          |             |
| `member`      | [MemberCapabilityContract](#membercapabilitycontract)         |          |          |             |
| `screenshare` | boolean                                                       |          |          |             |
| `self`        | [MemberCapabilityContract](#membercapabilitycontract)         |          |          |             |
| `sendDigit`   | boolean                                                       |          |          |             |
| `setLayout`   | boolean                                                       |          |          |             |
| `vmutedHide`  | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) |          |          |             |

### <a id="callconnecteventparams"></a>CallConnectEventParams

call.connect

| Property          | Type              | Optional | Readonly | Description |
| ----------------- | ----------------- | -------- | -------- | ----------- |
| `call_id`         | string            |          |          |             |
| `connect_state`   | CallConnectStates |          |          |             |
| `node_id`         | string            |          |          |             |
| `peer`            | Object            | ✓        |          |             |
| `room_session_id` | string            |          |          |             |
| `segment_id`      | string            |          |          |             |

### <a id="calllayoutchangedeventparams"></a>CallLayoutChangedEventParams

layout.changed

| Property          | Type                                        | Optional | Readonly | Description |
| ----------------- | ------------------------------------------- | -------- | -------- | ----------- |
| `layout`          | [InternalVideoLayout](#internalvideolayout) |          |          |             |
| `room_id`         | string                                      |          |          |             |
| `room_session_id` | string                                      |          |          |             |

### <a id="calllefteventparams"></a>CallLeftEventParams

call.left

| Property          | Type                      | Optional | Readonly | Description |
| ----------------- | ------------------------- | -------- | -------- | ----------- |
| `call_id`         | string                    |          |          |             |
| `member_id`       | string                    |          |          |             |
| `origin_call_id`  | string                    |          |          |             |
| `reason`          | string                    |          |          |             |
| `room_id`         | string                    |          |          |             |
| `room_session`    | InternalCallSessionEntity |          |          |             |
| `room_session_id` | string                    |          |          |             |

### <a id="callplayeventparams"></a>CallPlayEventParams

call.play

| Property          | Type          | Optional | Readonly | Description |
| ----------------- | ------------- | -------- | -------- | ----------- |
| `call_id`         | string        |          |          |             |
| `control_id`      | string        |          |          |             |
| `node_id`         | string        |          |          |             |
| `room_session_id` | string        |          |          |             |
| `state`           | CallPlayState |          |          |             |

### <a id="callsession"></a>CallSession

| Property                | Type                                                          | Optional | Readonly | Description                                                                                                                         |
| ----------------------- | ------------------------------------------------------------- | -------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `active`                | boolean                                                       |          | ✓        | Whether the connection is currently active                                                                                          |
| `answer`                | unknown                                                       |          |          |                                                                                                                                     |
| `audioMute`             | unknown                                                       |          |          |                                                                                                                                     |
| `audioUnmute`           | unknown                                                       |          |          |                                                                                                                                     |
| `callId`                | string                                                        |          | ✓        | The underlying connection id \\- callId                                                                                             |
| `cameraConstraints`     | `null` \\\| MediaTrackConstraints                             |          | ✓        | The constraints applied to the video device, or null if not available                                                               |
| `cameraId`              | `null` \\\| string                                            |          | ✓        | The id of the video device, or null if not available                                                                                |
| `cameraLabel`           | `null` \\\| string                                            |          | ✓        | The label of the video device, or null if not available                                                                             |
| `currentLayout`         | [InternalVideoLayout](#internalvideolayout)                   |          |          | The layout returned from the \\`layout.changed\\` event based on the current room layout                                            |
| `currentLayoutEvent`    | [CallLayoutChangedEventParams](#calllayoutchangedeventparams) |          |          | The \\`layout.changed\\` event based on the current room layout                                                                     |
| `currentPosition`       | undefined \\\| [VideoPosition](#videoposition)                |          |          | The current position of the member returned from the \\`layout.changed\\` event                                                     |
| `deaf`                  | unknown                                                       |          |          |                                                                                                                                     |
| `destroy`               | unknown                                                       |          |          |                                                                                                                                     |
| `emit`                  | unknown                                                       |          |          |                                                                                                                                     |
| `end`                   | unknown                                                       |          |          |                                                                                                                                     |
| `getLayouts`            | unknown                                                       |          |          |                                                                                                                                     |
| `getMemberOverlay`      | Function                                                      |          |          | Return the member overlay on top of the root element                                                                                |
| `getMembers`            | unknown                                                       |          |          |                                                                                                                                     |
| `hangup`                | unknown                                                       |          |          |                                                                                                                                     |
| `hold`                  | unknown                                                       |          |          |                                                                                                                                     |
| `id`                    | string                                                        |          | ✓        | Unique id for this room session                                                                                                     |
| `leave`                 | unknown                                                       |          |          |                                                                                                                                     |
| `leaveReason`           | undefined \\\| `RECONNECTION\\_ATTEMPT\\_TIMEOUT`             |          | ✓        |                                                                                                                                     |
| `localAudioTrack`       | `null` \\\| MediaStreamTrack                                  |          | ✓        | Provides access to the local audio \\[MediaStreamTrack\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStreamTrack\\). |
| `localStream`           | undefined \\\| MediaStream                                    |          | ✓        | Provides access to the local \\[MediaStream\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStream\\)                  |
| `localVideoOverlay`     | undefined \\\| LocalVideoOverlay                              |          |          | Local video overlay object that the SDK injects in the DOM element inside the MCU                                                   |
| `localVideoTrack`       | `null` \\\| MediaStreamTrack                                  |          | ✓        | Provides access to the local video \\[MediaStreamTrack\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStreamTrack\\). |
| `lock`                  | unknown                                                       |          |          |                                                                                                                                     |
| `memberId`              | string                                                        |          | ✓        | The id of the current member within the room                                                                                        |
| `microphoneConstraints` | `null` \\\| MediaTrackConstraints                             |          | ✓        | The constraints applied to the audio input device, or null if not available                                                         |
| `microphoneId`          | `null` \\\| string                                            |          | ✓        | The id of the audio input device, or null if not available                                                                          |
| `microphoneLabel`       | `null` \\\| string                                            |          | ✓        | The label of the audio input device, or null if not available                                                                       |
| `off`                   | unknown                                                       |          |          |                                                                                                                                     |
| `on`                    | unknown                                                       |          |          |                                                                                                                                     |
| `once`                  | unknown                                                       |          |          |                                                                                                                                     |
| `options`               | Record                                                        |          | ✓        | The BaseConnection options                                                                                                          |
| `overlayMap`            | undefined \\\| [OverlayMap](#overlaymap)                      |          |          | A JS Map containing all the layers on top of the Root Element                                                                       |
| `previewUrl`            | string                                                        | ✓        | ✓        | The preview\\_url for the room. Only with "enable\\_room\\_previews: true" on Room configuration.                                   |
| `remoteStream`          | undefined \\\| MediaStream                                    |          | ✓        | Provides access to the remote \\[MediaStream\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStream\\)                 |
| `removeAllListeners`    | unknown                                                       |          |          |                                                                                                                                     |
| `removeMember`          | unknown                                                       |          |          |                                                                                                                                     |
| `restoreOutboundAudio`  | unknown                                                       |          |          |                                                                                                                                     |
| `restoreOutboundVideo`  | unknown                                                       |          |          |                                                                                                                                     |
| `roomId`                | string                                                        |          | ✓        | The unique identifier for the room                                                                                                  |
| `roomSessionId`         | string                                                        |          | ✓        | The unique identifier for the room session                                                                                          |
| `screenShareList`       | [RoomSessionScreenShare](#roomsessionscreenshare)[]           |          |          | List of screen share objects                                                                                                        |
| `sendDigits`            | unknown                                                       |          |          |                                                                                                                                     |
| `setAudioDirection`     | unknown                                                       |          |          |                                                                                                                                     |
| `setAudioFlags`         | unknown                                                       |          |          |                                                                                                                                     |
| `setInputSensitivity`   | unknown                                                       |          |          |                                                                                                                                     |
| `setInputVolume`        | unknown                                                       |          |          |                                                                                                                                     |
| `setLayout`             | unknown                                                       |          |          |                                                                                                                                     |
| `setLocalStream`        | unknown                                                       |          |          |                                                                                                                                     |
| `setOutputVolume`       | unknown                                                       |          |          |                                                                                                                                     |
| `setPositions`          | unknown                                                       |          |          |                                                                                                                                     |
| `setRaisedHand`         | unknown                                                       |          |          |                                                                                                                                     |
| `setVideoDirection`     | unknown                                                       |          |          |                                                                                                                                     |
| `start`                 | unknown                                                       |          |          |                                                                                                                                     |
| `startScreenShare`      | unknown                                                       |          |          |                                                                                                                                     |
| `stopOutboundAudio`     | unknown                                                       |          |          |                                                                                                                                     |
| `stopOutboundVideo`     | unknown                                                       |          |          |                                                                                                                                     |
| `undeaf`                | unknown                                                       |          |          |                                                                                                                                     |
| `unhold`                | unknown                                                       |          |          |                                                                                                                                     |
| `unlock`                | unknown                                                       |          |          |                                                                                                                                     |
| `updateCamera`          | unknown                                                       |          |          |                                                                                                                                     |
| `updateMedia`           | unknown                                                       |          |          |                                                                                                                                     |
| `updateMicrophone`      | unknown                                                       |          |          |                                                                                                                                     |
| `updateSpeaker`         | unknown                                                       |          |          |                                                                                                                                     |
| `videoMute`             | unknown                                                       |          |          |                                                                                                                                     |
| `videoUnmute`           | unknown                                                       |          |          |                                                                                                                                     |
| `withAudio`             | boolean                                                       |          | ✓        | Indicates if there is any receiving audio                                                                                           |
| `withVideo`             | boolean                                                       |          | ✓        | Indicates if there is any receiving video                                                                                           |

### <a id="callstateeventparams"></a>CallStateEventParams

call.state

| Property          | Type          | Optional | Readonly | Description |
| ----------------- | ------------- | -------- | -------- | ----------- |
| `answer_time`     | number        |          |          |             |
| `call_id`         | string        |          |          |             |
| `call_state`      | CallStates    |          |          |             |
| `device`          | CallDevice    |          |          |             |
| `direction`       | CallDirection |          |          |             |
| `end_time`        | number        |          |          |             |
| `node_id`         | string        |          |          |             |
| `room_session_id` | string        |          |          |             |
| `segment_id`      | string        |          |          |             |
| `start_time`      | number        |          |          |             |

### <a id="callupdatedeventparams"></a>CallUpdatedEventParams

call.updated

| Property          | Type                      | Optional | Readonly | Description |
| ----------------- | ------------------------- | -------- | -------- | ----------- |
| `room_id`         | string                    |          |          |             |
| `room_session`    | InternalCallSessionEntity |          |          |             |
| `room_session_id` | string                    |          |          |             |

### <a id="capabilityonoffstatecontract"></a>CapabilityOnOffStateContract

| Property | Type    | Optional | Readonly | Description |
| -------- | ------- | -------- | -------- | ----------- |
| `off`    | boolean |          |          |             |
| `on`     | boolean |          |          |             |

### <a id="clientfactorycontract"></a>ClientFactoryContract

Contract for the ClientFactory

| Property            | Type    | Optional | Readonly | Description |
| ------------------- | ------- | -------- | -------- | ----------- |
| `addProfiles`       | unknown |          |          |             |
| `disposeClient`     | unknown |          |          |             |
| `getClient`         | unknown |          |          |             |
| `getProfile`        | unknown |          |          |             |
| `init`              | unknown |          |          |             |
| `listActiveClients` | unknown |          |          |             |
| `listProfiles`      | unknown |          |          |             |
| `removeProfiles`    | unknown |          |          |             |

### <a id="connectionoptions"></a>ConnectionOptions

| Property                    | Type                               | Optional | Readonly | Description                                                                                                                                                     |
| --------------------------- | ---------------------------------- | -------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `additionalDevice`          | boolean                            | ✓        |          |                                                                                                                                                                 |
| `attach`                    | boolean                            | ✓        |          |                                                                                                                                                                 |
| `audio`                     | boolean \\\| MediaTrackConstraints | ✓        |          | Audio constraints to use when joining the room. Default: \\`true\\`.                                                                                            |
| `autoApplyMediaParams`      | boolean                            | ✓        |          |                                                                                                                                                                 |
| `callerName`                | string                             | ✓        |          |                                                                                                                                                                 |
| `callerNumber`              | string                             | ✓        |          |                                                                                                                                                                 |
| `camId`                     | string                             | ✓        |          |                                                                                                                                                                 |
| `camLabel`                  | string                             | ✓        |          |                                                                                                                                                                 |
| `connectionPoolSize`        | number                             | ✓        |          | Number of connections to maintain in the connection pool. Set to 0 to disable connection pooling. Default: 3                                                    |
| `destinationNumber`         | string                             | ✓        |          |                                                                                                                                                                 |
| `disableUdpIceServers`      | boolean                            | ✓        |          | Disable ICE UDP transport policy                                                                                                                                |
| `enableConnectionPool`      | boolean                            | ✓        |          | Whether to enable connection pooling for faster call setup. When enabled, maintains pre\\-warmed RTCPeerConnections with gathered ICE candidates. Default: true |
| `fromCallAddressId`         | string                             | ✓        |          |                                                                                                                                                                 |
| `googleMaxBitrate`          | number                             | ✓        |          |                                                                                                                                                                 |
| `googleMinBitrate`          | number                             | ✓        |          |                                                                                                                                                                 |
| `googleStartBitrate`        | number                             | ✓        |          |                                                                                                                                                                 |
| `iceCandidatePoolSize`      | number                             | ✓        |          | Size of the ICE candidate pool for reuse. Allows ICE candidates to be reused when tracks are replaced. Default: 10                                              |
| `iceGatheringTimeout`       | number                             | ✓        |          |                                                                                                                                                                 |
| `iceServers`                | RTCIceServer[]                     | ✓        |          | List of ICE servers.                                                                                                                                            |
| `layout`                    | string                             | ✓        |          |                                                                                                                                                                 |
| `localStream`               | MediaStream                        | ✓        |          |                                                                                                                                                                 |
| `maxConnectionStateTimeout` | number                             | ✓        |          |                                                                                                                                                                 |
| `maxIceGatheringTimeout`    | number                             | ✓        |          |                                                                                                                                                                 |
| `micId`                     | string                             | ✓        |          |                                                                                                                                                                 |
| `micLabel`                  | string                             | ✓        |          |                                                                                                                                                                 |
| `msStreamsNumber`           | number                             | ✓        |          |                                                                                                                                                                 |
| `negotiateAudio`            | boolean                            | ✓        |          |                                                                                                                                                                 |
| `negotiateVideo`            | boolean                            | ✓        |          |                                                                                                                                                                 |
| `nodeId`                    | string                             | ✓        |          |                                                                                                                                                                 |
| `pingSupported`             | boolean                            | ✓        |          |                                                                                                                                                                 |
| `positions`                 | [VideoPositions](#videopositions)  | ✓        |          |                                                                                                                                                                 |
| `prevCallId`                | string                             | ✓        |          |                                                                                                                                                                 |
| `profileId`                 | string                             | ✓        |          |                                                                                                                                                                 |
| `recoverCall`               | boolean                            | ✓        |          |                                                                                                                                                                 |
| `remoteCallerName`          | string                             | ✓        |          |                                                                                                                                                                 |
| `remoteCallerNumber`        | string                             | ✓        |          |                                                                                                                                                                 |
| `remoteSdp`                 | string                             | ✓        |          |                                                                                                                                                                 |
| `remoteStream`              | MediaStream                        | ✓        |          |                                                                                                                                                                 |
| `requestTimeout`            | number                             | ✓        |          |                                                                                                                                                                 |
| `rtcPeerConfig`             | Object                             | ✓        |          |                                                                                                                                                                 |
| `screenShare`               | boolean                            | ✓        |          |                                                                                                                                                                 |
| `sfu`                       | boolean                            | ✓        |          |                                                                                                                                                                 |
| `shakenCheck`               | string                             | ✓        |          |                                                                                                                                                                 |
| `shakenResult`              | string                             | ✓        |          |                                                                                                                                                                 |
| `simulcast`                 | boolean                            | ✓        |          |                                                                                                                                                                 |
| `speakerId`                 | string                             | ✓        |          | Id of the speaker device to use for audio output. If undefined, picks a default speaker.                                                                        |
| `userVariables`             | Object                             | ✓        |          |                                                                                                                                                                 |
| `useStereo`                 | boolean                            | ✓        |          |                                                                                                                                                                 |
| `video`                     | boolean \\\| MediaTrackConstraints | ✓        |          | Video constraints to use when joining the room. Default: \\`true\\`.                                                                                            |
| `watchMediaPackets`         | boolean                            | ✓        |          |                                                                                                                                                                 |
| `watchMediaPacketsTimeout`  | number                             | ✓        |          |                                                                                                                                                                 |

### <a id="conversationapigetmessagesparams"></a>ConversationAPIGetMessagesParams

| Property   | Type   | Optional | Readonly | Description |
| ---------- | ------ | -------- | -------- | ----------- |
| `pageSize` | number | ✓        |          |             |

### <a id="conversationapisendmessageparams"></a>ConversationAPISendMessageParams

Conversation API

| Property        | Type   | Optional | Readonly | Description |
| --------------- | ------ | -------- | -------- | ----------- |
| `fromAddressId` | string |          |          |             |
| `text`          | string |          |          |             |

### <a id="conversationchatmessagessubscribeparams"></a>ConversationChatMessagesSubscribeParams

| Property    | Type                                                                    | Optional | Readonly | Description |
| ----------- | ----------------------------------------------------------------------- | -------- | -------- | ----------- |
| `groupId`   | string                                                                  |          |          |             |
| `onMessage` | [ConversationChatSubscribeCallback](#conversationchatsubscribecallback) |          |          |             |

### <a id="conversationcontract"></a>ConversationContract

| Property        | Type    | Optional | Readonly | Description |
| --------------- | ------- | -------- | -------- | ----------- |
| `createdAt`     | number  |          | ✓        |             |
| `fromAddressId` | string  |          | ✓        |             |
| `getMessages`   | unknown |          |          |             |
| `groupId`       | string  |          | ✓        |             |
| `lastMessageAt` | number  |          | ✓        |             |
| `metadata`      | Record  |          | ✓        |             |
| `name`          | string  |          | ✓        |             |
| `sendMessage`   | unknown |          |          |             |

### <a id="conversationmessage"></a>ConversationMessage

| Property                 | Type   | Optional | Readonly | Description |
| ------------------------ | ------ | -------- | -------- | ----------- |
| `details`                | Record |          |          |             |
| `from_fabric_address_id` | string |          |          |             |
| `group_id`               | string |          |          |             |
| `id`                     | string |          |          |             |
| `kind`                   | string | ✓        |          |             |
| `metadata`               | Record | ✓        |          |             |
| `subtype`                | string |          |          |             |
| `text`                   | string | ✓        |          |             |
| `ts`                     | number |          |          |             |
| `type`                   | string |          |          |             |

### <a id="conversationmessageevent"></a>ConversationMessageEvent

| Property        | Type                                                              | Optional | Readonly | Description |
| --------------- | ----------------------------------------------------------------- | -------- | -------- | ----------- |
| `event_channel` | string                                                            |          |          |             |
| `event_type`    | `conversation.message`                                            |          |          |             |
| `params`        | [ConversationMessageEventParams](#conversationmessageeventparams) |          |          |             |
| `timestamp`     | number                                                            |          |          |             |

### <a id="conversationmessageeventparams"></a>ConversationMessageEventParams

| Property                 | Type                 | Optional | Readonly | Description |
| ------------------------ | -------------------- | -------- | -------- | ----------- |
| `details`                | Record               |          |          |             |
| `from_fabric_address_id` | string               |          |          |             |
| `group_id`               | string               |          |          |             |
| `hidden`                 | boolean              |          |          |             |
| `id`                     | string               |          |          |             |
| `kind`                   | string               | ✓        |          |             |
| `metadata`               | Record               |          |          |             |
| `subtype`                | `chat` \\\| `update` |          |          |             |
| `text`                   | `null` \\\| string   |          |          |             |
| `ts`                     | number               |          |          |             |
| `type`                   | string               |          |          |             |
| `user_name`              | string               |          |          |             |

### <a id="conversationresponse"></a>ConversationResponse

| Property                 | Type   | Optional | Readonly | Description |
| ------------------------ | ------ | -------- | -------- | ----------- |
| `created_at`             | number |          |          |             |
| `from_fabric_address_id` | string |          |          |             |
| `group_id`               | string |          |          |             |
| `last_message_at`        | number |          |          |             |
| `metadata`               | Record |          |          |             |
| `name`                   | string |          |          |             |

### <a id="conversationsubscriberesult"></a>ConversationSubscribeResult

| Property      | Type     | Optional | Readonly | Description |
| ------------- | -------- | -------- | -------- | ----------- |
| `unsubscribe` | Function |          |          |             |

### <a id="coreroomeventparams"></a>CoreRoomEventParams

call.room

| Property          | Type   | Optional | Readonly | Description |
| ----------------- | ------ | -------- | -------- | ----------- |
| `call_id`         | string |          |          |             |
| `joined_status`   | string |          |          |             |
| `node_id`         | string |          |          |             |
| `room_session_id` | string |          |          |             |
| `segment_id`      | string |          |          |             |

### <a id="dialparams"></a>DialParams

| Property                   | Type                               | Optional | Readonly | Description                                                                                                    |
| -------------------------- | ---------------------------------- | -------- | -------- | -------------------------------------------------------------------------------------------------------------- |
| `applyLocalVideoOverlay`   | boolean                            | ✓        |          | Whether to apply the local\\-overlay on top of your video. Default: \\`true\\`.                                |
| `applyMemberOverlay`       | boolean                            | ✓        |          | Whether to apply an overlay on top of each member. Default: \\`true\\`.                                        |
| `audio`                    | boolean \\\| MediaTrackConstraints | ✓        |          | Audio constraints to use when joining the room. Default: \\`true\\`.                                           |
| `disableUdpIceServers`     | boolean                            | ✓        |          | Disable ICE UDP transport policy                                                                               |
| `fromCallAddressId`        | string                             | ✓        |          | Call address ID matching one of the subscriber’s addresses to attribute conversation API events in the INVITE. |
| `listen`                   | Partial                            | ✓        |          | Optional event listeners for the call session                                                                  |
| `mirrorLocalVideoOverlay`  | boolean                            | ✓        |          | Whether to mirror the local video overlay. Default: \\`false\\`.                                               |
| `negotiateAudio`           | boolean                            | ✓        |          | Negotiate the incoming audio from the RTC. Default: \\`true\\`.                                                |
| `negotiateVideo`           | boolean                            | ✓        |          | Negotiate the incoming video from the RTC. Default: \\`true\\` for "video" channel.                            |
| `nodeId`                   | string                             | ✓        |          |                                                                                                                |
| `rootElement`              | `null` \\\| HTMLElement            | ✓        |          | HTML element in which to display the video stream                                                              |
| `stopCameraWhileMuted`     | boolean                            | ✓        |          | Whether to stop the camera when the member is muted. Default: \\`true\\`.                                      |
| `stopMicrophoneWhileMuted` | boolean                            | ✓        |          | Whether to stop the microphone when the member is muted. Default: \\`true\\`.                                  |
| `to`                       | string                             |          |          |                                                                                                                |
| `userVariables`            | Record                             | ✓        |          | User & UserAgent metadata                                                                                      |
| `video`                    | boolean \\\| MediaTrackConstraints | ✓        |          | Video constraints to use when joining the room. Default: \\`true\\` for "video" channel.                       |

### <a id="disposeclientparams"></a>DisposeClientParams

Parameters for disposing a client instance

| Property     | Type   | Optional | Readonly | Description |
| ------------ | ------ | -------- | -------- | ----------- |
| `instanceId` | string |          |          |             |

### <a id="emittercontract"></a>EmitterContract

| Property             | Type    | Optional | Readonly | Description |
| -------------------- | ------- | -------- | -------- | ----------- |
| `emit`               | unknown |          |          |             |
| `off`                | unknown |          |          |             |
| `on`                 | unknown |          |          |             |
| `once`               | unknown |          |          |             |
| `removeAllListeners` | unknown |          |          |             |

### <a id="getaddressbyidparams"></a>GetAddressByIdParams

| Property | Type   | Optional | Readonly | Description |
| -------- | ------ | -------- | -------- | ----------- |
| `id`     | string |          |          |             |

### <a id="getaddressbynameparams"></a>GetAddressByNameParams

| Property | Type   | Optional | Readonly | Description |
| -------- | ------ | -------- | -------- | ----------- |
| `name`   | string |          |          |             |

### <a id="getaddressesparams"></a>GetAddressesParams

| Property      | Type                       | Optional | Readonly | Description |
| ------------- | -------------------------- | -------- | -------- | ----------- |
| `displayName` | string                     | ✓        |          |             |
| `pageSize`    | number                     | ✓        |          |             |
| `sortBy`      | `name` \\\| `created\\_at` | ✓        |          |             |
| `sortOrder`   | `asc` \\\| `desc`          | ✓        |          |             |
| `type`        | string                     | ✓        |          |             |

### <a id="getaddressresponse"></a>GetAddressResponse

| Property       | Type                          | Optional | Readonly | Description |
| -------------- | ----------------------------- | -------- | -------- | ----------- |
| `channels`     | Object                        |          |          |             |
| `cover_url`    | string                        | ✓        |          |             |
| `created_at`   | string                        |          |          |             |
| `display_name` | string                        |          |          |             |
| `id`           | string                        |          |          |             |
| `locked`       | boolean                       |          |          |             |
| `name`         | string                        |          |          |             |
| `preview_url`  | string                        | ✓        |          |             |
| `resource_id`  | string                        |          |          |             |
| `type`         | [ResourceType](#resourcetype) |          |          |             |

### <a id="getclientparams"></a>GetClientParams

Parameters for getting a client instance

| Property    | Type                                              | Optional | Readonly | Description                                                                  |
| ----------- | ------------------------------------------------- | -------- | -------- | ---------------------------------------------------------------------------- |
| `addressId` | string                                            | ✓        |          | Address ID to find a suitable profile for. Used if profileId is not provided |
| `options`   | [GetClientParamsOptions](#getclientparamsoptions) |          |          | Signalwire client options                                                    |
| `profileId` | string                                            | ✓        |          | Profile ID to use for the client. Takes priority over addressId              |

### <a id="getclientresult"></a>GetClientResult

Result from getting a client instance

| Property   | Type                                | Optional | Readonly | Description                              |
| ---------- | ----------------------------------- | -------- | -------- | ---------------------------------------- |
| `instance` | [ManagedInstance](#managedinstance) |          |          |                                          |
| `isNew`    | boolean                             |          |          | Whether this is a newly created instance |

### <a id="getconversationchatmessageparams"></a>GetConversationChatMessageParams

| Property   | Type   | Optional | Readonly | Description |
| ---------- | ------ | -------- | -------- | ----------- |
| `groupId`  | string |          |          |             |
| `pageSize` | number | ✓        |          |             |

### <a id="getconversationmessagesparams"></a>GetConversationMessagesParams

| Property   | Type   | Optional | Readonly | Description |
| ---------- | ------ | -------- | -------- | ----------- |
| `groupId`  | string |          |          |             |
| `pageSize` | number | ✓        |          |             |

### <a id="getconversationmessagesresponse"></a>GetConversationMessagesResponse

| Property | Type                                          | Optional | Readonly | Description |
| -------- | --------------------------------------------- | -------- | -------- | ----------- |
| `data`   | [ConversationMessage](#conversationmessage)[] |          |          |             |
| `links`  | Object                                        |          |          |             |

### <a id="getconversationsparams"></a>GetConversationsParams

| Property   | Type   | Optional | Readonly | Description |
| ---------- | ------ | -------- | -------- | ----------- |
| `pageSize` | number | ✓        |          |             |

### <a id="getmessagesparams"></a>GetMessagesParams

Conversation Messages

| Property   | Type   | Optional | Readonly | Description |
| ---------- | ------ | -------- | -------- | ----------- |
| `pageSize` | number | ✓        |          |             |

### <a id="getsubscriberinforesponse"></a>GetSubscriberInfoResponse

| Property                | Type                                        | Optional | Readonly | Description |
| ----------------------- | ------------------------------------------- | -------- | -------- | ----------- |
| `app_settings`          | Object                                      | ✓        |          |             |
| `company_name`          | string                                      | ✓        |          |             |
| `country`               | string                                      | ✓        |          |             |
| `display_name`          | string                                      | ✓        |          |             |
| `email`                 | string                                      |          |          |             |
| `fabric_addresses`      | [GetAddressResponse](#getaddressresponse)[] |          |          |             |
| `first_name`            | string                                      | ✓        |          |             |
| `id`                    | string                                      |          |          |             |
| `job_title`             | string                                      | ✓        |          |             |
| `last_name`             | string                                      | ✓        |          |             |
| `push_notification_key` | string                                      |          |          |             |
| `region`                | string                                      | ✓        |          |             |
| `time_zone`             | number                                      | ✓        |          |             |

### <a id="handlepushnotificationresult"></a>HandlePushNotificationResult

| Property     | Type          | Optional | Readonly | Description |
| ------------ | ------------- | -------- | -------- | ----------- |
| `resultType` | `inboundCall` |          |          |             |

### <a id="incomingcallhandlers"></a>IncomingCallHandlers

| Property           | Type                                        | Optional | Readonly | Description |
| ------------------ | ------------------------------------------- | -------- | -------- | ----------- |
| `all`              | [IncomingCallHandler](#incomingcallhandler) | ✓        |          |             |
| `pushNotification` | [IncomingCallHandler](#incomingcallhandler) | ✓        |          |             |
| `websocket`        | [IncomingCallHandler](#incomingcallhandler) | ✓        |          |             |

### <a id="incomingcallnotification"></a>IncomingCallNotification

| Property | Type   | Optional | Readonly | Description |
| -------- | ------ | -------- | -------- | ----------- |
| `invite` | Object |          |          |             |

### <a id="incominginvite"></a>IncomingInvite

| Property            | Type   | Optional | Readonly | Description |
| ------------------- | ------ | -------- | -------- | ----------- |
| `callee_id_name`    | string |          |          |             |
| `callee_id_number`  | string |          |          |             |
| `caller_id_name`    | string |          |          |             |
| `caller_id_number`  | string |          |          |             |
| `callID`            | string |          |          |             |
| `display_direction` | string |          |          |             |
| `nodeId`            | string |          |          |             |
| `sdp`               | string |          |          |             |

### <a id="incominginvitewithsource"></a>IncomingInviteWithSource

| Property            | Type                                          | Optional | Readonly | Description |
| ------------------- | --------------------------------------------- | -------- | -------- | ----------- |
| `callee_id_name`    | string                                        |          |          |             |
| `callee_id_number`  | string                                        |          |          |             |
| `caller_id_name`    | string                                        |          |          |             |
| `caller_id_number`  | string                                        |          |          |             |
| `callID`            | string                                        |          |          |             |
| `display_direction` | string                                        |          |          |             |
| `nodeId`            | string                                        |          |          |             |
| `sdp`               | string                                        |          |          |             |
| `source`            | [IncomingInviteSource](#incominginvitesource) |          |          |             |

### <a id="instancemanagercontract"></a>InstanceManagerContract

Contract for the InstanceManager

| Property               | Type    | Optional | Readonly | Description |
| ---------------------- | ------- | -------- | -------- | ----------- |
| `createInstance`       | unknown |          |          |             |
| `disposeInstance`      | unknown |          |          |             |
| `getInstance`          | unknown |          |          |             |
| `getInstanceByProfile` | unknown |          |          |             |
| `listInstances`        | unknown |          |          |             |
| `updateInstanceAccess` | unknown |          |          |             |

### <a id="joinconversationparams"></a>JoinConversationParams

| Property        | Type     | Optional | Readonly | Description |
| --------------- | -------- | -------- | -------- | ----------- |
| `addressIds`    | string[] |          |          |             |
| `fromAddressId` | string   |          |          |             |

### <a id="joinconversationresponse"></a>JoinConversationResponse

| Property                 | Type     | Optional | Readonly | Description |
| ------------------------ | -------- | -------- | -------- | ----------- |
| `addressIds`             | string[] |          |          |             |
| `from_fabric_address_id` | string   |          |          |             |
| `group_id`               | string   |          |          |             |

### <a id="managedinstance"></a>ManagedInstance

Managed client instance information

| Property         | Type                                      | Optional | Readonly | Description                                     |
| ---------------- | ----------------------------------------- | -------- | -------- | ----------------------------------------------- |
| `client`         | [SignalWireContract](#signalwirecontract) |          |          | The actual SignalWire client instance           |
| `createdAt`      | Date                                      |          |          | Timestamp when the instance was created         |
| `id`             | string                                    |          |          | Unique identifier for the instance              |
| `lastAccessedAt` | Date                                      |          |          | Timestamp when the instance was last accessed   |
| `profileId`      | string                                    |          |          | Profile ID used to create this instance         |
| `usageCount`     | number                                    |          |          | Number of times this instance has been accessed |

### <a id="membercapabilitycontract"></a>MemberCapabilityContract

| Property                | Type                                                          | Optional | Readonly | Description |
| ----------------------- | ------------------------------------------------------------- | -------- | -------- | ----------- |
| `audioFlags`            | boolean                                                       |          |          |             |
| `deaf`                  | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) |          |          |             |
| `meta`                  | boolean                                                       |          |          |             |
| `microphoneSensitivity` | boolean                                                       |          |          |             |
| `microphoneVolume`      | boolean                                                       |          |          |             |
| `muteAudio`             | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) |          |          |             |
| `muteVideo`             | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) |          |          |             |
| `position`              | boolean                                                       |          |          |             |
| `raisehand`             | [CapabilityOnOffStateContract](#capabilityonoffstatecontract) |          |          |             |
| `remove`                | boolean                                                       |          |          |             |
| `speakerVolume`         | boolean                                                       |          |          |             |

### <a id="memberjoinedeventparams"></a>MemberJoinedEventParams

member.joined

| Property          | Type                                          | Optional | Readonly | Description |
| ----------------- | --------------------------------------------- | -------- | -------- | ----------- |
| `member`          | [InternalMemberEntity](#internalmemberentity) |          |          |             |
| `room_id`         | string                                        |          |          |             |
| `room_session_id` | string                                        |          |          |             |

### <a id="memberlefteventparams"></a>MemberLeftEventParams

member.left

| Property          | Type                                          | Optional | Readonly | Description |
| ----------------- | --------------------------------------------- | -------- | -------- | ----------- |
| `member`          | [InternalMemberEntity](#internalmemberentity) |          |          |             |
| `reason`          | string                                        |          |          |             |
| `room_id`         | string                                        |          |          |             |
| `room_session_id` | string                                        |          |          |             |

### <a id="membertalkingeventparams"></a>MemberTalkingEventParams

member.talking

| Property          | Type   | Optional | Readonly | Description |
| ----------------- | ------ | -------- | -------- | ----------- |
| `member`          | Object |          |          |             |
| `room_id`         | string |          |          |             |
| `room_session_id` | string |          |          |             |

### <a id="memberupdatedeventparams"></a>MemberUpdatedEventParams

member.updated

| Property          | Type                        | Optional | Readonly | Description |
| ----------------- | --------------------------- | -------- | -------- | ----------- |
| `member`          | InternalMemberEntityUpdated |          |          |             |
| `room_id`         | string                      |          |          |             |
| `room_session_id` | string                      |          |          |             |

### <a id="microphoneanalyzer"></a>MicrophoneAnalyzer

| Property  | Type    | Optional | Readonly | Description |
| --------- | ------- | -------- | -------- | ----------- |
| `destroy` | unknown |          |          |             |

### <a id="onlineparams"></a>OnlineParams

| Property               | Type                                          | Optional | Readonly | Description |
| ---------------------- | --------------------------------------------- | -------- | -------- | ----------- |
| `incomingCallHandlers` | [IncomingCallHandlers](#incomingcallhandlers) |          |          |             |

### <a id="paginatedresponse"></a>PaginatedResponse

| Property | Type   | Optional | Readonly | Description |
| -------- | ------ | -------- | -------- | ----------- |
| `data`   | T[]    |          |          |             |
| `links`  | Object |          |          |             |

### <a id="paginatedresult"></a>PaginatedResult

| Property    | Type    | Optional | Readonly | Description |
| ----------- | ------- | -------- | -------- | ----------- |
| `data`      | T[]     |          |          |             |
| `firstPage` | unknown |          |          |             |
| `hasNext`   | boolean |          |          |             |
| `hasPrev`   | boolean |          |          |             |
| `nextPage`  | unknown |          |          |             |
| `prevPage`  | unknown |          |          |             |
| `self`      | unknown |          |          |             |

### <a id="profile"></a>Profile

Authentication profile for SignalWire client instances

| Property         | Type                                            | Optional | Readonly | Description |
| ---------------- | ----------------------------------------------- | -------- | -------- | ----------- |
| `addressDetails` | Object                                          | ✓        |          |             |
| `addressId`      | string                                          |          |          |             |
| `createdAt`      | number                                          |          |          |             |
| `credentials`    | [SignalWireCredentials](#signalwirecredentials) |          |          |             |
| `credentialsId`  | string                                          |          |          |             |
| `id`             | string                                          |          |          |             |
| `lastUsed`       | number                                          | ✓        |          |             |
| `type`           | [ProfileType](#profiletype)                     |          |          |             |
| `updatedAt`      | number                                          |          |          |             |

### <a id="profilemanagercontract"></a>ProfileManagerContract

Contract for the ProfileManager

| Property                    | Type    | Optional | Readonly | Description |
| --------------------------- | ------- | -------- | -------- | ----------- |
| `addProfile`                | unknown |          |          |             |
| `createDynamicProfile`      | unknown |          |          |             |
| `findProfileForAddress`     | unknown |          |          |             |
| `getProfile`                | unknown |          |          |             |
| `getProfilesByCredentialId` | unknown |          |          |             |
| `hasProfile`                | unknown |          |          |             |
| `init`                      | unknown |          |          |             |
| `listProfiles`              | unknown |          |          |             |
| `removeProfile`             | unknown |          |          |             |
| `updateProfile`             | unknown |          |          |             |

### <a id="reattachparams"></a>ReattachParams

| Property                   | Type                               | Optional | Readonly | Description                                                                                                    |
| -------------------------- | ---------------------------------- | -------- | -------- | -------------------------------------------------------------------------------------------------------------- |
| `applyLocalVideoOverlay`   | boolean                            | ✓        |          | Whether to apply the local\\-overlay on top of your video. Default: \\`true\\`.                                |
| `applyMemberOverlay`       | boolean                            | ✓        |          | Whether to apply an overlay on top of each member. Default: \\`true\\`.                                        |
| `audio`                    | boolean \\\| MediaTrackConstraints | ✓        |          | Audio constraints to use when joining the room. Default: \\`true\\`.                                           |
| `disableUdpIceServers`     | boolean                            | ✓        |          | Disable ICE UDP transport policy                                                                               |
| `fromCallAddressId`        | string                             | ✓        |          | Call address ID matching one of the subscriber’s addresses to attribute conversation API events in the INVITE. |
| `listen`                   | Partial                            | ✓        |          | Optional event listeners for the call session                                                                  |
| `mirrorLocalVideoOverlay`  | boolean                            | ✓        |          | Whether to mirror the local video overlay. Default: \\`false\\`.                                               |
| `negotiateAudio`           | boolean                            | ✓        |          | Negotiate the incoming audio from the RTC. Default: \\`true\\`.                                                |
| `negotiateVideo`           | boolean                            | ✓        |          | Negotiate the incoming video from the RTC. Default: \\`true\\` for "video" channel.                            |
| `nodeId`                   | string                             | ✓        |          |                                                                                                                |
| `rootElement`              | `null` \\\| HTMLElement            | ✓        |          | HTML element in which to display the video stream                                                              |
| `stopCameraWhileMuted`     | boolean                            | ✓        |          | Whether to stop the camera when the member is muted. Default: \\`true\\`.                                      |
| `stopMicrophoneWhileMuted` | boolean                            | ✓        |          | Whether to stop the microphone when the member is muted. Default: \\`true\\`.                                  |
| `to`                       | string                             | ✓        |          |                                                                                                                |
| `userVariables`            | Record                             | ✓        |          | User & UserAgent metadata                                                                                      |
| `video`                    | boolean \\\| MediaTrackConstraints | ✓        |          | Video constraints to use when joining the room. Default: \\`true\\` for "video" channel.                       |

### <a id="registerdeviceparams"></a>RegisterDeviceParams

| Property      | Type                                      | Optional | Readonly | Description |
| ------------- | ----------------------------------------- | -------- | -------- | ----------- |
| `deviceToken` | string                                    |          |          |             |
| `deviceType`  | [RegisterDeviceType](#registerdevicetype) |          |          |             |

### <a id="registerdeviceresponse"></a>RegisterDeviceResponse

| Property                | Type                                      | Optional | Readonly | Description |
| ----------------------- | ----------------------------------------- | -------- | -------- | ----------- |
| `date_registered`       | Date                                      |          |          |             |
| `device_name`           | string                                    | ✓        |          |             |
| `device_token`          | string                                    |          |          |             |
| `device_type`           | [RegisterDeviceType](#registerdevicetype) |          |          |             |
| `id`                    | string                                    |          |          |             |
| `push_notification_key` | string                                    |          |          |             |

### <a id="removeprofilesparams"></a>RemoveProfilesParams

Parameters for removing profiles

| Property     | Type     | Optional | Readonly | Description |
| ------------ | -------- | -------- | -------- | ----------- |
| `profileIds` | string[] |          |          |             |

### <a id="roomsessiondevice"></a>RoomSessionDevice

| Property                | Type                                              | Optional | Readonly | Description                                                                                                                         |
| ----------------------- | ------------------------------------------------- | -------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `active`                | boolean                                           |          | ✓        | Whether the connection is currently active                                                                                          |
| `audioMute`             | unknown                                           |          |          |                                                                                                                                     |
| `audioUnmute`           | unknown                                           |          |          |                                                                                                                                     |
| `callId`                | string                                            |          | ✓        | The underlying connection id \\- callId                                                                                             |
| `cameraConstraints`     | `null` \\\| MediaTrackConstraints                 |          | ✓        | The constraints applied to the video device, or null if not available                                                               |
| `cameraId`              | `null` \\\| string                                |          | ✓        | The id of the video device, or null if not available                                                                                |
| `cameraLabel`           | `null` \\\| string                                |          | ✓        | The label of the video device, or null if not available                                                                             |
| `emit`                  | unknown                                           |          |          |                                                                                                                                     |
| `hold`                  | unknown                                           |          |          |                                                                                                                                     |
| `id`                    | string                                            |          | ✓        | Unique id for this room session                                                                                                     |
| `join`                  | unknown                                           |          |          |                                                                                                                                     |
| `leave`                 | unknown                                           |          |          |                                                                                                                                     |
| `leaveReason`           | undefined \\\| `RECONNECTION\\_ATTEMPT\\_TIMEOUT` |          | ✓        |                                                                                                                                     |
| `localAudioTrack`       | `null` \\\| MediaStreamTrack                      |          | ✓        | Provides access to the local audio \\[MediaStreamTrack\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStreamTrack\\). |
| `localStream`           | undefined \\\| MediaStream                        |          | ✓        | Provides access to the local \\[MediaStream\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStream\\)                  |
| `localVideoTrack`       | `null` \\\| MediaStreamTrack                      |          | ✓        | Provides access to the local video \\[MediaStreamTrack\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStreamTrack\\). |
| `memberId`              | string                                            |          | ✓        | The id of the current member within the room                                                                                        |
| `microphoneConstraints` | `null` \\\| MediaTrackConstraints                 |          | ✓        | The constraints applied to the audio input device, or null if not available                                                         |
| `microphoneId`          | `null` \\\| string                                |          | ✓        | The id of the audio input device, or null if not available                                                                          |
| `microphoneLabel`       | `null` \\\| string                                |          | ✓        | The label of the audio input device, or null if not available                                                                       |
| `off`                   | unknown                                           |          |          |                                                                                                                                     |
| `on`                    | unknown                                           |          |          |                                                                                                                                     |
| `once`                  | unknown                                           |          |          |                                                                                                                                     |
| `options`               | Record                                            |          | ✓        | The BaseConnection options                                                                                                          |
| `previewUrl`            | string                                            | ✓        | ✓        | The preview\\_url for the room. Only with "enable\\_room\\_previews: true" on Room configuration.                                   |
| `remoteStream`          | undefined \\\| MediaStream                        |          | ✓        | Provides access to the remote \\[MediaStream\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStream\\)                 |
| `removeAllListeners`    | unknown                                           |          |          |                                                                                                                                     |
| `restoreOutboundAudio`  | unknown                                           |          |          |                                                                                                                                     |
| `restoreOutboundVideo`  | unknown                                           |          |          |                                                                                                                                     |
| `roomId`                | string                                            |          | ✓        | The unique identifier for the room                                                                                                  |
| `roomSessionId`         | string                                            |          | ✓        | The unique identifier for the room session                                                                                          |
| `runWorker`             | Function                                          |          |          |                                                                                                                                     |
| `sendDigits`            | unknown                                           |          |          |                                                                                                                                     |
| `setAudioDirection`     | unknown                                           |          |          |                                                                                                                                     |
| `setInputSensitivity`   | unknown                                           |          |          |                                                                                                                                     |
| `setInputVolume`        | unknown                                           |          |          |                                                                                                                                     |
| `setLocalStream`        | unknown                                           |          |          |                                                                                                                                     |
| `setMicrophoneVolume`   | unknown                                           |          |          |                                                                                                                                     |
| `setVideoDirection`     | unknown                                           |          |          |                                                                                                                                     |
| `stopOutboundAudio`     | unknown                                           |          |          |                                                                                                                                     |
| `stopOutboundVideo`     | unknown                                           |          |          |                                                                                                                                     |
| `unhold`                | unknown                                           |          |          |                                                                                                                                     |
| `updateCamera`          | unknown                                           |          |          |                                                                                                                                     |
| `updateMedia`           | unknown                                           |          |          |                                                                                                                                     |
| `updateMicrophone`      | unknown                                           |          |          |                                                                                                                                     |
| `videoMute`             | unknown                                           |          |          |                                                                                                                                     |
| `videoUnmute`           | unknown                                           |          |          |                                                                                                                                     |
| `withAudio`             | boolean                                           |          | ✓        | Indicates if there is any receiving audio                                                                                           |
| `withVideo`             | boolean                                           |          | ✓        | Indicates if there is any receiving video                                                                                           |

### <a id="roomsessionscreenshare"></a>RoomSessionScreenShare

| Property                | Type                                              | Optional | Readonly | Description                                                                                                                         |
| ----------------------- | ------------------------------------------------- | -------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `active`                | boolean                                           |          | ✓        | Whether the connection is currently active                                                                                          |
| `audioMute`             | unknown                                           |          |          |                                                                                                                                     |
| `audioUnmute`           | unknown                                           |          |          |                                                                                                                                     |
| `callId`                | string                                            |          | ✓        | The underlying connection id \\- callId                                                                                             |
| `cameraConstraints`     | `null` \\\| MediaTrackConstraints                 |          | ✓        | The constraints applied to the video device, or null if not available                                                               |
| `cameraId`              | `null` \\\| string                                |          | ✓        | The id of the video device, or null if not available                                                                                |
| `cameraLabel`           | `null` \\\| string                                |          | ✓        | The label of the video device, or null if not available                                                                             |
| `emit`                  | unknown                                           |          |          |                                                                                                                                     |
| `hold`                  | unknown                                           |          |          |                                                                                                                                     |
| `id`                    | string                                            |          | ✓        | Unique id for this room session                                                                                                     |
| `join`                  | unknown                                           |          |          |                                                                                                                                     |
| `leave`                 | unknown                                           |          |          |                                                                                                                                     |
| `leaveReason`           | undefined \\\| `RECONNECTION\\_ATTEMPT\\_TIMEOUT` |          | ✓        |                                                                                                                                     |
| `localAudioTrack`       | `null` \\\| MediaStreamTrack                      |          | ✓        | Provides access to the local audio \\[MediaStreamTrack\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStreamTrack\\). |
| `localStream`           | undefined \\\| MediaStream                        |          | ✓        | Provides access to the local \\[MediaStream\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStream\\)                  |
| `localVideoTrack`       | `null` \\\| MediaStreamTrack                      |          | ✓        | Provides access to the local video \\[MediaStreamTrack\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStreamTrack\\). |
| `memberId`              | string                                            |          | ✓        | The id of the current member within the room                                                                                        |
| `microphoneConstraints` | `null` \\\| MediaTrackConstraints                 |          | ✓        | The constraints applied to the audio input device, or null if not available                                                         |
| `microphoneId`          | `null` \\\| string                                |          | ✓        | The id of the audio input device, or null if not available                                                                          |
| `microphoneLabel`       | `null` \\\| string                                |          | ✓        | The label of the audio input device, or null if not available                                                                       |
| `off`                   | unknown                                           |          |          |                                                                                                                                     |
| `on`                    | unknown                                           |          |          |                                                                                                                                     |
| `once`                  | unknown                                           |          |          |                                                                                                                                     |
| `options`               | Record                                            |          | ✓        | The BaseConnection options                                                                                                          |
| `previewUrl`            | string                                            | ✓        | ✓        | The preview\\_url for the room. Only with "enable\\_room\\_previews: true" on Room configuration.                                   |
| `remoteStream`          | undefined \\\| MediaStream                        |          | ✓        | Provides access to the remote \\[MediaStream\\]\\(https://developer.mozilla.org/en\\-US/docs/Web/API/MediaStream\\)                 |
| `removeAllListeners`    | unknown                                           |          |          |                                                                                                                                     |
| `restoreOutboundAudio`  | unknown                                           |          |          |                                                                                                                                     |
| `restoreOutboundVideo`  | unknown                                           |          |          |                                                                                                                                     |
| `roomId`                | string                                            |          | ✓        | The unique identifier for the room                                                                                                  |
| `roomSessionId`         | string                                            |          | ✓        | The unique identifier for the room session                                                                                          |
| `runWorker`             | Function                                          |          |          |                                                                                                                                     |
| `sendDigits`            | unknown                                           |          |          |                                                                                                                                     |
| `setAudioDirection`     | unknown                                           |          |          |                                                                                                                                     |
| `setInputSensitivity`   | unknown                                           |          |          |                                                                                                                                     |
| `setInputVolume`        | unknown                                           |          |          |                                                                                                                                     |
| `setLocalStream`        | unknown                                           |          |          |                                                                                                                                     |
| `setMicrophoneVolume`   | unknown                                           |          |          |                                                                                                                                     |
| `setVideoDirection`     | unknown                                           |          |          |                                                                                                                                     |
| `stopOutboundAudio`     | unknown                                           |          |          |                                                                                                                                     |
| `stopOutboundVideo`     | unknown                                           |          |          |                                                                                                                                     |
| `unhold`                | unknown                                           |          |          |                                                                                                                                     |
| `updateCamera`          | unknown                                           |          |          |                                                                                                                                     |
| `updateMedia`           | unknown                                           |          |          |                                                                                                                                     |
| `updateMicrophone`      | unknown                                           |          |          |                                                                                                                                     |
| `videoMute`             | unknown                                           |          |          |                                                                                                                                     |
| `videoUnmute`           | unknown                                           |          |          |                                                                                                                                     |
| `withAudio`             | boolean                                           |          | ✓        | Indicates if there is any receiving audio                                                                                           |
| `withVideo`             | boolean                                           |          | ✓        | Indicates if there is any receiving video                                                                                           |

### <a id="sendconversationmessageparams"></a>SendConversationMessageParams

| Property        | Type   | Optional | Readonly | Description |
| --------------- | ------ | -------- | -------- | ----------- |
| `details`       | Record | ✓        |          |             |
| `fromAddressId` | string |          |          |             |
| `groupId`       | string |          |          |             |
| `metadata`      | Record | ✓        |          |             |
| `text`          | string |          |          |             |

### <a id="signalwireclientparams"></a>SignalWireClientParams

| Property                          | Type                                                                    | Optional | Readonly | Description                                                                             |
| --------------------------------- | ----------------------------------------------------------------------- | -------- | -------- | --------------------------------------------------------------------------------------- |
| `apiRequestRetriesDelay`          | number                                                                  | ✓        |          | Initial retry delay                                                                     |
| `apiRequestRetriesDelayIncrement` | number                                                                  | ✓        |          | Increment step for each retry delay                                                     |
| `contexts`                        | string[]                                                                | ✓        |          |                                                                                         |
| `debug`                           | Object                                                                  | ✓        |          |                                                                                         |
| `devTools`                        | boolean                                                                 | ✓        |          |                                                                                         |
| `host`                            | string                                                                  | ✓        |          |                                                                                         |
| `incomingCallHandlers`            | [IncomingCallHandlers](#incomingcallhandlers)                           | ✓        |          | Call back function to receive the incoming call                                         |
| `instanceMap`                     | InstanceMap                                                             | ✓        |          |                                                                                         |
| `logger`                          | SDKLogger                                                               | ✓        |          |                                                                                         |
| `logLevel`                        | `debug` \\\| `trace` \\\| `info` \\\| `warn` \\\| `error` \\\| `silent` | ✓        |          | logging level                                                                           |
| `maxApiRequestRetries`            | number                                                                  | ✓        |          | Max API request retry, set to 0 disable retries                                         |
| `onRefreshToken`                  | unknown                                                                 | ✓        |          |                                                                                         |
| `profileId`                       | string                                                                  | ✓        |          | Optional profileId ID for multi\\-instance support. Defaults to 'default'               |
| `project`                         | string                                                                  | ✓        |          | SignalWire project id, e.g. \\`a10d8a9f\\-2166\\-4e82\\-56ff\\-118bc3a4840f\\`          |
| `rootElement`                     | `null` \\\| HTMLElement                                                 | ✓        |          | HTML element in which to display the video stream                                       |
| `sessionChannel`                  | SessionChannel                                                          | ✓        |          |                                                                                         |
| `shouldDisconnect`                | Function                                                                | ✓        |          |                                                                                         |
| `storage`                         | [SignalWireStorageContract](#signalwirestoragecontract)                 | ✓        |          | Optional storage implementation for persisting client data                              |
| `token`                           | string                                                                  |          |          | SignalWire project token, e.g. \\`PT9e5660c101cd140a1c93a0197640a369cf5f16975a0079c9\\` |
| `topics`                          | string[]                                                                | ✓        |          | An alias for contexts \\- Topics has more priority over contexts                        |
| `userVariables`                   | Record                                                                  | ✓        |          | User & UserAgent metadata                                                               |

### <a id="signalwirecontract"></a>SignalWireContract

| Property                 | Type    | Optional | Readonly | Description |
| ------------------------ | ------- | -------- | -------- | ----------- |
| `address`                | Pick    |          |          |             |
| `chat`                   | Object  |          |          |             |
| `conversation`           | Object  |          |          |             |
| `dial`                   | unknown |          |          |             |
| `disconnect`             | unknown |          |          |             |
| `getSubscriberInfo`      | unknown |          |          |             |
| `handlePushNotification` | unknown |          |          |             |
| `offline`                | unknown |          |          |             |
| `online`                 | unknown |          |          |             |
| `reattach`               | unknown |          |          |             |
| `registerDevice`         | unknown |          |          |             |
| `unregisterDevice`       | unknown |          |          |             |
| `updateToken`            | unknown |          |          |             |

### <a id="signalwirecredentials"></a>SignalWireCredentials

Public type for authentication credentials

| Property                 | Type          | Optional | Readonly | Description                                      |
| ------------------------ | ------------- | -------- | -------- | ------------------------------------------------ |
| `host`                   | string        |          |          |                                                  |
| `satRefreshPayload`      | Record        |          |          | Custom payload for refresh request               |
| `satRefreshResultMapper` | RefreshMapper |          |          | String identifier for predefined mapper function |
| `satRefreshURL`          | string        |          |          | URL for refresh token endpoint                   |
| `satToken`               | string        |          |          | The current SAT token                            |
| `tokenExpiry`            | number        |          |          | Token expiry timestamp                           |

### <a id="signalwirestoragecontract"></a>SignalWireStorageContract

Contract for SignalWire storage implementations.
Provides both persistent and session storage capabilities.

| Property            | Type    | Optional | Readonly | Description |
| ------------------- | ------- | -------- | -------- | ----------- |
| `clear`             | unknown |          |          |             |
| `clearSession`      | unknown |          |          |             |
| `delete`            | unknown |          |          |             |
| `deleteMany`        | unknown |          |          |             |
| `deleteManySession` | unknown |          |          |             |
| `deleteSession`     | unknown |          |          |             |
| `get`               | unknown |          |          |             |
| `getMany`           | unknown |          |          |             |
| `getManySession`    | unknown |          |          |             |
| `getSession`        | unknown |          |          |             |
| `getStorageInfo`    | unknown |          |          |             |
| `has`               | unknown |          |          |             |
| `hasSession`        | unknown |          |          |             |
| `list`              | unknown |          |          |             |
| `listSession`       | unknown |          |          |             |
| `set`               | unknown |          |          |             |
| `setMany`           | unknown |          |          |             |
| `setManySession`    | unknown |          |          |             |
| `setSession`        | unknown |          |          |             |

### <a id="storageinfo"></a>StorageInfo

Storage information about the underlying storage implementation

| Property       | Type                                                             | Optional | Readonly | Description |
| -------------- | ---------------------------------------------------------------- | -------- | -------- | ----------- |
| `isAvailable`  | boolean                                                          |          |          |             |
| `isPersistent` | boolean                                                          |          |          |             |
| `quotaTotal`   | number                                                           | ✓        |          |             |
| `quotaUsed`    | number                                                           | ✓        |          |             |
| `type`         | `localStorage` \\\| `sessionStorage` \\\| `memory` \\\| `custom` |          |          |             |

### <a id="unregisterdeviceparams"></a>UnregisterDeviceParams

| Property | Type   | Optional | Readonly | Description |
| -------- | ------ | -------- | -------- | ----------- |
| `id`     | string |          |          |             |

### <a id="useroptions"></a>UserOptions

| Property         | Type                                                                    | Optional | Readonly | Description                                                                             |
| ---------------- | ----------------------------------------------------------------------- | -------- | -------- | --------------------------------------------------------------------------------------- |
| `contexts`       | string[]                                                                | ✓        |          |                                                                                         |
| `debug`          | Object                                                                  | ✓        |          |                                                                                         |
| `devTools`       | boolean                                                                 | ✓        |          |                                                                                         |
| `host`           | string                                                                  | ✓        |          |                                                                                         |
| `instanceMap`    | InstanceMap                                                             | ✓        |          |                                                                                         |
| `logger`         | SDKLogger                                                               | ✓        |          |                                                                                         |
| `logLevel`       | `debug` \\\| `trace` \\\| `info` \\\| `warn` \\\| `error` \\\| `silent` | ✓        |          | logging level                                                                           |
| `onRefreshToken` | unknown                                                                 | ✓        |          |                                                                                         |
| `profileId`      | string                                                                  | ✓        |          |                                                                                         |
| `project`        | string                                                                  | ✓        |          | SignalWire project id, e.g. \\`a10d8a9f\\-2166\\-4e82\\-56ff\\-118bc3a4840f\\`          |
| `sessionChannel` | SessionChannel                                                          | ✓        |          |                                                                                         |
| `token`          | string                                                                  |          |          | SignalWire project token, e.g. \\`PT9e5660c101cd140a1c93a0197640a369cf5f16975a0079c9\\` |
| `topics`         | string[]                                                                | ✓        |          | An alias for contexts \\- Topics has more priority over contexts                        |

### <a id="videolayout"></a>VideoLayout

Base Interface for a VideoLayout entity

| Property        | Type               | Optional | Readonly | Description |
| --------------- | ------------------ | -------- | -------- | ----------- |
| `id`            | string             |          |          |             |
| `layers`        | VideoLayoutLayer[] |          |          |             |
| `name`          | string             |          |          |             |
| `roomId`        | string             |          |          |             |
| `roomSessionId` | string             |          |          |             |

