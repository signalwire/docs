namespace Relay.Calling;

// Single source of truth for Fern nav grouping (`x-fern-sdk-group-name`) across the calling service.
// Each const is the full nav path `["calling", "<section>", "<canonical method>"]`:
//   - middle element: the apis.yml section that auto-populates the channel (via a
//     `referenced-packages: calling.<section>` reference + the section's `skip-slug`). It is a
//     distinct umbrella word, deliberately NOT a real method name — a base channel like
//     `calling.collect` would otherwise collide with a middle group named "collect".
//   - leaf element: the canonical method name being referred to by `@channel`, minus the
//     `calling.` service prefix (dots preserved, never camelCased).
// Renaming a section = edit the middle word here once. (TypeSpec 1.11 has no array-value spread,
// so each path is written in full.)

// Call Setup & Lifecycle  →  calling.setup
const GroupSetupDial = #["calling", "setup", "dial"];
const GroupSetupAnswer = #["calling", "setup", "answer"];
const GroupSetupEnd = #["calling", "setup", "end"];

// Call Control & Bridging  →  calling.control
const GroupControlConnect = #["calling", "control", "connect"];
const GroupControlDisconnect = #["calling", "control", "disconnect"];
const GroupControlTransfer = #["calling", "control", "transfer"];
const GroupControlRefer = #["calling", "control", "refer"];
const GroupControlPass = #["calling", "control", "pass"];

// Playback  →  calling.playback
const GroupPlaybackPlay = #["calling", "playback", "play"];
const GroupPlaybackPause = #["calling", "playback", "play.pause"];
const GroupPlaybackResume = #["calling", "playback", "play.resume"];
const GroupPlaybackStop = #["calling", "playback", "play.stop"];
const GroupPlaybackVolume = #["calling", "playback", "play.volume"];

// Prompt & Collect Input  →  calling.prompt
const GroupPromptCollect = #["calling", "prompt", "collect"];
const GroupPromptCollectStop = #["calling", "prompt", "collect.stop"];
const GroupPromptCollectStartInputTimers = #["calling", "prompt", "collect.start_input_timers"];
const GroupPromptPlayAndCollect = #["calling", "prompt", "play_and_collect"];
const GroupPromptPlayAndCollectStop = #["calling", "prompt", "play_and_collect.stop"];
const GroupPromptPlayAndCollectVolume = #["calling", "prompt", "play_and_collect.volume"];
const GroupPromptSendDigits = #["calling", "prompt", "send_digits"];
const GroupPromptBindDigit = #["calling", "prompt", "bind_digit"];
const GroupPromptClearDigitBindings = #["calling", "prompt", "clear_digit_bindings"];

// Payments  →  calling.payments
const GroupPaymentsPay = #["calling", "payments", "pay"];
const GroupPaymentsPayStop = #["calling", "payments", "pay.stop"];

// Recording  →  calling.recording
const GroupRecordingRecord = #["calling", "recording", "record"];
const GroupRecordingPause = #["calling", "recording", "record.pause"];
const GroupRecordingResume = #["calling", "recording", "record.resume"];
const GroupRecordingStop = #["calling", "recording", "record.stop"];

// Detection  →  calling.detection
const GroupDetectionDetect = #["calling", "detection", "detect"];
const GroupDetectionStop = #["calling", "detection", "detect.stop"];

// Fax  →  calling.fax
const GroupFaxSend = #["calling", "fax", "send_fax"];
const GroupFaxSendStop = #["calling", "fax", "send_fax.stop"];
const GroupFaxReceive = #["calling", "fax", "receive_fax"];
const GroupFaxReceiveStop = #["calling", "fax", "receive_fax.stop"];

// Media Streaming & Tap  →  calling.media
const GroupMediaTap = #["calling", "media", "tap"];
const GroupMediaTapStop = #["calling", "media", "tap.stop"];
const GroupMediaStream = #["calling", "media", "stream"];
const GroupMediaStreamStop = #["calling", "media", "stream.stop"];

// Transcription & Translation  →  calling.transcription
const GroupTranscriptionTranscribe = #["calling", "transcription", "transcribe"];
const GroupTranscriptionStop = #["calling", "transcription", "transcribe.stop"];
const GroupTranscriptionLiveTranscribe = #["calling", "transcription", "live_transcribe"];
const GroupTranscriptionLiveTranslate = #["calling", "transcription", "live_translate"];

// Audio Processing  →  calling.audio
const GroupAudioDenoise = #["calling", "audio", "denoise"];
const GroupAudioDenoiseStop = #["calling", "audio", "denoise.stop"];
const GroupAudioEcho = #["calling", "audio", "echo"];

// Queues  →  calling.queues
const GroupQueuesEnter = #["calling", "queues", "queue.enter"];
const GroupQueuesLeave = #["calling", "queues", "queue.leave"];

// Conferencing & Rooms  →  calling.conferencing
const GroupConferencingJoinConference = #["calling", "conferencing", "join_conference"];
const GroupConferencingLeaveConference = #["calling", "conferencing", "leave_conference"];
const GroupConferencingJoinRoom = #["calling", "conferencing", "join_room"];
const GroupConferencingLeaveRoom = #["calling", "conferencing", "leave_room"];

// AI Agent  →  calling.agent
const GroupAgentAi = #["calling", "agent", "ai"];
const GroupAgentAiStop = #["calling", "agent", "ai.stop"];
const GroupAgentAiMessage = #["calling", "agent", "ai_message"];
const GroupAgentAiHold = #["calling", "agent", "ai_hold"];
const GroupAgentAiUnhold = #["calling", "agent", "ai_unhold"];
const GroupAgentAmazonBedrock = #["calling", "agent", "amazon_bedrock"];

// AI Sidecar  →  calling.sidecar
const GroupSidecarBase = #["calling", "sidecar", "ai_sidecar"];
const GroupSidecarPoke = #["calling", "sidecar", "ai_sidecar.poke"];
const GroupSidecarAsk = #["calling", "sidecar", "ai_sidecar.ask"];
const GroupSidecarStop = #["calling", "sidecar", "ai_sidecar.stop"];
const GroupSidecarStatus = #["calling", "sidecar", "ai_sidecar.status"];

// Custom Events  →  calling.events
const GroupEventsUserEvent = #["calling", "events", "user_event"];
