---
slug: "/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-language"
title: "add_language"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin.add_language"
  parent: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin"
  module: "signalwire.core.mixins.ai_config_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py"
---
# `add_language`

Add a language configuration to support multilingual conversations

# Simple voice name

agent.add\_language("English", "en-US", "en-US-Neural2-F")

# Explicit parameters

agent.add\_language("English", "en-US", "josh", engine="elevenlabs", model="eleven\_turbo\_v2\_5")

# Combined format

agent.add\_language("English", "en-US", "elevenlabs.josh:eleven\_turbo\_v2\_5")

# Per-language params (engine-specific knobs)

agent.add\_language("English", "en-US", "josh",
engine="elevenlabs",
params={"stability": 0.5, "similarity\_boost": 0.75})

## Signature

```python
add_language(
    name: str,
    code: str,
    voice: str,
    speech_fillers: Optional[List[str]] = None,
    function_fillers: Optional[List[str]] = None,
    engine: Optional[str] = None,
    model: Optional[str] = None,
    params: Optional[Dict[str, Any]] = None
) -> AgentBase
```

## Parameters

| Name               | Type                       | Required | Default | Description                                                                                                                                               |
| ------------------ | -------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`             | `str`                      | yes      | —       | Name of the language (e.g., "English", "French")                                                                                                          |
| `code`             | `str`                      | yes      | —       | Language code (e.g., "en-US", "fr-FR")                                                                                                                    |
| `voice`            | `str`                      | yes      | —       | TTS voice to use. Can be a simple name (e.g., "en-US-Neural2-F") or a combined format "engine.voice:model" (e.g., "elevenlabs.josh:eleven\_turbo\_v2\_5") |
| `speech_fillers`   | `Optional[List[str]]`      | no       | `None`  | Optional list of filler phrases for natural speech                                                                                                        |
| `function_fillers` | `Optional[List[str]]`      | no       | `None`  | Optional list of filler phrases during function calls                                                                                                     |
| `engine`           | `Optional[str]`            | no       | `None`  | Optional explicit engine name (e.g., "elevenlabs", "rime")                                                                                                |
| `model`            | `Optional[str]`            | no       | `None`  | Optional explicit model name (e.g., "eleven\_turbo\_v2\_5", "arcana")                                                                                     |
| `params`           | `Optional[Dict[str, Any]]` | no       | `None`  | Optional per-language params dict (engine-specific tuning, voice settings, etc.). Emitted as the language object's `params` key in SWML.                  |

## Returns

`AgentBase` — Self for method chaining

## Examples

```python
# Explicit parameters
agent.add_language("English", "en-US", "josh", engine="elevenlabs", model="eleven_turbo_v2_5")

# Combined format
agent.add_language("English", "en-US", "elevenlabs.josh:eleven_turbo_v2_5")

# Per-language params (engine-specific knobs)
agent.add_language("English", "en-US", "josh",
                   engine="elevenlabs",
                   params={"stability": 0.5, "similarity_boost": 0.75})
```

## Source

[`/src/signalwire/signalwire/core/mixins/ai_config_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py)

Line 75.
