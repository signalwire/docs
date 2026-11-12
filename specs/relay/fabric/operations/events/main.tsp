import "@signalwire/typespec-asyncapi";
import "@typespec/openapi";

import "../../events/shared.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

@doc("""
  Receive-only. Fires every time a Call Fabric call leg changes state — created,
  ringing, answered, ending, ended. Track a call through its lifecycle with
  `call_state`, and match `tag` to the call you created.
  """)
@channel(fabricCallState)
@summary("Receive Call Fabric call-state changes")
@extension("x-fern-display-name", fabricCallState)
op callState(): CallStateEvent;

@doc("Receive-only. Fires when you join a Call Fabric call, delivering the room session, your identifiers, and your capabilities.")
@channel(fabricCallJoined)
@summary("Receive call-joined events")
@extension("x-fern-display-name", fabricCallJoined)
op callJoined(): CallJoinedEvent;

@doc("Receive-only. Fires when your Call Fabric call leg starts ending, delivering the room session you left. Read `end_reason` on `call.state` for why the call ended.")
@channel(fabricCallLeft)
@summary("Receive call-left events")
@extension("x-fern-display-name", fabricCallLeft)
op callLeft(): CallLeftEvent;

@doc("Receive-only. Fires when a member joins the call or conference, delivering the new member's state.")
@channel(fabricMemberJoined)
@summary("Receive member-joined events")
@extension("x-fern-display-name", fabricMemberJoined)
op memberJoined(): MemberJoinedEvent;

@doc("Receive-only. Fires when a member leaves the call or conference, delivering the member's last-known state.")
@channel(fabricMemberLeft)
@summary("Receive member-left events")
@extension("x-fern-display-name", fabricMemberLeft)
op memberLeft(): MemberLeftEvent;

@doc("Receive-only. Fires when a member's state changes; the member's `updated` field lists which properties changed. Follows member-control methods such as `call.mute`, `call.deaf`, and the volume setters.")
@channel(fabricMemberUpdated)
@summary("Receive member-updated events")
@extension("x-fern-display-name", fabricMemberUpdated)
op memberUpdated(): MemberUpdatedEvent;

@doc("Receive-only. Fires when a member starts or stops talking, delivering the member `id` and a `talking` boolean.")
@channel(fabricMemberTalking)
@summary("Receive member-talking events")
@extension("x-fern-display-name", fabricMemberTalking)
op memberTalking(): MemberTalkingEvent;

@doc("Receive-only. Fires when the room session's state changes — lock, layout, recording, and so on.")
@channel(fabricRoomUpdated)
@summary("Receive room-updated events")
@extension("x-fern-display-name", fabricRoomUpdated)
op roomUpdated(): RoomUpdatedEvent;

@doc("Receive-only. Fires when the video layout changes, for example after `call.layout.set`. Delivers the new layout. Wire event type is `layout.changed`.")
@channel(fabricLayoutChanged)
@summary("Receive layout-changed events")
@extension("x-fern-display-name", fabricLayoutChanged)
op layoutChanged(): LayoutChangedEvent;

@doc("Receive-only. Fires when audio playback on a Call Fabric call starts, pauses, resumes, finishes, or errors. Track a play action through to completion with `state`.")
@channel(fabricCallPlay)
@summary("Receive call.play events")
@extension("x-fern-display-name", fabricCallPlay)
op callPlay(): CallPlayEvent;

@doc("Receive-only. Fires as a connect request progresses, telling you whether your Call Fabric call has been bridged to the peer. Watch `connect_state`.")
@channel(fabricCallConnect)
@summary("Receive call.connect events")
@extension("x-fern-display-name", fabricCallConnect)
op callConnect(): CallConnectEvent;

@doc("Receive-only. Fires when a recording on a Call Fabric call starts, pauses, resumes, or finishes. Every state carries the recording URL; the finished event adds the duration and file size.")
@channel(fabricCallRecord)
@summary("Receive call.record events")
@extension("x-fern-display-name", fabricCallRecord)
op callRecord(): CallRecordEvent;

@doc("Receive-only. Fires as you collect input from a caller on a Call Fabric call — DTMF digits or speech — reporting partial and final results.")
@channel(fabricCallCollect)
@summary("Receive call.collect events")
@extension("x-fern-display-name", fabricCallCollect)
op callCollect(): CallCollectEvent;

@doc("Receive-only. Fires when a tap starts streaming Call Fabric call audio and again when it stops. Check `state` to tell which.")
@channel(fabricCallTap)
@summary("Receive call.tap events")
@extension("x-fern-display-name", fabricCallTap)
op callTap(): CallTapEvent;

@doc("Receive-only. Fires when a media stream on a Call Fabric call starts and again when it stops. Check `state` to tell which.")
@channel(fabricCallStream)
@summary("Receive call.stream events")
@extension("x-fern-display-name", fabricCallStream)
op callStream(): CallStreamEvent;

@doc("Receive-only. Fires when a detector on a Call Fabric call reports a result — a fax tone, an answering machine versus a human, or a DTMF digit.")
@channel(fabricCallDetect)
@summary("Receive call.detect events")
@extension("x-fern-display-name", fabricCallDetect)
op callDetect(): CallDetectEvent;

@doc("Receive-only. Fires when a dial reaches a Call Fabric call leg, reporting whether it was answered or failed.")
@channel(fabricCallDial)
@summary("Receive call.dial events")
@extension("x-fern-display-name", fabricCallDial)
op callDial(): CallDialEvent;

@doc("Receive-only. Fires when sending DTMF digits on a Call Fabric call leg finishes or fails.")
@channel(fabricCallSendDigits)
@summary("Receive call.send_digits events")
@extension("x-fern-display-name", fabricCallSendDigits)
op callSendDigits(): CallSendDigitsEvent;

@doc("Receive-only. Fires each time a SIP REFER transfer of a Call Fabric call leg changes state.")
@channel(fabricCallRefer)
@summary("Receive call.refer events")
@extension("x-fern-display-name", fabricCallRefer)
op callRefer(): CallReferEvent;

@doc("Receive-only. Fires when noise reduction is turned on or off on a Call Fabric call leg.")
@channel(fabricCallDenoise)
@summary("Receive call.denoise events")
@extension("x-fern-display-name", fabricCallDenoise)
op callDenoise(): CallDenoiseEvent;

@doc("Receive-only. Fires when audio echo starts on a Call Fabric call leg and again when it stops.")
@channel(fabricCallEcho)
@summary("Receive call.echo events")
@extension("x-fern-display-name", fabricCallEcho)
op callEcho(): CallEchoEvent;

@doc("Receive-only. Fires when a Call Fabric call leg joins, leaves, or is prevented from joining a room.")
@channel(fabricCallRoom)
@summary("Receive call.room events")
@extension("x-fern-display-name", fabricCallRoom)
op callRoom(): CallRoomEvent;

@doc("Receive-only. Fires when transcription on a Call Fabric call leg starts and again when it finishes.")
@channel(fabricCallTranscribe)
@summary("Receive call.transcribe events")
@extension("x-fern-display-name", fabricCallTranscribe)
op callTranscribe(): CallTranscribeEvent;

@doc("Receive-only. Fires as a Call Fabric call leg moves through a queue, plus periodic position updates.")
@channel(fabricCallQueue)
@summary("Receive call.queue events")
@extension("x-fern-display-name", fabricCallQueue)
op callQueue(): CallQueueEvent;

@doc("Receive-only. Fires as a fax on a Call Fabric call leg progresses: once per page, then once when it finishes.")
@channel(fabricCallFax)
@summary("Receive call.fax events")
@extension("x-fern-display-name", fabricCallFax)
op callFax(): CallFaxEvent;

@doc("Receive-only. Fires as a pay session on a Call Fabric call leg progresses and once more when it completes.")
@channel(fabricCallPay)
@summary("Receive call.pay events")
@extension("x-fern-display-name", fabricCallPay)
op callPay(): CallPayEvent;

@doc("Receive-only. Fires when an AI agent session on a Call Fabric call leg ends.")
@channel(fabricCallAi)
@summary("Receive call.ai events")
@extension("x-fern-display-name", fabricCallAi)
op callAi(): CallAiEvent;

@doc("Receive-only. Fires when a custom user event is emitted on a Call Fabric call leg.")
@channel(fabricUserEvent)
@summary("Receive user_event events")
@extension("x-fern-display-name", fabricUserEvent)
op userEvent(): FabricUserEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when the agent completes a response turn, with the response `text` and whether it was `barged`.")
@channel(fabricAiCompletion)
@summary("Receive ai.completion events")
@extension("x-fern-display-name", fabricAiCompletion)
op aiCompletion(): FabricAiCompletionEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when the agent produces its full response text for a turn.")
@channel(fabricAiResponse)
@summary("Receive ai.response events")
@extension("x-fern-display-name", fabricAiResponse)
op aiResponse(): FabricAiResponseEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when the agent speaks one segment of its response.")
@channel(fabricAiResponseUtterance)
@summary("Receive ai.response_utterance events")
@extension("x-fern-display-name", fabricAiResponseUtterance)
op aiResponseUtterance(): FabricAiResponseUtteranceEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when the caller's final transcript for a turn is recognized.")
@channel(fabricAiSpeechDetect)
@summary("Receive ai.speech_detect events")
@extension("x-fern-display-name", fabricAiSpeechDetect)
op aiSpeechDetect(): FabricAiSpeechDetectEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when an interim transcript of the caller's speech is available.")
@channel(fabricAiPartialResult)
@summary("Receive ai.partial_result events")
@extension("x-fern-display-name", fabricAiPartialResult)
op aiPartialResult(): FabricAiPartialResultEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when speaking starts in the AI session.")
@channel(fabricAiBeginSpeaking)
@summary("Receive ai.begin_speaking events")
@extension("x-fern-display-name", fabricAiBeginSpeaking)
op aiBeginSpeaking(): FabricAiBeginSpeakingEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when the AI session reports a non-fatal warning.")
@channel(fabricAiWarning)
@summary("Receive ai.warning events")
@extension("x-fern-display-name", fabricAiWarning)
op aiWarning(): FabricAiWarningEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when the caller interrupts the agent and the turn is handled as a transparent barge.")
@channel(fabricAiTransparentBarge)
@summary("Receive ai.transparent_barge events")
@extension("x-fern-display-name", fabricAiTransparentBarge)
op aiTransparentBarge(): FabricAiTransparentBargeEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when the AI session stops, with session timing and billing detail.")
@channel(fabricAiStop)
@summary("Receive ai.stop events")
@extension("x-fern-display-name", fabricAiStop)
op aiStop(): FabricAiStopEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when the end-of-call summary is produced.")
@channel(fabricAiPostPrompt)
@summary("Receive ai.post_prompt events")
@extension("x-fern-display-name", fabricAiPostPrompt)
op aiPostPrompt(): FabricAiPostPromptEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when a SWAIG function is called.")
@channel(fabricAiSwaig)
@summary("Receive ai.swaig events")
@extension("x-fern-display-name", fabricAiSwaig)
op aiSwaig(): FabricAiSwaigEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when a SWAIG function returns an action.")
@channel(fabricAiSwaigAction)
@summary("Receive ai.swaig_action events")
@extension("x-fern-display-name", fabricAiSwaigAction)
op aiSwaigAction(): FabricAiSwaigActionEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when the AI sidecar reports activity.")
@channel(fabricAiSidecar)
@summary("Receive ai.sidecar events")
@extension("x-fern-display-name", fabricAiSidecar)
op aiSidecar(): FabricAiSidecarEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when live transcription produces an utterance.")
@channel(fabricAiTranscribeUtterance)
@summary("Receive ai.transcribe.utterance events")
@extension("x-fern-display-name", fabricAiTranscribeUtterance)
op aiTranscribeUtterance(): FabricAiTranscribeUtteranceEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when live transcription produces a running summary.")
@channel(fabricAiTranscribeLiveSummarize)
@summary("Receive ai.transcribe.live_summarize events")
@extension("x-fern-display-name", fabricAiTranscribeLiveSummarize)
op aiTranscribeLiveSummarize(): FabricAiTranscribeLiveSummarizeEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when live transcription delivers its conversation log.")
@channel(fabricAiTranscribeConversationLog)
@summary("Receive ai.transcribe.conversation_log events")
@extension("x-fern-display-name", fabricAiTranscribeConversationLog)
op aiTranscribeConversationLog(): FabricAiTranscribeConversationLogEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when live translation produces translated text.")
@channel(fabricAiTranslateTranscriptDelta)
@summary("Receive ai.translate.transcript_delta events")
@extension("x-fern-display-name", fabricAiTranslateTranscriptDelta)
op aiTranslateTranscriptDelta(): FabricAiTranslateTranscriptDeltaEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when live translation produces a running summary.")
@channel(fabricAiTranslateLiveSummary)
@summary("Receive ai.translate.live_summary events")
@extension("x-fern-display-name", fabricAiTranslateLiveSummary)
op aiTranslateLiveSummary(): FabricAiTranslateLiveSummaryEvent;

@doc("Receive-only. Fires on a Call Fabric call leg when live translation delivers its conversation log.")
@channel(fabricAiTranslateConversationLog)
@summary("Receive ai.translate.conversation_log events")
@extension("x-fern-display-name", fabricAiTranslateConversationLog)
op aiTranslateConversationLog(): FabricAiTranslateConversationLogEvent;

@doc("Receive-only. Fires when a Call Fabric room session starts. Delivers the room session's initial state.")
@channel(fabricRoomStarted)
@summary("Receive room.started events")
@extension("x-fern-display-name", fabricRoomStarted)
op roomStarted(): RoomStartedEvent;

@doc("Receive-only. Fires when you subscribe to a Call Fabric room session, delivering the room's current state and your member/call identifiers.")
@channel(fabricRoomSubscribed)
@summary("Receive room.subscribed events")
@extension("x-fern-display-name", fabricRoomSubscribed)
op roomSubscribed(): RoomSubscribedEvent;

@doc("Receive-only. Fires when a Call Fabric room session ends. Delivers the room session's final state.")
@channel(fabricRoomEnded)
@summary("Receive room.ended events")
@extension("x-fern-display-name", fabricRoomEnded)
op roomEnded(): RoomEndedEvent;

@doc("Receive-only. Fires when you subscribe to a project's room list, delivering a snapshot of every active room session.")
@channel(fabricRoomsSubscribed)
@summary("Receive rooms.subscribed events")
@extension("x-fern-display-name", fabricRoomsSubscribed)
op roomsSubscribed(): RoomsSubscribedEvent;

@doc("Receive-only. Fires on your connection when you are promoted from audience to full member. Delivers your member ID and refreshed authorization; a `signalwire.authorization.state` event follows.")
@channel(fabricMemberPromoted)
@summary("Receive member.promoted events")
@extension("x-fern-display-name", fabricMemberPromoted)
op memberPromoted(): MemberPromotedEvent;

@doc("Receive-only. Fires on your connection when you are demoted from full member to audience. Delivers your member ID and refreshed authorization; a `signalwire.authorization.state` event follows.")
@channel(fabricMemberDemoted)
@summary("Receive member.demoted events")
@extension("x-fern-display-name", fabricMemberDemoted)
op memberDemoted(): MemberDemotedEvent;

@doc("Receive-only. Fires when a recording starts in a Call Fabric room.")
@channel(fabricRecordingStarted)
@summary("Receive recording.started events")
@extension("x-fern-display-name", fabricRecordingStarted)
op recordingStarted(): RecordingStartedEvent;

@doc("Receive-only. Fires when a recording's state changes, for example when it is paused or resumed.")
@channel(fabricRecordingUpdated)
@summary("Receive recording.updated events")
@extension("x-fern-display-name", fabricRecordingUpdated)
op recordingUpdated(): RecordingUpdatedEvent;

@doc("Receive-only. Fires when a recording ends, delivering the recording's final state including its duration.")
@channel(fabricRecordingEnded)
@summary("Receive recording.ended events")
@extension("x-fern-display-name", fabricRecordingEnded)
op recordingEnded(): RecordingEndedEvent;

@doc("Receive-only. Fires when media playback starts in a Call Fabric room.")
@channel(fabricPlaybackStarted)
@summary("Receive playback.started events")
@extension("x-fern-display-name", fabricPlaybackStarted)
op playbackStarted(): PlaybackStartedEvent;

@doc("Receive-only. Fires when a playback's state changes — pause, resume, volume, or seek position.")
@channel(fabricPlaybackUpdated)
@summary("Receive playback.updated events")
@extension("x-fern-display-name", fabricPlaybackUpdated)
op playbackUpdated(): PlaybackUpdatedEvent;

@doc("Receive-only. Fires when a playback ends. Wire event type is `playback.ended`.")
@channel(fabricPlaybackEnded)
@summary("Receive playback.ended events")
@extension("x-fern-display-name", fabricPlaybackEnded)
op playbackEnded(): PlaybackEndedEvent;

@doc("Receive-only. Fires when an RTMP stream starts in a Call Fabric room.")
@channel(fabricStreamStarted)
@summary("Receive stream.started events")
@extension("x-fern-display-name", fabricStreamStarted)
op streamStarted(): StreamStartedEvent;

@doc("Receive-only. Fires when an RTMP stream ends, delivering the stream's final state including its duration.")
@channel(fabricStreamEnded)
@summary("Receive stream.ended events")
@extension("x-fern-display-name", fabricStreamEnded)
op streamEnded(): StreamEndedEvent;

@doc("Receive-only. Fires on a subscriber's Conversation stream when a new message is published to a conversation the subscriber is part of.")
@channel(fabricConversationMessage)
@summary("Receive conversation.message events")
@extension("x-fern-display-name", fabricConversationMessage)
op conversationMessage(): ConversationMessageEvent;

@doc("Receive-only. Fires when a previously published conversation message is edited.")
@channel(fabricConversationMessageUpdated)
@summary("Receive conversation.message.updated events")
@extension("x-fern-display-name", fabricConversationMessageUpdated)
op conversationMessageUpdated(): ConversationMessageUpdatedEvent;

@doc("Receive-only. Fires when a subscriber is added to a conversation, identifying the subscriber, originating address, and conversation group and name.")
@channel(fabricConversationJoined)
@summary("Receive conversation.joined events")
@extension("x-fern-display-name", fabricConversationJoined)
op conversationJoined(): ConversationJoinedEvent;

@doc("Receive-only. Fires when a message is broadcast to every subscriber who shares a conversation with the sending address.")
@channel(fabricConversationBroadcast)
@summary("Receive conversation.broadcast events")
@extension("x-fern-display-name", fabricConversationBroadcast)
op conversationBroadcast(): ConversationBroadcastEvent;
