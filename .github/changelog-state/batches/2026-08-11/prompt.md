## Role

You are tiering merged documentation pull requests for SignalWire's developer
documentation. Each PR gets exactly one tier, which decides who hears about it.

## Tiers

**notable** — published to the public customer-facing changelog AND both internal
Slack digests. Reserve this for changes a customer building on SignalWire would
want to know about:
- A new page, guide, or tutorial.
- A new endpoint, method, field, or parameter appearing in the API or SWML reference.
- A documented behavior change, new limit, or changed default.
- A deprecation or removal.

**minor** — internal Support digest only. Support needs these to answer tickets;
customers do not get a card for them:
- A corrected factual error (wrong type, wrong default, wrong enum value, wrong
  description). Support must know the docs previously said something wrong.
- A page that moved, was renamed, or got a new slug — any URL change, because
  Support may have shared the old link.
- A substantive change to an example or code sample: it previously did not run,
  used the wrong parameter, or now demonstrates a different approach.
- A clarification that changes what a reader would conclude.

**skip** — nobody hears about it:
- Typos, spelling, grammar, punctuation, capitalization.
- Formatting, whitespace, heading levels, table or component markup.
- Broken-link fixes and link target updates.
- Rewording that does not change meaning: tightening prose, cutting filler,
  style-guide compliance, voice fixes.
- Tooling, CI, scripts, dependencies, build configuration.
- Regenerated build artifacts with no underlying source change.
- `.draft` files, and any page not yet wired into navigation.
- Internal refactors: moving content between files with no reader-visible change.

## Steps

1. Read the PR title, body, and the changed files with their diffs.
2. Ask what a customer reading the docs would *newly be able to do or know*.
   If the answer is nothing, the tier is `skip` or `minor`, never `notable`.
3. Ask whether the docs previously told someone something false, or whether a URL
   changed. If so, the tier is at least `minor`.
4. Assign the single highest tier justified by the change. One PR that adds a new
   guide and also fixes six typos is `notable` — describe the guide, ignore the typos.

## Worked examples

- Adds `fern/products/calling/pages/guides/port-numbers.mdx`, a new guide.
  → **notable**. "New guide: porting numbers with E911."

- Adds a `codecs` field to a SIP endpoint model in `specs/**/*.tsp`.
  → **notable**. A new field in the reference is a new capability to a reader.

- Changes a documented default from `30s` to `60s` in the reference.
  → **notable**. Behavior change; readers may have built around the old value.

- Corrects a parameter documented as `string` that is actually an object.
  → **minor**. The docs were wrong and Support needs to know, but this is not a
  new capability and does not belong on the public timeline.

- Moves a page from `/docs/ai/tool-calling` to `/docs/swml/ai/tool-calling`.
  → **minor**. URL change; Support may have sent customers the old link.

- Rewrites an intro paragraph to cut "In this guide you will learn" and drop the
  editorial "we".
  → **skip**. Style compliance; nothing a reader concludes differently.

- Fixes 12 broken links flagged by the link checker.
  → **skip**. Even at volume, this reaches nobody.

- Rewrites a warning from "this may take a while" to "this takes up to 30 seconds".
  → **minor**. Vague became specific, so a reader now concludes something they
  could not before. Not `skip`, despite reading like a reword.

- Updates `.github/workflows/check-links.yml` and `scripts/check-links.js`.
  → **skip**. Tooling.

## Narrowing

Default to the *lower* tier when genuinely torn. Over-reporting trains people to
ignore the digest, which is the failure mode this pipeline exists to avoid. Set
`confidence` below 0.7 whenever you are unsure, and say why in `reasoning` —
a human reviews every tier call before anything is published.

## Input

These pull requests merged into `main` in the SignalWire documentation repo
between 2026-08-04 and 2026-08-11.

Every URL you may cite is given to you below, read from the page's own
`slug:` frontmatter. **Never construct, guess, or infer a documentation URL.**
If a changed file has no URL listed, set that page's `url` to `null` and do not
put a link in `entry_body`. Reference-page URLs in particular are generated from
spec operation IDs and cannot be derived by hand.

Writing constraints for `entry_title` and `entry_body` — these are published to
customers on a public page:
- Sentence-case titles, no end punctuation. Name the change, never the week.
- Second person, present tense, active voice. No editorial "we".
- No marketing adjectives (powerful, seamless, robust), no emoji, no "simply".
- Do not describe the pull request or the repository. Describe what the reader
  can now do or now knows.

### PR #553 — Remove Browser SDK v3 guides

Author: hey-august · Merged: 2026-08-10T12:04:59Z · 14 docs files changed

## Description

Per @briankwest , the Browser SDK v3 guides are retired. This removes them and leaves v3 as reference-only, like v2.

### What changed

- **Deleted `fern/products/browser-sdk/pages/v3/guides/`** — 10 published guides plus 6 unpublished `.draft` files.
- **Removed the `guides` tab** from `fern/products/browser-sdk/versions/v3.yml`. The `reference` and `click-to-call` tabs are untouched; Click-to-Call lives outside `pages/v3/` and is hard-linked from `versions/v4.yml`, so it survives.
- **Added four redirects** in `fern/docs.yml` covering both the `/v3/js/guides*` and legacy `/js/guides*` paths.
- **Fixed the four inbound links** from pages that survive.
- **Deleted 13 images/videos** used only by the removed guides.

> [!NOTE]
> Several removed guides covered recording, RTMP streaming, and interactive live streaming. v4 does not implement those features yet.

### Redirects management

The new rules are placed **above** the existing `/docs/browser-sdk/js/:slug*` wildcard. That wildcard currently routes legacy guide paths into the v3 tree; left first, it would send them into pages that no longer exist.

### Inbound link fixes

| File                                                         | Change                                                                                                                                                                        |
| ------------------------------------------------------------ | --------------

Changed files:
- **removed** `fern/products/browser-sdk/pages/v3/guides/chat/get-started-with-a-simple-chat-demo/index.mdx` (+0/-236)
```diff
@@ -1,236 +0,0 @@
----
-id: 723188d4-fab9-4890-b6ff-f1719cb89c61
-title: Build a chat application with the Browser SDK
-slug: /js/guides/chat/build-a-react-application
-x-custom:
-  ported_from_readme: true
-  tags:
-    - product:chat
-    - sdk:relaybrowser
-    - language:javascript
-    - language:nodejs
-max-toc-depth: 3
----
-
-
-In this guide we will explore a simple chat application built using the SignalWire SDK.
-
-<Frame caption="The chat application you will build.">
-![Chat application demo screenshot showing multiple users and messages](/assets/images/project/get-started-with-a-simple-chat-demo/chat-demo.webp)
-</Frame>
-
-## The Frontend
-
-Using the Browser SDK you can easily integrate chat features into any web application. It only takes a few minutes to set up a basic example.
-
-### Connection
-
-To build your own chat application, you first need to include the SDK in your HTML.
-
-```html
-<!-- Import SignalWire library -->
-<script src="https://cdn.signalwire.com/@signalwire/js@3"></script>
-```
-
-Then you can interact with the SDK using the global variable `SignalWire`. We'll mainly be interested in the `SignalWire.Chat.Client` class for this guide, but if yo
```
- **removed** `fern/products/browser-sdk/pages/v3/guides/core/overview.mdx` (+0/-259)
```diff
@@ -1,259 +0,0 @@
----
-id: 004bdd77-fc94-4d36-82de-08f63d93f33e
-title: "Browser SDK Guides"
-sidebar-title: Overview
-position: 0
-slug: /js/guides
-max-toc-depth: 3
----
-
-The SignalWire Browser SDK is a JavaScript library that enables WebRTC-based voice, video, and chat applications directly in web browsers.
-Built on WebSocket architecture, it provides real-time communication capabilities without plugins or downloads.
-
-<Markdown src="/snippets/browser-sdk/v3/installation.mdx" />
-
-## Great guides to get you started
-
-### Video Guides
-
-<CardGroup cols={2}>
-  <Card title="Getting Started with the SignalWire Video SDK" href="/docs/browser-sdk/v3/js/guides/build-a-video-app" icon="fa-regular fa-star">
-    Learn how to build a video conferencing application using the SignalWire Browser SDK.
-  </Card>
-  <Card title="Zoom like application" href="/docs/browser-sdk/v3/js/guides/zoom-like-application">
-    Learn how to build a Zoom clone application using the SignalWire Browser SDK.
-  </Card>
-</CardGroup>
-
-### Chat Guides
-
-<Card title="Get Started with a Chat Application" href="/docs/browser-sdk/v3/js/guides/chat/build-a-react-application" icon="fa-regular fa-star">
- 
```
- **removed** `fern/products/browser-sdk/pages/v3/guides/video/getting-started-with-the-signalwire-video/index.mdx` (+0/-358)
```diff
@@ -1,358 +0,0 @@
----
-id: e3458a56-3f8b-4b1b-8a0e-d55a15bb17df
-description: Add high-quality, high-performance video to your application or website
-x-custom:
-  tags:
-    - product:video
-    - sdk:relaybrowser
-    - language:javascript
-    - language:nodejs
-sidebar_custom_props:
-  platform: javascript
-slug: /js/guides/build-a-video-app
-title: Build a video calling application with the Browser SDK
-max-toc-depth: 3
----
-
-SignalWire's Video API allows you to host real-time video calls and conferences on your website or app.
-In this guide, we will use SignalWire APIs in three steps to create a minimal full-stack video-calling website.
-
-This is what we will cover:
-
-1. Registering with SignalWire to [obtain your API key and Project ID](#obtaining-your-api-key-and-project-id)
-2. Writing a minimal [backend server](#backend) in Node.js.
-   This is a simple proxy server, so if you prefer you can use any platform such as PHP or Python.
-3. Developing a simple [frontend web app](#frontend) in JavaScript.
-   The SignalWire Browser SDK will do most of the work for us.
-
-When the site is finished, it will look something like this:
-
-<Frame caption="The end result of this 
```
- **removed** `fern/products/browser-sdk/pages/v3/guides/video/making-a-clubhouse-clone/index.mdx` (+0/-448)
```diff
@@ -1,448 +0,0 @@
----
-id: 2fff8644-a4bf-4888-b31d-0c4f9a60d719
-title: Make a Clubhouse like application 
-description: Learn how to make a Clubhouse clone using the SignalWire Video API.
-slug: /js/guides/clubhouse-like-application
-x-custom:
-  ported_from_readme: true
-  repo: https://github.com/signalwire/browser-audioconf-example
-  tags:
-    - language:javascript
-    - language:nodejs
-    - sdk:relaybrowser
-    - product:video
-sidebar_custom_props:
-  platform: javascript
-  github: https://github.com/signalwire/browser-audioconf-example
-max-toc-depth: 3
----
-
-Our Video APIs can do more than video! In this guide, we will build an audio-only application inspired by the popular Clubhouse. Here is what we are going to build:
-
-<Frame>
-
-  <video height={400} controls>
-    <source
-      src="/assets/images/project/clubhouse-like-video.mp4"
-      type="video/mp4"
-    />
-    Your browser does not support the video.
-  </video>
-
-</Frame>
-
-## Overview
-
-We are going to build an audio-only application inspired by the popular Clubhouse. Our application will run on the browser and will be composed by a frontend written in React, and a small server in Node.js. We wi
```
- **removed** `fern/products/browser-sdk/pages/v3/guides/video/zoom-clone-2/index.mdx` (+0/-632)
```diff
@@ -1,632 +0,0 @@
----
-id: 97ad2e2b-a14d-485a-878b-d9d6ebf551fa
-title: Make a Zoom like application
-description: Learn how to make a Zoom alternative using the SignalWire Video API.
-x-custom:
-  tags:
-    - product:video
-    - language:javascript
-    - language:nodejs
-    - language:react
-    - sdk:relaybrowser
-sidebar_custom_props:
-  platform: javascript
-  github: https://github.com/signalwire/browser-videoconf-full-react
-slug: /js/guides/zoom-like-application
-max-toc-depth: 3
----
-
-In this guide, we are going to make a Zoom-like video conferencing system using React, SignalWire APIs, SDKs and other tools.
-
-<Info>
-
-The full source code for this project is available on [GitHub](https://github.com/signalwire/browser-videoconf-full-react).
-
-</Info>
-
-We will use:
-
-1. [The SignalWire Video SDK](/docs/browser-sdk/v3/js/reference/video) will run in the client's browser.
-   It handles the cameras, the microphones, communication with
-   the SignalWire servers, and with other members in the conference. We will also use this SDK to display the video stream in the browser.
-
-2. [The SignalWire REST APIs for Video](/docs/apis/rest/video/rooms/create-room)
-   to pr
```
- **modified** `fern/docs.yml` (+14/-0)
- **removed** `fern/products/browser-sdk/pages/v3/guides/video/get-thumbnails-for-your-video-calls/index.mdx` (+0/-156)
- **removed** `fern/products/browser-sdk/pages/v3/guides/video/interactive-live-streaming/index.mdx` (+0/-159)
- **removed** `fern/products/browser-sdk/pages/v3/guides/video/recording-video/index.mdx` (+0/-142)
- **removed** `fern/products/browser-sdk/pages/v3/guides/video/streaming-to-youtube-and-other-platforms/index.mdx` (+0/-189)
- **removed** `fern/products/browser-sdk/pages/v3/guides/video/switch-webcam-or-microphone-with-signalwire-video-api.mdx` (+0/-91)
- **modified** `fern/products/browser-sdk/pages/v3/reference/video/RoomSession/index.mdx` (+1/-1)
- **modified** `fern/products/platform/pages/platform/setup/api-credentials.mdx` → /docs/platform/your-signalwire-api-space ("API credentials") (+4/-5)
- **modified** `fern/snippets/browser-sdk/v3/installation.mdx` (+0/-8)

---

### PR #548 — Add Reo.dev tracking script

Author: hey-august · Merged: 2026-08-07T17:43:14Z · 1 docs files changed

## Description

Adds the Reo.dev tracking snippet, requested by Product, to the Fern docs site. 

The snippet ships as a small local file (`fern/reo.js`) injected via a new `js:` block in `docs.yml`, since Fern takes script files rather than inline HTML. 

The live site's CSP already permits static.reo.dev, so no edge changes are needed. `fern check` passes. After merge, verify the script loads on signalwire.com/docs and visits appear in the Reo dashboard. 

### Follow-up

The Docusaurus (FreeSWITCH) docs are scoped separately.

The tracking script loads on all deploys, including previews. Marketing will likely need to configure Reo to filter the domain to just the public site, `signalwire.com/docs/*`.

## Type of Change

- [ ] Bug fix
- [x] New feature
- [ ] Breaking change
- [ ] Documentation update
- [ ] Code cleanup / refactor

## Related Issues

https://github.com/signalwire/cloud-product/issues/17535

## Testing

<!-- How did you test your changes? -->

- [ ] Added/updated unit tests
- [x] Tested manually
- [ ] Tested with live SignalWire credentials (if applicable)

Changed files:
- **modified** `fern/docs.yml` (+3/-0)
```diff
@@ -181,6 +181,9 @@ css:
   - components/skeleton/styles.css
   - components/voice-widget/styles.css
 
+js:
+  - reo.js
+
 redirects:
   - source: /docs/agents-sdk
     destination: /docs/server-sdks
```

---

### PR #546 — normalize CRLF line endings to LF in SWML pages

Author: hey-august · Merged: 2026-08-07T17:12:32Z · 67 docs files changed

67 `.mdx` files under `fern/products/swml/pages/` were committed with CRLF line endings.

> CRLF stands for Carriage Return + Line Feed and it’s a line-ending sequence written as \r\n (CR = \r, LF = \n). It moves the cursor to the start of the line and then down to the next line, and it’s commonly used in Windows text files.

The rest of the docs all use LF. LF is the more commonly accepted standard format. From [this blog](https://medium.com/arvatotech/crlf-vs-lf-in-git-why-your-team-should-standardize-line-endings-and-how-to-do-it-cleanly-b57ab72ff346):

> Should Your Team Standardize on a Single Line Ending?
> 
> Yes. Absolutely.
> 
> You want:
> 
>     Consistency
>     Predictable diffs
>     Cleaner commits
>     Zero merge noise caused by formatting
> 
> Both LF and CRLF are technically fine — but LF is the industry standard today, especially for cross-platform teams.
> Why LF Is Considered the Better Default
> 
>     Git internally prefers LF.
>     Most open-source projects require LF.
>     Containers, Linux servers, and CI pipelines use LF.
>     Many languages (Go, Python, JS) have tooling that expects LF.
>     VS Code defaults to LF in most environments.
> 
> The only major ecosystem still using CRLF by default is traditional Windows/Visual Studio workflows.

Both LF and CRLF are technically fine — but LF is the industry standard today, especially for cross-platform teams.

This PR converts them to LF and adds a `.gitattributes` (`*

Changed files:
- **modified** `fern/products/swml/pages/guides/swaig/handle_incoming_data.mdx` → /docs/swml/guides/data-map ("Handle SWAIG function calls inline") (+529/-529)
```diff
@@ -1,529 +1,529 @@
----
-id: 706e7b1b-fd15-4b22-91d9-006b6f4c1b47
-slug: /guides/data-map
-title: Handle SWAIG function calls inline
-description: Learn how to use `data_map` in SWML SWAIG functions to process, transform, and utilize incoming data effectively.
-x-custom:
-  tags:
-    - sdk:swml
-    - product:ai
-    - product:voice
-max-toc-depth: 3
----
-
-## Overview
-
-The [`data_map`](/docs/swml/guides/data-map) object is a crucial component of
-[SWAIG Functions](/docs/swml/reference/ai/swaig/functions) in the
-[`ai`](/docs/swml/reference/ai) SWML method.
-Data Maps are used to request, process, and transform incoming data, and trigger specific actions or responses, directly within the serverless context of your SWML Script.
-
-<Tip title="No server required">
-Data Maps enable some of the most powerful serverless capabilities of SWML Scripts.
-A `data_map` transforms the static JSON document in your SWML Script into a highly capable, dynamic application,
-removing the need to host a separate script to integrate with REST APIs to query, transform, and post data.
-</Tip>
-
-In particular, the `data_map` object facilitates a full range of input proces
```
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_params/index.mdx` → /docs/swml/reference/calling/ai/params ("params") (+585/-585)
```diff
@@ -1,585 +1,585 @@
----
-id: 2f704bee-56b8-412f-9d67-1bf4e4c29836
-unlisted: false
-hide_title: false
-title: params
-slug: /reference/calling/ai/params
-description: Parameters for AI that can customize the AI agent's behavior.
-max-toc-depth: 3
----
-
-[functions-fillers]: /docs/swml/reference/calling/ai/swaig/functions
-[ai-languages-params]: /docs/swml/reference/calling/ai/languages#paramssimilarity
-[post-prompt-url]: /docs/swml/reference/calling/ai#post_prompt_url
-[get-visual-input]: /docs/swml/reference/calling/ai/swaig#internal_fillersget_visual_input
-[iana-tz]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
-
-Parameters for AI that can be passed in `ai.params` at the top level of the [`ai` method](/docs/swml/reference/calling/ai).
-These parameters control the fundamental behavior and capabilities of the AI agent, including model selection, conversation management, and advanced features like thinking and vision.
-
-## **Properties**
-
-<ParamField path="ai.params" type="object" toc={true}>
-  An object that accepts the following properties.
-</ParamField>
-
-<Indent>
-
-<ParamField path="params.ai_model" type="string" default="g
```
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/functions/parameters/index.mdx` → /docs/swml/reference/calling/ai/swaig/functions/parameters ("parameters") (+680/-680)
```diff
@@ -1,680 +1,680 @@
----
-id: ef5ab3a0-5cb5-4460-8f83-37d61f107db9
-slug: /reference/calling/ai/swaig/functions/parameters
-title: parameters
-description: The parameters object for the SWAIG function.
-max-toc-depth: 3
----
-
-The `parameters` object is used to define the input data that will be passed to the function.
-
-## **Properties**
-
-<ParamField path="functions[].parameters" type="object" toc={true}>
-  An object that accepts the following properties.
-</ParamField>
-
-<Indent>
-
-<ParamField path="parameters.type" type="string" required={true} toc={true}>
-  Defines the top-level type of the parameters. Must be set to `"object"`
-</ParamField>
-
-
-<ParamField path="parameters.properties" type="object" required={true} toc={true}>
-  An object containing the [properties](#properties) definitions to be passed to the function
-</ParamField>
-
-<Indent>
-
-<ParamField path="properties.{property_name}" type="object" required={true} toc={true}>
-  The `properties` object defines the input data that will be passed to the function. It supports different types of parameters, each with their own set of configuration options. The property name is a key
```
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/index.mdx` → /docs/swml/reference/calling/ai ("ai") (+553/-553)
```diff
@@ -1,553 +1,553 @@
----
-id: 50bbedaf-3e1c-44f0-9021-4f54de00029f
-hide_title: false
-slug: /reference/calling/ai
-title: ai
-description: Create an AI agent to interact with users.
-max-toc-depth: 3
----
-
-[languages]: /docs/swml/reference/calling/ai/languages
-[params]: /docs/swml/reference/calling/ai/params
-[prompt]: /docs/swml/reference/calling/ai/prompt
-[SWAIG]: /docs/swml/reference/calling/ai/swaig
-[set_global_data action]: /docs/swml/reference/calling/ai/swaig/functions/data-map#list-of-valid-actions
-[Prompting Best Practices]: /docs/platform/ai/best-practices#crafting-the-initial-prompt-for-the-ai
-[markdown-guide]: https://www.markdownguide.org/
-
-Creates an AI agent that conducts voice conversations using automatic speech recognition (ASR),
-large language models (LLMs), and text-to-speech (TTS) synthesis.
-The agent processes caller speech in real-time, generates contextually appropriate responses,
-and can execute custom functions to interact with external systems and databases through [SignalWire AI Gateway (SWAIG)][SWAIG].
-
-Since the [prompt] configuration is central to AI agent behavior,
-it is recommended to read the [Prompting Best P
```
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/prompt/index.mdx` → /docs/swml/reference/calling/ai/prompt ("prompt") (+795/-795)
```diff
@@ -1,795 +1,795 @@
----
-id: 5e46ac90-465d-40da-9319-3788076b5327
-hide_title: false
-slug: /reference/calling/ai/prompt
-title: prompt
-description: Establish the set of rules and instructions for the AI agent through a prompt.
-max-toc-depth: 3
----
-
-[prompt-properties]: #properties
-[Prompting Best Practices]: /docs/platform/ai/best-practices#crafting-the-initial-prompt-for-the-ai
-
-Defines the AI agent's personality, goals, behaviors, and instructions for handling conversations.
-The prompt establishes how the agent should interact with callers, what information it should gather,
-and how it should respond to various scenarios.
-
-It is recommended to write prompts using markdown formatting as LLMs better understand structured content.
-Additionally it is recommended to read the [Prompting Best Practices][Prompting Best Practices] guide.
-
-### Prompt types
-
-There are three ways to define prompt content, each suited for different use cases:
-
-- **Text prompt** — A single string containing the full prompt. Best for simple agents where the entire personality, instructions, and rules fit naturally into one block of text.
-
-- **POM (Prompt Object Mo
```
- **modified** `fern/products/swml/pages/guides/basics/deployment.mdx` → /docs/swml/guides/deployment ("Deploy SWML from web servers") (+197/-197)
- **modified** `fern/products/swml/pages/guides/basics/goto-execute-transfer.mdx` → /docs/swml/guides/goto-execute-transfer-disambiguation ("Control program flow") (+292/-292)
- **modified** `fern/products/swml/pages/guides/basics/request.mdx` → /docs/swml/guides/request ("Send simple HTTP requests") (+294/-294)
- **modified** `fern/products/swml/pages/guides/basics/swml_remote_server.mdx` → /docs/swml/guides/remote-server ("Handle incoming calls from code") (+193/-193)
- **modified** `fern/products/swml/pages/guides/get-started/quickstart.mdx` → /docs/swml/guides ("Quickstart") (+159/-159)
- **modified** `fern/products/swml/pages/guides/recipes/call-whisper.mdx` → /docs/swml/guides/call-whisper ("Call whisper") (+112/-112)
- **modified** `fern/products/swml/pages/guides/recipes/creating-ivr-with-swml.mdx` → /docs/swml/guides/ivr ("Simple IVR") (+517/-517)
- **modified** `fern/products/swml/pages/guides/recipes/forwarding-calls.mdx` → /docs/swml/guides/forward-calls ("Forwarding calls") (+61/-61)
- **modified** `fern/products/swml/pages/guides/recipes/recording-calls.mdx` → /docs/swml/guides/record-calls ("Recording calls") (+52/-52)
- **modified** `fern/products/swml/pages/guides/swaig/context_switch.mdx` → /docs/swml/guides/context-switch ("Switch AI context mid-call") (+449/-449)
- **modified** `fern/products/swml/pages/guides/swaig/executing_swml.mdx` → /docs/swml/guides/executing-swml ("Execute SWML from a function") (+337/-337)
- **modified** `fern/products/swml/pages/guides/swaig/overview.mdx` → /docs/swml/guides/swaig ("SWAIG") (+170/-170)
- **modified** `fern/products/swml/pages/guides/swaig/set_meta_data.mdx` → /docs/swml/guides/set-meta-data ("Store data outside LLM context") (+408/-408)
- **modified** `fern/products/swml/pages/guides/swaig/toggle_functions.mdx` → /docs/swml/guides/toggle-functions ("Enable functions dynamically") (+254/-254)
- **modified** `fern/products/swml/pages/reference/expressions.mdx` → /docs/swml/reference/expressions ("Expressions") (+508/-508)

And 47 more changed files, not shown individually:
- 30 files under `fern/products/swml/pages/reference/methods/calling/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/functions/ai_swaig.data_map/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/functions/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/includes/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/languages/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/params/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/prompt/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/functions/ai_swaig.data_map/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/functions/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/functions/parameters/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/includes/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/connect/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/pay/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/play/`
- 1 file under `fern/products/swml/pages/reference/`

---

### PR #545 — standardize "Relay" brand capitalization

Author: hey-august · Merged: 2026-08-06T20:31:26Z · 125 docs files changed

**Signal:** Every sampled diff in this PR changes only whitespace, line endings, or letter case. Almost certainly `skip`.

## Description

The product is "Relay," not "RELAY." This PR fixes incorrect references in prose and Typespec, and regenerates the OpenAPI spec and SWML schema accordingly

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [x] Documentation update
- [ ] Code cleanup / refactor

## Related Issues

Closes #544 

## Testing

<!-- How did you test your changes? -->

- [ ] Added/updated unit tests
- [ ] Tested manually
- [ ] Tested with live SignalWire credentials (if applicable)

## Checklist

- [ ] I have read the [CONTRIBUTING](CONTRIBUTING.md) guidelines
- [ ] My code follows the project's style guidelines
- [ ] I have added tests for my changes (if applicable)
- [ ] I have updated documentation (if applicable)
- [ ] All existing tests pass

Changed files:
- **modified** `fern/products/browser-sdk/pages/v2/reference/overview.mdx` (+12/-12)
```diff
@@ -1,6 +1,6 @@
 ---
 id: b73a0777-5e70-4414-95cb-880d80ed89cc
-title: RELAY SDK for JavaScript
+title: Relay SDK for JavaScript
 sidebar-title: Overview
 position: 0
 max-toc-depth: 3
@@ -13,7 +13,7 @@ This version of the SDK will be end of life and unsupported starting June 2027.
 
 </Warning>
 
-The RELAY JavaScript SDK transforms your standard browser into a realtime media engine, enabling developers to directly make audio and video calls to phone numbers, SIP endpoints, and other browsers. Using the JavaScript SDK you can add immersive, scalable communication - from video conferences and softphones to click-to-call and mobile gaming - all available right in your own web pages and applications.
+The Relay JavaScript SDK transforms your standard browser into a realtime media engine, enabling developers to directly make audio and video calls to phone numbers, SIP endpoints, and other browsers. Using the JavaScript SDK you can add immersive, scalable communication - from video conferences and softphones to click-to-call and mobile gaming - all available right in your own web pages and applications.
 
 SignalWire's simple and powerful authentication system, using JWT, allows you to
```
- **modified** `fern/products/browser-sdk/pages/v2/reference/v2-vs-v3.mdx` (+19/-19)
```diff
@@ -1,6 +1,6 @@
 ---
 id: 4d6f13f7-5b87-4407-af8a-d98baeb79bbc
-title: "RELAY Browser SDK v2 vs v3"
+title: "Relay Browser SDK v2 vs v3"
 position: 1
 slug: /js/reference/v2-vs-v3
 max-toc-depth: 3
@@ -10,26 +10,26 @@ The SignalWire **Client-side SDKs** transform your **browser** into a real-time
 
 Depending on your **use case**, you can choose among **two different SDK versions**:
 
-- [RELAY Browser SDK v3](/docs/browser-sdk/v3)
-- [RELAY Browser SDK v2](/docs/browser-sdk/v2)
+- [Relay Browser SDK v3](/docs/browser-sdk/v3)
+- [Relay Browser SDK v2](/docs/browser-sdk/v2)
 
 Both SDKs are **JavaScript libraries** that run entirely on the **browser**.
 
-To help get you started, in the following we will introduce two broad and common use cases: for each of them, we suggest which of the two SDKs is the most indicated to the job. Keep into consideration that, in the near future, all functionality of RELAY Browser SDK v2 will be integrated into RELAY Browser SDK v3, which will become the reference SDK.
+To help get you started, in the following we will introduce two broad and common use cases: for each of them, we suggest which of the two SDKs is the most indicated to the job. Keep in
```
- **modified** `fern/products/platform/pages/calling/voice/SIP/byoc/index.mdx` → /docs/platform/voice/sip/bring-your-own-carrier ("Bring your own carrier") (+13/-13)
```diff
@@ -80,19 +80,19 @@ In the below example, we have a Call Flow that answers the call and plays a TTS
 
 ---
 
-#### Using RELAY
+#### Using Relay
 
-To handle incoming calls using a RELAY Application, you will need to:
+To handle incoming calls using a Relay Application, you will need to:
 
 1. Go to the settings page for the newly created Domain App, by clicking on the app name in the Domain Apps list.
-2. Set the **HANDLE USING** field to **RELAY Application**
+2. Set the **HANDLE USING** field to **Relay Application**
 3. Set a topic (V4) or context (V3) in the **WHEN A CALL COMES IN** field. Let's use `office` as an example.
 4. Run code listening for calls on that `office` topic/context and then do something with them.
 
 <Tabs>
-<Tab title="RELAY V3">
+<Tab title="Relay V3">
 
-  ##### RELAY V3 Example
+  ##### Relay V3 Example
 
 ```javascript
 import { Voice } from "@signalwire/realtime-api";
@@ -122,9 +122,9 @@ Then, we tell it to listen for `call.received` events, and when a new call comes
 in we answer it and say "Hello! This is a test call." to the caller.
 
 </Tab>
-<Tab title="RELAY V4">
+<Tab title="Relay V4">
 
-  ##### RELAY V4 Example
+  ##### Relay V4 Example
 
 `
```
- **modified** `fern/products/server-sdks/pages/guides/make-and-receive-calls/overview.mdx` → /docs/server-sdks/guides/relay-client ("Relay Client") (+27/-27)
```diff
@@ -1,6 +1,6 @@
 ---
-title: "RELAY Client"
-description: Use the RELAY client to make and receive phone calls with the SignalWire SDK.
+title: "Relay Client"
+description: Use the Relay client to make and receive phone calls with the SignalWire SDK.
 slug: /guides/relay-client
 max-toc-depth: 3
 ---
@@ -14,22 +14,22 @@ max-toc-depth: 3
 [ref-recordaction]: /docs/server-sdks/reference/python/relay/actions/record-action
 [ref-relayclient]: /docs/server-sdks/reference/python/relay/client
 
-### What Is RELAY?
+### What Is Relay?
 
-RELAY is SignalWire's real-time WebSocket protocol for programmatic call control. While the agent-based approach ([AgentBase][ref-agentbase] + SWML) lets SignalWire's AI handle conversations declaratively, RELAY gives you **imperative, event-driven control** over every aspect of a call.
+Relay is SignalWire's real-time WebSocket protocol for programmatic call control. While the agent-based approach ([AgentBase][ref-agentbase] + SWML) lets SignalWire's AI handle conversations declaratively, Relay gives you **imperative, event-driven control** over every aspect of a call.
 
-#### When to Use RELAY vs Agents
+#### When to Use Relay vs Agents
 
 | Approach | B
```
- **modified** `fern/products/server-sdks/pages/reference/python/rest/fabric/relay-applications/index.mdx` → /docs/server-sdks/reference/python/rest/fabric/relay-applications ("Relay Applications") (+9/-9)
```diff
@@ -1,7 +1,7 @@
 ---
-title: "RELAY Applications"
+title: "Relay Applications"
 slug: /reference/python/rest/fabric/relay-applications
-description: Manage RELAY application resources via the Fabric namespace.
+description: Manage Relay application resources via the Fabric namespace.
 max-toc-depth: 3
 ---
 
@@ -13,7 +13,7 @@ max-toc-depth: 3
 [delete]: /docs/server-sdks/reference/python/rest/fabric/relay-applications/delete
 [listaddresses]: /docs/server-sdks/reference/python/rest/fabric/relay-applications/list-addresses
 
-Manage RELAY application resources. Standard CRUD with PUT updates and address listing.
+Manage Relay application resources. Standard CRUD with PUT updates and address listing.
 
 Access via `client.fabric.relay_applications` on a [`RestClient`][restclient] instance.
 
@@ -33,21 +33,21 @@ items = client.fabric.relay_applications.list()
 
 <CardGroup cols={3}>
   <Card title="list" href="/docs/server-sdks/reference/python/rest/fabric/relay-applications/list">
-    List RELAY application resources.
+    List Relay application resources.
   </Card>
   <Card title="create" href="/docs/server-sdks/reference/python/rest/fabric/relay-applications/create">
-    Create 
```
- **modified** `fern/products/browser-sdk/pages/v2/reference/call.mdx` (+1/-1)
- **modified** `fern/products/browser-sdk/pages/v2/reference/relay-client.mdx` (+7/-7)
- **modified** `fern/products/browser-sdk/pages/v3/guides/video/getting-started-with-the-signalwire-video/index.mdx` (+1/-1)
- **modified** `fern/products/browser-sdk/pages/v3/guides/video/zoom-clone-2/index.mdx` (+1/-1)
- **modified** `fern/products/call-flow-builder/pages/nodes/stop_call_recording.mdx` → /docs/call-flow-builder/reference/stop-call-recording ("Stop Call Recording") (+1/-1)
- **modified** `fern/products/call-flow-builder/pages/nodes/voicemail_recording.mdx` → /docs/call-flow-builder/reference/voicemail-recording ("Voicemail Recording") (+1/-1)
- **modified** `fern/products/platform/pages/ai/get-started/no-code-agents.mdx` → /docs/platform/ai/no-code-agents ("No-code agent") (+1/-1)
- **modified** `fern/products/platform/pages/ai/overview.mdx` → /docs/platform/ai ("SignalWire AI") (+1/-1)
- **modified** `fern/products/platform/pages/calling/fax/overview.mdx` → /docs/platform/fax ("First steps with fax") (+1/-1)
- **modified** `fern/products/platform/pages/calling/voice/TTS/azure.mdx` → /docs/platform/voice/tts/azure ("Azure") (+2/-2)
- **modified** `fern/products/platform/pages/calling/voice/TTS/cartesia.mdx` → /docs/platform/voice/tts/cartesia ("Cartesia") (+2/-2)
- **modified** `fern/products/platform/pages/calling/voice/TTS/deepgram.mdx` → /docs/platform/voice/tts/deepgram ("Deepgram") (+2/-2)
- **modified** `fern/products/platform/pages/calling/voice/TTS/elevenlabs.mdx` → /docs/platform/voice/tts/elevenlabs ("ElevenLabs") (+2/-2)
- **modified** `fern/products/platform/pages/calling/voice/TTS/google.mdx` → /docs/platform/voice/tts/gcloud ("Google Cloud") (+2/-2)
- **modified** `fern/products/platform/pages/calling/voice/TTS/openai.mdx` → /docs/platform/voice/tts/openai ("OpenAI") (+2/-2)

And 105 more changed files, not shown individually:
- 10 files under `fern/products/server-sdks/pages/reference/python/relay/call/`
- 10 files under `fern/products/server-sdks/pages/reference/typescript/relay/call/`
- 8 files under `fern/products/server-sdks/pages/reference/typescript/relay/client/`
- 7 files under `fern/products/server-sdks/pages/reference/typescript/rest/fabric/relay-applications/`
- 6 files under `fern/products/server-sdks/pages/reference/python/relay/client/`
- 6 files under `fern/products/server-sdks/pages/reference/python/rest/fabric/relay-applications/`
- 4 files under `fern/products/server-sdks/pages/reference/python/relay/`
- 4 files under `fern/products/server-sdks/pages/reference/python/rest/calling/`
- 4 files under `fern/products/server-sdks/pages/reference/typescript/relay/`
- 4 files under `fern/products/server-sdks/pages/reference/typescript/rest/calling/`
- 3 files under `fern/products/server-sdks/pages/reference/python/agents/function-result/`
- 3 files under `fern/products/server-sdks/pages/reference/python/rest/phone-numbers/`
- 3 files under `fern/products/server-sdks/pages/reference/typescript/rest/phone-numbers/`
- 3 files under `fern/products/swml/pages/reference/methods/calling/`
- 2 files under `fern/products/platform/pages/calling/voice/`
- 2 files under `fern/products/server-sdks/pages/reference/python/agents/configuration/`
- 2 files under `fern/products/server-sdks/pages/reference/typescript/agents/configuration/`
- 1 file under `fern/products/platform/pages/calling/voice/TTS/`
- 1 file under `fern/products/platform/pages/messaging/chat/`
- 1 file under `fern/products/platform/pages/messaging/sms/`
- 1 file under `fern/products/server-sdks/pages/guides/manage-resources/`
- 1 file under `fern/products/server-sdks/pages/reference/python/core/`
- 1 file under `fern/products/server-sdks/pages/reference/python/relay/message/`
- 1 file under `fern/products/server-sdks/pages/reference/python/rest/fabric/`
- 1 file under `fern/products/server-sdks/pages/reference/typescript/agents/function-result/`
- 1 file under `fern/products/server-sdks/pages/reference/typescript/core/`
- 1 file under `fern/products/server-sdks/pages/reference/typescript/relay/message/`
- 1 file under `fern/products/server-sdks/pages/reference/typescript/rest/fabric/`
- 1 file under `fern/products/server-sdks/`
- 1 file under `fern/products/swml/pages/guides/basics/`
- 1 file under `fern/products/swml/pages/guides/get-started/`
- 1 file under `fern/products/swml/pages/guides/recipes/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai_sidecar/`
- 1 file under `fern/snippets/common/dashboard/`
- 1 file under `fern/snippets/server-sdks/`
- 1 file under `specs/signalwire-rest/calling-api/calls/models/`
- 1 file under `specs/signalwire-rest/fabric-api/relay-applications/addresses/`
- 1 file under `specs/signalwire-rest/fabric-api/relay-applications/`
- 1 file under `specs/signalwire-rest/`
- 1 file under `specs/signalwire-rest/message-api/messages/models/`
- 1 file under `specs/swml/calling/Methods/join_room/`

---

### PR #541 — chore: remove comment that tested republish

Author: hey-august · Merged: 2026-08-05T21:05:34Z · 1 docs files changed

## Description

Remove JSX-style comment from homepage

Changed files:
- **modified** `fern/products/home/pages/welcome.mdx` → /docs/ ("SignalWire Documentation") (+0/-1)
```diff
@@ -8,7 +8,6 @@ layout: custom
 ---
 
 <Markdown src="/snippets/llms-hint.mdx" />
-{/* cache-bust 2026-08-05: force fresh render after Fern js-yaml incident */}
 
 <div class="lp-page-container">
   <div class="main-content">
```

---

### PR #540 — Add comment to homepage to force fresh render after Fern js-yaml incident

Author: hey-august · Merged: 2026-08-05T20:53:05Z · 1 docs files changed

## Description

Add JSX-style comment to homepage

Changed files:
- **modified** `fern/products/home/pages/welcome.mdx` → /docs/ ("SignalWire Documentation") (+1/-0)
```diff
@@ -8,6 +8,7 @@ layout: custom
 ---
 
 <Markdown src="/snippets/llms-hint.mdx" />
+{/* cache-bust 2026-08-05: force fresh render after Fern js-yaml incident */}
 
 <div class="lp-page-container">
   <div class="main-content">
```

---

### PR #538 — Rewrite the E911 platform guide to use new native, self-service REST endpoint

Author: hey-august · Merged: 2026-08-06T16:49:17Z · 3 docs files changed

## Description

Now that native E911 REST endpoints are live, the platform E911 guide no longer needs to tell people to file a support ticket. 

This PR rewrites `/docs/platform/e911` around the self-service process: 
- create a carrier-validated emergency address
- assign it to a number
- wait for `e911_status` to become `active` 

The doc uses Fern's built-in endpoint snippet components so the examples render from the OpenAPI spec and can't drift, and it links heavily into the generated E911 Addresses reference. 

### Also added:
- An Info callout that covers setting `EmergencyAddressSid` via the Compatibility API
- A brief Dashboard section that covers the E911 tab and per-number assignment. 

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [x] Documentation update
- [ ] Code cleanup / refactor

## Related Issues

#537 

## Testing

Verified with `fern docs md check` and `fern generate --docs --preview` (0 errors); snippets, links, and anchors checked on a preview deploy

- [ ] Added/updated unit tests
- [ ] Tested manually
- [ ] Tested with live SignalWire credentials (if applicable)

## Checklist

- [x] I have read the [CONTRIBUTING](CONTRIBUTING.md) guidelines
- [x] My code follows the project's style guidelines
- [x] I have added tests for my changes (if applicable)
- [x] I have updated documentation (if applicable)
- [x] All existing tests pass

Changed files:
- **modified** `fern/products/platform/pages/platform/phone-numbers/e911.mdx` → /docs/platform/e911 ("E911") (+91/-36)
```diff
@@ -2,53 +2,108 @@
 id: 5286e8ea-58ec-472a-8645-ade919b8449b
 title: E911
 slug: /e911
-x-custom:
-  ported_from_readme: true
+description: Register an emergency address and enable E911 service for your SignalWire phone numbers.
+max-toc-depth: 3
 ---
 
-### What is E911?
+**E911, or Enhanced 911,** is a support system for wireless and VoIP phone users who dial 911,
+the standard number for requesting help in an emergency across supported countries.
+Because a VoIP number isn't tied to a physical line,
+you register a street address for the number ahead of time.
+When someone dials 911 from that number,
+the call is routed to the dispatch center serving the registered address,
+and that address is displayed to the dispatcher.
 
-**E911, or Enhanced 911,** is a support system for wireless and VoIP phone users who dial 911, the standard number for requesting help in an emergency across supported countries. 
-Since wireless users are often mobile, this enhancement helps the 911 service by allowing the location of the user to be reported to the call receiver.
+E911 on SignalWire is self-service:
+create an emergency address, assign it to a phone number,
+and the number is provisioned f
```
- **modified** `fern/products/platform/pages/platform/phone-numbers/overview.mdx` → /docs/platform/phone-numbers ("Phone numbers") (+1/-1)
```diff
@@ -87,4 +87,4 @@ You can delete a number group from its settings page. Deleting the group will ca
 
 ## E911
 
-Manage addresses for emergency services in the **E911** tab. See [What is E911?](/docs/platform/e911) for setup and testing instructions.
+Create and manage emergency addresses in the **E911** tab, then assign one to a number from its detail page. See the [E911 guide](/docs/platform/e911) for setup and testing instructions, or use the [REST API](/docs/apis/rest/e-911-addresses/list-addresses) to manage E911 programmatically.
```
- **modified** `fern/products/platform/pages/platform/setup/porting-into-signalwire.mdx` → /docs/platform/porting-into-signalwire ("Port phone numbers to SignalWire") (+1/-1)
```diff
@@ -12,7 +12,7 @@ You can port any number (wireless or business landline) to SignalWire.
 
 <Info>
 
-If requesting E911 capabilities for numbers, please reach out to SignalWire prior to submitting the order or in the port order itself.
+E911 registrations don't transfer with a port. Once your port completes, assign an emergency address to the number like any other SignalWire number — see the [E911 guide](/docs/platform/e911).
 
 </Info>
 
```

---

### PR #536 — Document 6 new TTS engines

Author: hey-august · Merged: 2026-08-05T17:26:02Z · 12 docs files changed

## Description

Add six new TTS engines:
- `groq-tts` (Groq-hosted Orpheus, replacing the retired `playai-turbo`)
- `mistral` (Voxtral)
- `grok` (xAI)
- `smallest` (Waves Lightning)
- `fish` (Fish Audio)
- `speechify`

Engine facts (models, defaults, voices, languages) were verified against the platform source.

### Summary of additions and changes

- Adds a reference page per engine, following the Inworld/MiniMax page structure, each with a voice widget.
- Updates the voices landing page (link refs, language notes, voice-ID table) and removes the provider logo-grid hero image, which was stale.
- Extends the engine list in the SWML `ai.languages` reference and in the TypeSpec spec, with regenerated `openapi.yaml` and SWML JSON schema.
  - Also adds the previously missing `amazon`, `azure`, and `openai` entries.
- Refreshes the SDK voice guide's engine table (adds the missing Inworld and MiniMax rows plus the six new engines), fixes its dead absolute links, and replaces the subjective engine-comparison table with a pointer to the landing page.
- Deprecates Rime's EOL `arcana` model in favor of `coda` across pages and examples.
- Notes that cloned/custom voices are available only for ElevenLabs, enabled via support request.

> [!NOTE]
> The groq-tts, mistral, smallest, fish, and speechify widgets may render empty until the CDN voice catalog adds those engines.

> [!NOTE]
> The Mistral examples use a `myvoice` placeholder because Mistral's hosted API re

Changed files:
- **added** `fern/products/platform/pages/calling/voice/TTS/fish.mdx` → /docs/platform/voice/tts/fish ("Fish Audio") (+169/-0)
```diff
@@ -0,0 +1,169 @@
+---
+title: Fish Audio
+subtitle: Text-to-speech
+slug: /voice/tts/fish
+description: Learn how to use Fish Audio's marketplace and cloned TTS voices with SignalWire AI Voice applications.
+max-toc-depth: 3
+---
+
+
+import { VoiceWidget } from "@/components/index";
+
+Fish Audio is a text-to-speech engine with a large voice marketplace, voice cloning, and
+automatic language detection across dozens of languages.
+
+## Models
+
+SignalWire supports the following Fish Audio models.
+See [Fish Audio's documentation](https://docs.fish.audio/) for more detail.
+
+| Model | Description |
+|-------|-------------|
+| `s2.1-pro` | **Default.** Latest-generation model |
+| `s2-pro` | Previous-generation pro model |
+| `s1` | First-generation model |
+| `s2.1-pro-free` | Free developer tier of `s2.1-pro` |
+
+## Voices
+
+Press play to audition any Fish Audio voice, then **copy config** to grab the value for SWML or your SDK.
+
+<VoiceWidget provider="fish" />
+
+A Fish Audio voice ID is a **reference ID** — a long hexadecimal string found on the voice's page
+in the Fish Audio marketplace. The default voice is Energetic Male
+(`802e3bc2b27e49c2995d23ef70e6ac89`).
+
+<Warn
```
- **added** `fern/products/platform/pages/calling/voice/TTS/groq-tts.mdx` → /docs/platform/voice/tts/groq-tts ("Groq") (+189/-0)
```diff
@@ -0,0 +1,189 @@
+---
+title: Groq
+subtitle: Text-to-speech
+slug: /voice/tts/groq-tts
+description: Learn how to use Groq-hosted Orpheus TTS voices with SignalWire AI Voice applications.
+max-toc-depth: 3
+---
+
+
+import { VoiceWidget } from "@/components/index";
+
+Groq hosts Canopy Labs' Orpheus text-to-speech models, offering fast, expressive voices
+in English and Arabic.
+
+<Info>
+The `groq-tts` engine replaces the retired `playai-turbo` engine.
+If you were using `playai-turbo` voices, switch to `groq-tts` with one of the voices below.
+</Info>
+
+## Models
+
+SignalWire supports the following Orpheus models on Groq.
+See [Groq's text-to-speech documentation](https://console.groq.com/docs/text-to-speech) for more detail.
+
+| Model | Description |
+|-------|-------------|
+| `canopylabs/orpheus-v1-english` | **Default.** English voices |
+| `canopylabs/orpheus-arabic-saudi` | Arabic (Saudi dialect) voices. The shorthand `arabic` also selects this model |
+
+<Warning>
+The Arabic model requires accepting Canopy Labs' model terms in the
+[Groq console](https://console.groq.com/) for the account making the requests.
+Requests fail until the terms are accepted.
+</Warning>
+
```
- **added** `fern/products/platform/pages/calling/voice/TTS/mistral.mdx` → /docs/platform/voice/tts/mistral ("Mistral") (+172/-0)
```diff
@@ -0,0 +1,172 @@
+---
+title: Mistral
+subtitle: Text-to-speech
+slug: /voice/tts/mistral
+description: Learn how to use Mistral's Voxtral TTS voices with SignalWire AI Voice applications.
+max-toc-depth: 3
+---
+
+
+import { VoiceWidget } from "@/components/index";
+
+Mistral's Voxtral text-to-speech models deliver realistic, emotionally expressive
+multilingual speech with low latency.
+
+## Models
+
+| Model | Description |
+|-------|-------------|
+| `voxtral-mini-tts-latest` | **Default.** Latest Voxtral Mini TTS model |
+
+Model IDs are passed through to Mistral directly, so newer Voxtral TTS models work as soon as
+Mistral releases them. See
+[Mistral's text-to-speech documentation](https://docs.mistral.ai/capabilities/audio/text_to_speech)
+for current models.
+
+## Voices
+
+Press play to audition any Mistral voice, then **copy config** to grab the value for SWML or your SDK.
+
+<VoiceWidget provider="mistral" />
+
+Voice IDs are passed through to Mistral's hosted voice library — a voice named `myvoice`
+becomes `mistral.myvoice` in the [voice string](#usage).
+Find the available voices in
+[Mistral AI Studio](https://console.mistral.ai/) under **Audio › Text-to-speech**.
```
- **added** `fern/products/platform/pages/calling/voice/TTS/smallest.mdx` → /docs/platform/voice/tts/smallest ("Smallest.ai") (+177/-0)
```diff
@@ -0,0 +1,177 @@
+---
+title: Smallest.ai
+subtitle: Text-to-speech
+slug: /voice/tts/smallest
+description: Learn how to use Smallest.ai's Waves Lightning TTS voices with SignalWire AI Voice applications.
+max-toc-depth: 3
+---
+
+
+import { VoiceWidget } from "@/components/index";
+
+Smallest.ai's Waves platform offers fast Lightning text-to-speech voices with especially
+strong coverage of Indian languages.
+
+## Models
+
+SignalWire supports the following Waves Lightning models.
+
+| Model | Description |
+|-------|-------------|
+| `lightning_v3.1` | **Default.** Fast, low-latency model |
+| `lightning_v3.1_pro` | Higher-quality model |
+
+## Voices
+
+Press play to audition any Smallest.ai voice, then **copy config** to grab the value for SWML or your SDK.
+
+<VoiceWidget provider="smallest" />
+
+Smallest.ai provides roughly 250 voices in the Waves catalog. A voice's name is its voice ID —
+for example, `sophia` (the default, an American English female voice) becomes `smallest.sophia`
+in the [voice string](#usage).
+
+Browse the catalog in Smallest.ai's platform and documentation:
+
+<CardGroup cols={2}>
+	<Card title="Waves platform" icon="regular waveform-lines" href="ht
```
- **added** `fern/products/platform/pages/calling/voice/TTS/speechify.mdx` → /docs/platform/voice/tts/speechify ("Speechify") (+169/-0)
```diff
@@ -0,0 +1,169 @@
+---
+title: Speechify
+subtitle: Text-to-speech
+slug: /voice/tts/speechify
+description: Learn how to use Speechify's Simba TTS voices with SignalWire AI Voice applications.
+max-toc-depth: 3
+---
+
+
+import { VoiceWidget } from "@/components/index";
+
+Speechify is a text-to-speech engine offering natural voices built on its Simba model family.
+
+## Models
+
+SignalWire supports the following Speechify models.
+See [Speechify's documentation](https://docs.sws.speechify.com/) for more detail.
+
+| Model | Description |
+|-------|-------------|
+| `simba-3.0` | **Default.** Current-generation multilingual model |
+| `simba-3.2` | English-only model with the lowest latency |
+| `simba-english` | Legacy English model |
+| `simba-multilingual` | Legacy multilingual model |
+
+<Warning>
+Model availability varies per voice and per workspace — an unavailable voice and model
+pairing fails. Test your combination before deploying.
+</Warning>
+
+## Voices
+
+Press play to audition any Speechify voice, then **copy config** to grab the value for SWML or your SDK.
+
+<VoiceWidget provider="speechify" />
+
+Speechify voice IDs come from its voice list API (for example, `a
```
- **added** `fern/products/platform/pages/calling/voice/TTS/grok.mdx` → /docs/platform/voice/tts/grok ("Grok") (+132/-0)
- **modified** `fern/products/platform/pages/calling/voice/TTS/index.mdx` → /docs/platform/voice/tts ("Voices and languages") (+21/-6)
- **modified** `fern/products/platform/pages/calling/voice/TTS/rime.mdx` → /docs/platform/voice/tts/rime ("Rime") (+12/-19)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/voice-language.mdx` → /docs/server-sdks/guides/voice-language ("Voice & Language") (+20/-38)
- **modified** `fern/products/server-sdks/pages/reference/python/agents/agent-base/add-language.mdx` → /docs/server-sdks/reference/python/agents/agent-base/add-language ("add_language") (+1/-1)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/languages/index.mdx` → /docs/swml/reference/calling/ai/languages ("languages") (+3/-3)
- **modified** `specs/swml/calling/Methods/ai/ai_languages.tsp` (+4/-3)

---

### PR #535 — TTS: state that only catalog voices resolve; document custom/cloned voice options

Author: hey-august · Merged: 2026-08-05T16:48:34Z · 3 docs files changed

## Description

The Cartesia and ElevenLabs TTS pages presented a voice-string format and catalog table without saying anything about custom or cloned voices, and since catalog voice IDs are opaque UUIDs, readers naturally assumed any valid provider voice ID would work. Instead, it fails at call time with an audible fallback. 

This PR adds a warning to both provider pages stating that only voices from SignalWire's catalog resolve and that voice IDs from your own provider account will not work, adds a new page (`/voice/tts/custom-voices`) documenting the supported options (ElevenLabs voice import is available by request through Support; Cartesia custom voices are not supported), and links it from the TTS index. 

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [x] Documentation update
- [ ] Code cleanup / refactor

## Related Issues

Closes #518.

## Testing

`yarn fern-md-check` passes (all 2811 MDX files valid).

- [ ] Added/updated unit tests
- [ ] Tested manually
- [ ] Tested with live SignalWire credentials (if applicable)

## Checklist

- [x] I have read the [CONTRIBUTING](CONTRIBUTING.md) guidelines
- [x] My code follows the project's style guidelines
- [x] I have added tests for my changes (if applicable)
- [x] I have updated documentation (if applicable)
- [x] All existing tests pass

Changed files:
- **modified** `fern/products/platform/pages/calling/voice/TTS/cartesia.mdx` → /docs/platform/voice/tts/cartesia ("Cartesia") (+6/-0)
```diff
@@ -37,6 +37,12 @@ All Cartesia voices can be used with any model.
 
 ## Voices
 
+<Warning>
+Only voices from SignalWire's catalog below resolve on the platform. Voice IDs from your own
+Cartesia account — including custom or cloned voices — will not work.
+See [Custom and cloned voices](/docs/platform/voice/tts#custom-and-cloned-voices) for details.
+</Warning>
+
 Press play to audition any Cartesia voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="cartesia" />
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/elevenlabs.mdx` → /docs/platform/voice/tts/elevenlabs ("ElevenLabs") (+7/-0)
```diff
@@ -23,6 +23,13 @@ Consult ElevenLabs' documentation for an up-to-date list of available models and
 
 ## Voices
 
+<Warning>
+Only voices from SignalWire's catalog below resolve on the platform. Voice IDs from your own
+ElevenLabs account — including custom or cloned voices — will not work by default.
+ElevenLabs voice import is available by request:
+see [Custom and cloned voices](/docs/platform/voice/tts#custom-and-cloned-voices) for details.
+</Warning>
+
 Press play to audition any ElevenLabs voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="elevenlabs" />
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/index.mdx` → /docs/platform/voice/tts ("Voices and languages") (+23/-2)
```diff
@@ -40,6 +40,10 @@ Choose a provider to browse and audition its full voice catalog. Press play to a
 grab the engine and voice values for your SWML or SDK code. Each provider's complete voice list
 lives on its reference page, linked in the table below.
 
+Only voices from SignalWire's catalog resolve on the platform — voice IDs from your own provider
+account will not work. See [Custom and cloned voices](#custom-and-cloned-voices)
+for supported options.
+
 <VoiceWidget groupBy="none" />
 
 ## Compare providers and models
@@ -108,9 +112,26 @@ For detailed instructions for each provider, consult the voice ID references lin
 | OpenAI          | `openai.alloy`                                  | [Reference](/docs/platform/voice/tts/openai#usage)           |
 | Rime            | `rime.luna:arcana`                              | [Reference](/docs/platform/voice/tts/rime#voices)            |
 
-<br/>
+## Custom and cloned voices
 
----
+SignalWire's TTS integrations run on SignalWire's own accounts with each provider.
+When you set a voice string like `elevenlabs.<voice_id>` or `cartesia.<voice_id>:<model>`,
+SignalWire resolves the voice ID against its own provider account —
+not yours.
```

---

### PR #534 — Add server-rendered llms.txt discovery hints for AI agents

Author: hey-august · Merged: 2026-08-05T00:02:04Z · 10 docs files changed

## Description

Fern's built-in AI-agent directive (a hidden `sr-only` div on every page) tells agents to fetch the docs index "at the root level at /llms.txt". But on our subpath custom domain, that link isn't right; the index actually lives at [signalwire.com/docs/llms.txt](https://signalwire.com/docs/llms.txt). 

The div isn't configurable from `docs.yml` and is rendered by Fern's cloud frontend, so this PR ships our own correct hints in server-rendered HTML (visible to non-JS fetchers like Claude's).

An open [bug report](https://github.com/fern-api/fern/issues/17322) alerted Fern that the built-in hint should be `basePath`-aware.

Two mechanisms, all additive and easy to remove once Fern fixes their side:

1. A minimal `llms.txt` navbar link — a plain server-rendered anchor, also useful to humans.
2. A visually-hidden hint block (`fern/snippets/llms-hint.mdx`) included on the landing page and each product's entry page, wrapped in `<llms-ignore>` so it stays out of the `.md`/llms.txt output that already carries the correct directive via `agents.page-directive`.

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update
- [ ] Code cleanup / refactor

## Related Issues

https://github.com/fern-api/fern/issues/17322

## Testing

<!-- How did you test your changes? -->

- [ ] Added/updated unit tests
- [ ] Tested manually
- [ ] Tested with live SignalWire credentials (if applicable)

## Checklist

- 

Changed files:
- **modified** `fern/docs.yml` (+3/-0)
```diff
@@ -126,6 +126,9 @@ logo:
   href: /docs
 
 navbar-links:
+  - type: minimal
+    text: llms.txt
+    href: https://signalwire.com/docs/llms.txt
   - type: minimal
     text: Log in
     href: https://signalwire.com/signin
```
- **modified** `fern/products/apis/pages/core/overview.mdx` → /docs/apis/ ("Overview") (+2/-0)
```diff
@@ -4,6 +4,8 @@ title: Overview
 slug: /
 ---
 
+<Markdown src="/snippets/llms-hint.mdx" />
+
 Welcome to the SignalWire REST API. Every capability on the platform — placing calls, sending messages, managing phone numbers, running video rooms, building AI agents — is reachable through a consistent set of HTTP endpoints under your Space's subdomain.
 
 Requests and responses are JSON over HTTPS, authenticated with your Project ID and API token. Endpoints follow standard [REST](https://en.wikipedia.org/wiki/REST) conventions: predictable resource URLs, conventional HTTP verbs, and structured status codes for every outcome — including errors.
```
- **modified** `fern/products/browser-sdk/pages/v4/guides/getting-started/overview.mdx` (+2/-0)
```diff
@@ -6,6 +6,8 @@ position: 1
 max-toc-depth: 3
 ---
 
+<Markdown src="/snippets/llms-hint.mdx" />
+
 The SignalWire Browser SDK puts voice, video, and chat in a browser
 without plugins, downloads, or a media server you have to run. It also integrates with
 powerful AI agents, [SWML](/docs/swml), and all telephony and communication services SignalWire provides.
```
- **modified** `fern/products/call-flow-builder/pages/core/overview.mdx` → /docs/call-flow-builder/ ("Call Flow Builder") (+2/-0)
```diff
@@ -9,6 +9,8 @@ slug: /
 max-toc-depth: 3
 ---
 
+<Markdown src="/snippets/llms-hint.mdx" />
+
 ## Introduction
 
 Call Flow Builder is a no-code visual tool for creating and managing voice applications directly in the Dashboard.
```
- **modified** `fern/products/compatibility-api/pages/cxml/core/overview.mdx` (+2/-0)
```diff
@@ -6,6 +6,8 @@ slug: /
 position: 0
 ---
 
+<Markdown src="/snippets/llms-hint.mdx" />
+
 The SignalWire Compatibility API provides a seamless migration path from Twilio* to SignalWire. If you've built applications using Twilio's TwiML, REST API, or helper libraries, you can transition to SignalWire with minimal code changes while gaining access to SignalWire's powerful infrastructure and competitive pricing.
 
 
```
- **modified** `fern/products/home/pages/welcome.mdx` → /docs/ ("SignalWire Documentation") (+2/-0)
```diff
@@ -7,6 +7,8 @@ hide-toc: true
 layout: custom
 ---
 
+<Markdown src="/snippets/llms-hint.mdx" />
+
 <div class="lp-page-container">
   <div class="main-content">
     {/* Dashed Pattern */}
```
- **modified** `fern/products/platform/pages/getting-started.mdx` → /docs/platform/getting-started ("Get started") (+2/-0)
```diff
@@ -6,6 +6,8 @@ slug: getting-started
 position: 0
 ---
 
+<Markdown src="/snippets/llms-hint.mdx" />
+
 SignalWire is a programmable unified communications platform that unifies voice, messaging, video, and AI into a single control plane.
 SignalWire's APIs and SDKs enable developers to build state-of-the-art realtime communication experiences without needing to
 manage complex telecom infrastructure or stitch together disconnected tools.
```
- **modified** `fern/products/server-sdks/pages/guides/getting-started/overview.mdx` → /docs/server-sdks/ ("SignalWire SDKs") (+2/-0)
```diff
@@ -7,6 +7,8 @@ position: 0
 max-toc-depth: 3
 ---
 
+<Markdown src="/snippets/llms-hint.mdx" />
+
 [installation]: /docs/server-sdks/guides/installation
 [quick-start]: /docs/server-sdks/guides/quickstart
 [development-environment]: /docs/server-sdks/guides/dev-environment
```
- **modified** `fern/products/swml/pages/get-started/index.mdx` → /docs/swml/ ("Introduction to SWML") (+1/-0)
```diff
@@ -9,6 +9,7 @@ slug: /
 max-toc-depth: 3
 ---
 
+<Markdown src="/snippets/llms-hint.mdx" />
 
 SWML is a markup and scripting language for quickly writing powerful communication applications in YAML or JSON documents. SWML is easy to use, and enables you to create powerful voice and messaging applications using a descriptive format.
 
```
- **added** `fern/snippets/llms-hint.mdx` (+3/-0)
```diff
@@ -0,0 +1,3 @@
+<llms-ignore>
+  <div className="llms-hint" aria-hidden="true">For AI agents: the complete SignalWire documentation index is at https://signalwire.com/docs/llms.txt. Append /llms.txt to any URL for a section-level index, or .md to any page URL for its markdown version.</div>
+</llms-ignore>
```

---

### PR #533 — Document status callbacks as advisory notifications, not realtime triggers

Author: hey-august · Merged: 2026-08-04T21:28:59Z · 30 docs files changed

## Description

Status callbacks are not built to be reliable realtime signals for critical actions. Until now, the docs did not clarify this, and the platform webhooks page implied the opposite ("react to each state change as it happens").

### Changes/Additions

**Canonical posture section:** The platform Webhooks doc gets a new "Status callbacks are advisory" section (`#status-callback-reliability` for quick linking). It declares that callbacks are asynchronous, best-effort notifications whose failure mode is invisible to the receiver (a missed callback simply never arrives), so time-critical and business-critical actions must not gate solely on receiving one. It describes and links the alternatives with visible failure modes:

- **RELAY over WebSocket:** events arrive over a persistent connection, so disconnection is detectable and the client can fail safe
- **REST polling and reconciliation:** treat a callback as a hint: confirm state via `GET` before acting, sweep for missed callbacks (Compatibility API retrieve-a-call / retrieve-a-message; voice-logs / message-logs on the SignalWire REST API, which has no GET-call endpoint)
- **In-call flow logic:** SWML `connect` result variables, cXML `<Dial>` `action` URL

**Shared advisory snippet:** Added a new `fern/snippets/common/_status-callback-advisory.mdx` (`<Note>`), which is embedded immediately after the status-callback heading on every page that documents them: 
- cXML webhooks guide (voice + SMS sections)

Changed files:
- **modified** `fern/products/compatibility-api/pages/cxml/guides/webhooks/common-webhook-errors.mdx` → /docs/compatibility-api/guides/common-webhook-errors ("Common webhook errors") (+4/-2)
```diff
@@ -7,9 +7,11 @@ Below are some examples of common errors that you might encounter when using web
 
 ## HTML retrieval error (error code 11200)
 
-HTML Retrieval Errors happen when there is a failure to retrieve the contents of the URL in your webhook. This indicates that SignalWire tried to reach your URL but did not receive a response before the connection timed out. Our current timeouts are 2 seconds for Connect and 5 seconds for Read, and we retry twice once the connection times out.
+HTML Retrieval Errors happen when there is a failure to retrieve the contents of the URL in your webhook. This indicates that SignalWire tried to reach your URL but did not receive a response before the connection timed out. Our current timeouts are 2 seconds for Connect and 5 seconds for Read.
 
-SignalWire automatically retries HTTP retrieval requests. If it's an action type of webhook, SignalWire won't attempt a retry but will go to the fallback URL (on inbound calls, can specify an action URL and a fallback URL). If it's a status callback webhook, SignalWire will retry three times, and back off slightly between each attempt. So the second one will retry very quickly, and for the third retry, t
```
- **modified** `fern/products/compatibility-api/pages/cxml/guides/webhooks/index.mdx` → /docs/compatibility-api/guides/webhooks ("Compatibility API Webhooks") (+8/-0)
```diff
@@ -41,10 +41,14 @@ You will receive an incoming voice call webhook request when you have your webho
 
 ### Status Callback
 
+<Markdown src="/snippets/common/_status-callback-advisory.mdx" />
+
 When one of your SignalWire phone numbers receives a call or is used to place an outgoing call, you can have asynchronous HTTP requests sent to your server that tell you about the status changes and the call details. You can do this by setting the `StatusCallback` parameter when [placing an outbound call](/docs/compatibility-api/rest/calls/create-a-call) through the API.
 
 SignalWire will send you a status callback when the call is completed unless directed otherwise; you can use the events `initiated`, `ringing`, `answered`, and `completed` in the `StatusCallbackEvent` parameter in order to get updates when each of those statuses is reached.
 
+For time-critical logic during the call itself, prefer the `<Dial>` [`action` URL](/docs/compatibility-api/cxml/reference/voice/dial#dial_action), which receives the dial outcome as part of document execution.
+
 ### Recording Status Callback
 
 If you are recording your voice calls, you may notice that the recording is not always instantly availa
```
- **modified** `fern/products/platform/pages/platform/core/webhooks/index.mdx` → /docs/platform/webhooks ("Webhooks") (+31/-1)
```diff
@@ -86,7 +86,7 @@ Click **Edit Settings**. Under **Inbound Call Settings** (or **Inbound Message S
 ## Status callbacks to keep track of events
 
 Status callbacks are asynchronous HTTP requests SignalWire sends to your server as a call, 
-message, or recording moves through its lifecycle, so your application can react to each state change as it happens.
+message, or recording moves through its lifecycle, keeping your application informed of each state change.
 
 ```mermaid
 flowchart LR
@@ -117,6 +117,36 @@ A status of **Sent** means the message left SignalWire successfully.
 MMS messages do not support DLRs, so they only ever show **Sent**.
 </Info>
 
+### Status callbacks are advisory [#status-callback-reliability]
+
+Status callbacks are best-effort notifications, not a reliable realtime signal.
+They are delivered asynchronously over HTTP, so a callback can arrive late, arrive after a retry,
+or not arrive at all — if your server is unreachable when SignalWire sends the request, the
+callback is simply lost, and nothing notifies your application that it was missed.
+Because a missed callback is invisible to the receiver, never gate time-critical or
+business-critical actions (
```
- **added** `fern/snippets/common/_status-callback-advisory.mdx` (+5/-0)
```diff
@@ -0,0 +1,5 @@
+{/* Shared component: Status callback advisory */}
+
+<Note title="Status callbacks are advisory">
+Status callbacks are asynchronous, best-effort HTTP notifications: delivery can be delayed or fail silently — if your server is unreachable, the callback simply never arrives. Don't gate time-critical or business-critical actions solely on receiving one. Confirm state via the REST API before acting, or use a transport with visible failure modes — see [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
+</Note>
```
- **modified** `specs/compatibility-api/calls/models/webhooks.tsp` (+4/-0)
```diff
@@ -13,6 +13,8 @@ import "../../../_shared/webhook/decorator.tsp";
 
   Use `StatusCallbackEvent` to receive every call progress event — not just the final status —
   along with current call state and all parameters below.
+
+  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
   """)
 model VoiceStatusCallbackPayload {
   @doc("The unique ID of the project this call is associated with.")
@@ -190,6 +192,8 @@ model VoiceStatusCallbackPayload {
   | `in-progress` | The recording has begun. |
   | `completed` | The file is available for access. |
   | `absent` | The recording was too short or the call was silent — no audio was detected. |
+
+  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
   """)
 model RecordingStatusCallbackPayload {
   @doc("The unique ID of the project this call is associated with
```
- **modified** `specs/signalwire-rest/calling-api/calls/models/webhooks.tsp` (+4/-0)
```diff
@@ -8,6 +8,8 @@ namespace SignalWireAPI.Calling;
   Sent to your `status_url` when the call's transcription is ready.
   `calling.transcript.completed` includes the transcribed text;
   `calling.transcript.failed` means the call could not be transcribed.
+
+  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
   """)
 model TranscribeStatusCallbackPayload {
   @doc("Whether the transcription completed or failed.")
@@ -51,6 +53,8 @@ model Tran
```
- **modified** `fern/products/compatibility-api/pages/cxml/messaging/overview.mdx` → /docs/compatibility-api/cxml/reference/messaging ("Messaging Overview") (+2/-0)
- **modified** `fern/products/compatibility-api/pages/cxml/voice/overview.mdx` → /docs/compatibility-api/cxml/reference/voice ("Voice Overview") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/connect/index.mdx` → /docs/swml/reference/calling/connect ("connect") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/detect_machine.mdx` → /docs/swml/reference/calling/detect-machine ("detect_machine") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/enter_queue.mdx` → /docs/swml/reference/calling/enter-queue ("enter_queue") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/join_conference.mdx` → /docs/swml/reference/calling/join-conference ("join_conference") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/pay/index.mdx` → /docs/swml/reference/calling/pay ("pay") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/play/index.mdx` → /docs/swml/reference/calling/play ("play") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/prompt.mdx` → /docs/swml/reference/calling/prompt ("prompt") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/receive_fax.mdx` → /docs/swml/reference/calling/receive-fax ("receive_fax") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/record.mdx` → /docs/swml/reference/calling/record ("record") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/record_call.mdx` → /docs/swml/reference/calling/record-call ("record_call") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/send_fax.mdx` → /docs/swml/reference/calling/send-fax ("send_fax") (+2/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/send_sms.mdx` → /docs/swml/reference/calling/send-sms ("send_sms") (+2/-0)

And 10 more changed files, not shown individually:
- 4 files under `fern/products/swml/pages/reference/methods/calling/`
- 1 file under `fern/products/swml/pages/reference/methods/messaging/`
- 1 file under `specs/compatibility-api/incoming-phone-numbers/models/`
- 1 file under `specs/compatibility-api/messages/models/`
- 1 file under `specs/compatibility-api/transcriptions/models/`
- 1 file under `specs/signalwire-rest/message-api/messages/models/`
- 1 file under `specs/signalwire-rest/relay-rest/campaign-registry/models/`

---

### PR #531 — Remove host example from RELAY client guide. Not needed

Author: NoahConder · Merged: 2026-08-06T19:36:00Z · 1 docs files changed

## Description

Removes the `host` parameter from the Relay client guide and examples.

External users never need to set `host`, because it defaults to `relay.signalwire.com`, which is correct for all public-cloud customers. 

The old examples also showed `your-space.signalwire.com` as the value, which is not a valid Relay host.

The `host` parameter remains documented in the SDK reference (`relay/client`), where the default and `SIGNALWIRE_SPACE` env var are covered.

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [X] Documentation update
- [ ] Code cleanup / refactor

## Testing

<!-- How did you test your changes? -->

- [ ] Added/updated unit tests
- [X] Tested manually
- [ ] Tested with live SignalWire credentials (if applicable)

## Checklist

- [X] I have read the [CONTRIBUTING](CONTRIBUTING.md) guidelines
- [X] My code follows the project's style guidelines
- [ ] I have added tests for my changes (if applicable)
- [X] I have updated documentation (if applicable)
- [X] All existing tests pass

Changed files:
- **modified** `fern/products/server-sdks/pages/guides/make-and-receive-calls/overview.mdx` → /docs/server-sdks/guides/relay-client ("Relay Client") (+3/-8)
```diff
@@ -52,7 +52,6 @@ from signalwire.relay import RelayClient
 client = RelayClient(
     project="your-project-id",
     token="your-api-token",
-    host="your-space.signalwire.com",
     contexts=["default"],
 )
 
@@ -73,7 +72,6 @@ import { RelayClient } from '@signalwire/sdk';
 const client = new RelayClient({
   project: 'your-project-id',
   token: 'your-api-token',
-  host: 'your-space.signalwire.com',
   contexts: ['default'],
 });
 
@@ -257,8 +255,8 @@ The RELAY client supports two authentication methods:
 
 | Language | Syntax |
 |----------|--------|
-| Python | `RelayClient(project="...", token="...", host="...")` |
-| TypeScript | `new RelayClient({ project: '...', token: '...', host: '...' })` |
+| Python | `RelayClient(project="...", token="...")` |
+| TypeScript | `new RelayClient({ project: '...', token: '...' })` |
 {/*
 
 | Go | `relay.NewClient(relay.WithProjectID("..."), relay.WithAPIToken("..."), relay.WithHost("..."))` |
@@ -275,7 +273,6 @@ The RELAY client supports two authentication methods:
 client = RelayClient(
     project="your-project-id",
     token="your-api-token",
-    host="your-space.signalwire.com",
 )
 ```
 
@@ -284,7 +281,6 @@ client = RelayClie
```

---

### PR #490 — Enhance AI documentation with best practices and tool calling guidance

Author: Devon-White · Merged: 2026-08-10T17:37:35Z · 49 docs files changed

Restructures the AI platform section around tool calling and production best practices. Closes #489.

## What changed

- **New guide: Tool calling** (`/ai/tool-calling`) — the mental model (the AI agent is the front end, your code owns the business logic), how a SWAIG function works, a complete order-status agent in SWML and the Python Server SDK, and five patterns for reliable SWAIG functions.
- **Rewrote Best practices** (`/ai/best-practices`) — restructured around the prompt/code split, writing for real-time voice (end-pointing and turnaround), speech-recognition hints, testing and monitoring with post-prompt reports, and TCPA compliance, ending with a complete worked example that shows the request/response exchange.
- **AI overview** — renamed the Agents SDK section to Server SDKs, added a "How does it work?" section with a theme-paired light/dark flow diagram (SVG pair + CSS-only `.light-only`/`.dark-only` rules in `styles.css`).
- **Capabilities** — added "Ways to build AI agents" cards and an "AI in the media path" section explaining the single-engine architecture and what it does for response time.
- **Prompt engineering pages** — cross-linked to the tool calling guide, fixed stale `/docs/swml/reference/ai` paths, standardized "Next steps" sections.
- Completed the "Agents SDK" → "Server SDKs" rename across platform, server-sdks, and SWML pages.
- Removed the now-orphaned `ai-agent.svg`.

Changed files:
- **modified** `fern/products/platform/pages/ai/get-started/capabilities/index.mdx` → /docs/platform/ai/capabilities ("AI platform") (+252/-181)
```diff
@@ -2,184 +2,238 @@
 id: ec1d338d-9a57-4256-bb95-fd50df79a14a
 title: AI platform
 slug: /ai/capabilities
-description: Learn about the capabilities of SignalWire's AI platform, including natural language processing, voice technology, business applications, advanced features, multi-channel intelligence, real-time analytics, and security.
+description: How SignalWire's AI platform works, from the ways to build agents and AI in the media path to conversation intelligence, analytics, integrations, and compliance.
+max-toc-depth: 3
 ---
 
-## Introduction
+SignalWire's AI platform is a single system for building and deploying conversational AI.
+It orchestrates voice, video, and messaging on one platform, with native integrations for the major LLM,
+Text-to-Speech, and Speech-to-Text providers.
+Functions execute serverlessly during live conversations, in parallel and asynchronously where needed,
+and a global edge network with points of presence in every major region keeps latency low.
+Security, compliance, logging, and analytics are part of the platform rather than add-ons.
 
-SignalWire's AI platform is a unified system for building and deploying conversational AI solutions.
-The p
```
- **modified** `fern/products/platform/pages/ai/guides/best-practices-for-ai/index.mdx` → /docs/platform/ai/best-practices ("Best practices for creating a SignalWire AI agent") (+511/-664)
```diff
@@ -1,721 +1,568 @@
 ---
-id: e6af1926-c844-48ea-a33c-692d47245973
 title: Best practices for creating a SignalWire AI agent
 sidebar-title: Best practices
 slug: /ai/best-practices
-author: Devon White
-x-custom:
-  tags:
-    - getting-started
-    - favorite
-    - sdk:swml
-    - product:ai
-    - product:voice
-description: |
-  This guide offers a detailed overview of best 
-  practices to make sure your SignalWire Agent operates 
-  effectively.
+description: Best practices for designing SignalWire AI agents that are consistent, responsive, and production-ready.
+max-toc-depth: 3
 ---
 
-## **Overview**
-
-When designing an AI Agent with SignalWire, it's crucial to achieve a harmonious balance between clarity,
-efficiency, and adaptability.
-The following guide offers a detailed overview of best practices
-to make sure your SignalWire Agent operates effectively and offers a user-friendly experience.
-
----
-
-## **"End-Pointing" and "Turnaround"**
-
-When using SignalWire products to design interaction between AI systems and humans, 
-you'll likely encounter the important concepts of **"end-pointing"** and **"turnaround."**
- - **End-pointing, or "end-of-utterance detection"
```
- **modified** `fern/products/platform/pages/ai/guides/content-redaction/index.mdx` → /docs/platform/ai/content-redaction ("Handling sensitive content") (+392/-80)
```diff
@@ -1,35 +1,346 @@
 ---
-title: Redacting sensitive content
-sidebar-title: Content redaction
+title: Handling sensitive content
+sidebar-title: Sensitive content
 slug: /ai/content-redaction
-author: Devon White
-x-custom:
-  tags:
-    - product:ai
-    - product:voice
-    - sdk:swml
 description: |
-  Mask credit card numbers, PII, and other sensitive content from your
-  AI agent's logs, events, webhooks, and call records — without changing
-  the conversation itself.
+  Keep card numbers, account numbers, and other sensitive values out of your
+  AI agent's context and records, using payment collection, DTMF prompts,
+  scoped state, and content redaction.
 max-toc-depth: 3
 ---
 
-[ai-params]: /docs/swml/reference/calling/ai/params
 [redact-prompt]: /docs/swml/reference/calling/ai/params#paramsredact_prompt
 [auto-correct]: /docs/swml/reference/calling/ai/params#paramsauto_correct
 [utility-model]: /docs/swml/reference/calling/ai/params#paramsutility_model
 [text-normalization]: /docs/swml/reference/calling/ai/params#text-normalization-values
-[prompt-engineering]: /docs/platform/ai/prompt-engineering
-[hipaa]: /docs/platform/compliance/hipaa
+[tool-calling]: /docs/platform/
```
- **added** `fern/products/platform/pages/ai/guides/tool-calling/index.mdx` → /docs/platform/ai/tool-calling ("Tool calling") (+583/-0)
```diff
@@ -0,0 +1,583 @@
+---
+title: Tool calling
+slug: /ai/tool-calling
+description: Connect your AI agent to your backend with tool calls, so that your code owns business logic, live data, and decisions.
+subtitle: The AI runs the conversation. Your code runs the business.
+max-toc-depth: 3
+---
+
+[best-practices]: /docs/platform/ai/best-practices
+[prompt-engineering]: /docs/platform/ai/prompt-engineering
+[swaig-guide]: /docs/swml/guides/swaig
+[swaig-functions]: /docs/swml/reference/calling/ai/swaig/functions
+[ai-reference]: /docs/swml/reference/calling/ai
+[ai-languages]: /docs/swml/reference/calling/ai/languages
+[sdk-functions]: /docs/server-sdks/guides/defining-functions
+[sdk-swaig]: /docs/server-sdks/guides/swaig
+[sdk-datamap]: /docs/server-sdks/guides/data-map
+[swml-datamap]: /docs/swml/guides/data-map
+[result-actions]: /docs/server-sdks/guides/result-actions
+[state-management]: /docs/server-sdks/guides/state-management
+[contexts-workflows]: /docs/server-sdks/guides/contexts-workflows
+[toggle-functions]: /docs/swml/guides/toggle-functions
+[context-switch]: /docs/swml/guides/context-switch
+[swaig-webhook]: /docs/apis/rest/calls/webhooks/ai-swaig-tool-webhook
+[swai
```
- **removed** `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/includes/index.mdx` (+0/-452)
```diff
@@ -1,452 +0,0 @@
----
-id: 456ebc16-6a1a-4266-baaf-8b2559d55988
-slug: /reference/calling/amazon-bedrock/swaig/includes
-title: Includes
-sidebar-title: includes
-description: Remote function signatures to include in SWAIG functions.
-max-toc-depth: 3
----
-
-[swaig-functions]: /docs/swml/reference/calling/amazon-bedrock/swaig/functions#properties
-[webhook-response]: /docs/swml/reference/calling/amazon-bedrock/swaig/functions#webhook-response
-[webhook-request]: /docs/swml/reference/calling/amazon-bedrock/swaig/functions#callback-request-for-web_hook_url
-[request-flow]: #request-flow
-
-Remote function signatures to include in SWAIG functions. Will allow you to include functions that are defined in a remote location
-that can be executed during the interaction with the Amazon Bedrock agent. To learn more about how includes works see the
-[request flow][request-flow] section.
-
-## **Properties**
-
-<ParamField path="SWAIG.includes" type="object[]" toc={true}>
-  An array of objects that accept the following properties.
-</ParamField>
-
-<Indent>
-
-<ParamField path="includes[].url" type="string" required={true} toc={true}>
-  URL where the remote functions are defined. Authentic
```
- **modified** `fern/docs.yml` (+5/-0)
- **modified** `fern/products/apis/apis.yml` (+2/-0)
- **modified** `fern/products/platform/pages/ai/get-started/no-code-agents.mdx` → /docs/platform/ai/no-code-agents ("No-code agent") (+15/-23)
- **modified** `fern/products/platform/pages/ai/guides/prompt-engineering/best-practices.mdx` → /docs/platform/ai/prompt-engineering/best-practices ("Prompt writing techniques") (+230/-142)
- **modified** `fern/products/platform/pages/ai/guides/prompt-engineering/index.mdx` → /docs/platform/ai/prompt-engineering ("Prompt engineering") (+154/-194)
- **modified** `fern/products/platform/pages/ai/guides/prompt-engineering/prompt-areas.mdx` → /docs/platform/ai/prompt-engineering/where-to-apply ("Where to apply prompt engineering") (+251/-182)
- **modified** `fern/products/platform/pages/ai/overview.mdx` → /docs/platform/ai ("SignalWire AI") (+115/-63)
- **modified** `fern/products/platform/pages/calling/index.mdx` → /docs/platform/calling ("Calling") (+1/-1)
- **modified** `fern/products/platform/pages/getting-started.mdx` → /docs/platform/getting-started ("Get started") (+27/-25)
- **modified** `fern/products/platform/pages/platform/compliance/tcpa.mdx` → /docs/platform/compliance/tcpa ("TCPA") (+4/-4)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/architecture.mdx` → /docs/server-sdks/guides/architecture ("Architecture") (+3/-3)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/lifecycle.mdx` → /docs/server-sdks/guides/lifecycle ("Request Lifecycle") (+1/-1)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/mcp-gateway.mdx` → /docs/server-sdks/guides/mcp-gateway ("MCP Gateway") (+1/-1)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/security.mdx` → /docs/server-sdks/guides/security ("Security") (+2/-2)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/state-management.mdx` → /docs/server-sdks/guides/state-management ("State Management") (+1/-1)

And 29 more changed files, not shown individually:
- 3 files under `fern/snippets/swml/`
- 2 files under `fern/products/server-sdks/pages/reference/python/agents/configuration/`
- 2 files under `fern/products/server-sdks/pages/reference/typescript/agents/configuration/`
- 2 files under `fern/products/server-sdks/pages/reference/typescript/agents/`
- 1 file under `fern/products/server-sdks/pages/guides/getting-started/`
- 1 file under `fern/products/server-sdks/pages/reference/python/agents/agent-base/`
- 1 file under `fern/products/server-sdks/pages/reference/python/agents/cli/`
- 1 file under `fern/products/server-sdks/pages/reference/python/agents/`
- 1 file under `fern/products/server-sdks/pages/reference/typescript/agents/agent-base/`
- 1 file under `fern/products/swml/pages/get-started/`
- 1 file under `fern/products/swml/pages/guides/get-started/`
- 1 file under `fern/products/swml/pages/guides/swaig/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/functions/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/includes/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/ai/prompt/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/functions/ai_swaig.data_map/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/functions/`
- 1 file under `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/`
- 1 file under `specs/signalwire-rest/calling-api/calls/`
- 1 file under `specs/signalwire-rest/calling-api/calls/models/`
- 1 file under `specs/swml/calling/Methods/amazon_bedrock/swaig/`

## Output

Return one entry per pull request above, including `skip` entries — the tier
call is auditable, so nothing is silently dropped. Return only a JSON object
matching this shape, with no markdown fences around it:

{
  "entries": [
    {
      "pr": 123,
      "tier": "notable" | "minor" | "skip",
      "product": "calling" | "swml" | "platform" | "server-sdks" | "browser-sdks" | "apis" | "compatibility-api" | "call-flow-builder" | "other",
      "entry_title": "Sentence-case title naming the change, not the week. Null when tier is skip.",
      "entry_body": "1-3 sentences, second person, present tense. Customer-facing prose. Null when tier is skip.",
      "support_detail": "What specifically changed and what it means for a Support conversation. More detail than entry_body, internal audience. Null when tier is skip.",
      "pages": [{ "path": "fern/...", "url": "/docs/... or null", "status": "added" | "modified" | "removed" | "renamed" }],
      "confidence": 0.0,
      "reasoning": "Why this tier."
    }
  ]
}
