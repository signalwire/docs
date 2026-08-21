# Documentation changes for Support — 2026-08-11

Covers documentation merged between 2026-08-04 and 2026-08-11.
5 new or changed capabilities, 2 corrections and moves.

Entries marked **New** also appear on the public [changelog](/docs/changelog).
Entries marked **Changed** are internal-only: corrections to things the docs
previously got wrong, and pages that moved to a new URL.

## browser-sdks

- **New — Browser SDK v3 guides are retired** ([#553](https://github.com/signalwire/docs/pull/553))

  Ten published v3 guides were deleted and four redirects added covering both /v3/js/guides* and legacy /js/guides* paths. Anyone who bookmarked or was sent a v3 guide link now lands on a redirect target rather than the guide. If a customer needs recording, RTMP streaming, or interactive live streaming, v4 does not implement those yet — that gap is real, not a documentation omission.

  - removed: `fern/products/browser-sdk/pages/v3/guides/core/overview.mdx`
  - modified: `fern/docs.yml`

## platform

- **New — E911 registration is self-service through the REST API** ([#538](https://github.com/signalwire/docs/pull/538))

  The E911 guide no longer tells customers to open a ticket — the native REST endpoints are live and the flow is self-service. Two related corrections ship with it: the phone numbers page now points at the REST API for programmatic management, and the porting guide now states that E911 registrations do not transfer with a port, replacing the old advice to contact SignalWire before submitting the order. Expect fewer E911 provisioning tickets, and redirect any that arrive to the guide.

  - modified: [E911](/docs/platform/e911)
  - modified: [Port phone numbers to SignalWire](/docs/platform/porting-into-signalwire)

- **New — Six new text-to-speech engines** ([#536](https://github.com/signalwire/docs/pull/536))

  Six new engine reference pages, plus the previously missing amazon, azure, and openai entries in the SWML ai.languages engine list. Two things to watch: anyone still on playai-turbo must move to groq-tts, and Rime arcana is end-of-life in favor of coda. The Groq Arabic model additionally requires accepting Canopy Labs' terms in the Groq console or requests fail. Voice widgets for groq-tts, mistral, smallest, fish, and speechify may render empty until the CDN voice catalog picks up those engines.

  - added: [Groq](/docs/platform/voice/tts/groq-tts)
  - added: [Mistral](/docs/platform/voice/tts/mistral)
  - added: [Grok](/docs/platform/voice/tts/grok)
  - added: [Smallest.ai](/docs/platform/voice/tts/smallest)
  - added: [Fish Audio](/docs/platform/voice/tts/fish)
  - added: [Speechify](/docs/platform/voice/tts/speechify)

- **New — Status callbacks are documented as advisory, not realtime triggers** ([#533](https://github.com/signalwire/docs/pull/533))

  The platform webhooks page previously implied callbacks were a reliable realtime signal, saying applications could react to each state change as it happens. That line is gone, replaced by a canonical Status callbacks are advisory section, linkable at #status-callback-reliability. A shared advisory note is now embedded on every page documenting status callbacks, and the same wording is in the TypeSpec descriptions so it reaches the REST reference. Use the anchor when a customer reports missed callbacks: the answer is to confirm state via GET or move to Relay, not to expect delivery guarantees. One retry detail also changed on the common webhook errors page.

  - modified: [Webhooks](/docs/platform/webhooks)
  - modified: [Compatibility API Webhooks](/docs/compatibility-api/guides/webhooks)

- **New — New guide for AI tool calling** ([#490](https://github.com/signalwire/docs/pull/490))

  New page at /docs/platform/ai/tool-calling, and a substantially rewritten best practices guide. The AI overview and capabilities pages gained a how-it-works section and an AI in the media path section. Two naming and path changes matter for old links: the Agents SDK to Server SDKs rename is now complete across platform, server-sdks, and SWML pages, and stale /docs/swml/reference/ai paths were fixed. The Amazon Bedrock SWAIG includes reference page was removed.

  - added: [Tool calling](/docs/platform/ai/tool-calling)
  - modified: [Best practices for creating a SignalWire AI agent](/docs/platform/ai/best-practices)
  - modified: [SignalWire AI](/docs/platform/ai)

- **Changed — Only catalog voices resolve, and custom voice options are documented** ([#535](https://github.com/signalwire/docs/pull/535))

  Readers were assuming any valid provider voice ID would work, because catalog IDs are opaque UUIDs. It does not — it fails at call time with an audible fallback, which is the symptom to listen for on a ticket. Warnings now say so on both provider pages, and a Custom and cloned voices section on the voices page states the real options: ElevenLabs voice import is available by request through Support, and Cartesia custom voices are not supported. Note the PR description calls this a new page at /voice/tts/custom-voices, but it shipped as an anchored section on the voices page instead.

  - modified: [Voices and languages](/docs/platform/voice/tts)
  - modified: [ElevenLabs](/docs/platform/voice/tts/elevenlabs)
  - modified: [Cartesia](/docs/platform/voice/tts/cartesia)

## server-sdks

- **Changed — Relay client examples no longer set an invalid host** ([#531](https://github.com/signalwire/docs/pull/531))

  The old examples passed host="your-space.signalwire.com", which is not a valid Relay host — anyone who copied them was configuring something wrong. External users never need host at all; it defaults to relay.signalwire.com, correct for all public-cloud customers. The parameter is still documented in the SDK relay/client reference along with the default and the SIGNALWIRE_SPACE environment variable.

  - modified: [Relay Client](/docs/server-sdks/guides/relay-client)
