namespace Relay.Calling;

// Single source of truth for Fern nav grouping (`x-fern-sdk-group-name`) across the calling service.
// Each const is the nav path `["calling", "<section>"]`:
//   - first element: the `calling` service package.
//   - second element: the apis.yml section that auto-populates the channel (via a
//     `referenced-packages: calling.<section>` reference + the section's `skip-slug`). It is a
//     distinct umbrella word, deliberately NOT a real method name — a base channel like
//     `calling.collect` would otherwise collide with a group named "collect".
// Channels sit directly in `calling.<section>` (no per-channel subpackage), so they render flat
// inside the one manually-set section instead of each getting its own nested folder.
// Renaming a section = edit the second word here once. (TypeSpec 1.11 has no array-value spread,
// so each path is written in full.)

// Call Setup & Lifecycle  →  calling.setup
const GroupSetupDial = #["calling", "setup"];
const GroupSetupAnswer = #["calling", "setup"];
const GroupSetupEnd = #["calling", "setup"];

// Call Control & Bridging  →  calling.control
const GroupControlConnect = #["calling", "control"];
const GroupControlDisconnect = #["calling", "control"];
const GroupControlTransfer = #["calling", "control"];
const GroupControlRefer = #["calling", "control"];
const GroupControlPass = #["calling", "control"];

// Playback  →  calling.playback
const GroupPlaybackPlay = #["calling", "playback"];
const GroupPlaybackPause = #["calling", "playback"];
const GroupPlaybackResume = #["calling", "playback"];
const GroupPlaybackStop = #["calling", "playback"];
const GroupPlaybackVolume = #["calling", "playback"];

// Prompt & Collect Input  →  calling.prompt
const GroupPromptCollect = #["calling", "prompt"];
const GroupPromptCollectStop = #["calling", "prompt"];
const GroupPromptCollectStartInputTimers = #["calling", "prompt"];
const GroupPromptPlayAndCollect = #["calling", "prompt"];
const GroupPromptPlayAndCollectStop = #["calling", "prompt"];
const GroupPromptPlayAndCollectVolume = #["calling", "prompt"];
const GroupPromptSendDigits = #["calling", "prompt"];
const GroupPromptBindDigit = #["calling", "prompt"];
const GroupPromptClearDigitBindings = #["calling", "prompt"];

// Payments  →  calling.payments
const GroupPaymentsPay = #["calling", "payments"];
const GroupPaymentsPayStop = #["calling", "payments"];

// Recording  →  calling.recording
const GroupRecordingRecord = #["calling", "recording"];
const GroupRecordingPause = #["calling", "recording"];
const GroupRecordingResume = #["calling", "recording"];
const GroupRecordingStop = #["calling", "recording"];

// Detection  →  calling.detection
const GroupDetectionDetect = #["calling", "detection"];
const GroupDetectionStop = #["calling", "detection"];

// Fax  →  calling.fax
const GroupFaxSend = #["calling", "fax"];
const GroupFaxSendStop = #["calling", "fax"];
const GroupFaxReceive = #["calling", "fax"];
const GroupFaxReceiveStop = #["calling", "fax"];

// Media Streaming & Tap  →  calling.media
const GroupMediaTap = #["calling", "media"];
const GroupMediaTapStop = #["calling", "media"];
const GroupMediaStream = #["calling", "media"];
const GroupMediaStreamStop = #["calling", "media"];

// Transcription & Translation  →  calling.transcription
const GroupTranscriptionTranscribe = #["calling", "transcription"];
const GroupTranscriptionStop = #["calling", "transcription"];
const GroupTranscriptionLiveTranscribe = #["calling", "transcription"];
const GroupTranscriptionLiveTranslate = #["calling", "transcription"];

// Audio Processing  →  calling.audio
const GroupAudioDenoise = #["calling", "audio"];
const GroupAudioDenoiseStop = #["calling", "audio"];
const GroupAudioEcho = #["calling", "audio"];

// Queues  →  calling.queues
const GroupQueuesEnter = #["calling", "queues"];
const GroupQueuesLeave = #["calling", "queues"];

// Conferencing & Rooms  →  calling.conferencing
const GroupConferencingJoinConference = #["calling", "conferencing"];
const GroupConferencingLeaveConference = #["calling", "conferencing"];
const GroupConferencingJoinRoom = #["calling", "conferencing"];
const GroupConferencingLeaveRoom = #["calling", "conferencing"];

// AI Agent  →  calling.agent
const GroupAgentAi = #["calling", "agent"];
const GroupAgentAiStop = #["calling", "agent"];
const GroupAgentAiMessage = #["calling", "agent"];
const GroupAgentAiHold = #["calling", "agent"];
const GroupAgentAiUnhold = #["calling", "agent"];
const GroupAgentAmazonBedrock = #["calling", "agent"];

// AI Sidecar  →  calling.sidecar
const GroupSidecarBase = #["calling", "sidecar"];
const GroupSidecarPoke = #["calling", "sidecar"];
const GroupSidecarAsk = #["calling", "sidecar"];
const GroupSidecarStop = #["calling", "sidecar"];
const GroupSidecarStatus = #["calling", "sidecar"];

// Custom Events  →  calling.events
const GroupEventsUserEvent = #["calling", "events"];
