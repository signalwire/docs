---
sidebar_position: 3
title: "Call Recording"
---

## Call Recording

> **Summary**: Record calls using `record_call()` and `stop_record_call()` methods on SwaigFunctionResult. Supports stereo/mono, multiple formats, and webhook notifications.

### Recording Overview

**`record_call()`**
- Starts background recording
- Continues while conversation proceeds
- Supports stereo (separate channels) or mono
- Output formats: WAV, MP3, or MP4
- Direction: speak only, listen only, or both

**`stop_record_call()`**
- Stops an active recording
- Uses control_id to target specific recording
- Recording is automatically stopped on call end

### Basic Recording

```python
from signalwire_agents import AgentBase
from signalwire_agents.core.function_result import SwaigFunctionResult


class RecordingAgent(AgentBase):
    def __init__(self):
        super().__init__(name="recording-agent")
        self.add_language("English", "en-US", "rime.spore")

        self.prompt_add_section(
            "Role",
            "You are a customer service agent. "
            "Start recording when the customer agrees."
        )

        self.define_tool(
            name="start_recording",
            description="Start recording the call with customer consent",
            parameters={"type": "object", "properties": {}},
            handler=self.start_recording
        )

    def start_recording(self, args, raw_data):
        return (
            SwaigFunctionResult("Recording has started.")
            .record_call(
                control_id="main_recording",
                stereo=True,
                format="wav"
            )
        )


if __name__ == "__main__":
    agent = RecordingAgent()
    agent.run()
```

### Recording Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `control_id` | str | None | Identifier to stop specific recording |
| `stereo` | bool | False | True for separate L/R channels |
| `format` | str | `"wav"` | Output format: "wav", "mp3", or "mp4" |
| `direction` | str | `"both"` | "speak", "listen", or "both" |
| `terminators` | str | None | DTMF digits that stop recording |
| `beep` | bool | False | Play beep before recording |
| `input_sensitivity` | float | `44.0` | Audio sensitivity threshold |
| `initial_timeout` | float | `0.0` | Seconds to wait for speech |
| `end_silence_timeout` | float | `0.0` | Silence duration to auto-stop |
| `max_length` | float | None | Maximum recording seconds |
| `status_url` | str | None | Webhook for recording events |

### Stereo Recording

Record caller and agent on separate channels:

```python
def start_stereo_recording(self, args, raw_data):
    return (
        SwaigFunctionResult("Recording in stereo mode")
        .record_call(
            control_id="stereo_rec",
            stereo=True,  # Caller on left, agent on right
            format="wav"
        )
    )
```

### Direction Options

```python
## Record only what the AI/agent speaks
def record_agent_only(self, args, raw_data):
    return (
        SwaigFunctionResult("Recording agent audio")
        .record_call(direction="speak")
    )

## Record only what the caller says
def record_caller_only(self, args, raw_data):
    return (
        SwaigFunctionResult("Recording caller audio")
        .record_call(direction="listen")
    )

## Record both sides (default)
def record_both(self, args, raw_data):
    return (
        SwaigFunctionResult("Recording full conversation")
        .record_call(direction="both")
    )
```

### Recording with Webhook

Receive notifications when recording completes:

```python
def start_recording_with_callback(self, args, raw_data):
    return (
        SwaigFunctionResult("Recording started")
        .record_call(
            control_id="webhook_rec",
            status_url="https://example.com/recording-complete"
        )
    )
```

The webhook receives recording metadata including the URL to download the file.

### Auto-Stop Recording

Configure automatic stop conditions:

```python
def start_auto_stop_recording(self, args, raw_data):
    return (
        SwaigFunctionResult("Recording with auto-stop")
        .record_call(
            max_length=300.0,        # Stop after 5 minutes
            end_silence_timeout=5.0, # Stop after 5 seconds of silence
            terminators="#"          # Stop if user presses #
        )
    )
```

### Stop Recording

Stop a recording by control_id:

```python
from signalwire_agents import AgentBase
from signalwire_agents.core.function_result import SwaigFunctionResult


class ControlledRecordingAgent(AgentBase):
    def __init__(self):
        super().__init__(name="controlled-recording-agent")
        self.add_language("English", "en-US", "rime.spore")

        self.prompt_add_section(
            "Role",
            "You handle call recordings. You can start and stop recording."
        )

        self._register_functions()

    def _register_functions(self):
        self.define_tool(
            name="start_recording",
            description="Start recording the call",
            parameters={"type": "object", "properties": {}},
            handler=self.start_recording
        )

        self.define_tool(
            name="stop_recording",
            description="Stop recording the call",
            parameters={"type": "object", "properties": {}},
            handler=self.stop_recording
        )

    def start_recording(self, args, raw_data):
        return (
            SwaigFunctionResult("Recording has started")
            .record_call(control_id="main")
        )

    def stop_recording(self, args, raw_data):
        return (
            SwaigFunctionResult("Recording has stopped")
            .stop_record_call(control_id="main")
        )


if __name__ == "__main__":
    agent = ControlledRecordingAgent()
    agent.run()
```

### Recording with Beep

Alert the caller that recording is starting:

```python
def start_recording_with_beep(self, args, raw_data):
    return (
        SwaigFunctionResult("This call will be recorded")
        .record_call(
            beep=True,  # Plays a beep before recording starts
            format="mp3"
        )
    )
```

### Complete Example

```python
#!/usr/bin/env python3
## compliance_agent.py - Agent with recording compliance features
from signalwire_agents import AgentBase
from signalwire_agents.core.function_result import SwaigFunctionResult


class ComplianceAgent(AgentBase):
    """Agent with full recording compliance features"""

    def __init__(self):
        super().__init__(name="compliance-agent")
        self.add_language("English", "en-US", "rime.spore")

        self.prompt_add_section(
            "Role",
            "You are a customer service agent. Before recording, you must "
            "inform the customer and get their verbal consent."
        )

        self.prompt_add_section(
            "Recording Policy",
            """
            1. Always inform customer: "This call may be recorded for quality purposes."
            2. Ask for consent: "Do you agree to the recording?"
            3. Only start recording after explicit "yes" or agreement.
            4. If customer declines, proceed without recording.
            """
        )

        self._register_functions()

    def _register_functions(self):
        self.define_tool(
            name="start_compliant_recording",
            description="Start recording after customer consent is obtained",
            parameters={"type": "object", "properties": {}},
            handler=self.start_compliant_recording
        )

        self.define_tool(
            name="pause_recording",
            description="Pause recording for sensitive information",
            parameters={"type": "object", "properties": {}},
            handler=self.pause_recording
        )

        self.define_tool(
            name="resume_recording",
            description="Resume recording after sensitive section",
            parameters={"type": "object", "properties": {}},
            handler=self.resume_recording
        )

    def start_compliant_recording(self, args, raw_data):
        call_id = raw_data.get("call_id", "unknown")

        return (
            SwaigFunctionResult("Recording has begun. Thank you for your consent.")
            .record_call(
                control_id=f"compliance_{call_id}",
                stereo=True,
                format="wav",
                beep=True,
                status_url="https://example.com/recordings/status"
            )
            .update_global_data({"recording_active": True})
        )

    def pause_recording(self, args, raw_data):
        call_id = raw_data.get("call_id", "unknown")

        return (
            SwaigFunctionResult(
                "Recording paused. You may now provide sensitive information."
            )
            .stop_record_call(control_id=f"compliance_{call_id}")
            .update_global_data({"recording_active": False})
        )

    def resume_recording(self, args, raw_data):
        call_id = raw_data.get("call_id", "unknown")

        return (
            SwaigFunctionResult("Recording resumed.")
            .record_call(
                control_id=f"compliance_{call_id}",
                stereo=True,
                format="wav"
            )
            .update_global_data({"recording_active": True})
        )


if __name__ == "__main__":
    agent = ComplianceAgent()
    agent.run()
```

### Recording Best Practices

#### Compliance
- Always inform callers before recording
- Obtain consent where legally required
- Provide option to decline recording
- Document consent in call logs

#### Technical
- Use control_id for multiple recordings
- Use stereo=True for transcription accuracy
- Use status_url to track recording completion
- Set max_length to prevent oversized files

#### Storage
- Use WAV for quality, MP3 for size, MP4 for video
- Implement retention policies
- Secure storage with encryption

