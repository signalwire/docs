import "@typespec/http";
import "@typespec/openapi";
import "../../types";
import "../../../_shared/alias/token-permissions.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/examples.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/calls")
namespace CallingAPI.Calls {
  @tag(CALLS_TAG)
  @friendlyName("Calls")
  interface Calls {
    @summary("Send Call Commands")
    @doc("""
      Unified JSON-RPC style endpoint for executing call methods through command-based dispatch.
      Send a request with the appropriate `command` field to invoke the desired call operation.
      All async-safe RELAY methods can be sent through this endpoint without a WebSocket connection.

      ## Supported Commands

      Use one of the following commands in the `command` field of the request body to perform the corresponding action on an active call. 
      For more details on each command, refer to the individual API reference documentation linked below.

      | Command | Description |
      |---------|-------------|
      | `dial` | Create and initiate a new outbound call |
      | `update` | Modify an active call's dialplan in real-time |
      | `calling.end` | Terminate an active call immediately |
      | `calling.transfer` | Transfer a call to a new destination (SIP URI, phone number, or inline SWML) |
      | `calling.disconnect` | Disconnect bridged calls without hanging up either leg |
      | `calling.play` | Play audio, TTS, silence, or ringtone to a call |
      | `calling.play.pause` | Pause active playback |
      | `calling.play.resume` | Resume paused playback |
      | `calling.play.stop` | Stop active playback |
      | `calling.play.volume` | Adjust playback volume |
      | `calling.record` | Start recording a call |
      | `calling.record.pause` | Pause active recording |
      | `calling.record.resume` | Resume paused recording |
      | `calling.record.stop` | Stop active recording |
      | `calling.collect` | Collect DTMF or speech input |
      | `calling.collect.stop` | Stop active collection |
      | `calling.collect.start_input_timers` | Start input timers on active collect |
      | `calling.detect` | Start a detector (answering machine, fax, or digit) |
      | `calling.detect.stop` | Stop active detector |
      | `calling.tap` | Tap call audio to an RTP or WebSocket endpoint |
      | `calling.tap.stop` | Stop active tap |
      | `calling.stream` | Stream call audio to a WebSocket endpoint |
      | `calling.stream.stop` | Stop active stream |
      | `calling.denoise` | Start noise reduction on a call |
      | `calling.denoise.stop` | Stop noise reduction |
      | `calling.transcribe` | Start call transcription |
      | `calling.transcribe.stop` | Stop active transcription |
      | `calling.ai_hold` | Place an AI call on hold |
      | `calling.ai_unhold` | Resume an AI call from hold |
      | `calling.ai_message` | Inject a message into an active AI conversation |
      | `calling.ai.stop` | Stop an active AI session |
      | `calling.live_transcribe` | Start, stop, or summarize real-time transcription |
      | `calling.live_translate` | Start, stop, summarize, or inject real-time translation |
      | `calling.send_fax.stop` | Stop active fax send |
      | `calling.receive_fax.stop` | Stop active fax receive |
      | `calling.refer` | Transfer a SIP call via SIP REFER |
      | `calling.user_event` | Fire a custom user event on the call |

      ${tokenPermissions<"_Voice_">}
      """)
    @opExample(
      #{ parameters: userEventCallExample },
      #{
        title: "calling.user_event",
        description: "Fire a custom user event on an active call",
      }
    )
    @opExample(
      #{ parameters: referCallExample },
      #{
        title: "calling.refer",
        description: "Perform a SIP REFER on an active call",
      }
    )
    @opExample(
      #{ parameters: receiveFaxStopCallExample },
      #{
        title: "calling.receive_fax.stop",
        description: "Stop an active fax receive operation",
      }
    )
    @opExample(
      #{ parameters: sendFaxStopCallExample },
      #{
        title: "calling.send_fax.stop",
        description: "Stop an active fax send operation",
      }
    )
    @opExample(
      #{ parameters: aiStopCallExample },
      #{
        title: "calling.ai.stop",
        description: "Stop an active AI session on the call",
      }
    )
    @opExample(
      #{ parameters: transcribeStopCallExample },
      #{
        title: "calling.transcribe.stop",
        description: "Stop an active transcription",
      }
    )
    @opExample(
      #{ parameters: transcribeCallExample },
      #{
        title: "calling.transcribe",
        description: "Start transcription on an active call",
      }
    )
    @opExample(
      #{ parameters: denoiseStopCallExample },
      #{
        title: "calling.denoise.stop",
        description: "Disable noise reduction on an active call",
      }
    )
    @opExample(
      #{ parameters: denoiseCallExample },
      #{
        title: "calling.denoise",
        description: "Enable noise reduction on an active call",
      }
    )
    @opExample(
      #{ parameters: streamStopCallExample },
      #{
        title: "calling.stream.stop",
        description: "Stop an active audio stream",
      }
    )
    @opExample(
      #{ parameters: streamCallExample },
      #{
        title: "calling.stream",
        description: "Start streaming call audio to a WebSocket endpoint",
      }
    )
    @opExample(
      #{ parameters: tapStopCallExample },
      #{
        title: "calling.tap.stop",
        description: "Stop an active tap operation",
      }
    )
    @opExample(
      #{ parameters: tapCallExample },
      #{
        title: "calling.tap",
        description: "Start tapping (capturing audio) on an active call",
      }
    )
    @opExample(
      #{ parameters: detectStopCallExample },
      #{
        title: "calling.detect.stop",
        description: "Stop an active detection operation",
      }
    )
    @opExample(
      #{ parameters: detectCallExample },
      #{
        title: "calling.detect",
        description: "Start detection (machine, fax, or digit) on an active call",
      }
    )
    @opExample(
      #{ parameters: collectStartInputTimersCallExample },
      #{
        title: "calling.collect.start_input_timers",
        description: "Start input timers for an active collect operation",
      }
    )
    @opExample(
      #{ parameters: collectStopCallExample },
      #{
        title: "calling.collect.stop",
        description: "Stop an active collect operation",
      }
    )
    @opExample(
      #{ parameters: collectCallExample },
      #{
        title: "calling.collect",
        description: "Collect user input (digits or speech) during a call",
      }
    )
    @opExample(
      #{ parameters: recordStopCallExample },
      #{
        title: "calling.record.stop",
        description: "Stop an active recording",
      }
    )
    @opExample(
      #{ parameters: recordResumeCallExample },
      #{
        title: "calling.record.resume",
        description: "Resume a paused recording",
      }
    )
    @opExample(
      #{ parameters: recordPauseCallExample },
      #{
        title: "calling.record.pause",
        description: "Pause an active recording",
      }
    )
    @opExample(
      #{ parameters: recordCallExample },
      #{
        title: "calling.record",
        description: "Start recording an active call",
      }
    )
    @opExample(
      #{ parameters: playVolumeCallExample },
      #{
        title: "calling.play.volume",
        description: "Adjust the volume of an active play operation",
      }
    )
    @opExample(
      #{ parameters: playStopCallExample },
      #{
        title: "calling.play.stop",
        description: "Stop an active play operation",
      }
    )
    @opExample(
      #{ parameters: playResumeCallExample },
      #{
        title: "calling.play.resume",
        description: "Resume a paused play operation",
      }
    )
    @opExample(
      #{ parameters: playPauseCallExample },
      #{
        title: "calling.play.pause",
        description: "Pause an active play operation",
      }
    )
    @opExample(
      #{ parameters: playCallExample },
      #{
        title: "calling.play",
        description: "Play media on an active call",
      }
    )
    @opExample(
      #{ parameters: disconnectCallExample },
      #{
        title: "calling.disconnect",
        description: "Disconnect a call leg",
      }
    )
    @opExample(
      #{ parameters: transferCallExample },
      #{
        title: "calling.transfer",
        description: "Transfer an active call to a new destination",
      }
    )
    @opExample(
      #{ parameters: liveTranslateStartExample },
      #{
        title: "calling.live_translate",
        description: "Start real-time language translation between call participants",
      }
    )
    @opExample(
      #{ parameters: liveTranscribeStartExample },
      #{
        title: "calling.live_transcribe",
        description: "Start real-time speech-to-text transcription on an active call",
      }
    )
    @opExample(
      #{ parameters: aiMessageExample },
      #{
        title: "calling.ai_message",
        description: "Send a message to the AI conversation to modify behavior or add context",
      }
    )
    @opExample(
      #{ parameters: unholdCallExample },
      #{
        title: "calling.ai_unhold",
        description: "Resume an AI call that was previously put on hold",
      }
    )
    @opExample(
      #{ parameters: holdCallExample },
      #{
        title: "calling.ai_hold",
        description: "Put an active AI call on hold, pausing the conversation",
      }
    )
    @opExample(
      #{ parameters: hangupCallExample },
      #{
        title: "calling.end",
        description: "Terminate an active call immediately",
      }
    )
    @opExample(
      #{ parameters: updateCallExample },
      #{
        title: "update",
        description: "Modify an existing call's parameters in real-time",
      }
    )
    @opExample(
      #{ parameters: dialCallExample },
      #{
        title: "dial",
        description: "Initiate a new outbound call with the dial command",
      }
    )
    @post
    @operationId("call-commands")
    callCommand(@body request: CallRequest):
      | {
          @statusCode statusCode: 200;
          @body call: CallResponse;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | CallCreate422Error
      | StatusCode500;
  }
}
