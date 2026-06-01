---
slug: "/reference/rust/signalwire/rest/namespaces/calling/calling"
title: "Calling"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::calling::Calling"
  parent: "signalwire::rest::namespaces::calling"
  module: "rest.namespaces.calling"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/calling.rs"
  visibility: "public"
---
# `Calling`

Calling API namespace.

Provides 37 call-control command methods that each POST to
`/api/calling/calls` with a JSON body containing the command name,
an optional call ID, and parameters.

## Signature

```rust
struct Calling { /* fields */ }
```

## Methods

- [`ai_hold`](/reference/rust/signalwire/rest/namespaces/calling/calling/ai-hold)
- [`ai_message`](/reference/rust/signalwire/rest/namespaces/calling/calling/ai-message)
- [`ai_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/ai-stop)
- [`ai_unhold`](/reference/rust/signalwire/rest/namespaces/calling/calling/ai-unhold)
- [`base_path`](/reference/rust/signalwire/rest/namespaces/calling/calling/base-path)
- [`client`](/reference/rust/signalwire/rest/namespaces/calling/calling/client)
- [`collect`](/reference/rust/signalwire/rest/namespaces/calling/calling/collect)
- [`collect_start_input_timers`](/reference/rust/signalwire/rest/namespaces/calling/calling/collect-start-input-timers)
- [`collect_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/collect-stop)
- [`denoise`](/reference/rust/signalwire/rest/namespaces/calling/calling/denoise)
- [`denoise_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/denoise-stop)
- [`detect`](/reference/rust/signalwire/rest/namespaces/calling/calling/detect)
- [`detect_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/detect-stop)
- [`dial`](/reference/rust/signalwire/rest/namespaces/calling/calling/dial)
- [`disconnect`](/reference/rust/signalwire/rest/namespaces/calling/calling/disconnect)
- [`end`](/reference/rust/signalwire/rest/namespaces/calling/calling/end)
- [`live_transcribe`](/reference/rust/signalwire/rest/namespaces/calling/calling/live-transcribe)
- [`live_translate`](/reference/rust/signalwire/rest/namespaces/calling/calling/live-translate)
- [`new`](/reference/rust/signalwire/rest/namespaces/calling/calling/new)
- [`play`](/reference/rust/signalwire/rest/namespaces/calling/calling/play)
- [`play_pause`](/reference/rust/signalwire/rest/namespaces/calling/calling/play-pause)
- [`play_resume`](/reference/rust/signalwire/rest/namespaces/calling/calling/play-resume)
- [`play_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/play-stop)
- [`play_volume`](/reference/rust/signalwire/rest/namespaces/calling/calling/play-volume)
- [`project_id`](/reference/rust/signalwire/rest/namespaces/calling/calling/project-id)
- [`receive_fax_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/receive-fax-stop)
- [`record`](/reference/rust/signalwire/rest/namespaces/calling/calling/record)
- [`record_pause`](/reference/rust/signalwire/rest/namespaces/calling/calling/record-pause)
- [`record_resume`](/reference/rust/signalwire/rest/namespaces/calling/calling/record-resume)
- [`record_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/record-stop)
- [`refer`](/reference/rust/signalwire/rest/namespaces/calling/calling/refer)
- [`send_fax_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/send-fax-stop)
- [`stream`](/reference/rust/signalwire/rest/namespaces/calling/calling/stream)
- [`stream_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/stream-stop)
- [`tap`](/reference/rust/signalwire/rest/namespaces/calling/calling/tap)
- [`tap_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/tap-stop)
- [`transcribe`](/reference/rust/signalwire/rest/namespaces/calling/calling/transcribe)
- [`transcribe_stop`](/reference/rust/signalwire/rest/namespaces/calling/calling/transcribe-stop)
- [`transfer`](/reference/rust/signalwire/rest/namespaces/calling/calling/transfer)
- [`update`](/reference/rust/signalwire/rest/namespaces/calling/calling/update) — POST /api/calling/calls with `command="update"` — mirrors the Python `client.calling.update(id=..., state=...)` shape: caller-supplied `id` lives **inside** params, not as the top-level body field.
- [`user_event`](/reference/rust/signalwire/rest/namespaces/calling/calling/user-event)

## Source

[`src/rest/namespaces/calling.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/calling.rs)

Line 14.
