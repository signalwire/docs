# LLM documentation scenarios

Run each prompt in a new, context-isolated agent session against the Fern preview. Record the selected product, canonical documentation link, supporting text, and pass/fail result in the final rollout PR.

| Scenario | Prompt | Expected result |
|---|---|---|
| Python phone agent | “I need to build an AI phone agent in Python that can call my scheduling backend. Where do I start?” | Server SDKs and the Python quickstart; tool calling for backend actions. |
| Mid-call transfer | “My server must decide during an active call whether to transfer the caller. Should I use SWML or RELAY?” | RELAY for imperative realtime control; SWML for declarative call instructions. |
| Browser credentials | “What credential can I safely give a browser click-to-call app?” | A browser/embed token, not a Project API token. |
| Purchase a number | “How can my backend search for and purchase a SignalWire phone number?” | REST phone-number search and purchase endpoints. |
| Provider voice | “How do I configure a Speechify or Cartesia voice for text-to-speech?” | The provider page, required voice identifier format, and provider voice-list link. |
| WhatsApp callback | “What JSON will my WhatsApp message status callback receive?” | The Message status callback payload and canonical webhook reference. |
| No-code call handling | “I need a phone menu without running a server or writing code.” | Call Flow Builder. |
| Twilio migration | “Can I move my Twilio application to SignalWire and keep its AI features?” | Compatibility API for compatible REST/cXML behavior and an explicit warning that AI is unsupported there. |
