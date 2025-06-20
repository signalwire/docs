---
title: "agent_server"
---

# agent_server

Copyright (c) 2025 SignalWire

This file is part of the SignalWire AI Agents SDK.

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

## AgentBase

Base class for all SignalWire AI Agents.

This class extends SWMLService and provides enhanced functionality for building agents including:
- Prompt building and customization
- SWML rendering
- SWAIG function definition and execution
- Web service for serving SWML and handling webhooks
- Security and session management

Subclassing options:
1. Simple override of get_prompt() for raw text
2. Using prompt_* methods for structured prompts
3. Declarative PROMPT_SECTIONS class attribute

### Methods

#### tool
```python
tool(cls, name = None, kwargs = {})
```

Class method decorator for defining SWAIG tools

Used as:

@AgentBase.tool(name="example_function", parameters=\{...\})
def example_function(self, param1):
    # ...

#### define_contexts
```python
define_contexts()
```

Define contexts and steps for this agent (alternative to POM/prompt)

Returns:
    ContextBuilder for method chaining
    
Note:
    Contexts can coexist with traditional prompts. The restriction is only
    that you can't mix POM sections with raw text in the main prompt.

#### set_prompt_text
```python
set_prompt_text(text: str)
```

Set the prompt as raw text instead of using POM

Args:
    text: The raw prompt text
    
Returns:
    Self for method chaining

#### set_post_prompt
```python
set_post_prompt(text: str)
```

Set the post-prompt text for summary generation

Args:
    text: The post-prompt text
    
Returns:
    Self for method chaining

#### set_prompt_pom
```python
set_prompt_pom(pom: List[Dict[str, Any]])
```

Set the prompt as a POM dictionary

Args:
    pom: POM dictionary structure
    
Returns:
    Self for method chaining

#### prompt_add_section
```python
prompt_add_section(title: str, body: str = '', bullets: Optional[List[str]] = None, numbered: bool = False, numbered_bullets: bool = False, subsections: Optional[List[Dict[str, Any]]] = None)
```

Add a section to the prompt

Args:
    title: Section title
    body: Optional section body text
    bullets: Optional list of bullet points
    numbered: Whether this section should be numbered
    numbered_bullets: Whether bullets should be numbered
    subsections: Optional list of subsection objects
    
Returns:
    Self for method chaining

#### prompt_add_to_section
```python
prompt_add_to_section(title: str, body: Optional[str] = None, bullet: Optional[str] = None, bullets: Optional[List[str]] = None)
```

Add content to an existing section (creating it if needed)

Args:
    title: Section title
    body: Optional text to append to section body
    bullet: Optional single bullet point to add
    bullets: Optional list of bullet points to add
    
Returns:
    Self for method chaining

#### prompt_add_subsection
```python
prompt_add_subsection(parent_title: str, title: str, body: str = '', bullets: Optional[List[str]] = None)
```

Add a subsection to an existing section (creating parent if needed)

Args:
    parent_title: Parent section title
    title: Subsection title
    body: Optional subsection body text
    bullets: Optional list of bullet points
    
Returns:
    Self for method chaining

#### define_tool
```python
define_tool(name: str, description: str, parameters: Dict[str, Any], handler: Callable, secure: bool = True, fillers: Optional[Dict[str, List[str]]] = None, webhook_url: Optional[str] = None, swaig_fields = {})
```

Define a SWAIG function that the AI can call

Args:
    name: Function name (must be unique)
    description: Function description for the AI
    parameters: JSON Schema of parameters
    handler: Function to call when invoked
    secure: Whether to require token validation
    fillers: Optional dict mapping language codes to arrays of filler phrases
    webhook_url: Optional external webhook URL to use instead of local handling
    **swaig_fields: Additional SWAIG fields to include in function definition
    
Returns:
    Self for method chaining

#### register_swaig_function
```python
register_swaig_function(function_dict: Dict[str, Any])
```

Register a raw SWAIG function dictionary (e.g., from DataMap.to_swaig_function())

Args:
    function_dict: Complete SWAIG function definition dictionary
    
Returns:
    Self for method chaining

#### get_name
```python
get_name()
```

Get agent name

Returns:
    Agent name

#### get_app
```python
get_app()
```

Get the FastAPI application instance for deployment adapters like Lambda/Mangum

This method ensures the FastAPI app is properly initialized and configured,
then returns it for use with deployment adapters like Mangum for AWS Lambda.

Returns:
    FastAPI: The configured FastAPI application instance

#### get_prompt
```python
get_prompt()
```

Get the prompt for the agent

Returns:
    Either a string prompt or a POM object as list of dicts

#### get_post_prompt
```python
get_post_prompt()
```

Get the post-prompt for the agent

Returns:
    Post-prompt text or None if not set

#### define_tools
```python
define_tools()
```

Define the tools this agent can use

Returns:
    List of SWAIGFunction objects or raw dictionaries (for data_map tools)
    
This method can be overridden by subclasses.

#### on_summary
```python
on_summary(summary: Optional[Dict[str, Any]], raw_data: Optional[Dict[str, Any]] = None)
```

Called when a post-prompt summary is received

Args:
    summary: The summary object or None if no summary was found
    raw_data: The complete raw POST data from the request

#### on_function_call
```python
on_function_call(name: str, args: Dict[str, Any], raw_data: Optional[Dict[str, Any]] = None)
```

Called when a SWAIG function is invoked

Args:
    name: Function name
    args: Function arguments
    raw_data: Raw request data
    
Returns:
    Function result

#### validate_basic_auth
```python
validate_basic_auth(username: str, password: str)
```

Validate basic auth credentials

Args:
    username: Username from request
    password: Password from request
    
Returns:
    True if valid, False otherwise
    
This method can be overridden by subclasses.

#### validate_tool_token
```python
validate_tool_token(function_name: str, token: str, call_id: str)
```

Validate a tool token

Args:
    function_name: Name of the function/tool
    token: Token to validate
    call_id: Call ID for the session
    
Returns:
    True if token is valid, False otherwise

#### get_basic_auth_credentials
```python
get_basic_auth_credentials(include_source: bool = False)
```

Get the basic auth credentials

Args:
    include_source: Whether to include the source of the credentials
    
Returns:
    If include_source is False:
        (username, password) tuple
    If include_source is True:
        (username, password, source) tuple, where source is one of:
        "provided", "environment", or "generated"

#### get_full_url
```python
get_full_url(include_auth: bool = False)
```

Get the full URL for this agent's endpoint

Args:
    include_auth: Whether to include authentication credentials in the URL
    
Returns:
    Full URL including host, port, and route (with auth if requested)

#### as_router
```python
as_router()
```

Get a FastAPI router for this agent

Returns:
    FastAPI router

#### serve
```python
serve(host: Optional[str] = None, port: Optional[int] = None)
```

Start a web server for this agent

Args:
    host: Optional host to override the default
    port: Optional port to override the default

#### run
```python
run(event = None, context = None, force_mode = None, host: Optional[str] = None, port: Optional[int] = None)
```

Smart run method that automatically detects environment and handles accordingly

Args:
    event: Serverless event object (Lambda, Cloud Functions)
    context: Serverless context object (Lambda, Cloud Functions)
    force_mode: Override automatic mode detection for testing
    host: Host override for server mode
    port: Port override for server mode
    
Returns:
    Response for serverless modes, None for server mode

#### handle_serverless_request
```python
handle_serverless_request(event = None, context = None, mode = None)
```

Handle serverless environment requests (CGI, Lambda, Cloud Functions)

Args:
    event: Serverless event object (Lambda, Cloud Functions)
    context: Serverless context object (Lambda, Cloud Functions)
    mode: Override execution mode (from force_mode in run())
    
Returns:
    Response appropriate for the serverless platform

#### setup_graceful_shutdown
```python
setup_graceful_shutdown()
```

Setup signal handlers for graceful shutdown (useful for Kubernetes)

#### on_swml_request
```python
on_swml_request(request_data: Optional[dict] = None, callback_path: Optional[str] = None, request: Optional[Request] = None)
```

Customization point for subclasses to modify SWML based on request data

Args:
    request_data: Optional dictionary containing the parsed POST body
    callback_path: Optional callback path
    request: Optional FastAPI Request object for accessing query params, headers, etc.
    
Returns:
    Optional dict with modifications to apply to the SWML document

#### add_hint
```python
add_hint(hint: str)
```

Add a simple string hint to help the AI agent understand certain words better

Args:
    hint: The hint string to add
    
Returns:
    Self for method chaining

#### add_hints
```python
add_hints(hints: List[str])
```

Add multiple string hints

Args:
    hints: List of hint strings
    
Returns:
    Self for method chaining

#### add_pattern_hint
```python
add_pattern_hint(hint: str, pattern: str, replace: str, ignore_case: bool = False)
```

Add a complex hint with pattern matching

Args:
    hint: The hint to match
    pattern: Regular expression pattern
    replace: Text to replace the hint with
    ignore_case: Whether to ignore case when matching
    
Returns:
    Self for method chaining

#### add_language
```python
add_language(name: str, code: str, voice: str, speech_fillers: Optional[List[str]] = None, function_fillers: Optional[List[str]] = None, engine: Optional[str] = None, model: Optional[str] = None)
```

Add a language configuration to support multilingual conversations

Args:
    name: Name of the language (e.g., "English", "French")
    code: Language code (e.g., "en-US", "fr-FR")
    voice: TTS voice to use. Can be a simple name (e.g., "en-US-Neural2-F") 
          or a combined format "engine.voice:model" (e.g., "elevenlabs.josh:eleven_turbo_v2_5")
    speech_fillers: Optional list of filler phrases for natural speech
    function_fillers: Optional list of filler phrases during function calls
    engine: Optional explicit engine name (e.g., "elevenlabs", "rime")
    model: Optional explicit model name (e.g., "eleven_turbo_v2_5", "arcana")
    
Returns:
    Self for method chaining
    
Examples:
    # Simple voice name
    agent.add_language("English", "en-US", "en-US-Neural2-F")
    
    # Explicit parameters
    agent.add_language("English", "en-US", "josh", engine="elevenlabs", model="eleven_turbo_v2_5")
    
    # Combined format
    agent.add_language("English", "en-US", "elevenlabs.josh:eleven_turbo_v2_5")

#### set_languages
```python
set_languages(languages: List[Dict[str, Any]])
```

Set all language configurations at once

Args:
    languages: List of language configuration dictionaries
    
Returns:
    Self for method chaining

#### add_pronunciation
```python
add_pronunciation(replace: str, with_text: str, ignore_case: bool = False)
```

Add a pronunciation rule to help the AI speak certain words correctly

Args:
    replace: The expression to replace
    with_text: The phonetic spelling to use instead
    ignore_case: Whether to ignore case when matching
    
Returns:
    Self for method chaining

#### set_pronunciations
```python
set_pronunciations(pronunciations: List[Dict[str, Any]])
```

Set all pronunciation rules at once

Args:
    pronunciations: List of pronunciation rule dictionaries
    
Returns:
    Self for method chaining

#### set_param
```python
set_param(key: str, value: Any)
```

Set a single AI parameter

Args:
    key: Parameter name
    value: Parameter value
    
Returns:
    Self for method chaining

#### set_params
```python
set_params(params: Dict[str, Any])
```

Set multiple AI parameters at once

Args:
    params: Dictionary of parameter name/value pairs
    
Returns:
    Self for method chaining

#### set_global_data
```python
set_global_data(data: Dict[str, Any])
```

Set the global data available to the AI throughout the conversation

Args:
    data: Dictionary of global data
    
Returns:
    Self for method chaining

#### update_global_data
```python
update_global_data(data: Dict[str, Any])
```

Update the global data with new values

Args:
    data: Dictionary of global data to update
    
Returns:
    Self for method chaining

#### set_native_functions
```python
set_native_functions(function_names: List[str])
```

Set the list of native functions to enable

Args:
    function_names: List of native function names
    
Returns:
    Self for method chaining

#### set_internal_fillers
```python
set_internal_fillers(internal_fillers: Dict[str, Dict[str, List[str]]])
```

Set internal fillers for native SWAIG functions

Internal fillers provide custom phrases the AI says while executing
internal/native functions like check_time, wait_for_user, next_step, etc.

Args:
    internal_fillers: Dictionary mapping function names to language-specific filler phrases
                    Format: \{"function_name": \{"language_code": ["phrase1", "phrase2"]\}\}
                    Example: \{"next_step": \{"en-US": ["Moving to the next step...", "Great, let's continue..."]\}\}
    
Returns:
    Self for method chaining
    
Example:
    agent.set_internal_fillers(\{
        "next_step": \{
            "en-US": ["Moving to the next step...", "Great, let's continue..."],
            "es": ["Pasando al siguiente paso...", "Excelente, continuemos..."]
        \},
        "check_time": \{
            "en-US": ["Let me check the time...", "Getting the current time..."]
        \}
    \})

#### add_internal_filler
```python
add_internal_filler(function_name: str, language_code: str, fillers: List[str])
```

Add internal fillers for a specific function and language

Args:
    function_name: Name of the internal function (e.g., 'next_step', 'check_time')
    language_code: Language code (e.g., 'en-US', 'es', 'fr')
    fillers: List of filler phrases for this function and language
    
Returns:
    Self for method chaining
    
Example:
    agent.add_internal_filler("next_step", "en-US", ["Moving to the next step...", "Great, let's continue..."])

#### add_function_include
```python
add_function_include(url: str, functions: List[str], meta_data: Optional[Dict[str, Any]] = None)
```

Add a remote function include to the SWAIG configuration

Args:
    url: URL to fetch remote functions from
    functions: List of function names to include
    meta_data: Optional metadata to include with the function include
    
Returns:
    Self for method chaining

#### set_function_includes
```python
set_function_includes(includes: List[Dict[str, Any]])
```

Set the complete list of function includes

Args:
    includes: List of include objects, each with url and functions properties
    
Returns:
    Self for method chaining

#### enable_sip_routing
```python
enable_sip_routing(auto_map: bool = True, path: str = '/sip')
```

Enable SIP-based routing for this agent

This allows the agent to automatically route SIP requests based on SIP usernames.
When enabled, an endpoint at the specified path is automatically created
that will handle SIP requests and deliver them to this agent.

Args:
    auto_map: Whether to automatically map common SIP usernames to this agent
             (based on the agent name and route path)
    path: The path to register the SIP routing endpoint (default: "/sip")

Returns:
    Self for method chaining

#### register_sip_username
```python
register_sip_username(sip_username: str)
```

Register a SIP username that should be routed to this agent

Args:
    sip_username: SIP username to register
    
Returns:
    Self for method chaining

#### auto_map_sip_usernames
```python
auto_map_sip_usernames()
```

Automatically register common SIP usernames based on this agent's 
name and route

Returns:
    Self for method chaining

#### set_web_hook_url
```python
set_web_hook_url(url: str)
```

Override the default web_hook_url with a supplied URL string

Args:
    url: The URL to use for SWAIG function webhooks
    
Returns:
    Self for method chaining

#### set_post_prompt_url
```python
set_post_prompt_url(url: str)
```

Override the default post_prompt_url with a supplied URL string

Args:
    url: The URL to use for post-prompt summary delivery
    
Returns:
    Self for method chaining

#### on_request
```python
on_request(request_data: Optional[dict] = None, callback_path: Optional[str] = None)
```

Called when SWML is requested, with request data when available

This method overrides SWMLService's on_request to properly handle SWML generation
for AI Agents. It forwards the call to on_swml_request for compatibility.

Args:
    request_data: Optional dictionary containing the parsed POST body
    callback_path: Optional callback path
    
Returns:
    None to use the default SWML rendering (which will call _render_swml)

#### register_routing_callback
```python
register_routing_callback(callback_fn: Callable[[Request, Dict[str, Any]], Optional[str]], path: str = '/sip')
```

Register a callback function that will be called to determine routing
based on POST data.

When a routing callback is registered, an endpoint at the specified path is automatically
created that will handle requests. This endpoint will use the callback to
determine if the request should be processed by this service or redirected.

The callback should take a request object and request body dictionary and return:
- A route string if it should be routed to a different endpoint
- None if normal processing should continue

Args:
    callback_fn: The callback function to register
    path: The path where this callback should be registered (default: "/sip")

#### set_dynamic_config_callback
```python
set_dynamic_config_callback(callback: Callable[[dict, dict, dict, EphemeralAgentConfig], None])
```

Set a callback function for dynamic agent configuration

This callback receives an EphemeralAgentConfig object that provides the same
configuration methods as AgentBase, allowing you to dynamically configure
the agent's voice, prompt, parameters, etc. based on request data.

Args:
    callback: Function that takes (query_params, body_params, headers, agent_config)
             and configures the agent_config object using familiar methods like:
             - agent_config.add_language(...)
             - agent_config.prompt_add_section(...)
             - agent_config.set_params(...)
             - agent_config.set_global_data(...)
             
Example:
    def my_config(query_params, body_params, headers, agent):
        if query_params.get('tier') == 'premium':
            agent.add_language("English", "en-US", "premium_voice")
            agent.set_params(\{"end_of_speech_timeout": 500\})
        agent.set_global_data(\{"tier": query_params.get('tier', 'standard')\})
    
    my_agent.set_dynamic_config_callback(my_config)

#### manual_set_proxy_url
```python
manual_set_proxy_url(proxy_url: str)
```

Manually set the proxy URL base for webhook callbacks

This can be called at runtime to set or update the proxy URL

Args:
    proxy_url: The base URL to use for webhooks (e.g., https://example.ngrok.io)
    
Returns:
    Self for method chaining

#### add_skill
```python
add_skill(skill_name: str, params: Optional[Dict[str, Any]] = None)
```

Add a skill to this agent

Args:
    skill_name: Name of the skill to add
    params: Optional parameters to pass to the skill for configuration
    
Returns:
    Self for method chaining
    
Raises:
    ValueError: If skill not found or failed to load with detailed error message

#### remove_skill
```python
remove_skill(skill_name: str)
```

Remove a skill from this agent

#### list_skills
```python
list_skills()
```

List currently loaded skills

#### has_skill
```python
has_skill(skill_name: str)
```

Check if skill is loaded


## SWMLService

Base class for creating and serving SWML documents.

This class provides core functionality for:
- Loading and validating SWML schema
- Creating SWML documents
- Setting up web endpoints for serving SWML
- Managing authentication
- Registering SWML functions

It serves as the foundation for more specialized services like AgentBase.

### Methods

#### reset_document
```python
reset_document()
```

Reset the current document to an empty state

#### add_verb
```python
add_verb(verb_name: str, config: Union[Dict[str, Any], int])
```

Add a verb to the main section of the current document

Args:
    verb_name: The name of the verb to add
    config: Configuration for the verb or direct value for certain verbs (e.g., sleep)
    
Returns:
    True if the verb was added successfully, False otherwise

#### add_section
```python
add_section(section_name: str)
```

Add a new section to the document

Args:
    section_name: Name of the section to add
    
Returns:
    True if the section was added, False if it already exists

#### add_verb_to_section
```python
add_verb_to_section(section_name: str, verb_name: str, config: Union[Dict[str, Any], int])
```

Add a verb to a specific section

Args:
    section_name: Name of the section to add to
    verb_name: The name of the verb to add
    config: Configuration for the verb or direct value for certain verbs (e.g., sleep)
    
Returns:
    True if the verb was added successfully, False otherwise

#### get_document
```python
get_document()
```

Get the current SWML document

Returns:
    The current SWML document as a dictionary

#### render_document
```python
render_document()
```

Render the current SWML document as a JSON string

Returns:
    The current SWML document as a JSON string

#### register_verb_handler
```python
register_verb_handler(handler: SWMLVerbHandler)
```

Register a custom verb handler

Args:
    handler: The verb handler to register

#### as_router
```python
as_router()
```

Create a FastAPI router for this service

Returns:
    APIRouter: FastAPI router

#### register_routing_callback
```python
register_routing_callback(callback_fn: Callable[[Request, Dict[str, Any]], Optional[str]], path: str = '/sip')
```

Register a callback function that will be called to determine routing
based on POST data.

When a routing callback is registered, an endpoint at the specified path is automatically
created that will handle requests. This endpoint will use the callback to
determine if the request should be processed by this service or redirected.

The callback should take a request object and request body dictionary and return:
- A route string if it should be routed to a different endpoint
- None if normal processing should continue

Args:
    callback_fn: The callback function to register
    path: The path where this callback should be registered (default: "/sip")

#### extract_sip_username
```python
extract_sip_username(request_body: Dict[str, Any])
```

Extract SIP username from request body

This extracts the username portion of a SIP URI from the 'to' field
in the call data of a request body.

Args:
    request_body: The parsed JSON body of the request
    
Returns:
    The extracted SIP username, or None if not found

#### on_request
```python
on_request(request_data: Optional[dict] = None, callback_path: Optional[str] = None)
```

Called when SWML is requested, with request data when available

Subclasses can override this to inspect or modify SWML based on the request

Args:
    request_data: Optional dictionary containing the parsed POST body
    callback_path: Optional callback path
    
Returns:
    Optional dict to modify/augment the SWML document

#### serve
```python
serve(host: Optional[str] = None, port: Optional[int] = None, ssl_cert: Optional[str] = None, ssl_key: Optional[str] = None, ssl_enabled: Optional[bool] = None, domain: Optional[str] = None)
```

Start a web server for this service

Args:
    host: Host to bind to (defaults to self.host)
    port: Port to bind to (defaults to self.port)
    ssl_cert: Path to SSL certificate file
    ssl_key: Path to SSL key file
    ssl_enabled: Whether to enable SSL
    domain: Domain name for SSL certificate

#### stop
```python
stop()
```

Stop the web server

#### get_basic_auth_credentials
```python
get_basic_auth_credentials(include_source: bool = False)
```

Get the basic auth credentials

Args:
    include_source: Whether to include the source of the credentials
    
Returns:
    (username, password) tuple or (username, password, source) tuple if include_source is True

#### add_answer_verb
```python
add_answer_verb(max_duration: Optional[int] = None, codecs: Optional[str] = None)
```

Add an answer verb to the current document

Args:
    max_duration: Maximum duration in seconds
    codecs: Comma-separated list of codecs
    
Returns:
    True if added successfully, False otherwise

#### add_hangup_verb
```python
add_hangup_verb(reason: Optional[str] = None)
```

Add a hangup verb to the current document

Args:
    reason: Hangup reason (hangup, busy, decline)
    
Returns:
    True if added successfully, False otherwise

#### add_ai_verb
```python
add_ai_verb(prompt_text: Optional[str] = None, prompt_pom: Optional[List[Dict[str, Any]]] = None, post_prompt: Optional[str] = None, post_prompt_url: Optional[str] = None, swaig: Optional[Dict[str, Any]] = None, kwargs = {})
```

Add an AI verb to the current document

Args:
    prompt_text: Simple prompt text
    prompt_pom: Prompt object model
    post_prompt: Post-prompt text
    post_prompt_url: Post-prompt URL
    swaig: SWAIG configuration
    **kwargs: Additional parameters
    
Returns:
    True if added successfully, False otherwise

#### manual_set_proxy_url
```python
manual_set_proxy_url(proxy_url: str)
```

Manually set the proxy URL base for webhook callbacks

This can be called at runtime to set or update the proxy URL

Args:
    proxy_url: The base URL to use for webhooks (e.g., https://example.ngrok.io)


## AgentServer

Server for hosting multiple SignalWire AI Agents under a single FastAPI application.

This allows you to run multiple agents on different routes of the same server,
which is useful for deployment and resource management.

Example:
    server = AgentServer()
    server.register(SupportAgent(), "/support")
    server.register(SalesAgent(), "/sales") 
    server.run()

### Methods

#### register
```python
register(agent: AgentBase, route: Optional[str] = None)
```

Register an agent with the server

Args:
    agent: The agent to register
    route: Optional route to override the agent's default route
    
Raises:
    ValueError: If the route is already in use

#### setup_sip_routing
```python
setup_sip_routing(route: str = '/sip', auto_map: bool = True)
```

Set up central SIP-based routing for the server

This configures all agents to handle SIP requests at the specified path,
using a coordinated routing system where each agent checks if it can
handle SIP requests for specific usernames.

Args:
    route: The path for SIP routing (default: "/sip")
    auto_map: Whether to automatically map SIP usernames to agent routes

#### register_sip_username
```python
register_sip_username(username: str, route: str)
```

Register a mapping from SIP username to agent route

Args:
    username: The SIP username
    route: The route to the agent

#### unregister
```python
unregister(route: str)
```

Unregister an agent from the server

Args:
    route: The route of the agent to unregister
    
Returns:
    True if the agent was unregistered, False if not found

#### get_agents
```python
get_agents()
```

Get all registered agents

Returns:
    List of (route, agent) tuples

#### get_agent
```python
get_agent(route: str)
```

Get an agent by route

Args:
    route: The route of the agent
    
Returns:
    The agent or None if not found

#### run
```python
run(event = None, context = None, host: Optional[str] = None, port: Optional[int] = None)
```

Universal run method that automatically detects environment and handles accordingly

Detects execution mode and routes appropriately:
- Server mode: Starts uvicorn server with FastAPI
- CGI mode: Uses same routing logic but outputs CGI headers  
- Lambda mode: Uses same routing logic but returns Lambda response

Args:
    event: Serverless event object (Lambda, Cloud Functions)
    context: Serverless context object (Lambda, Cloud Functions)  
    host: Optional host to override the default (server mode only)
    port: Optional port to override the default (server mode only)
    
Returns:
    Response for serverless modes, None for server mode

#### register_global_routing_callback
```python
register_global_routing_callback(callback_fn: Callable[[Request, Dict[str, Any]], Optional[str]], path: str)
```

Register a routing callback across all agents

This allows you to add unified routing logic to all agents at the same path.

Args:
    callback_fn: The callback function to register
    path: The path to register the callback at


## get_logger

```python
get_logger(name: str)
```

Get a logger instance for the specified name with structured logging support

This is the single entry point for all logging in the SDK.
All modules should use this instead of direct logging module usage.

Args:
    name: Logger name, typically __name__
    
Returns:
    StructuredLoggerWrapper that supports both regular and structured logging


## get_execution_mode

Determine the execution mode based on environment variables

Returns:
    str: 'server', 'cgi', 'lambda', 'google_cloud_function', 'azure_function', or 'unknown'

