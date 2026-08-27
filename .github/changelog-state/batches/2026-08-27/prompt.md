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
between 2026-08-18 and 2026-08-27.

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

### PR #621 — Decouple SWML schemas from REST operation models

Author: Devon-White · Merged: 2026-08-24T21:11:43Z · 21 docs files changed

## Summary

- replace direct Calling and Messaging SWML document references in REST operations with open object schemas
- keep the full Calling and Messaging schemas in OpenAPI as unreferenced components through a service-level `SWMLDocument` union
- expose a shallow AI Agent model with reusable descriptions and links to the canonical SWML reference
- add compact manual request and success-response examples wherever REST operations carry AI or SWML data
- cover AI Agents, Call Flows and versions, SWML Scripts, generic Fabric resources, and inline SWML Call commands
- include both Calling and Messaging SWML Script variants without expanding the complete SWML or AI graphs

## Validation

- `yarn build:specs`
- TypeSpec formatting check
- validated 77 emitted manual media examples against their OpenAPI request or response schemas
- validated all 26 embedded SWML documents against the emitted Calling or Messaging draft-2020-12 JSON Schema
- validated shallow AI Agent configurations against the canonical SWML `AIObject` definition
- confirmed `SWMLDocument`, `SWML.Calling.SWMLObject`, and `SWML.Messaging.SWMLObject` emit under `components.schemas`
- confirmed none of those schemas are referenced from operations
- `git diff --check`
- local `fern check` reached the final FDR redirects comparison; FDR returned 403, so CI will perform that remote check

Changed files:
- **added** `specs/signalwire-rest/fabric-api/_shared/examples.tsp` (+131/-0)
```diff
@@ -0,0 +1,131 @@
+import "./const.tsp";
+import "./enums.tsp";
+
+const FABRIC_RESOURCE_ID_EXAMPLE = "993ed018-9e79-4e50-b97b-984bd5534095";
+const FABRIC_PROJECT_ID_EXAMPLE = "1313fe58-5e14-4c11-bbe7-6fdfa11fe780";
+const FABRIC_CREATED_AT_EXAMPLE = utcDateTime.fromISO("2024-05-06T12:20:00Z");
+const FABRIC_UPDATED_AT_EXAMPLE = utcDateTime.fromISO("2024-05-06T12:25:00Z");
+
+const AI_AGENT_REQUEST_EXAMPLE = #{
+  prompt: #{ text: "You are a helpful customer support assistant." },
+  name: "Support Assistant",
+};
+
+const AI_AGENT_EXAMPLE = #{
+  prompt: #{ text: "You are a helpful customer support assistant." },
+  agent_id: "a87db7ed-8ebe-42e4-829f-8ba5a4152f54",
+  name: "Support Assistant",
+};
+
+const AI_AGENT_RESPONSE_EXAMPLE = #{
+  id: FABRIC_RESOURCE_ID_EXAMPLE,
+  project_id: FABRIC_PROJECT_ID_EXAMPLE,
+  display_name: "Support Assistant",
+  type: FabricResponseType.AiAgent,
+  created_at: FABRIC_CREATED_AT_EXAMPLE,
+  updated_at: FABRIC_UPDATED_AT_EXAMPLE,
+  ai_agent: AI_AGENT_EXAMPLE,
+};
+
+const CALL_FLOW_EXAMPLE = #{
+  id: FABRIC_RESOURCE_ID_EXAMPLE,
+  title: "Welcome Call Flow",
+  flow_data: #{},
+  relayml: SWML_CONTENTS_EXAMPLE,
+  document_version: 1,
+};
```
- **modified** `specs/signalwire-rest/fabric-api/ai-agent/models/core.tsp` (+108/-8)
```diff
@@ -1,15 +1,9 @@
 import "./enums.tsp";
-import "./ai/main.tsp";
-
 import "../../../types";
-
-// Import SWML AI types for reuse
 import "../../../../swml/calling/Methods/ai/main.tsp";
 
 using TypeSpec.Http;
 
-using SWML.Calling;
-
 model AIAgentPathID {
   @doc("Unique ID of an AI Agent.")
   @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
@@ -18,8 +12,114 @@ model AIAgentPathID {
 }
 
 @summary("AI Agent")
-@doc("An AI Agent configuration that extends the SWML AI object with additional API-specific properties.")
-model AIAgent is AIObject {
+@doc("""
+  ${SWML.Calling.aiDescription}
+
+  See the [SWML `ai` method reference](/docs/swml/reference/calling/ai) for the complete configuration contract.
+  """)
+model AIAgent {
+  // TODO(https://github.com/signalwire/cloud-product/issues/20538): Re-enable
+  // when the Fabric AI Agent API persists this SWML property.
+  /*
+  @doc("""
+    ${SWML.Calling.aiGlobalDataDescription}
+
+    See [`ai.global_data` in the SWML reference](/docs/swml/reference/calling/ai#aiglobal_data).
+    """)
+  @example(#{ company_name: "Acme Corp", support_hours: "9am-5pm EST" })
+  global_data?: TypeSpec.Record<unknown>;
+  */
+
+  @doc("""
+    ${SW
```
- **modified** `specs/signalwire-rest/fabric-api/call-flows/main.tsp` (+51/-0)
```diff
@@ -8,6 +8,7 @@ import "./addresses";
 import "./versions";
 import "../../types";
 import "../tags.tsp";
+import "../_shared/examples.tsp";
 import "../../../_shared/alias/token-permissions.tsp";
 
 using TypeSpec.Http;
@@ -26,6 +27,18 @@ namespace SignalWireAPI.Fabric.CallFlows {
       
       ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
       """)
+    @opExample(
+      #{
+        returnType: #{
+          links: #{
+            self: "https://example.signalwire.com/api/fabric/resources/call_flows?page_number=0&page_size=50",
+            first: "https://example.signalwire.com/api/fabric/resources/call_flows?page_number=0&page_size=50",
+          },
+          data: #[CALL_FLOW_RESPONSE_EXAMPLE],
+        },
+      },
+      #{ title: "Call flow list", description: "A page containing one Call Flow." }
+    )
     list():
       | CallFlowListResponse
       | StatusCode401
@@ -39,6 +52,10 @@ namespace SignalWireAPI.Fabric.CallFlows {
       
       ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
       """)
+    @opExample(
+      #{ returnType: #{ statusCode: 200, call_flow: CALL_FLOW_RESPONSE_EXAMPLE } },
+      #{ title: "Call flow", desc
```
- **modified** `specs/signalwire-rest/fabric-api/swml-scripts/main.tsp` (+116/-0)
```diff
@@ -7,12 +7,41 @@ import "./models/errors.tsp";
 import "./addresses";
 import "../../types";
 import "../tags.tsp";
+import "../_shared/examples.tsp";
 import "../../../_shared/alias/token-permissions.tsp";
 
 using TypeSpec.Http;
 using TypeSpec.OpenAPI;
 using Types.StatusCodes;
 
+const CreateCallingSwmlScriptExample = #{
+  parameters: #{
+    request: #{
+      name: "Welcome Script",
+      script_type: "calling",
+      contents: SWML_CONTENTS_EXAMPLE,
+    }
+  },
+  returnType: #{
+    statusCode: 200,
+    swml_script: CALLING_SWML_SCRIPT_RESPONSE_EXAMPLE,
+  },
+};
+
+const CreateMessagingSwmlScriptExample = #{
+  parameters: #{
+    request: #{
+      name: "Reply Bot",
+      script_type: "messaging",
+      contents: SWML_MESSAGING_CONTENTS_EXAMPLE,
+    }
+  },
+  returnType: #{
+    statusCode: 200,
+    swml_script: MESSAGING_SWML_SCRIPT_RESPONSE_EXAMPLE,
+  },
+};
+
 @route("/resources/swml_scripts")
 namespace SignalWireAPI.Fabric.SwmlScripts {
   @tag(SWML_SCRIPTS_TAG)
@@ -25,6 +54,21 @@ namespace SignalWireAPI.Fabric.SwmlScripts {
       
       ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
       """)
+    @opExample(
+      #{
+        retur
```
- **modified** `specs/swml/calling/Methods/ai/main.tsp` (+56/-34)
```diff
@@ -11,68 +11,90 @@ using TypeSpec.JsonSchema;
 
 namespace SWML.Calling;
 
+const aiDescription: string = """
+  Creates an AI agent that conducts voice conversations using automatic speech recognition (ASR),
+  large language models (LLMs), and text-to-speech (TTS) synthesis.
+  The agent processes caller speech in real-time, generates contextually appropriate responses,
+  and can execute custom functions to interact with external systems through SignalWire AI Gateway (SWAIG).
+  """;
+
+const aiGlobalDataDescription: string = """
+  A key-value object for storing data that persists throughout the AI session.
+  Can be set initially in the SWML script or modified during the conversation using the set_global_data action.
+  The global_data object is accessible everywhere in the AI session: prompts, AI parameters,
+  and SWML returned from SWAIG functions. Access properties using template strings (e.g. \${global_data.property_name}).
+  """;
+
+const aiHintsDescription: string = "Hints help the AI agent understand certain words or phrases better. Words that can commonly be misinterpreted can be added to the hints to help the AI speak more accurately.";
+
+const aiLanguagesDescript
```
- **modified** `specs/signalwire-rest/calling-api/calls/models/examples.tsp` (+4/-16)
- **modified** `specs/signalwire-rest/calling-api/calls/models/requests.tsp` (+17/-9)
- **modified** `specs/signalwire-rest/fabric-api/ai-agent/main.tsp` (+41/-0)
- **modified** `specs/signalwire-rest/fabric-api/ai-agent/models/requests.tsp` (+4/-2)
- **modified** `specs/signalwire-rest/fabric-api/call-flows/models/core.tsp` (+1/-3)
- **modified** `specs/signalwire-rest/fabric-api/call-flows/models/requests.tsp` (+2/-4)
- **modified** `specs/signalwire-rest/fabric-api/call-flows/models/responses.tsp` (+1/-3)
- **modified** `specs/signalwire-rest/fabric-api/call-flows/versions/main.tsp` (+40/-0)
- **modified** `specs/signalwire-rest/fabric-api/call-flows/versions/models/responses.tsp` (+2/-4)
- **modified** `specs/signalwire-rest/fabric-api/resources/main.tsp` (+42/-0)
- **modified** `specs/signalwire-rest/fabric-api/swml-scripts/models/core.tsp` (+2/-5)
- **modified** `specs/signalwire-rest/fabric-api/swml-scripts/models/requests.tsp` (+4/-4)
- **modified** `specs/signalwire-rest/main.tsp` (+1/-0)
- **added** `specs/signalwire-rest/swml-document.tsp` (+14/-0)
- **modified** `specs/signalwire-rest/webhooks/calling/main.tsp` (+0/-1)

And 1 more changed file, not shown individually:
- 1 file under `specs/signalwire-rest/webhooks/messaging/`

---

### PR #616 — Fix a few stray voice ids missing engine declaration

Author: hey-august · Merged: 2026-08-19T19:14:01Z · 1 docs files changed

## Description

I did another sweep and caught a few additional voice IDs that were listed without a declared engine.

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [x] Documentation update
- [ ] Code cleanup / refactor

## Related Issues

Adds to: #578 
Finishes: #577

Changed files:
- **modified** `fern/products/platform/pages/calling/voice/TTS/google.mdx` → /docs/platform/voice/tts/gcloud ("Google Cloud") (+4/-4)
```diff
@@ -115,11 +115,11 @@ can change.
 
 Unlike the other supported engines, Google Cloud voice identifier strings include both voice and language keys,
 following the pattern `<language>-<model>-<variant>`.
-For example:
+Prefixed with the engine, complete voice strings look like this:
 
-- English (UK) WaveNet female voice: `en-GB-Wavenet-A`
-- Spanish (Spain) Neural2 male voice: `es-ES-Neural2-B`
-- Mandarin Chinese Standard female voice: `cmn-CN-Standard-D`
+- English (UK) WaveNet female voice: `gcloud.en-GB-Wavenet-A`
+- Spanish (Spain) Neural2 male voice: `gcloud.es-ES-Neural2-B`
+- Mandarin Chinese Standard female voice: `gcloud.cmn-CN-Standard-D`
 
 ---
 
```

---

### PR #614 — docs: add LLM equivalents for Call Flow screenshots

Author: Devon-White · Merged: 2026-08-21T21:04:15Z · 22 docs files changed

## Summary

- hide Call Flow Builder canvas screenshots from Markdown exports
- preserve node topology, output-connector routing, variables, and configuration as text
- cover procedural builder screenshots and provider-specific TTS selections
- add local/manual deployed-preview assertions for all 22 affected routes and complex branch behavior; the checker is intentionally not wired into CI

## Scope

This is PR 5 in the stacked implementation for #388 and depends on #613.

## Validation

- yarn test:scripts
- yarn fern-md-check
- git diff --check
- yarn check-llm-exports <preview-url> passed for all 122 manifest routes
- source audit confirms every rendered Call Flow image is inside llms-ignore

Refs #388

Changed files:
- **modified** `fern/products/call-flow-builder/pages/core/overview.mdx` → /docs/call-flow-builder/ ("Call Flow Builder") (+34/-0)
```diff
@@ -27,6 +27,12 @@ You can easily add, remove, and rearrange elements in the call flow using the vi
 
 </llms-ignore>
 
+<llms-only>
+
+Sample topology: **Handle Call** → **Answer Call** → **Gather Input**. Pressing `1` plays a busy message and records voicemail; pressing `2` connects to AI Agent `Ally`; **Unknown** and **No Input** route to another voicemail recording. Both voicemail paths and the AI Agent end at **Hang Up Call**.
+
+</llms-only>
+
 Add or remove any element from the call flow by dragging it into the desired location,
 and define links between them using the connection lines.
 
@@ -85,6 +91,11 @@ After creating the call flow, the Call Flow will show up in the list of call flo
 
 </llms-ignore>
 
+<llms-only>
+
+In the Dashboard, open **Tools** > **Call Flow Builder**, select **Add New**, enter a name, and select **Save**.
+
+</llms-only>
 
 ---
 
@@ -101,6 +112,11 @@ From here, click on the `Edit` option to open the Call Flow Builder page.
 
 </llms-ignore>
 
+<llms-only>
+
+On the Call Flow list, open the flow's **More Options** menu and select **Edit**.
+
+</llms-only>
 
 #### Add a node
 When you first open a new Call Flow, you will see a canvas with a single n
```
- **modified** `fern/products/call-flow-builder/pages/core/version.mdx` → /docs/call-flow-builder/guides/version ("Versioning") (+30/-0)
```diff
@@ -14,10 +14,20 @@ and to revert to a previous version if needed.
 Once a Call Flow has been created, you can click on the `Version History` button located in the top left corner of the Call Flow Builder interface.
 This will open a panel showing all the versions of the call flow, along with a timestamp of when the version was created.
 
+<llms-ignore>
+
 <Frame caption="Opening the version history of a Call Flow.">
   ![Opening the version history of a Call Flow.](/assets/images/call-flow/version_button.webp)
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+Select **Version History** in the top-left of the builder to open the version panel and its timestamped entries.
+
+</llms-only>
+
 ---
 
 ## Deploy a new version
@@ -27,10 +37,20 @@ Once you are satisfied with the new version, you can click the `Deploy` button t
 When a new version is saved, it will add a new entry to the version history. The name of the
 version will be `+1` from the previous version. E.g. `Version 1.0`, `Version 2.0`, `Version 3.0`, etc.
 
+<llms-ignore>
+
 <Frame caption="Deploying a new version of a Call Flow.">
   ![Deploying a new version of a Call Flow.](/assets/images/call-flow/deploy_version.webp)
 </Fr
```
- **modified** `fern/products/call-flow-builder/pages/nodes/forward_to_phone.mdx` → /docs/call-flow-builder/reference/forward-to-phone ("Forward to Phone") (+30/-0)
```diff
@@ -98,12 +98,22 @@ phone number, ensuring that the person receiving the forwarded call will see the
 If the forward is successful, the call connects directly. If the call fails for any reason (no answer, busy, declined, or error), the flow routes to **Hang Up Call**.
 This approach is particularly useful for business scenarios where you want to maintain transparency about who is calling.
 
+<llms-ignore>
+
 <Frame caption="Forward call while preserving original caller ID" ogImage>
 
 ![A Call Flow that uses the Forward to Phone node to forward the call while preserving the original caller ID.](/assets/images/call-flow/nodes/forward-from-original-example.webp)
 
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+Flow topology: **Handle Call** → **Forward to Phone**, with **From** set to `%{call.from}`. **Success** completes the forward; **No Answer**, **Busy**, **Decline**, and **Error** converge on **Hang Up Call**.
+
+</llms-only>
+
 
 ### Forward to SIP
 
@@ -115,12 +125,22 @@ For example:
 If the endpoint is unavailable, the flow will follow one of the four failed routes depending on the SIP signaling that is received. 
 You can give individual actions for each signal, or route them
```
- **modified** `fern/products/call-flow-builder/pages/nodes/gather_input.mdx` → /docs/call-flow-builder/reference/gather-input ("Gather Input") (+28/-0)
```diff
@@ -94,25 +94,45 @@ For every input option you can configure, an output node connection will be crea
 You can choose to accept both Speech and DTMF tones with your IVR. 
 The caller in this example can either press 1 or say “sales” to connect with the sales line.
 
+<llms-ignore>
+
 <Frame caption="Gather input as speech or DTMF and send call to the selected channel.">
 
 ![Gather Input node example that accepts both DTMF and speech input.](/assets/images/call-flow/nodes/simple-input.webp)
 
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+Flow topology: **Handle Call** → **Answer Call** → **Gather Input**. Option 1 (press `1` or say `sales`) routes to **Forward to Phone** at `sip:sales@example.com`; Option 2 (press `2` or say `support`) routes to `sip:support@example.com`. **Unknown** and **No Input** remain separate outputs.
+
+</llms-only>
+
 ### Input with infinite loop prevention
 
 If you plan to loop your “No Input” route, you probably want to disconnect a call if the Gather Input node attempts to loop the call more than 2 times. 
 You can do that with a combination of a [Set Variables](/docs/call-flow-builder/reference/set-variables) node 
 and a [Conditions](/docs/call-flow-b
```
- **modified** `fern/products/call-flow-builder/pages/nodes/voicemail_recording.mdx` → /docs/call-flow-builder/reference/voicemail-recording ("Voicemail Recording") (+30/-0)
```diff
@@ -51,10 +51,20 @@ For a traditional voicemail experience, we recommend pairing the Voicemail Recor
 [Play Audio or TTS](/docs/call-flow-builder/reference/play-audio-or-tts) node and including a beep before recording. 
 Including a terminator (in this case, a `#` sign) will allow nodes to run after the caller is finished leaving their voicemail.
 
+<llms-ignore>
+
 <Frame caption="Play TTS and record voicemail." ogImage>
 ![Play TTS and record voicemail.](/assets/images/call-flow/nodes/simple-voicemail.webp)
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+Route **Forward to Phone**'s **No Answer**, **Busy**, **Decline**, and **Error** outputs to an unavailable-message **Play Audio or TTS** node → **Voicemail Recording** → a thank-you **Play Audio or TTS** node. Enable the recording beep, use `#` as the terminator, and save WAV format.
+
+</llms-only>
+
 ---
 
 ### Record voicemail and send recording URL as a POST request
@@ -64,10 +74,20 @@ Please note that any later recordings in the Flow will overwrite the `%{record_u
 so the Request node should immediately follow this Voicemail Recording node or use 
 [Set Variables](/docs/call-flow-builder/reference/set-variables) to save this U
```
- **modified** `fern/products/call-flow-builder/pages/core/variables.mdx` → /docs/call-flow-builder/guides/variables ("Variables") (+20/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/ai_agent.mdx` → /docs/call-flow-builder/reference/ai-agent ("AI Agent") (+10/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/answer_call.mdx` → /docs/call-flow-builder/reference/answer-call ("Answer Call") (+10/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/conditions.mdx` → /docs/call-flow-builder/reference/conditions ("Conditions") (+10/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/execute_swml.mdx` → /docs/call-flow-builder/reference/execute-swml ("Execute SWML") (+10/-1)
- **modified** `fern/products/call-flow-builder/pages/nodes/handle_call.mdx` → /docs/call-flow-builder/reference/handle-call ("Handle Call") (+10/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/hangup_call.mdx` → /docs/call-flow-builder/reference/hangup-call ("Hang Up Call") (+10/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/play_audio_or_tts.mdx` → /docs/call-flow-builder/reference/play-audio-or-tts ("Play Audio or TTS") (+10/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/request.mdx` → /docs/call-flow-builder/reference/request ("Request") (+19/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/send_sms.mdx` → /docs/call-flow-builder/reference/send-sms ("Send SMS") (+20/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/set_variables.mdx` → /docs/call-flow-builder/reference/set-variables ("Set Variables") (+9/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/start_call_recording.mdx` → /docs/call-flow-builder/reference/start-call-recording ("Start Call Recording") (+10/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/stop_call_recording.mdx` → /docs/call-flow-builder/reference/stop-call-recording ("Stop Call Recording") (+10/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/unset_variables.mdx` → /docs/call-flow-builder/reference/unset-variables ("Unset Variables") (+10/-0)
- **modified** `fern/products/platform/pages/calling/voice/SIP/byoc/index.mdx` → /docs/platform/voice/sip/bring-your-own-carrier ("Bring your own carrier") (+20/-0)

And 2 more changed files, not shown individually:
- 2 files under `fern/products/platform/pages/calling/voice/TTS/`

---

### PR #613 — docs: add LLM equivalents for Dashboard screenshots

Author: Devon-White · Merged: 2026-08-21T21:01:59Z · 43 docs files changed

## Summary

- hide Dashboard and related instructional screenshots and their expiring image URLs from Markdown exports
- add page-specific text equivalents for navigation, settings, wizard state, and the two legacy SWML Dashboard screenshots
- share only the nine identical TTS assignment blocks
- add local/manual deployed-preview assertions for every affected route and key workflow; the checker is intentionally not wired into CI

## Scope

This is PR 4 in the stacked implementation for #388 and depends on #612. The final audit also found and covered five screenshots stored outside the `/assets/images/dashboard/` path: three WireStarter/SWSH captures and two legacy SWML Dashboard captures.

## Validation

- yarn test:scripts
- yarn fern-md-check
- git diff --check
- yarn check-llm-exports <preview-url> after the Fern preview deploys
- source audit confirms every Dashboard image reference is inside llms-ignore
- the manual checker rejects presigned image URLs on every tested route

Refs #388

Changed files:
- **modified** `fern/products/compatibility-api/pages/cxml/guides/receiving-your-first-sms.mdx` → /docs/compatibility-api/guides/receive-sms ("Receiving your first SMS") (+30/-0)
```diff
@@ -57,10 +57,20 @@ which allows you to generate scripts dynamically.
 Navigate to the "Resources" tab from the sidebar and create a new Resource.
 There, select the resource type of "Script", and pick "cXML script".
 
+<llms-ignore>
+
 <Frame>
   ![Create a new cXML script.](/assets/images/dashboard/resources/new-cxml-bin.webp)
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+In **My Resources**, select **+ Add New** > **Script** > **cXML Script**.
+
+</llms-only>
+
 <Markdown src="/snippets/common/dashboard/_resource-admonition.mdx" />
 
 ### Paste the script
@@ -102,10 +112,20 @@ You will need at least one number to receive messages.
 Navigate to the "Phone Numbers" section of your Dashboard and open the settings for the number you want to configure.
 There, assign the cXML script you just created to handle messages.
 
+<llms-ignore>
+
 <Frame>
   ![Open the settings for the number.](/assets/images/dashboard/phone-numbers/assign-resource-full.webp)
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+On the phone number's edit page, select **+ Assign Resource** under **Inbound Message Settings**, choose the cXML script, and save.
+
+</llms-only>
+
 ### Send a test SMS
 
 Try sending a mes
```
- **modified** `fern/products/platform/pages/messaging/sms/the-campaign-registry/registration/index.mdx` → /docs/platform/messaging/campaign-registry/registration ("Registration") (+90/-0)
```diff
@@ -94,8 +94,18 @@ To see the details of an existing Brand, click on the Brand Name. None of these
 details are editable. If you are trying to make changes to an existing Brand,
 please use the button to contact Support for assistance.
 
+<llms-ignore>
+
 ![Brand details page](/assets/images/dashboard/campaign-registry/sms/brand-details.webp)
 
+</llms-ignore>
+
+<llms-only>
+
+Select a Brand name to open its detail page. The page has **Settings**, **Campaigns**, **Campaign Phone Numbers**, and **Assignment Orders** tabs; use **Contact Support** if its locked details must change.
+
+</llms-only>
+
 ### Creating a new brand
 
 <Tip>
@@ -108,8 +118,18 @@ To create a new Brand, start by clicking the blue "+ New" button to open the New
    Campaign Service Provider (CSP) by clicking the "Create a Partner Brand" button.
 1. Create a new Brand to register and manage with SignalWire by filling out the form.
 
+<llms-ignore>
+
 ![Brand creation page](/assets/images/dashboard/campaign-registry/sms/TCR-wizard-1.webp)
 
+</llms-ignore>
+
+<llms-only>
+
+The New Brand wizard has **Company Details**, **Company Contact**, and **Legal** steps. To import an approved brand from another Campaign Ser
```
- **modified** `fern/products/platform/pages/platform/core/webhooks/index.mdx` → /docs/platform/webhooks ("Webhooks") (+50/-0)
```diff
@@ -37,38 +37,78 @@ flowchart LR
 
 In the SignalWire Dashboard, open the **My Resources** tab and click **+ Add**, then choose **SWML Script**.
 
+<llms-ignore>
+
 <Frame caption="The Resource selection menu">
 
 ![Selecting a Resource type in the SignalWire Dashboard](/assets/images/dashboard/resources/add-new-resource.webp)
 
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+In **My Resources**, select **+ Add**, then choose **Script** > **SWML Application**.
+
+</llms-only>
+
 Give the script a name, set **Handle Calls Using** to **External URL**, and enter your webhook URL in the **Primary Script URL** field. Click **Create** to save the Resource.
 
+<llms-ignore>
+
 <Frame caption="A SWML Script Resource configured to fetch SWML from an external webhook URL">
 
 ![Configuring a SWML Script Resource with an external URL in the SignalWire Dashboard](/assets/images/dashboard/resources/external-swml-script.webp)
 
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+In the **New SWML Application** form, enter a name, set **Handle Calls Using** to **External URL**, enter the webhook endpoint in **Primary Script URL**, and create the Resource.
+
+</llms-only>
+
 ### Assign the Resource to you
```
- **modified** `fern/products/swml/pages/guides/get-started/quickstart.mdx` → /docs/swml/guides ("Quickstart") (+40/-0)
```diff
@@ -96,14 +96,34 @@ You can write and save new SWML scripts from the "Relay/SWML" section of your Da
 In that section, switch to the tab named [SWML Scripts](https://my.signalwire.com/relay-bins).
 Once there, you can create a new SWML script:
 
+<llms-ignore>
+
 ![Image](/assets/images/swml/new-swml-2.png)
 
+</llms-ignore>
+
+<llms-only>
+
+On the **New SWML Script** page, enter a name, paste the script into the **SWML** field, and click **Save**.
+
+</llms-only>
+
 After you save the SWML, navigate to the [Phone Numbers](https://my.signalwire.com/phone_numbers) page.
 Open the settings for a phone number you own (you may have to buy a new one),
 and configure it to handle incoming calls using the SWML script you just saved.
 
+<llms-ignore>
+
 ![Image](/assets/images/swml/add-phone-number.png)
 
+</llms-ignore>
+
+<llms-only>
+
+In **Voice and Fax Settings**, set **Accept Incoming Calls As** to **Voice Calls**, set **Handle Calls Using** to **a SWML Script**, and choose the saved script under **When a Call Comes In**. Enable the external-URL fallback option only if you need a fallback SWML handler.
+
+</llms-only>
+
 </Accordion>
 
 <Accordion title="Learn about the Legacy Dashb
```
- **removed** `fern/snippets/dashboard/ui-accordion.mdx` (+0/-37)
```diff
@@ -1,37 +0,0 @@
-<Accordion title="Learn about the Legacy Dashboard migration">
-
-Identify your Dashboard and select between Legacy and New UIs using the tabs below.
-
-<Tabs>
-
-<Tab title="New Dashboard">
-
-<Frame caption="The redesigned main menu.">
-  ![The main sidebar menu of the new SignalWire Space Dashboard UI.](/assets/images/dashboard/sidebar/new-sidebar.webp)
-</Frame>
-
-<Frame caption="The new SignalWire Dashboard features a streamlined sidebar menu. Many items are now located in the unified My Resources menu.">
-  ![The selection menu when a new Resource is created.](/assets/images/dashboard/resources/add-new-resource.webp)
-</Frame>
-
-Resources that were previously accessible in the sidebar of the legacy UI are now located in the unified **My Resources** menu.
-
-</Tab>
-
-<Tab title="Legacy Dashboard">
-
-<Frame caption="The legacy main menu.">
-  ![The main sidebar menu of the legacy SignalWire Space Dashboard UI.](/assets/images/dashboard/legacy/sidebar.webp)
-</Frame>
-
-In the Legacy Dashboard, there is no **My Resources** tab.
-
-Instead, Resources are accessible as individual tabs in the main navigational sidebar.
-
-To upgrade your Space to the New UI, [
```
- **modified** `fern/products/apis/pages/core/authorization.mdx` → /docs/apis/authorization ("Authorization") (+10/-0)
- **modified** `fern/products/compatibility-api/pages/cxml/guides/gathering-user-input.mdx` → /docs/compatibility-api/guides/gather-user-input ("Gathering user input") (+8/-0)
- **modified** `fern/products/compatibility-api/pages/cxml/guides/securing-callback-for-inbound-fax.mdx` → /docs/compatibility-api/guides/callback-for-inbound-fax ("Callback for inbound fax") (+10/-0)
- **modified** `fern/products/compatibility-api/pages/cxml/guides/sending-your-first-sms.mdx` → /docs/compatibility-api/guides/send-sms ("Sending your first SMS") (+11/-1)
- **modified** `fern/products/compatibility-api/pages/cxml/guides/webhooks/index.mdx` → /docs/compatibility-api/guides/webhooks ("Compatibility API Webhooks") (+10/-0)
- **modified** `fern/products/compatibility-api/pages/cxml/guides/webhooks/webhook-security.mdx` → /docs/compatibility-api/guides/webhook-security ("Webhook security") (+10/-0)
- **modified** `fern/products/compatibility-api/pages/rest-api/core/authorization.mdx` → /docs/compatibility-api/authorization ("Authorization") (+10/-0)
- **modified** `fern/products/platform/pages/calling/fax/overview.mdx` → /docs/platform/fax ("First steps with fax") (+30/-0)
- **modified** `fern/products/platform/pages/calling/voice/SIP/sip-trunking/index.mdx` → /docs/platform/voice/sip/trunking ("SIP trunking") (+20/-0)
- **modified** `fern/products/platform/pages/calling/voice/TTS/fish.mdx` → /docs/platform/voice/tts/fish ("Fish Audio") (+1/-3)
- **modified** `fern/products/platform/pages/calling/voice/TTS/grok.mdx` → /docs/platform/voice/tts/grok ("Grok") (+1/-3)
- **modified** `fern/products/platform/pages/calling/voice/TTS/groq-tts.mdx` → /docs/platform/voice/tts/groq-tts ("Groq") (+1/-3)
- **modified** `fern/products/platform/pages/calling/voice/TTS/inworld.mdx` → /docs/platform/voice/tts/inworld ("Inworld") (+1/-3)
- **modified** `fern/products/platform/pages/calling/voice/TTS/minimax.mdx` → /docs/platform/voice/tts/minimax ("MiniMax") (+1/-3)
- **modified** `fern/products/platform/pages/calling/voice/TTS/mistral.mdx` → /docs/platform/voice/tts/mistral ("Mistral") (+1/-3)

And 23 more changed files, not shown individually:
- 5 files under `fern/products/swml/pages/guides/recipes/`
- 3 files under `fern/products/platform/pages/calling/voice/TTS/`
- 3 files under `fern/products/platform/pages/platform/core/`
- 2 files under `fern/products/platform/pages/platform/setup/`
- 2 files under `fern/products/swml/pages/guides/basics/`
- 1 file under `fern/products/platform/pages/calling/voice/`
- 1 file under `fern/products/platform/pages/messaging/sms/`
- 1 file under `fern/products/platform/pages/platform/call-fabric/`
- 1 file under `fern/products/platform/pages/platform/integrations/FreeSWITCH/add-ai-to-freeswitch/`
- 1 file under `fern/products/platform/pages/platform/integrations/FreeSWITCH/installing-freeswitch-or-freeswitch-advantage/`
- 1 file under `fern/products/platform/pages/platform/phone-numbers/`
- 1 file under `fern/products/platform/pages/tools/wirestarter/`
- 1 file under `fern/snippets/common/dashboard/`

---

### PR #612 — docs: add LLM equivalents for Server SDK diagrams

Author: Devon-White · Merged: 2026-08-21T20:55:51Z · 30 docs files changed

Stacks on #611. Covers all 46 raster diagram references across 30 Server SDK guide pages: human Frames are excluded from Markdown exports, 38 diagrams receive Mermaid equivalents, five receive structured-Markdown equivalents, and three Dashboard captures rely on complete adjacent numbered instructions. Adds a diagram-specific authoring rule and local/manual preview acceptance cases. The export checker is intentionally not wired into CI.

Validation:
- manually compared all 46 source assets with their LLM-view content
- yarn test:scripts
- yarn fern-md-check (all 2,824 MDX files valid)
- git diff --check
- yarn check-llm-exports <preview-url> after the Fern preview deploys

Part of #388.

Changed files:
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/agent-base.mdx` → /docs/server-sdks/guides/agent-base ("AgentBase") (+57/-0)
```diff
@@ -38,10 +38,30 @@ Before building agents, you should understand:
 
 ## Agent Architecture Overview
 
+<llms-ignore>
+
 <Frame caption="Agent Components">
   <img class="diagram" src="/assets/images/sdks/diagrams/03_01_agent-base_diagram1.webp" alt="Agent components overview." />
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+```mermaid
+flowchart TD
+    agentClass["Your agent class<br/>extends AgentBase"] --> config["Configuration"]
+    config --> prompts["Prompts<br/>role, guidelines, rules"]
+    config --> voice["Voice<br/>language, voice, TTS engine"]
+    config --> params["AI parameters<br/>timeouts, barge, attention"]
+    config --> hints["Hints<br/>keywords, names, terms"]
+    config --> functions["Functions<br/>tools, DataMap, handlers"]
+    config --> skills["Skills<br/>plugins, add-ons, integrations"]
+    prompts & voice & params & hints & functions & skills --> swml["Automatically generated SWML output"]
+```
+
+</llms-only>
+
 ## A Complete Agent Example
 
 Here's what a production agent looks like across all supported languages:
@@ -381,10 +401,31 @@ swaig-test my_agent.py --exec check_order --order_number 12345
 
 ## Class Overview
 
+<llms-ignore>
+
 <Frame c
```
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/architecture.mdx` → /docs/server-sdks/guides/architecture ("Architecture") (+43/-1)
```diff
@@ -35,10 +35,30 @@ Before diving into these concepts, you should have:
 
 ## The Big Picture
 
+<llms-ignore>
+
 <Frame caption="SignalWire Server SDK Architecture">
   <img class="diagram" src="/assets/images/sdks/diagrams/02_01_architecture_diagram1.webp" alt="SignalWire Server SDK Architecture." />
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+```mermaid
+sequenceDiagram
+    participant Caller
+    participant Cloud as SignalWire Cloud
+    participant Agent as Your Agent<br/>AgentBase and SWMLService
+    Caller->>Cloud: Incoming call
+    Cloud->>Agent: POST / or POST /swaig
+    Note over Cloud: Receive call, request SWML,<br/>execute AI, call SWAIG tools
+    Note over Agent: AuthMixin, WebMixin, PromptMixin,<br/>ToolMixin, SkillMixin, AIConfigMixin,<br/>ServerlessMixin, StateMixin
+    Agent-->>Cloud: SWML JSON or function result
+```
+
+</llms-only>
+
 ## Key Terminology
 
 | Term | Definition |
@@ -71,12 +91,34 @@ Understanding these core concepts helps you:
 
 ## The Mixin Composition Pattern
 
-AgentBase doesn't inherit from a single monolithic class. Instead, it combines nine specialized mixins plus the SWMLService base class:
+AgentBase doesn't inherit from a single
```
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/lifecycle.mdx` → /docs/server-sdks/guides/lifecycle ("Request Lifecycle") (+104/-0)
```diff
@@ -11,18 +11,70 @@ max-toc-depth: 3
 
 Understanding the request lifecycle helps you debug issues and optimize your agents. Here's the complete flow:
 
+<llms-ignore>
+
 <Frame caption="Complete Call Lifecycle">
   <img class="diagram" src="/assets/images/sdks/diagrams/02_04_lifecycle_diagram1.webp" alt="Complete call lifecycle." />
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+The complete call lifecycle proceeds through these five phases:
+
+| Step | Phase | Event |
+|---:|---|---|
+| 1 | Call setup | Caller dials your phone number. |
+| 2 | Call setup | SignalWire receives the call. |
+| 3 | Call setup | SignalWire checks the number's webhook configuration. |
+| 4 | Call setup | SignalWire requests SWML by sending `POST https://your-agent.com/`. |
+| 5 | SWML generation | Your agent receives the HTTP request. |
+| 6 | SWML generation | The agent builds the SWML document, including prompts, functions, and languages. |
+| 7 | SWML generation | The agent generates security tokens for SWAIG functions. |
+| 8 | SWML generation | The agent returns a SWML JSON response. |
+| 9 | AI conversation | SignalWire executes the SWML, answers the call, and starts the AI. |
+| 10 | AI conversat
```
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/swaig.mdx` → /docs/server-sdks/guides/swaig ("SWAIG (SignalWire AI Gateway)") (+42/-0)
```diff
@@ -14,10 +14,31 @@ max-toc-depth: 3
 
 SWAIG (SignalWire AI Gateway) connects the AI conversation to your backend logic. When the AI decides it needs to perform an action (like looking up an order or checking a balance), it calls a SWAIG function that you've defined.
 
+<llms-ignore>
+
 <Frame caption="SWAIG Function Flow">
   <img class="diagram" src="/assets/images/sdks/diagrams/02_03_swaig_diagram1.webp" alt="SWAIG function call flow." />
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+```mermaid
+sequenceDiagram
+    participant User
+    participant AI as SignalWire AI Engine
+    participant Agent as Your agent
+    User->>AI: What is my account balance?
+    Note over AI: Transcribe speech, understand intent,<br/>select get_balance(account_id)
+    AI->>Agent: POST /swaig with function and arguments
+    Note over Agent: Look up balance and return<br/>SwaigFunctionResult
+    Agent-->>AI: Balance is $150.00
+    AI-->>User: Speak the result
+```
+
+</llms-only>
+
 ### SWAIG in SWML
 
 When your agent generates SWML, it includes SWAIG function definitions in the `ai` verb:
@@ -540,10 +561,31 @@ return result;
 
 ### SWAIG Request Flow
 
+<llms-ignore>
+
 <Frame caption="SWAIG 
```
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/swml.mdx` → /docs/server-sdks/guides/swml ("SWML (SignalWire Markup Language)") (+38/-0)
```diff
@@ -12,10 +12,26 @@ max-toc-depth: 3
 
 SWML (SignalWire Markup Language) is a document that instructs SignalWire how to handle a phone call. SWML can be written in JSON or YAML format -- **this guide uses JSON throughout**. When a call comes in, SignalWire requests SWML from your agent, then executes the instructions.
 
+<llms-ignore>
+
 <Frame caption="SWML Flow">
   <img class="diagram" src="/assets/images/sdks/diagrams/02_02_swml_diagram1.webp" alt="SWML request and response flow." />
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+```mermaid
+flowchart TD
+    call["Call arrives"] --> request["SignalWire sends POST https://your-agent.com/"]
+    request --> response["Your agent returns SWML JSON"]
+    response --> execute["SignalWire executes the SWML instructions"]
+    execute --> conversation["AI conversation begins from the SWML configuration"]
+```
+
+</llms-only>
+
 ### SWML Document Structure
 
 Every SWML document has this structure:
@@ -364,10 +380,32 @@ When SignalWire requests SWML, the agent's render method (`_render_swml()` in Py
 
 ### SWML Rendering Pipeline
 
+<llms-ignore>
+
 <Frame caption="SWML Rendering Pipeline">
   <img class="diagram" src="/assets/images/
```
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/call-flow.mdx` → /docs/server-sdks/guides/call-flow ("Call Flow Customization") (+16/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/call-transfer.mdx` → /docs/server-sdks/guides/call-transfer ("Call Transfer") (+13/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/concierge.mdx` → /docs/server-sdks/guides/concierge ("Concierge") (+17/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/contexts-workflows.mdx` → /docs/server-sdks/guides/contexts-workflows ("Contexts and Workflows") (+21/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/defining-functions.mdx` → /docs/server-sdks/guides/defining-functions ("SWAIG Functions") (+20/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/hints.mdx` → /docs/server-sdks/guides/hints ("Hints") (+10/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/info-gatherer.mdx` → /docs/server-sdks/guides/info-gatherer ("InfoGatherer") (+20/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/mcp-gateway.mdx` → /docs/server-sdks/guides/mcp-gateway ("MCP Gateway") (+26/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/multi-agent.mdx` → /docs/server-sdks/guides/multi-agent ("Multi-Agent Servers") (+32/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/prompts-pom.mdx` → /docs/server-sdks/guides/prompts-pom ("Prompts & POM") (+17/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/receptionist.mdx` → /docs/server-sdks/guides/receptionist ("Receptionist") (+18/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/search-knowledge.mdx` → /docs/server-sdks/guides/search-knowledge ("Search and Knowledge") (+16/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/skill-config.mdx` → /docs/server-sdks/guides/skill-config ("Skill Configuration") (+16/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/state-management.mdx` → /docs/server-sdks/guides/state-management ("State Management") (+18/-0)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/survey.mdx` → /docs/server-sdks/guides/survey ("Survey") (+23/-0)

And 10 more changed files, not shown individually:
- 4 files under `fern/products/server-sdks/pages/guides/deploy/`
- 3 files under `fern/products/server-sdks/pages/guides/getting-started/`
- 2 files under `fern/products/server-sdks/pages/guides/manage-resources/`
- 1 file under `fern/products/server-sdks/pages/guides/build-ai-agents/`

---

### PR #611 — docs: improve callout and voice widget LLM exports

Author: Devon-White · Merged: 2026-08-21T19:07:40Z · 25 docs files changed

Part 2 of #388, stacked on #610.

- hides all 17 VoiceWidget instances and widget-only instructions from .md exports
- preserves the existing provider voice documentation as the machine-readable source
- adds targeted titles where legal, credential, network-security, or availability warnings otherwise lose intent
- extends the local/manual preview assertions across all canonical TTS provider routes; the checker is intentionally not wired into CI

Validation:
- yarn test:scripts
- yarn fern-md-check
- yarn check-llm-exports <preview-url> after the Fern preview deploys

Retarget to main after #610 merges.

Changed files:
- **modified** `fern/products/platform/pages/calling/voice/TTS/azure.mdx` → /docs/platform/voice/tts/azure ("Azure") (+4/-0)
```diff
@@ -12,10 +12,14 @@ Microsoft's Azure platform offers an impressive array of high-quality, multiling
 
 ## Voices
 
+<llms-ignore>
+
 Press play to audition any Azure voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="azure" />
 
+</llms-ignore>
+
 <CardGroup cols={2}>
   <Card title="Voices" href="https://learn.microsoft.com/en-us/azure/ai-services/speech-service/language-support?tabs=tts">
     Browse the complete list of Azure Neural voices in Microsoft's official documentation.
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/cartesia.mdx` → /docs/platform/voice/tts/cartesia ("Cartesia") (+4/-0)
```diff
@@ -43,10 +43,14 @@ Cartesia account — including custom or cloned voices — will not work.
 See [Custom and cloned voices](/docs/platform/voice/tts#custom-and-cloned-voices) for details.
 </Warning>
 
+<llms-ignore>
+
 Press play to audition any Cartesia voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="cartesia" />
 
+</llms-ignore>
+
 Copy the voice ID from the table below:
 
 
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/deepgram.mdx` → /docs/platform/voice/tts/deepgram ("Deepgram") (+4/-0)
```diff
@@ -28,10 +28,14 @@ Deepgram's Aura model provides ultra-low latency text-to-speech optimized for co
 
 ## Voices
 
+<llms-ignore>
+
 Press play to audition any Deepgram voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="deepgram" />
 
+</llms-ignore>
+
 Deepgram Aura voices are designed for natural-sounding English speech. Each voice follows the pattern `aura-<name>-en`.
 
 Popular voices include:
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/elevenlabs.mdx` → /docs/platform/voice/tts/elevenlabs ("ElevenLabs") (+4/-0)
```diff
@@ -30,10 +30,14 @@ ElevenLabs voice import is available by request:
 see [Custom and cloned voices](/docs/platform/voice/tts#custom-and-cloned-voices) for details.
 </Warning>
 
+<llms-ignore>
+
 Press play to audition any ElevenLabs voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="elevenlabs" />
 
+</llms-ignore>
+
 You can use the **Name** and **ID** values for each voice in the below table interchangeably.
 
 | Name | ID |
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/fish.mdx` → /docs/platform/voice/tts/fish ("Fish Audio") (+4/-0)
```diff
@@ -26,10 +26,14 @@ See [Fish Audio's documentation](https://docs.fish.audio/) for more detail.
 
 ## Voices
 
+<llms-ignore>
+
 Press play to audition any Fish Audio voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="fish" />
 
+</llms-ignore>
+
 A Fish Audio voice ID is a **reference ID** — a long hexadecimal string found on the voice's page
 in the Fish Audio marketplace. The default voice is Energetic Male
 (`802e3bc2b27e49c2995d23ef70e6ac89`).
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/google.mdx` → /docs/platform/voice/tts/gcloud ("Google Cloud") (+10/-0)
```diff
@@ -41,10 +41,20 @@ the `polyglot-1` voice has variants for English (Australia), English (US), Frenc
 
 ## Voices
 
+<llms-ignore>
+
 Press play to audition any Google Cloud voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="gcloud" />
 
+</llms-ignore>
+
+<llms-only>
+
+Browse Google's table of [supported voices](https://cloud.google.com/text-to-speech/docs/voices) and copy the **Voice name** value to use as the voice ID.
+
+</llms-only>
+
 ## Billing
 
 Google Cloud TTS usage on SignalWire is billed according to the following SKU codes:
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/grok.mdx` → /docs/platform/voice/tts/grok ("Grok") (+4/-0)
```diff
@@ -18,10 +18,14 @@ never append a `:model` suffix.
 
 ## Voices
 
+<llms-ignore>
+
 Press play to audition any Grok voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="grok" />
 
+</llms-ignore>
+
 Grok provides five voices: `ara`, `eve`, `leo`, `rex`, and `sal`.
 `eve` is the default, and is also used as the fallback when an unrecognized voice is requested.
 
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/groq-tts.mdx` → /docs/platform/voice/tts/groq-tts ("Groq") (+4/-0)
```diff
@@ -35,10 +35,14 @@ Requests fail until the terms are accepted.
 
 ## Voices
 
+<llms-ignore>
+
 Press play to audition any Groq voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="groq-tts" />
 
+</llms-ignore>
+
 Groq's Orpheus deployment provides the following voices:
 
 | Voice | Description |
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/index.mdx` → /docs/platform/voice/tts ("Voices and languages") (+10/-0)
```diff
@@ -38,6 +38,8 @@ Refer to each provider's documentation for up-to-date model details and service
 
 ## Browse and audition voices
 
+<llms-ignore>
+
 Choose a provider to browse and audition its full voice catalog. Press play to audition a voice, and use **copy config** to
 grab the engine and voice values for your SWML or SDK code. Each provider's complete voice list
 lives on its reference page, linked in the table below.
@@ -48,6 +50,14 @@ for supported options.
 
 <VoiceWidget groupBy="none" />
 
+</llms-ignore>
+
+<llms-only>
+
+Browse each provider's complete voice list on its reference page, linked in the table below.
+
+</llms-only>
+
 ## Compare providers and models
 
 SignalWire's TTS providers offer a wide range of voice engines optimized for various applications.
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/inworld.mdx` → /docs/platform/voice/tts/inworld ("Inworld") (+4/-0)
```diff
@@ -28,10 +28,14 @@ defaults to `inworld-tts-1.5-max`. Set a model explicitly to override this.
 
 ## Voices
 
+<llms-ignore>
+
 Press play to audition any Inworld voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="inworld" />
 
+</llms-ignore>
+
 Inworld provides a large library of expressive voices across many languages.
 A voice's name is its voice ID — for example, `Lauren` becomes `inworld.Lauren` in the
 [voice string](#usage).
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/minimax.mdx` → /docs/platform/voice/tts/minimax ("MiniMax") (+4/-0)
```diff
@@ -28,10 +28,14 @@ SignalWire supports the following MiniMax models. Pick a `turbo` model for speed
 
 ## Voices
 
+<llms-ignore>
+
 Press play to audition any MiniMax voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="minimax" />
 
+</llms-ignore>
+
 MiniMax provides a large library of system voices across many languages.
 A voice's **Voice ID** is what you put in the [voice string](#usage): for exampl
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/polly.mdx` → /docs/platform/voice/tts/amazon-polly ("Amazon Polly") (+10/-0)
```diff
@@ -38,10 +38,20 @@ SignalWire supports the following three Amazon models.
 
 ## Voices
 
+<llms-ignore>
+
 Press play to audition any Amazon Polly voice, then **copy config** to grab the value for SWML or your SDK.
 
 <VoiceWidget provider="polly" />
 
+</llms-ignore>
+
+<llms-only>
+
+Browse Amazon's list of [available voices](https://docs.aws.amazon.com/polly/latest/dg/available-voices.html) and build the voice ID string as shown in the model cards above.
+
+</llms-only>
+
 ## Languages
 
 Consult AWS documentation for a comprehensive and up-to-date list of supported voices,
```
- **modified** `fern/products/browser-sdk/pages/v4/guides/getting-started/authentication.mdx` (+1/-1)
- **modified** `fern/products/compatibility-api/pages/cxml/guides/webhooks/webhook-security.mdx` → /docs/compatibility-api/guides/webhook-security ("Webhook security") (+1/-1)
- **modified** `fern/products/platform/pages/ai/get-started/best-practices-for-ai/index.mdx` → /docs/platform/ai/best-practices ("Best practices for creating a SignalWire AI agent") (+1/-1)
- **modified** `fern/products/platform/pages/ai/guides/Integrations/vapi/inbound-calls.mdx` → /docs/platform/ai/vapi/inbound ("VAPI inbound calling") (+1/-1)
- **modified** `fern/products/platform/pages/calling/voice/SIP/byoc/index.mdx` → /docs/platform/voice/sip/bring-your-own-carrier ("Bring your own carrier") (+1/-1)
- **modified** `fern/products/platform/pages/calling/voice/TTS/mistral.mdx` → /docs/platform/voice/tts/mistral ("Mistral") (+4/-0)
- **modified** `fern/products/platform/pages/calling/voice/TTS/openai.mdx` → /docs/platform/voice/tts/openai ("OpenAI") (+4/-0)
- **modified** `fern/products/platform/pages/calling/voice/TTS/rime.mdx` → /docs/platform/voice/tts/rime ("Rime") (+4/-0)

And 5 more changed files, not shown individually:
- 3 files under `fern/products/platform/pages/platform/compliance/`
- 2 files under `fern/products/platform/pages/calling/voice/TTS/`

---

### PR #610 — docs: improve LLM export correctness

Author: Devon-White · Merged: 2026-08-21T18:57:03Z · 27 docs files changed

Part 1 of #388.

- adds structured LLM views for the homepage and getting-started routing
- preserves webhook, tooltip, iframe, button, and Postman semantics in .md exports
- adds local/manual preview semantic assertions and agent scenarios; the export checker is intentionally not wired into CI
- documents the llms-only/llms-ignore authoring convention

Validation:
- yarn test:scripts
- yarn fern-md-check
- yarn check-llm-exports <preview-url> after the Fern preview deploys

Changed files:
- **modified** `fern/products/call-flow-builder/pages/core/overview.mdx` → /docs/call-flow-builder/ ("Call Flow Builder") (+33/-1)
```diff
@@ -19,10 +19,14 @@ It features a simple drag-and-drop interface for creating complex call flows wit
 All elements of the call flow are represented as nodes in a tree structure.
 You can easily add, remove, and rearrange elements in the call flow using the visual interface.
 
+<llms-ignore>
+
 <Frame caption="A sample Call Flow showcasing input-gathering, recording, AI Agent, and TTS features.">
   ![A sample call flow created with Call Flow Builder, showing connections between nodes.](/assets/images/call-flow/sample-flow.webp)
 </Frame>
 
+</llms-ignore>
+
 Add or remove any element from the call flow by dragging it into the desired location,
 and define links between them using the connection lines.
 
@@ -46,6 +50,8 @@ To get started with Call Flow Builder, open the **Tools** tab in the left menu o
 
 Check out this brief demo to see how to add, configure, and connect nodes in Call Flow Builder.
 
+<llms-ignore>
+
 <iframe
   src="https://www.youtube.com/embed/ZPnwEKOhYH4?si=Q1cEQi9RrG6L6VZw"
   title="YouTube video player"
@@ -56,17 +62,29 @@ Check out this brief demo to see how to add, configure, and connect nodes in Cal
   style="width: 100%; aspect-ratio: 16/9;">
 </iframe>
 
```
- **modified** `fern/products/compatibility-api/pages/cxml/voice/record.mdx` → /docs/compatibility-api/cxml/reference/voice/record ("Record") (+20/-0)
```diff
@@ -104,13 +104,33 @@ The `action` request contains the [Standard Request Parameters](/docs/compatibil
 
 #### Request parameters for `recordingStatusCallback`  [#record_recordingStatusCallback]
 
+<llms-ignore>
+
 <WebhookPayloadSnippet webhook="recordingStatusCallback" />
 
+</llms-ignore>
+
+<llms-only>
+
+See the [Recording status callback reference](/docs/compatibility-api/rest/recordings/webhooks/recording-status-callback) for the request fields sent to `recordingStatusCallback`.
+
+</llms-only>
+
 
 #### Request parameters for `transcribeCallback`  [#record_transcribeCallback]
 
+<llms-ignore>
+
 <WebhookPayloadSnippet webhook="transcriptionStatusCallback" />
 
+</llms-ignore>
+
+<llms-only>
+
+See the [Transcription status callback reference](/docs/compatibility-api/rest/recording-transcriptions/webhooks/transcription-status-callback) for the request fields sent to `transcribeCallback`.
+
+</llms-only>
+
 ## Nesting
 
 No other verbs can be nested within `<Record>` and you cannot nest `<Record>` within any other verbs.
```
- **modified** `fern/products/home/pages/welcome.mdx` → /docs/ ("SignalWire Documentation") (+38/-0)
```diff
@@ -9,6 +9,8 @@ layout: custom
 
 <Markdown src="/snippets/llms-hint.mdx" />
 
+<llms-ignore>
+
 <div class="lp-page-container">
   <div class="main-content">
     {/* Dashed Pattern */}
@@ -114,3 +116,39 @@ layout: custom
 
   </div>
 </div>
+
+</llms-ignore>
+
+<llms-only>
+
+SignalWire is a programmable communications platform for building voice, video, messaging, and AI applications.
+Use the build type or interface below to choose the shortest path into the documentation.
+
+## Choose what to build
+
+| Goal | Start here | Use it for |
+|---|---|---|
+| AI voice agent | [AI application path](/docs/platform/getting-started#ai-application) | LLM-powered phone agents and virtual assistants |
+| Browser or mobile experience | [Browser or mobile path](/docs/platform/getting-started#browser-or-mobile-app) | WebRTC voice, video, and chat in an application |
+| Server application | [Server application path](/docs/platform/getting-started#server-application) | Backend call routing, messaging, interactive voice response, and realtime control |
+| No-code application | [No-code and low-code path](/docs/platform/getting-started#no-code--low-code) | Dashboard AI agents and drag-and-drop ca
```
- **modified** `fern/products/platform/pages/getting-started.mdx` → /docs/platform/getting-started ("Get started") (+35/-1)
```diff
@@ -29,17 +29,39 @@ In your Dashboard, you can:
 - Access your API credentials
 - Set up AI agents, call flows, and more
 
+<llms-ignore>
+
 <Frame>
   ![The SignalWire Dashboard](/assets/images/dashboard/home/home.webp)
 </Frame>
 
+</llms-ignore>
+
+<llms-only>
+
+The Dashboard's left navigation includes **My Resources**, **Click-to-Call**, **Phone Numbers**, **Messaging Campaigns**, **API Credentials**, **Logs**, **Storage**, and **Configuration**. The home page also displays the current **Project ID** and **Space URL**.
+
+</llms-only>
+
 ## Start building
 
 Let's begin by figuring out the best way for you to build.
 The right approach depends on what you're creating and how you prefer to work.
 
 ### What are you trying to build?
 
+<llms-only>
+
+| What you are building | Primary interface | Choose another interface when |
+|---|---|---|
+| AI voice agent | [Server SDKs](/docs/server-sdks) | Use [SignalWire AI](/docs/platform/ai) for Dashboard configuration or [SWML AI](/docs/swml/reference/calling/ai) when AI is one part of a declarative call flow. |
+| Browser or mobile voice, video, or chat | [Browser SDK](/docs/browser-sdk) | Use a server interface only for trusted backe
```
- **modified** `fern/products/platform/pages/messaging/sms/hosted-messaging.mdx` → /docs/platform/messaging/hosted-messaging ("Hosted messaging") (+13/-1)
```diff
@@ -5,10 +5,22 @@ title: Hosted messaging
 description: Learn about porting Messaging services only to the SignalWire platform.
 ---
 
+<llms-ignore>
+
 Hosted Messaging allows you to use SignalWire to send and receive SMS and MMS on 
-<Tooltip tip="10DLC stands for '10-digit long code numbers', such as `(123) 456-7890`. [Learn more](/docs/platform/phone-numbers/getting-started/buying-a-phone-number/#types-of-phone-number)">10DLC</Tooltip> 
+<Tooltip tip="10DLC stands for '10-digit long code numbers', such as `(123) 456-7890`. [Learn more](/docs/platform/phone-numbers)">10DLC</Tooltip>
 and Toll-Free VoIP phone numbers that are held elsewhere for voice (such as a PBX or VoIP provider).
 
+</llms-ignore>
+
+<llms-only>
+
+Hosted Messaging allows you to use SignalWire to send and receive SMS and MMS on
+[10-digit long code (10DLC) phone numbers](/docs/platform/phone-numbers),
+such as `(123) 456-7890`, and Toll-Free VoIP phone numbers that are held elsewhere for voice, such as by a PBX or VoIP provider.
+
+</llms-only>
+
 Use Hosted Messaging to migrate a phone number to SignalWire's robust Messaging platform
 while maintaining your existing Voice infrastructure.
 
```
- **modified** `fern/products/platform/pages/messaging/whatsapp/receive-messages.mdx` → /docs/platform/messaging/whatsapp/receive-messages ("Receive WhatsApp messages") (+12/-2)
```diff
@@ -37,11 +37,21 @@ You can also view message history graphically in your
 [SignalWire Dashboard](https://my.signalwire.com) under **Logs → Messaging**.
 
 To be notified of eac
```
- **modified** `fern/products/apis/pages/core/overview.mdx` → /docs/apis/ ("Overview") (+10/-0)
- **modified** `fern/products/compatibility-api/pages/cxml/voice/conference-noun.mdx` → /docs/compatibility-api/cxml/reference/voice/conference ("Conference") (+10/-0)
- **modified** `fern/products/compatibility-api/pages/cxml/voice/dial.mdx` → /docs/compatibility-api/cxml/reference/voice/dial ("Dial") (+10/-0)
- **modified** `fern/products/compatibility-api/pages/cxml/voice/number-noun.mdx` → /docs/compatibility-api/cxml/reference/voice/number ("Number") (+10/-0)
- **modified** `fern/products/compatibility-api/pages/cxml/voice/sip-noun.mdx` → /docs/compatibility-api/cxml/reference/voice/sip ("Sip") (+10/-0)
- **modified** `fern/products/compatibility-api/pages/rest-api/core/overview.mdx` → /docs/compatibility-api/rest ("Overview") (+10/-0)
- **modified** `fern/products/platform/pages/ai/get-started/tool-calling/index.mdx` → /docs/platform/ai/tool-calling ("Tool calling") (+4/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_params/index.mdx` → /docs/swml/reference/calling/ai/params ("params") (+4/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/functions/index.mdx` → /docs/swml/reference/calling/ai/swaig/functions ("functions") (+4/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/includes/index.mdx` → /docs/swml/reference/calling/ai/swaig/includes ("includes") (+4/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/index.mdx` → /docs/swml/reference/calling/ai ("ai") (+4/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai_sidecar/index.mdx` → /docs/swml/reference/calling/ai-sidecar ("ai_sidecar") (+8/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/bedrock/index.mdx` → /docs/swml/reference/calling/amazon-bedrock ("amazon_bedrock") (+4/-0)
- **modified** `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/functions/index.mdx` → /docs/swml/reference/calling/amazon-bedrock/swaig/functions ("functions") (+4/-0)

And 7 more changed files, not shown individually:
- 4 files under `fern/products/swml/pages/reference/methods/calling/`
- 3 files under `fern/products/swml/pages/reference/methods/messaging/`

---

### PR #603 — Render web-components reference in .md exports, and add check-md-exports audit script

Author: hey-august · Merged: 2026-08-19T15:14:30Z · 32 docs files changed

## Description

**Fixes**
- Rename `fern/products/browser-sdk/pages/v4/web-components/*.md` → `.mdx` (27 files) and update `v4.yml` nav paths. These pages use `<ParamField>`/`<CardGroup>`, which Fern's `.md`-export path only compiles in `.mdx` files — every page in this section was exporting raw JSX to AI consumers while rendering fine as HTML. **Verified on the preview: the exports now render every term properly.**
- Add the MDX-required blank lines inside `<Accordion>` blocks in 5 v4 guides (house-style normalization per `documentation-style.md`; note the authentication guide's export corruption turned out to be a separate Fern exporter bug — fence imbalance in `<EndpointRequestSnippet>` output — reported upstream, not fixable from our MDX).
- Replace an authored `&#xA;` entity with a period in `sw-audio-level`'s methods table.

**New tooling**:
- `scripts/check-md-exports.js` (`yarn check-md-exports`): audits the llms.txt tree + all `.md` exports for structural breakage. Tiered checks (error/warn/info), `--cross-check` mode verifying ParamField terms from sources against deployed exports (with `--source-ref origin/main` to read sources from the ref the site was built from, eliminating branch-drift noise), `--base-url` for previews, markdown/JSON reports, CI-ready exit codes. Zero dependencies, mirrors `check-links.js` conventions.
- `scripts/check-md-exports.test.js` (`yarn test:scripts`, 18 fixture tests on `node:test`): locks in the detection heuristics — the #525 regres

Changed files:
- **modified** `fern/products/browser-sdk/pages/v4/guides/build-voice-video/device-management.mdx` (+2/-0)
```diff
@@ -254,6 +254,7 @@ Save the page below as `devices-demo.html` and open it over HTTPS (or `localhost
 Pick a different mic, camera, or speaker before dialing. The log records each pick as `preference: …` — that's the `client.select*` branch in action. Plug or unplug a USB headset to see `deviceRecovered$` fire.
 
 <Accordion title="devices-demo.html — full source">
+
 ```html
 <!doctype html>
 <html lang="en">
@@ -442,6 +443,7 @@ Pick a different mic, camera, or speaker before dialing. The log records each pi
   </body>
 </html>
 ```
+
 </Accordion>
 
 ### Switch a device mid-call
```
- **modified** `fern/products/browser-sdk/pages/v4/guides/build-voice-video/inbound-calls.mdx` (+2/-0)
```diff
@@ -217,6 +217,7 @@ Once registered, the log prints the user's dialable `/private/<name>` address(es
 Leave the page open — when the call arrives, the **Caller** line populates and the **Answer** / **Decline** buttons enable. After you accept, **Hang up** enables so you can end the call.
 
 <Accordion title="inbound-demo.html — full source">
+
 ```html
 <!doctype html>
 <html lang="en">
@@ -376,6 +377,7 @@ Leave the page open — when the call arrives, the **Caller** line populates and
   </body>
 </html>
 ```
+
 </Accordion>
 
 ### Place a test call
```
- **modified** `fern/products/browser-sdk/pages/v4/guides/build-voice-video/messaging-chat.mdx` (+2/-0)
```diff
@@ -199,6 +199,7 @@ The demo touches: `client.directory$` (to list addresses),
 same conversation).
 
 <Accordion title="messaging-chat-demo.html — full source">
+
 ```html
 <!doctype html>
 <html lang="en">
@@ -416,6 +417,7 @@ same conversation).
   </body>
 </html>
 ```
+
 </Accordion>
 
 ## Reference
```
- **modified** `fern/products/browser-sdk/pages/v4/guides/build-voice-video/outbound-calls.mdx` (+2/-0)
```diff
@@ -132,6 +132,7 @@ Create a SAT against your project — the [Authentication guide](/docs/browser-s
 Copy the returned `token`, save the page below as `outbound-demo.html`, and open it over HTTPS (or `localhost`). Paste the SAT and a destination, toggle the **Send audio** / **Send video** checkboxes to match the call shape you want, click **Dial**, and watch the log — it records every status the call moves through. The checkboxes map directly onto the `audio` and `video` keys of `dial()`'s [`DialOptions`](/docs/browser-sdk/v4/reference/interfaces/dial-options).
 
 <Accordion title="outbound-demo.html — full source">
+
 ```html
 <!doctype html>
 <html lang="en">
@@ -241,6 +242,7 @@ Copy the returned `token`, save the page below as `outbound-demo.html`, and open
   </body>
 </html>
 ```
+
 </Accordion>
 
 You should see `Status: connected` once the destination picks up. If `dial()` rejects with `CallCreateError`, the token's scope doesn't reach the destination — re-check `allowed_addresses` or the token's project.
```
- **modified** `fern/products/browser-sdk/pages/v4/guides/getting-started/authentication.mdx` (+2/-0)
```diff
@@ -341,6 +341,7 @@ The Project API Token can issue a SAT for any user in your project. Use a develo
 Copy the returned `token`, save the page below as `auth-demo.html`, and open it in a browser. Paste the SAT into the input, click **Authenticate**, and watch the log. It reports whether the SDK was able to open a session with the SAT.
 
 <Accordion title="auth-demo.html — full source">
+
 ```html
 <!doctype html>
 <html lang="en">
@@ -399,6 +400,7 @@ Copy the returned `token`, save the page below as `auth-demo.html`, and open it
   </body>
 </html>
 ```
+
 </Accordion>
 
 You should see `Authenticated — WebSocket open.` in the log. If you see `Failed: InvalidCredentialsError`, the SAT is expired, malformed, or issued for a different SignalWire space than the SDK is connecting to. Create a fresh one and try again.
```
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-audio-level.mdx` (+1/-1)
```diff
@@ -65,7 +65,7 @@ _Class: `SwAudioLevel` · Module: `packages/web-components/src/components/sw-aud
 
 | Name               | Privacy | Description                                                                                                                            | Parameters | Return | Inherited From |
 | ------------------ | ------- | -------------------------------------------------------------------------------------------------------------------------------------- | ---------- | ------ | -------------- |
-| `releaseResources` | public  | Public method to release all audio resources immediately&#xA;Call this before stopping the MediaStream tracks to ensure proper cleanup |            | `void` |                |
+| `releaseResources` | public  | Public method to release all audio resources immediately. Call this before stopping the MediaStream tracks to ensure proper cleanup |            | `void` |                |
 
 ### Attributes
 
```
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/index.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-call-controls.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-call-dialpad.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-call-media.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-call-provider.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-call-status.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-call-widget.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-click-to-call.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-device-selector.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-directory.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-local-camera.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-participant-controls.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-participants.mdx` (+0/-0)
- **renamed** `fern/products/browser-sdk/pages/v4/web-components/sw-self-media.mdx` (+0/-0)

And 12 more changed files, not shown individually:
- 12 files under `fern/products/browser-sdk/pages/v4/web-components/`

---

### PR #593 — Mark required method keys on four SWML reference pages

Author: hey-august · Merged: 2026-08-19T16:35:42Z · 4 docs files changed

## Description

This was a fix that came up during my review of #361, but didn't make it in before we merged that PR.

The SWML schema declares every method key as required. `SWMLObject.json` lists `required: ["answer"]`, `["stop_stream"]`, `["transcribe"]`, and `["transcribe_stop"]`, matching the `?`-free declarations in the TypeSpec
sources under `specs/swml/calling/Methods/`.

These four reference pages rendered the top-level `ParamField` without `required={true}`, so the method key incorrectly appeared to be optional.

A sweep of all 113 schema-required top-level keys against the SWML reference found these four pages and no others. One line changes on each; `yarn fern-md-check` passes.

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [x] Documentation update
- [ ] Code cleanup / refactor

## Related Issues

<!-- Link any related issues: Fixes #123 or Relates to #456 -->

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
- **modified** `fern/products/swml/pages/reference/methods/calling/answer.mdx` → /docs/swml/reference/calling/answer ("answer") (+1/-1)
```diff
@@ -10,7 +10,7 @@ Answer incoming call and set an optional maximum duration.
 
 ## **Properties**
 
-<ParamField path="answer" type="object" toc={true}>
+<ParamField path="answer" type="object" required={true} toc={true}>
   An object that accepts the following properties.
 </ParamField>
 
```
- **modified** `fern/products/swml/pages/reference/methods/calling/stop_stream.mdx` → /docs/swml/reference/calling/stop-stream ("stop_stream") (+1/-1)
```diff
@@ -9,7 +9,7 @@ Stop an audio stream started with [`stream`](/docs/swml/reference/calling/stream
 
 ## **Properties**
 
-<ParamField path="stop_stream" type="object" toc={true}>
+<ParamField path="stop_stream" type="object" required={true} toc={true}>
   An object that accepts the following properties.
 </ParamField>
 
```
- **modified** `fern/products/swml/pages/reference/methods/calling/transcribe.mdx` → /docs/swml/reference/calling/transcribe ("transcribe") (+1/-1)
```diff
@@ -16,7 +16,7 @@ Only one transcription can be active on a call at a time. Starting another while
 
 ## **Properties**
 
-<ParamField path="transcribe" type="object" toc={true}>
+<ParamField path="transcribe" type="object" required={true} toc={true}>
   An object that accepts the following properties.
 </ParamField>
 
```
- **modified** `fern/products/swml/pages/reference/methods/calling/transcribe_stop.mdx` → /docs/swml/reference/calling/transcribe-stop ("transcribe_stop") (+1/-1)
```diff
@@ -10,7 +10,7 @@ Stop the transcription currently running on the call, started with [`transcribe`
 
 ## **Properties**
 
-<ParamField path="transcribe_stop" type="object" toc={true}>
+<ParamField path="transcribe_stop" type="object" required={true} toc={true}>
   An empty object.
 </ParamField>
 
```

---

### PR #578 — Document `ai.multilingual` and qualify voice strings with their engine

Author: hey-august · Merged: 2026-08-19T18:53:57Z · 18 docs files changed

## Description

Documents `ai.multilingual` for SWML. 

### Additions
- `ai.multilingual` reference page, modeled field-by-field against source code. States the mutual exclusivity with regular `ai.languages` on both pages, plus the `ai` method (object) page.

### Changes

- **Added `engine` for incorrect "bare form" examples:** Per #577 , while the technical reference and TTS pages were correct, a few stray examples passed voice IDs without engine. These examples would only work if the voice ID string matched the platform default engine, which sometimes changes. Every voice example now names its engine.
- **Removed default engine assertions:** Since the platform default TTS engine can change, I removed references to the default. Users who need a specific engine should declare it.
- **Corrected `params.languages_enabled`:** its description previously claimed it enabled multilingualism when it only toggles handling for a languages array.
- Fixed a broken `#providers` anchor 

### Two notes for reviewers

**`multilingual` appears on the Fabric AI Agent REST schemas, but is SWML-only today.** `AIAgent` derives from the SWML `ai` object, so the new field lands on `AIAgent`, `AIAgentCreateRequest`, and `AIAgentUpdateRequest`. The Fabric API silently drops it, as it already does for `global_data` and `post_prompt_url`. Fixing the derivation is tracked in #594 rather than here, to keep the REST contract change out of a SWML PR.

**This widens schema validation three ways, with no run

Changed files:
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/languages/index.mdx` → /docs/swml/reference/calling/ai/languages ("languages") (+117/-66)
```diff
@@ -8,13 +8,34 @@ description: Configure the spoken language of your AI Agent, as well as the TTS
 max-toc-depth: 3
 ---
 
-[tts-providers]: /docs/platform/voice/tts#providers
+[tts-providers]: /docs/platform/voice/tts#compare-providers-and-models
 [voices-and-languages]: /docs/platform/voice/tts
 [swaig-functions]: /docs/swml/reference/calling/ai/swaig/functions
 [deepgram-codes]: https://developers.deepgram.com/docs/models-languages-overview#nova-3
+[multilingual]: /docs/swml/reference/calling/ai/multilingual
+[openai-asr-engine]: /docs/swml/reference/calling/ai/params#paramsopenai_asr_engine
+[turn-filler-sources]: /docs/swml/reference/calling/ai/params#paramsturn_filler_sources
+[ai-pronounce]: /docs/swml/reference/calling/ai#aipronounce
+[cartesia]: /docs/platform/voice/tts/cartesia
+[elevenlabs]: /docs/platform/voice/tts/elevenlabs
+[fish]: /docs/platform/voice/tts/fish
+[inworld]: /docs/platform/voice/tts/inworld
+[minimax]: /docs/platform/voice/tts/minimax
+[rime]: /docs/platform/voice/tts/rime
+[smallest]: /docs/platform/voice/tts/smallest
 
 Use `ai.languages` to configure the spoken language of your AI Agent, as well as the TTS engine, voice, and fillers.
 
+Use [`ai.mul
```
- **added** `fern/products/swml/pages/reference/methods/calling/ai/multilingual/index.mdx` → /docs/swml/reference/calling/ai/multilingual ("multilingual") (+351/-0)
```diff
@@ -0,0 +1,351 @@
+---
+slug: /reference/calling/ai/multilingual
+title: multilingual
+description: Configure one AI Agent to detect the caller's language and answer in it, switching as the caller switches.
+max-toc-depth: 3
+---
+
+[languages]: /docs/swml/reference/calling/ai/languages
+[voices-and-languages]: /docs/platform/voice/tts
+[variables]: /docs/swml/reference/variables
+[openai-asr-engine]: /docs/swml/reference/calling/ai/params#paramsopenai_asr_engine
+[turn-filler-sources]: /docs/swml/reference/calling/ai/params#paramsturn_filler_sources
+
+Use `ai.multilingual` to let one AI Agent detect the language a caller is speaking and answer
+in that language, switching whenever the caller does. You give it a voice per language, and the
+agent selects the matching voice as the conversation moves between them.
+
+Use [`ai.languages`][languages] instead when each call stays in one language and you are choosing
+between a fixed set. Use neither when the agent only ever speaks one language — set the voice and
+leave both out.
+
+<Warning>
+`multilingual` and [`languages`][languages] are mutually exclusive. If both are set, SignalWire uses
+`multilingual` and ignores `languages` ent
```
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/prompt/index.mdx` → /docs/swml/reference/calling/ai/prompt ("prompt") (+32/-89)
```diff
@@ -158,75 +158,22 @@ The `prompt` property accepts one of the following objects:
   When `true`, resets conversation history to only the system prompt when entering this context. Useful for focused tasks that shouldn't be influenced by previous conversation.
 </ParamField>
 
-<ParamField path="*.enter_fillers" type="object[]" toc={true}>
-  Language-specific filler phrases played when transitioning into this context.
+<ParamField path="*.enter_fillers" type="object" toc={true}>
+  Filler phrases played when entering this context, keyed by language code. One phrase is picked at random.
+
+  The agent looks for an entry matching the language being spoken, then `auto`, then `default`, and plays nothing when none of the three is set.
 </ParamField>
 
 <Indent>
 
-<ParamField path="enter_fillers[].<language_code toc={true}>" type="string[]">
-  An array of filler phrases for the specified language code. One phrase is randomly selected during transitions. Possible language codes:
-  - `default` - Default language set by the user in the [`ai.languages`](/docs/swml/reference/calling/ai/languages) property
-  - `bg` - Bulgarian
-  - `ca` - Catalan
-  - `cs` - Czech
-  - `da` - Danish
-  - 
```
- **modified** `specs/swml/calling/Methods/ai/_shared/fillers.tsp` (+264/-278)
```diff
@@ -4,282 +4,268 @@ using TypeSpec.JsonSchema;
 
 namespace SWML.Calling;
 
-@doc("Supported language codes")
-@oneOf
-union FunctionFillers {
-  {
-    @doc("Default language set by the user")
-    @example(#["one moment please", "let me check"])
-    default: string[],
-  },
-  {
-    @doc("Bulgarian")
-    @example(#["един момент", "нека проверя"])
-    bg: string[],
-  },
-  {
-    @doc("Catalan")
-    @example(#["un moment", "deixa'm comprovar"])
-    ca: string[],
-  },
-  {
-    @doc("Chinese (Simplified)")
-    @example(#["请稍等", "让我查一下"])
-    zh: string[],
-  },
-  {
-    @doc("Chinese (Simplified, China)")
-    @example(#["请稍等", "让我查一下"])
-    `zh-CN`: string[],
-  },
-  {
-    @doc("Chinese (Simplified Han)")
-    @example(#["请稍等", "让我查一下"])
-    `zh-Hans`: string[],
-  },
-  {
-    @doc("Chinese (Traditional, Taiwan)")
-    @example(#["請稍等", "讓我查一下"])
-    `zh-TW`: string[],
-  },
-  {
-    @doc("Chinese (Traditional Han)")
-    @example(#["請稍等", "讓我查一下"])
-    `zh-Hant`: string[],
-  },
-  {
-    @doc("Chinese (Traditional, Hong Kong)")
-    @example(#["請稍等", "讓我查一下"])
-    `zh-HK`: string[],
-  },
-  {
-    @doc("Czech")
-    @example(#["moment prosím", "nechte mě zko
```
- **added** `specs/swml/calling/Methods/ai/ai_multilingual.tsp` (+132/-0)
```diff
@@ -0,0 +1,132 @@
+import "@typespec/json-schema";
+import "../../../Shared/Types/main.tsp";
+import "./ai_languages.tsp";
+import "./_shared/fillers.tsp";
+
+using TypeSpec.JsonSchema;
+
+namespace SWML.Calling;
+
+// A multilingual entry is flat: parse_multilingual reads only `language`, `voice`, `engine`,
+// `model`, and `params`. The last four are shared with `languages[]` and picked from
+// LanguagesBase so their descriptions live in one place. Anything added to LanguagesBase must
+// be picked in here deliberately, or it would appear in the schema while the engine ignores it.
+union PickedMultilingualLanguage {
+  "voice",
+  "engine",
+  "model",
+  "params",
+}
+
+@summary("MultilingualLanguage")
+model MultilingualLanguage {
+  @doc("""
+    The language this voice applies to, as a code the ASR engine supports.
+    Use `default` instead of a code to mark the catch-all entry, which speaks any
+    detected language that has no entry of its own.
+    """)
+  @example("es")
+  language: string;
+
+  // `voice` is required on `languages[]` but not here. Only the base entry — the `default`
+  // entry when one is given, otherwise the first language listed — has to carry a vo
```
- **modified** `fern/products/platform/pages/calling/voice/TTS/google.mdx` → /docs/platform/voice/tts/gcloud ("Google Cloud") (+6/-3)
- **modified** `fern/products/server-sdks/pages/guides/build-ai-agents/voice-language.mdx` → /docs/server-sdks/guides/voice-language ("Voice & Language") (+9/-1)
- **modified** `fern/products/server-sdks/pages/reference/python/agents/agent-base/add-language.mdx` → /docs/server-sdks/reference/python/agents/agent-base/add-language ("add_language") (+10/-6)
- **modified** `fern/products/server-sdks/pages/reference/typescript/agents/agent-base/add-language.mdx` → /docs/server-sdks/reference/typescript/agents/agent-base/add-language ("addLanguage") (+10/-6)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_params/index.mdx` → /docs/swml/reference/calling/ai/params ("params") (+33/-2)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/index.mdx` → /docs/swml/reference/calling/ai/swaig ("SWAIG") (+23/-21)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/index.mdx` → /docs/swml/reference/calling/ai ("ai") (+10/-0)
- **modified** `fern/snippets/swml/_supported-language-codes.mdx` (+3/-2)
- **modified** `specs/swml/calling/Methods/ai/ai_languages.tsp` (+71/-28)
- **modified** `specs/swml/calling/Methods/ai/ai_params.tsp` (+53/-3)
- **modified** `specs/swml/calling/Methods/ai/main.tsp` (+14/-1)
- **modified** `specs/swml/calling/Methods/ai/prompt/contexts/main.tsp` (+4/-4)
- **modified** `specs/swml/calling/Methods/ai/swaig/internal_filler.tsp` (+20/-5)

---

### PR #568 — AI guides follow-ups

Author: Devon-White · Merged: 2026-08-19T20:30:29Z · 20 docs files changed

_(no description)_

Changed files:
- **removed** `fern/products/platform/pages/ai/get-started/capabilities/index.mdx` (+0/-463)
```diff
@@ -1,463 +0,0 @@
----
-id: ec1d338d-9a57-4256-bb95-fd50df79a14a
-title: AI platform
-slug: /ai/capabilities
-description: How SignalWire's AI platform works, from the ways to build agents and AI in the media path to conversation intelligence, analytics, integrations, and compliance.
-max-toc-depth: 3
----
-
-SignalWire's AI platform is a single system for building and deploying conversational AI.
-It orchestrates voice, video, and messaging on one platform, with native integrations for the major LLM,
-Text-to-Speech, and Speech-to-Text providers.
-Functions execute serverlessly during live conversations, in parallel and asynchronously where needed,
-and a global edge network with points of presence in every major region keeps latency low.
-Security, compliance, logging, and analytics are part of the platform rather than add-ons.
-
----
-
-## Ways to build AI agents
-
-An AI agent is a resource on the SignalWire platform.
-However you create it — in SWML, with a Server SDK, in the Dashboard's AI Agents UI, or as a
-node in Call Flow Builder — the result is the same kind of agent: addressable from phone
-numbers, SIP, and your applications, running on the same realtime infrastructur
```
- **renamed** `fern/products/platform/pages/ai/get-started/tool-calling/index.mdx` → /docs/platform/ai/tool-calling ("Tool calling") (+223/-217)
```diff
@@ -4,6 +4,7 @@ slug: /ai/tool-calling
 description: Connect your AI agent to your backend with tool calls, so that your code owns business logic, live data, and decisions.
 subtitle: The AI runs the conversation. Your code runs the business.
 max-toc-depth: 3
+position: 2
 ---
 
 [best-practices]: /docs/platform/ai/best-practices
@@ -28,15 +29,20 @@ max-toc-depth: 3
 
 Ask a language model what a ride across town costs, with nothing else to go on, and it will give you
 a number. The number will sound right. That doesn't make it the fare you charge.
+A model without tools has no way to tell the difference: it will invent an answer rather than admit
+it doesn't know.
 
-An agent on a real phone line needs two things a model can't supply on its own.
-It needs facts that are current for this caller, like the fare to their address or whether a driver
-is free. It also needs to act: book the pickup, text the receipt, transfer the call.
-Tool calling, also called function calling, gives it both.
-The agent runs the conversation while your backend stays the source of truth.
+Tool calling, also called function calling, closes that gap. A tool can look up or check something,
+such as the fa
```
- **added** `fern/products/platform/pages/ai/guides/analytics.mdx` → /docs/platform/ai/analytics ("Conversation analytics") (+442/-0)
```diff
@@ -0,0 +1,442 @@
+---
+title: Conversation analytics
+slug: /ai/analytics
+description: Use final post-prompt reports to analyze SignalWire AI conversations and live debug webhooks to troubleshoot voice calls.
+max-toc-depth: 3
+---
+
+[best-practices]: /docs/platform/ai/best-practices
+[content-redaction]: /docs/platform/ai/content-redaction
+[debug-webhook-ref]: /docs/apis/rest/webhooks/ai-debug-webhook
+[enable-debug-events]: /docs/server-sdks/reference/python/agents/agent-base/enable-debug-events
+[on-summary]: /docs/server-sdks/reference/python/agents/agent-base/on-summary
+[post-prompt-callback]: /docs/apis/rest/webhooks/ai-post-prompt-callback
+[prompt-engineering]: /docs/platform/ai/prompt-engineering
+[set-post-prompt]: /docs/server-sdks/reference/python/agents/agent-base/set-post-prompt
+[speech-hints]: /docs/server-sdks/guides/hints
+[tool-calling]: /docs/platform/ai/tool-calling
+[tts]: /docs/platform/voice/tts
+
+Conversation analytics shows what happened during an AI conversation, how well the experience
+performed, and whether the user accomplished their goal. Use it to replace impressions such as
+"the agent felt slow" or "the call went poorly" with specific eviden
```
- **modified** `fern/products/platform/pages/ai/guides/prompt-engineering/index.mdx` → /docs/platform/ai/prompt-engineering ("Prompt engineering") (+314/-190)
```diff
@@ -1,219 +1,343 @@
 ---
-id: 3244a74f-bdd3-4454-8c02-7ae18c802b7e
 title: Prompt engineering
 sidebar-title: Prompt engineering
-subtitle: The craft of writing effective prompts for SignalWire AI agents
+subtitle: Write clear, reliable prompts for SignalWire AI agents
 slug: /ai/prompt-engineering
-description: Learn the fundamentals of prompt engineering and how it can help you create responsive and reliable AI agents for your SignalWire applications.
+description: Learn where to place AI agent instructions, how to structure an effective prompt, and when to enforce behavior in code instead.
 max-toc-depth: 3
 ---
 
-[context-steps]: /docs/platform/ai/prompt-engineering/where-to-apply#context-steps
-[swaig]: /docs/platform/ai/prompt-engineering/where-to-apply#swaig-functions
-[conscience]: /docs/platform/ai/prompt-engineering/where-to-apply#conscience
-[post-prompt]: /docs/platform/ai/prompt-engineering/where-to-apply#post-prompt
-
-SignalWire AI Agents combine 
-<Tooltip tip="ASR, or 'Automatic Speech Recognition', is also known as 'Speech-to-Text' (STT).">ASR</Tooltip>, 
-conversational intelligence, 
-[tool calling](/docs/platform/ai/tool-calling),
-<Tooltip tip="'Retrieval Aug
```
- **modified** `fern/products/platform/pages/ai/overview.mdx` → /docs/platform/ai ("System-directed AI") (+140/-818)
```diff
@@ -1,872 +1,194 @@
 ---
-id: 9b5e2dd1-c53b-44fc-b210-ce32e99e5039
 slug: /ai
-title: SignalWire AI
+title: System-directed AI
 sidebar-title: Overview
 position: 0
-subtitle: Programmable, integrated, realtime voice AI
-description: Build programmable, realtime voice AI agents with SWML, the SignalWire Dashboard, Call Flow Builder, or the Server SDKs.
+subtitle: Build conversational agents directed by your code, data, and business rules
+description: SignalWire AI runs voice and text conversations while your code supplies current data, enforces business rules, and directs agent actions.
 max-toc-depth: 3
 ---
 
-SignalWire AI runs programmable voice agents on the same realtime platform that carries your calls.
-Deploy a minimum viable product with no-code and low-code tools, then scale it with
-[SWML](/docs/swml) or the [Server SDKs](/docs/server-sdks).
+[addresses]: /docs/platform/addresses
+[analytics]: /docs/platform/ai/analytics
+[best-practices]: /docs/platform/ai/best-practices
+[chat-api]: /docs/apis/rest/ai-chat/chat-methods
+[chat-client]: /docs/server-sdks/reference/python/agents/ai-chat-client
+[chat-gateway]: /docs/server-sdks/reference/python/agents/chat-gateway
+[cal
```
- **modified** `fern/docs.yml` (+18/-0)
- **modified** `fern/products/call-flow-builder/pages/nodes/ai_agent.mdx` → /docs/call-flow-builder/reference/ai-agent ("AI Agent") (+3/-3)
- **renamed** `fern/products/platform/pages/ai/get-started/best-practices-for-ai/index.mdx` → /docs/platform/ai/best-practices ("Best practices for creating a SignalWire AI agent") (+239/-186)
- **removed** `fern/products/platform/pages/ai/get-started/no-code-agents.mdx` (+0/-142)
- **added** `fern/products/platform/pages/ai/get-started/quickstart.mdx` → /docs/platform/ai/quickstart ("Quickstart") (+324/-0)
- **modified** `fern/products/platform/pages/ai/guides/content-redaction/index.mdx` → /docs/platform/ai/content-redaction ("Handling sensitive content") (+213/-172)
- **removed** `fern/products/platform/pages/ai/guides/prompt-engineering/best-practices.mdx` (+0/-428)
- **removed** `fern/products/platform/pages/ai/guides/prompt-engineering/prompt-areas.mdx` (+0/-377)
- **modified** `fern/products/platform/pages/calling/voice/overview.mdx` → /docs/platform/voice ("Voice") (+2/-2)
- **modified** `fern/products/platform/pages/getting-started.mdx` → /docs/platform/getting-started ("Get started") (+8/-19)
- **modified** `fern/products/platform/pages/platform/call-fabric/resources.mdx` → /docs/platform/resources ("Resources") (+2/-5)
- **modified** `fern/products/platform/platform.yml` (+0/-1)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/index.mdx` → /docs/swml/reference/calling/ai ("ai") (+3/-3)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/prompt/index.mdx` → /docs/swml/reference/calling/ai/prompt ("prompt") (+2/-2)
- **modified** `fern/products/swml/pages/reference/methods/calling/bedrock/index.mdx` → /docs/swml/reference/calling/amazon-bedrock ("amazon_bedrock") (+2/-2)

---

### PR #527 — Add doc on SWML requests signature

Author: giavac · Merged: 2026-08-19T13:48:40Z · 2 docs files changed

## Description

Documents the HMAC signature SignalWire sends with every request for a SWML document, so developers serving SWML from their own web server can verify the caller.

The scheme itself is not new — `X-Signalwire-Signature` has been sent on SWML document fetches for some time, and it is verifiable with the existing `validateRequest` helper. What was missing was any mention of it in the SWML documentation. The Compatibility API has a dedicated Webhook security page and the Platform section documents the signature generically, but a developer following the SWML guides had no way to learn that their endpoint receives a signature at all, or how to check it. This adds that page and links to it from the guide where it matters.

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [x] Documentation update
- [ ] Code cleanup / refactor

## Related Issues

<!-- Link any related issues: Fixes #123 or Relates to #456 -->

## Testing

<!-- How did you test your changes? -->

- [ ] Added/updated unit tests
- [ ] Tested manually
- [ ] Tested with live SignalWire credentials (if applicable)

## Checklist

- [x] I have read the [CONTRIBUTING](CONTRIBUTING.md) guidelines
- [x] My code follows the project's style guidelines
- [x] I have added tests for my changes (if applicable)
- [x] I have updated documentation (if applicable)
- [x] All existing tests pass

## Additional Notes

<!-- Any other context about the PR -->

Changed files:
- **modified** `fern/products/swml/pages/guides/basics/swml_remote_server.mdx` → /docs/swml/guides/remote-server ("Handle incoming calls from code") (+12/-0)
```diff
@@ -188,6 +188,18 @@ app.post("/start", async (req, res) => {
 app.listen(3000);
 ```
 
+### Verifying that the request came from SignalWire
+
+Anyone who learns your endpoint URL can POST to it and read back the SWML document you return, so a
+public endpoint should check who is calling it before it answers.
+
+SignalWire signs every request for a SWML document with an HMAC signature in the
+`X-Signalwire-Signature` header, which you can verify against your project's signing key.
+
+<Card title="Verify SWML request signatures" href="/docs/swml/guides/webhook-security">
+  How the signature is computed, and how to verify it in Node, Python, or Ruby.
+</Card>
+
 ## Conclusion
 
 We have shown how to handle incoming calls from code, by emitting SWML instructions that say something on a call, but it can do so much more! For more advanced applications, you'll want to check out [SWML's Technical Reference](/docs/swml).
```
- **added** `fern/products/swml/pages/guides/basics/webhook-security.mdx` → /docs/swml/guides/webhook-security ("Verify SWML request signatures") (+279/-0)
```diff
@@ -0,0 +1,279 @@
+---
+title: Verify SWML request signatures
+subtitle: Confirm that a request for a SWML document really came from SignalWire.
+slug: /guides/webhook-security
+description: Verify the HMAC signature SignalWire sends with every request for a SWML document, so your server can reject forged requests.
+max-toc-depth: 3
+---
+
+When you serve SWML from your own web server, anyone who learns your endpoint URL can POST to it
+and read back the SWML document you return. Since a SWML document can contain phone numbers, SIP
+credentials, and prompts, that endpoint should not answer to just anyone.
+
+To let you check the caller, SignalWire signs every request for a SWML document with an HMAC
+signature derived from your project's signing key. Verifying that signature proves the request came
+from SignalWire and that neither the URL nor the body was altered in transit.
+
+<Warning title="This step is not optional!">
+For production applications it is extremely important to verify the signature, so that requests
+from a malicious third party are rejected instead of being served a SWML document.
+</Warning>
+
+## Which requests are signed
+
+Every POST SignalWire makes to fetc
```

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
