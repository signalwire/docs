---
slug: "/reference/dotnet/signal-wire.swml/swml-builder"
title: "SWMLBuilder"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.SWMLBuilder"
  parent: "SignalWire.SWML"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `SWMLBuilder`

## Signature

```dotnet
public class SWMLBuilder
```

## Properties

| Name      | Type                              | Required | Default | Description |
| --------- | --------------------------------- | -------- | ------- | ----------- |
| `Service` | `public Service Service { get; }` | yes      | —       | —           |

## Methods

- [`AddSection(string)`](/reference/dotnet/signal-wire.swml/swml-builder/add-section-string) — Add a section to the underlying document. (Python parity: `SWMLBuilder.add_section`.)
- [`Ai(string?, List<Dictionary<string, object>>?, string?, string?, Dictionary<string, object>?, Dictionary<string, object>?)`](/reference/dotnet/signal-wire.swml/swml-builder/ai-string-list-dictionary-string-object-string-string-dictionary-string-object-dictionary-string-object) — Add an `ai` verb. (Python parity: `SWMLBuilder.ai(prompt_text, prompt_pom, post_prompt, post_prompt_url, swaig, ...)`.)
- [`Answer(int?, string?)`](/reference/dotnet/signal-wire.swml/swml-builder/answer-int-string) — Add an `answer` verb. (Python parity: `SWMLBuilder.answer(max_duration, codecs)`.)
- [`Build()`](/reference/dotnet/signal-wire.swml/swml-builder/build) — Build the SWML document as a dict. (Python parity: `SWMLBuilder.build`.)
- [`Hangup(string?)`](/reference/dotnet/signal-wire.swml/swml-builder/hangup-string) — Add a `hangup` verb. (Python parity: `SWMLBuilder.hangup(reason)`.)
- [`Play(string?, List<string>?, double?, string?, string?, string?)`](/reference/dotnet/signal-wire.swml/swml-builder/play-string-list-string-double-string-string-string) — Add a `play` verb. (Python parity: `SWMLBuilder.play(url, urls, volume, say_text, say_voice, say_language)`.)
- [`Render()`](/reference/dotnet/signal-wire.swml/swml-builder/render) — Render the SWML document as a JSON string. (Python parity: `SWMLBuilder.render`.)
- [`Reset()`](/reference/dotnet/signal-wire.swml/swml-builder/reset) — Reset the underlying document. (Python parity: `SWMLBuilder.reset`.)
- [`Say(string, string?, string?)`](/reference/dotnet/signal-wire.swml/swml-builder/say-string-string-string) — Add a `say` verb (synthesized speech). (Python parity: `SWMLBuilder.say(text, voice, language)`.)
- [`SWMLBuilder(Service)`](/reference/dotnet/signal-wire.swml/swml-builder/swml-builder-service)
