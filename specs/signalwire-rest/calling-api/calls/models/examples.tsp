namespace SignalWireAPI.Calling;

/**
 * Operation examples for the Calling API
 *
 * These examples can be imported and used with @opExample decorator on operations
 */
const callId = "3fa85f64-5717-4562-b3fc-2c963f66afa6";

// Call command examples
const dialCallExample = #{
  request: #{
    command: "dial",
    params: #{
      from: "+15551234567",
      to: "+15559876543",
      url: "https://example.com/swml",
      caller_id: "+15551234567",
      status_url: "https://example.com/status_callback",
      status_events: #["answered", "ended"],
      codecs: #["PCMU", "PCMA"],
      timeout: 30,
      max_price_per_minute: 0.05,
    },
  },
};

const updateCallExample = #{
  request: #{
    command: "update",
    params: #{
      id: callId,
      url: "https://example.com/swml",
      fallback_url: "https://example.com/fallback",
    },
  },
};

const hangupCallExample = #{
  request: #{
    command: "calling.end",
    id: callId,
    params: #{ reason: HangupReason.hangup },
  },
};

const holdCallExample = #{
  request: #{
    command: "calling.ai_hold",
    id: callId,
    params: #{ timeout: "300" },
  },
};

const unholdCallExample = #{
  request: #{
    command: "calling.ai_unhold",
    id: callId,
    params: #{},
  },
};

const aiMessageExample = #{
  request: #{
    command: "calling.ai_message",
    id: callId,
    params: #{
      role: "system",
      message_text: "You are now in expert mode. Provide detailed technical responses and use industry terminology.",
    },
  },
};

// Live Transcribe examples
const liveTranscribeStartExample = #{
  request: #{
    command: "calling.live_transcribe",
    id: callId,
    params: #{
      action: #{
        start: #{
          lang: "en-US",
          direction: #[
            TranscribeDirection.`local-caller`,
            TranscribeDirection.`remote-caller`
          ],
          webhook: "https://example.com/transcription-events",
          live_events: true,
          ai_summary: true,
          ai_summary_prompt: "Summarize the key points of this conversation.",
          speech_engine: SpeechEngine.deepgram,
        },
      },
    },
  },
};

const liveTranscribeStopExample = #{
  request: #{
    command: "calling.live_transcribe",
    id: callId,
    params: #{ action: LiveTranscribeStopAction.stop },
  },
};

const liveTranscribeSummarizeExample = #{
  request: #{
    command: "calling.live_transcribe",
    id: callId,
    params: #{
      action: #{
        summarize: #{
          webhook: "https://example.com/summary",
          prompt: "Provide a bullet-point summary of the main topics discussed.",
        },
      },
    },
  },
};

// Live Translate examples
const liveTranslateStartExample = #{
  request: #{
    command: "calling.live_translate",
    id: callId,
    params: #{
      action: #{
        start: #{
          from_lang: "en-US",
          to_lang: "es-ES",
          direction: #[
            TranscribeDirection.`local-caller`,
            TranscribeDirection.`remote-caller`
          ],
          from_voice: "elevenlabs.josh",
          to_voice: "elevenlabs.josh",
          filter_from: "professional",
          webhook: "https://example.com/translation-events",
          live_events: true,
          ai_summary: true,
          speech_engine: SpeechEngine.deepgram,
        },
      },
    },
  },
};

const liveTranslateStopExample = #{
  request: #{
    command: "calling.live_translate",
    id: callId,
    params: #{ action: "stop" },
  },
};

const liveTranslateSummarizeExample = #{
  request: #{
    command: "calling.live_translate",
    id: callId,
    params: #{
      action: #{
        summarize: #{
          webhook: "https://example.com/summary",
          prompt: "Summarize the key agreements reached in both languages.",
        },
      },
    },
  },
};

const liveTranslateInjectExample = #{
  request: #{
    command: "calling.live_translate",
    id: callId,
    params: #{
      action: #{
        inject: #{
          message: "Please hold while I transfer you to a specialist.",
          direction: "remote-caller",
        },
      },
    },
  },
};

// Disconnect example
const disconnectCallExample = #{
  request: #{
    command: "calling.disconnect",
    id: callId,
    params: #{},
  },
};

// Play examples
const playCallExample = #{
  request: #{
    command: "calling.play",
    id: callId,
    params: #{
      control_id: "play-control-1",
      play: #[
        #{
          type: PlayMediaType.audio,
          params: #{ url: "https://example.com/audio.mp3" },
        }
      ],
      volume: 0,
      direction: PlayDirection.listen,
      loop: 1,
    },
  },
};

const playPauseCallExample = #{
  request: #{
    command: "calling.play.pause",
    id: callId,
    params: #{ control_id: "play-control-1" },
  },
};

const playResumeCallExample = #{
  request: #{
    command: "calling.play.resume",
    id: callId,
    params: #{ control_id: "play-control-1" },
  },
};

const playStopCallExample = #{
  request: #{
    command: "calling.play.stop",
    id: callId,
    params: #{ control_id: "play-control-1" },
  },
};

const playVolumeCallExample = #{
  request: #{
    command: "calling.play.volume",
    id: callId,
    params: #{ control_id: "play-control-1", volume: 5 },
  },
};

// Record examples
const recordCallExample = #{
  request: #{
    command: "calling.record",
    id: callId,
    params: #{
      control_id: "record-control-1",
      record: #{
        audio: #{ format: "mp3", direction: PlayDirection.speak, stereo: false },
      },
    },
  },
};

const recordPauseCallExample = #{
  request: #{
    command: "calling.record.pause",
    id: callId,
    params: #{ control_id: "record-control-1" },
  },
};

const recordResumeCallExample = #{
  request: #{
    command: "calling.record.resume",
    id: callId,
    params: #{ control_id: "record-control-1" },
  },
};

const recordStopCallExample = #{
  request: #{
    command: "calling.record.stop",
    id: callId,
    params: #{ control_id: "record-control-1" },
  },
};

// Collect examples
const collectCallExample = #{
  request: #{
    command: "calling.collect",
    id: callId,
    params: #{
      control_id: "collect-control-1",
      initial_timeout: 5,
      digits: #{ max: 4, terminators: "#" },
      continuous: false,
      partial_results: false,
      send_start_of_input: false,
      start_input_timers: false,
      status_url: "https://example.com/collect_callback",
    },
  },
};

const collectStopCallExample = #{
  request: #{
    command: "calling.collect.stop",
    id: callId,
    params: #{ control_id: "collect-control-1" },
  },
};

const collectStartInputTimersCallExample = #{
  request: #{
    command: "calling.collect.start_input_timers",
    id: callId,
    params: #{ control_id: "collect-control-1" },
  },
};

// Detect examples
const detectCallExample = #{
  request: #{
    command: "calling.detect",
    id: callId,
    params: #{
      control_id: "detect-control-1",
      detect: #{
        type: DetectType.machine,
        params: #{ initial_timeout: 4.5, end_silence_timeout: 1.0 },
      },
      timeout: 30,
    },
  },
};

const detectStopCallExample = #{
  request: #{
    command: "calling.detect.stop",
    id: callId,
    params: #{ control_id: "detect-control-1" },
  },
};

// Tap examples
const tapCallExample = #{
  request: #{
    command: "calling.tap",
    id: callId,
    params: #{
      control_id: "tap-control-1",
      tap: #{ type: "audio", params: #{ direction: PlayDirection.both } },
      device: #{
        type: TapDeviceType.rtp,
        params: #{ addr: "198.51.100.42", port: 5060 },
      },
    },
  },
};

const tapStopCallExample = #{
  request: #{
    command: "calling.tap.stop",
    id: callId,
    params: #{ control_id: "tap-control-1" },
  },
};

// Stream examples
const streamCallExample = #{
  request: #{
    command: "calling.stream",
    id: callId,
    params: #{
      control_id: "stream-control-1",
      url: "wss://example.com/stream",
      track: StreamTrack.inbound_track,
    },
  },
};

const streamStopCallExample = #{
  request: #{
    command: "calling.stream.stop",
    id: callId,
    params: #{ control_id: "stream-control-1" },
  },
};

// Denoise examples
const denoiseCallExample = #{
  request: #{
    command: "calling.denoise",
    id: callId,
    params: #{},
  },
};

const denoiseStopCallExample = #{
  request: #{
    command: "calling.denoise.stop",
    id: callId,
    params: #{},
  },
};

// AI Stop example
const aiStopCallExample = #{
  request: #{
    command: "calling.ai.stop",
    id: callId,
    params: #{ control_id: "ai-control-1" },
  },
};

// Fax Stop examples
const sendFaxStopCallExample = #{
  request: #{
    command: "calling.send_fax.stop",
    id: callId,
    params: #{ control_id: "fax-send-control-1" },
  },
};

const receiveFaxStopCallExample = #{
  request: #{
    command: "calling.receive_fax.stop",
    id: callId,
    params: #{ control_id: "fax-receive-control-1" },
  },
};

// Refer example
const referCallExample = #{
  request: #{
    command: "calling.refer",
    id: callId,
    params: #{
      device: #{ type: "sip", params: #{ to: "sip:destination@example.com" } },
    },
  },
};

// Transfer example
const transferCallExample = #{
  request: #{
    command: "calling.transfer",
    id: callId,
    params: #{ dest: "sip:destination@example.com" },
  },
};

// User Event example
const userEventCallExample = #{
  request: #{
    command: "calling.user_event",
    id: callId,
    params: #{
      event: #{ action: "custom_action", data: "example" },
    },
  },
};
