# Python SDK Reference — Documentation File Tree Plan

## Context

The unified SDKs product is scaffolded at `fern/products/sdks/` with 5 stub `overview.mdx` files under `pages/reference/python/`. No reference content exists yet. We explored the Python SDK source (`temp/signalwire-python/`) and mapped every public namespace, class, and method. This plan defines the complete file tree for the Python reference docs.

The SDK is v2.0.0. CLI tools and configuration are agent-centric, so they fold under the Agents namespace. **3 top-level namespaces**: Agents, RELAY, REST.

## Navigation Changes

`sdks.yml` currently has 5 top-level folders. Update to 3:

```yaml
# REMOVE these two entries:
- folder: ./pages/reference/python/cli
  title: CLI Tools
- folder: ./pages/reference/python/configuration
  title: Configuration
```

CLI and Configuration content moves physically into `agents/cli/` and `agents/configuration/` subfolders. The folder-based nav auto-discovers them as subsections within Agents.

Delete the now-empty stub directories:
- `pages/reference/python/cli/` (move overview.mdx → agents/cli/overview.mdx)
- `pages/reference/python/configuration/` (move overview.mdx → agents/configuration/overview.mdx)

## File Tree

163 MDX files across 3 namespaces. Convention: `namespace/class/index.mdx` + `methods/method.mdx`.

### `agents/` — AI Agent Framework, CLI, and Configuration (48 files)

```
agents/
  overview.mdx                         # [EXISTS] Namespace overview, class hierarchy, imports

  ## Core Classes
  agent-base/
    index.mdx                          # Central class. Constructor, properties, mixin composition, hello-world example
    methods/
      set-params.mdx                   # AIConfigMixin: set_param(), set_params()
      global-data.mdx                  # AIConfigMixin: set_global_data(), update_global_data()
      hints.mdx                        # AIConfigMixin: add_hint(), add_hints(), add_pattern_hint()
      languages.mdx                    # AIConfigMixin: add_language(), set_languages()
      pronunciations.mdx               # AIConfigMixin: add_pronunciation(), set_pronunciations()
      native-functions.mdx             # AIConfigMixin: set_native_functions()
      fillers.mdx                      # AIConfigMixin: set_internal_fillers(), add_internal_filler()
      debug-events.mdx                 # AIConfigMixin: enable_debug_events(), on_debug_event()
      set-prompt-text.mdx              # PromptMixin: set_prompt_text(), get_prompt()
      set-post-prompt.mdx              # PromptMixin: set_post_prompt(), get_post_prompt()
      set-prompt-pom.mdx               # PromptMixin: set_prompt_pom()
      prompt-sections.mdx              # PromptMixin: prompt_add_section(), prompt_add_to_section(), prompt_add_subsection()
      define-contexts.mdx              # PromptMixin: define_contexts()
      define-tool.mdx                  # ToolMixin: define_tool()
      tool-decorator.mdx               # ToolMixin: @tool() decorator
      register-swaig-function.mdx      # ToolMixin: register_swaig_function()
      add-skill.mdx                    # SkillMixin: add_skill(), remove_skill(), list_skills()
      serve.mdx                        # WebMixin: serve()
      run.mdx                          # WebMixin: run()
      get-app.mdx                      # WebMixin: get_app()
      as-router.mdx                    # WebMixin: as_router()
      on-summary.mdx                   # AgentBase: on_summary()
      verbs.mdx                        # add_pre_answer_verb(), add_answer_verb(), add_post_answer_verb(), etc.
      sip-routing.mdx                  # enable_sip_routing(), register_sip_username()
      webhook-urls.mdx                 # set_web_hook_url(), set_post_prompt_url()
      serverless.mdx                   # ServerlessMixin: handle_serverless_request()
  swml-service/
    index.mdx                          # SWML generation + FastAPI base, constructor, properties
    methods/
      add-verb.mdx                     # add_verb(), add_verb_to_section(), add_section()
      get-document.mdx                 # get_document(), render_document(), reset_document()
      register-verb-handler.mdx        # register_verb_handler()
      register-routing-callback.mdx    # register_routing_callback()
      serve.mdx                        # serve(), stop()
      on-request.mdx                   # on_request() hook
      auth.mdx                         # get_basic_auth_credentials(), manual_set_proxy_url()
  swml-builder/
    index.mdx                          # Fluent builder: answer(), hangup(), ai(), play(), say(), build(), render() — all on one page
  swaig-function/
    index.mdx                          # SWAIGFunction: constructor, execute(), validate_args(), to_swaig() — all on one page
  function-result/
    index.mdx                          # FunctionResult overview, set_response(), set_post_process(), fluent chain pattern
    methods/
      call-control.mdx                 # connect(), hangup(), hold(), transfer
      speech.mdx                       # say(), wait_for_user(), stop()
      media.mdx                        # play_background_file(), record_call(), tap()
      data.mdx                         # update_global_data(), set_metadata()
      context-navigation.mdx           # swml_change_step(), swml_change_context()
      events.mdx                       # swml_user_event(), simulate_user_input()
      functions.mdx                    # toggle_functions(), enable_functions_on_timeout()
      hints.mdx                        # add_dynamic_hints(), clear_dynamic_hints()
      settings.mdx                     # set_end_of_speech_timeout(), update_settings()
      sms.mdx                          # send_sms()
      pay.mdx                          # pay()
      sip.mdx                          # sip_refer()
      rooms.mdx                        # join_room(), join_conference()
      swml.mdx                         # execute_swml()
  context-builder/
    index.mdx                          # ContextBuilder: add_context(), get_context(), validate()
    context.mdx                        # Context class: add_step(), prompt methods, filler methods
    step.mdx                           # Step class: set_text(), add_section(), set_step_criteria(), set_functions()
  data-map/
    index.mdx                          # DataMap fluent API + create_simple_api_tool(), create_expression_tool() — all on one page
  skill-base/
    index.mdx                          # SkillBase: SKILL_NAME, setup(), register_tools(), define_tool() — all on one page
  pom-builder/
    index.mdx                          # PomBuilder: add_section(), render_markdown(), render_xml() — all on one page
  agent-server/
    index.mdx                          # AgentServer overview, constructor
    methods/
      register.mdx                     # register(), unregister()
      get-agents.mdx                   # get_agents(), get_agent()
      run.mdx                          # run()
      sip-routing.mdx                  # setup_sip_routing()
      routing-callback.mdx             # register_global_routing_callback()
      static-files.mdx                 # serve_static_files()
  bedrock-agent/
    index.mdx                          # BedrockAgent (extends AgentBase): set_voice(), set_inference_params() — all on one page
  prefabs.mdx                          # All 5 prefabs on one page: Concierge, FAQBot, InfoGatherer, Receptionist, Survey
  skills.mdx                           # Built-in skills catalog: 17 skills, config params, usage patterns

  ## CLI Tools (folded from top-level)
  cli/
    overview.mdx                       # CLI overview, installation, common patterns
    swaig-test.mdx                     # --list-tools, --exec, --dump-swml, --simulate-serverless, --route, --verbose
    sw-search.mdx                      # build, search, validate subcommands, --file-types, --output, chunking strategies
    sw-agent-init.mdx                  # Project scaffolding, --type, --no-venv, interactive prompts
    sw-agent-dokku.mdx                 # Dokku deployment helper
    mcp-gateway.mdx                    # MCP protocol bridge, config options

  ## Configuration (folded from top-level)
  configuration/
    overview.mdx                       # How config flows through the SDK
    environment-variables.mdx          # Complete env var reference (SIGNALWIRE_*, SWML_*, PORT, HOST, etc.)
    config-loader.mdx                  # ConfigLoader: find_config_file(), get(), get_section(), substitute_vars()
    security-config.mdx                # SecurityConfig: SSL, CORS, host allowlist
    auth-handler.mdx                   # AuthHandler: verify_basic_auth(), verify_bearer_token(), FastAPI dependency
```

### `relay/` — Real-time WebSocket Call Control (38 files)

```
relay/
  overview.mdx                         # [EXISTS] Namespace overview, WebSocket architecture, async patterns
  client/
    index.mdx                          # RelayClient constructor, properties, @on_call/@on_message decorators
    methods/
      connect.mdx                      # connect()
      disconnect.mdx                   # disconnect()
      run.mdx                          # run()
      dial.mdx                         # dial() → Call
      send-message.mdx                 # send_message() → Message
      receive.mdx                      # receive(contexts)
      unreceive.mdx                    # unreceive(contexts)
      execute.mdx                      # execute(method, params)
  call/
    index.mdx                          # Call overview, properties, on(), wait_for(), wait_for_ended()
    events.mdx                         # Event handling patterns, on() event types, lifecycle
    methods/
      answer.mdx
      hangup.mdx
      pass.mdx                         # pass_()
      transfer.mdx
      play.mdx
      record.mdx
      play-and-collect.mdx
      collect.mdx
      connect.mdx
      disconnect.mdx
      send-digits.mdx
      detect.mdx
      refer.mdx
      pay.mdx
      send-fax.mdx
      receive-fax.mdx
      tap.mdx
      stream.mdx
      hold.mdx                         # hold(), unhold()
      denoise.mdx                      # denoise(), denoise_stop()
      transcribe.mdx
      echo.mdx
      bind-digit.mdx                   # bind_digit(), clear_digit_bindings()
      live-transcribe.mdx              # live_transcribe(), live_translate()
      join-conference.mdx              # join_conference(), leave_conference()
      join-room.mdx                    # join_room(), leave_room()
      ai.mdx                           # ai(), amazon_bedrock()
      ai-message.mdx
      ai-hold.mdx                      # ai_hold(), ai_unhold()
      user-event.mdx
      queue.mdx                        # queue_enter(), queue_leave()
  message/
    index.mdx                          # Message class: properties, on(), wait() — all on one page
  actions.mdx                          # All Action classes on one page (PlayAction, RecordAction, etc.)
  events.mdx                           # All Event classes on one page (22+ typed wrappers)
  constants.mdx                        # RELAY constants: call states, connect states, event types, message states
```

### `rest/` — HTTP Resource Management (24 files)

```
rest/
  overview.mdx                         # [EXISTS] Namespace overview, RestClient constructor, auth, env vars
  client/
    index.mdx                          # RestClient constructor, all namespace properties (.fabric, .calling, etc.)
  calling/
    index.mdx                          # CallingNamespace overview: dial(), update(), end()
    methods/
      transfer.mdx                     # transfer(), disconnect()
      play.mdx                         # play(), play_pause/resume/stop/volume()
      record.mdx                       # record(), record_pause/resume/stop()
      collect.mdx                      # collect(), collect_stop(), collect_start_input_timers()
      detect.mdx                       # detect(), detect_stop()
      tap.mdx                          # tap(), tap_stop()
      stream.mdx                       # stream(), stream_stop()
      denoise.mdx                      # denoise(), denoise_stop()
      transcribe.mdx                   # transcribe/stop, live_transcribe, live_translate
      ai.mdx                           # ai_message(), ai_hold/unhold(), ai_stop()
      fax.mdx                          # send_fax_stop(), receive_fax_stop()
      refer.mdx
      user-event.mdx
  fabric/
    index.mdx                          # Full namespace: ai_agents, call_flows, conference_rooms, subscribers, cxml_apps
  video/
    index.mdx                          # Full namespace: rooms, conferences, streams
  compat/
    index.mdx                          # Twilio-compatible API: accounts, calls, messages, faxes, conferences, etc.
  phone-numbers.mdx                    # list(), search()
  addresses.mdx                        # CRUD
  queues.mdx                           # CRUD + members
  recordings.mdx                       # list(), get(), delete()
  number-groups.mdx                    # CRUD + membership
  verified-callers.mdx                 # CRUD + verification
  sip-profile.mdx                      # get(), update()
  lookup.mdx                           # lookup()
  short-codes.mdx                      # CRUD
  imported-numbers.mdx                 # create()
  mfa.mdx                             # request(), verify()
  registry.mdx                         # TCN: brands, campaigns, orders
  datasphere.mdx                       # documents CRUD, search
  logs.mdx                            # message, voice, fax, conference logs
  project.mdx                          # tokens, project info
  pubsub.mdx                           # publish(), subscribe()
  chat.mdx                            # send(), get_messages()
```

## Totals

| Namespace | MDX Files |
|-----------|-----------|
| agents | 80 |
| relay | 47 |
| rest | 36 |
| **Total** | **163** |

## Implementation Steps

1. **Update `sdks.yml`** — Remove `cli` and `configuration` folder entries from the reference tab variants
2. **Move existing stubs** — Move `cli/overview.mdx` and `configuration/overview.mdx` into `agents/cli/` and `agents/configuration/`
3. **Delete empty dirs** — Remove the now-empty `pages/reference/python/cli/` and `pages/reference/python/configuration/`
4. **Create directory tree** — Create all folders and empty MDX files with frontmatter stubs
5. **Verify** — Run build to confirm nav picks up all pages correctly

## Key Design Decisions

1. **3 top-level namespaces** — Agents (includes CLI + Config), RELAY, REST. CLI tools and configuration are agent-centric.
2. **AgentBase is the deepest class (26 method pages)** — central class with 9 composed mixins, methods grouped by topic.
3. **RELAY Call gets individual method pages** — 30+ distinct operations, each independently looked up.
4. **Action/Event classes grouped into single pages** — shared interfaces, thin typed wrappers.
5. **REST namespaces with <10 methods are flat MDX files** — only CallingNamespace (37 methods) gets a methods subfolder.
6. **Prefabs and Skills are single catalog pages** — config-driven templates, not deep APIs.
7. **Search, Livewire, MCP Gateway omitted** — internal infrastructure, not user-facing SDK namespaces.

## Source Files

| What | Source Path |
|------|------------|
| AgentBase + mixins | `temp/signalwire-python/signalwire/signalwire/core/agent_base.py` + `core/mixins/` |
| SWMLService | `temp/signalwire-python/signalwire/signalwire/core/swml_service.py` |
| FunctionResult | `temp/signalwire-python/signalwire/signalwire/core/function_result.py` |
| Contexts | `temp/signalwire-python/signalwire/signalwire/core/contexts.py` |
| DataMap | `temp/signalwire-python/signalwire/signalwire/core/data_map.py` |
| RELAY Client/Call | `temp/signalwire-python/signalwire/signalwire/relay/client.py`, `call.py` |
| RELAY Events | `temp/signalwire-python/signalwire/signalwire/relay/event.py` |
| REST Client | `temp/signalwire-python/signalwire/signalwire/rest/client.py` |
| REST Namespaces | `temp/signalwire-python/signalwire/signalwire/rest/namespaces/` |
| CLI Tools | `temp/signalwire-python/signalwire/signalwire/cli/` |
| Config | `temp/signalwire-python/signalwire/signalwire/core/config_loader.py` |
| Skills | `temp/signalwire-python/signalwire/signalwire/skills/` |
| Prefabs | `temp/signalwire-python/signalwire/signalwire/prefabs/` |
| Nav config | `fern/products/sdks/sdks.yml` |

## Verification

1. After updating `sdks.yml` and moving stubs, run `fern check` to confirm nav resolves
2. After creating the full directory tree, run local build to confirm all pages register
3. Spot-check method pages against source code for signature accuracy
