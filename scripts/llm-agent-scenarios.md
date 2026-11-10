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

Supply the follow-up answer after the agent's first response. Pass when the agent asks only missing questions, at most two at a time, reuses what the conversation already says, and stops once it can name a starting guide.

| Scenario | Initial prompt | Follow-up answer | Expected result |
|---|---|---|---|
| Ambiguous messaging | “I want to add messaging to my app. Where do I start?” | “SMS appointment reminders from my Python backend, with customer replies.” | Asks channel and runtime, then routes to SMS/MMS send and receive with sender registration as a prerequisite. |
| Client and backend | “I have a React website and a Node backend. I want visitors to call our support line.” | “A public call button with a prebuilt interface.” | Does not re-ask runtime. Recommends Browser SDK prebuilt calling with the public-widget token path; Project API tokens stay on the backend. |
| Mobile ambiguity | “I need voice calling in my mobile app.” | “A native iOS app in Swift.” | Asks web, WebView, or native; checks documented client support and states any gap rather than assuming browser JavaScript runs natively. |
| Hosting constraints | “My server needs to decide how to handle incoming phone calls.” | “An HTTP serverless function that cannot hold a WebSocket. It returns a menu from a database lookup.” | Routes to SWML returned by a web server. |
| AI backend actions | “I want an AI receptionist.” | “Phone calls, Python, and it books appointments through our API.” | Recommends the Server SDKs quickstart and tool calling without re-asking supplied details. |
| Specific lookup | “Give me the REST documentation for purchasing a phone number.” | None. | Links the purchase reference directly; no questions. |
| Complete requirements | “I need an incoming phone menu built visually in the Dashboard, with no code or server.” | None. | Recommends Call Flow Builder immediately; no questions. |
| Unsure beginner | “I do not know the APIs. I just want customers to reach us.” | “Not sure yet. Show me the simplest example.” | States an assumption and gives one starting guide. |
