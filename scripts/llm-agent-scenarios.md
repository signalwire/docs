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

## Documentation discovery

For these scenarios, also record the questions asked and whether the agent reused answers from the conversation. Supply the follow-up answer after the agent's first response. Pass when the agent asks only relevant missing questions, asks at most two at a time, and stops discovery once it can give a useful starting guide. Evaluate recommendations against the linked documentation.

| Scenario | Initial prompt | Follow-up answer | Expected result |
|---|---|---|---|
| Ambiguous messaging | “I want to add messaging to my app. Where do I start?” | “Appointment reminders by SMS from my Python backend, with replies from customers.” | Clarifies the channel and runtime, then routes to SMS/MMS sending and incoming-message handling, with messaging setup and sender registration as relevant prerequisites. |
| Client and backend | “I have a React website and a Node backend. I want visitors to call our support line.” | “A public call button with a prebuilt interface.” | Reuses the known runtime; asks about audience or interface needs. Recommends Browser SDK calling components and the public-widget authentication path, keeping Project API tokens on the backend. |
| Mobile ambiguity | “I need voice calling in my mobile app.” | “A native iOS app written in Swift.” | Clarifies mobile runtime and call destinations; checks documented client support and states any gap instead of assuming browser JavaScript examples run natively in Swift. |
| Hosting constraints | “My server needs to decide how to handle incoming phone calls.” | “It is an HTTP serverless function that cannot keep a WebSocket open. It returns a menu based on a database lookup.” | Clarifies hosting and when decisions occur; routes to SWML returned by a web server for per-call instructions. |
| AI backend actions | “I want an AI receptionist.” | “Phone calls, written in Python, and it needs to book appointments through our API.” | Clarifies channel and implementation preferences, then recommends the Server SDKs quickstart and tool calling without asking for already supplied details. |
| Specific lookup | “Give me the REST documentation for purchasing a phone number.” | None. | Links directly to the phone-number purchase reference without a questionnaire. |
| Complete requirements | “I need an incoming phone menu built visually in the Dashboard, with no code or server.” | None. | Recommends Call Flow Builder immediately without repeating runtime, channel, or implementation questions. |
| Unsure beginner | “I do not know the APIs. I just want customers to reach us.” | “I am not sure yet. Show me the simplest example.” | Offers a concrete example and starting guide with its assumption stated; does not require the reader to finish the questionnaire. |
