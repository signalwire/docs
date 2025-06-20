---
title: "agent_base"
---

# agent_base

Copyright (c) 2025 SignalWire

This file is part of the SignalWire AI Agents SDK.

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

## PomBuilder

Builder class for creating structured prompts using the Prompt Object Model.

This class is a flexible wrapper around the POM API that allows for:
- Dynamic creation of sections on demand
- Adding content to existing sections
- Nesting subsections
- Rendering to markdown or XML

Unlike previous implementations, there are no predefined section types -
you can create any section structure that fits your needs.

### Methods

#### add_section
```python
add_section(title: str, body: str = '', bullets: Optional[List[str]] = None, numbered: bool = False, numbered_bullets: bool = False, subsections: Optional[List[Dict[str, Any]]] = None)
```

Add a new section to the POM

Args:
    title: Section title
    body: Optional body text
    bullets: Optional list of bullet points
    numbered: Whether to number this section
    numbered_bullets: Whether to number bullet points
    subsections: Optional list of subsection objects
    
Returns:
    Self for method chaining

#### add_to_section
```python
add_to_section(title: str, body: Optional[str] = None, bullet: Optional[str] = None, bullets: Optional[List[str]] = None)
```

Add content to an existing section

Args:
    title: Section title
    body: Text to append to the section body
    bullet: Single bullet to add
    bullets: List of bullets to add
    
Returns:
    Self for method chaining

#### add_subsection
```python
add_subsection(parent_title: str, title: str, body: str = '', bullets: Optional[List[str]] = None)
```

Add a subsection to an existing section, creating the parent if needed

Args:
    parent_title: Title of the parent section
    title: Title for the new subsection
    body: Optional body text
    bullets: Optional list of bullet points
    
Returns:
    Self for method chaining

#### has_section
```python
has_section(title: str)
```

Check if a section with the given title exists

Args:
    title: Section title to check
    
Returns:
    True if the section exists, False otherwise

#### get_section
```python
get_section(title: str)
```

Get a section by title

Args:
    title: Section title
    
Returns:
    Section object or None if not found

#### render_markdown
```python
render_markdown()
```

Render the POM as markdown

#### render_xml
```python
render_xml()
```

Render the POM as XML

#### to_dict
```python
to_dict()
```

Convert the POM to a list of section dictionaries

#### to_json
```python
to_json()
```

Convert the POM to a JSON string

#### from_sections
```python
from_sections(cls, sections: List[Dict[str, Any]])
```

Create a PomBuilder from a list of section dictionaries

Args:
    sections: List of section definition dictionaries
    
Returns:
    A new PomBuilder instance with the sections added


## SWAIGFunction

Represents a SWAIG function for AI integration

### Methods

#### execute
```python
execute(args: Dict[str, Any], raw_data: Optional[Dict[str, Any]] = None)
```

Execute the function with the given arguments

Args:
    args: Parsed arguments for the function
    raw_data: Optional raw request data
    
Returns:
    Function result as a dictionary (from SwaigFunctionResult.to_dict())

#### validate_args
```python
validate_args(args: Dict[str, Any])
```

Validate the arguments against the parameter schema

Args:
    args: Arguments to validate
    
Returns:
    True if valid, False otherwise

#### to_swaig
```python
to_swaig(base_url: str, token: Optional[str] = None, call_id: Optional[str] = None, include_auth: bool = True)
```

Convert this function to a SWAIG-compatible JSON object for SWML

Args:
    base_url: Base URL for the webhook
    token: Optional auth token to include
    call_id: Optional call ID for session tracking
    include_auth: Whether to include auth credentials in URL
    
Returns:
    Dictionary representation for the SWAIG array in SWML


## SwaigFunctionResult

Wrapper around SWAIG function responses that handles proper formatting
of response text and actions.

The result object has three main components:
1. response: Text the AI should say back to the user
2. action: List of structured actions to execute 
3. post_process: Whether to let AI take another turn before executing actions

Post-processing behavior:
- post_process=False (default): Execute actions immediately after AI response
- post_process=True: Let AI respond to user one more time, then execute actions

This is useful for confirmation workflows like:
"I'll transfer you to sales. Do you have any other questions first?"
(AI can handle follow-up, then execute the transfer)

Example:
    return SwaigFunctionResult("Found your order")
    
    # With actions
    return (
        SwaigFunctionResult("I'll transfer you to support")
        .add_action("transfer", \{"dest": "support"\})
    )
    
    # With simple action value
    return (
        SwaigFunctionResult("I'll confirm that")
        .add_action("confirm", True)
    )
    
    # With multiple actions
    return (
        SwaigFunctionResult("Processing your request")
        .add_actions([
            \{"set_global_data": \{"key": "value"\}\},
            \{"play": \{"url": "music.mp3"\}\}
        ])
    )
    
    # With post-processing enabled
    return (
        SwaigFunctionResult("Let me transfer you to billing", post_process=True)
        .connect("+15551234567", final=True)
    )
    
    # Using the connect helper
    return (
        SwaigFunctionResult("I'll transfer you to our sales team now")
        .connect("sales@company.com", final=False, from_addr="+15559876543")
    )

### Methods

#### set_response
```python
set_response(response: str)
```

Set the natural language response text

Args:
    response: The text the AI should say
    
Returns:
    Self for method chaining

#### set_post_process
```python
set_post_process(post_process: bool)
```

Set whether to enable post-processing for this result.

Post-processing allows the AI to take one more turn with the user
before executing any actions. This is useful for confirmation workflows.

Args:
    post_process: True to let AI respond once more before executing actions,
                 False to execute actions immediately after the response.
                 
Returns:
    Self for method chaining

#### add_action
```python
add_action(name: str, data: Any)
```

Add a structured action to the response

Args:
    name: The name/type of the action (e.g., "play", "transfer")
    data: The data for the action - can be a string, boolean, object, or array
    
Returns:
    Self for method chaining

#### add_actions
```python
add_actions(actions: List[Dict[str, Any]])
```

Add multiple structured actions to the response

Args:
    actions: List of action objects to add to the response
    
Returns:
    Self for method chaining

#### connect
```python
connect(destination: str, final: bool = True, from_addr: Optional[str] = None)
```

Add a connect action to transfer/connect the call to another destination.

This is a convenience method that abstracts the SWML connect verb, so users
don't need to manually construct SWML documents.

Transfer behavior:
- final=True: Permanent transfer - call exits the agent completely, 
             SWML replaces the agent and call continues there
- final=False: Temporary transfer - if far end hangs up, call returns 
              to the agent to continue the conversation

Args:
    destination: Where to connect the call (phone number, SIP address, etc.)
    final: Whether this is a permanent transfer (True) or temporary (False).
          Defaults to True for permanent transfers.
    from_addr: Optional caller ID override (phone number or SIP address).
              If None, uses the current call's from address.
              
Returns:
    Self for method chaining
    
Example:
    # Permanent transfer to a phone number
    result.connect("+15551234567", final=True)
    
    # Temporary transfer to SIP address with custom caller ID
    result.connect("support@company.com", final=False, from_addr="+15559876543")

#### swml_transfer
```python
swml_transfer(dest: str, ai_response: str)
```

Add a SWML transfer action with AI response setup for when transfer completes.

This is a virtual helper that generates SWML to transfer the call to another
destination and sets up an AI response for when the transfer completes and
control returns to the agent.

For transfers, you typically want to enable post-processing so the AI speaks
the response first before executing the transfer.

Args:
    dest: Destination URL for the transfer (SWML endpoint, SIP address, etc.)
    ai_response: Message the AI should say when transfer completes and control returns
                
Returns:
    Self for method chaining
    
Example:
    # Transfer with post-processing (speak first, then transfer)
    result = (
        SwaigFunctionResult("I'm transferring you to support", post_process=True)
        .swml_transfer(
            "https://support.example.com/swml",
            "The support call is complete. How else can I help?"
        )
    )
    
    # Or enable post-processing with method chaining
    result.swml_transfer(dest, ai_response).set_post_process(True)

#### update_global_data
```python
update_global_data(data: Dict[str, Any])
```

Update global agent data variables.

This is a convenience method that abstracts the set_global_data action.
Global data persists across the entire agent session and is available
in prompt variables and can be accessed by all functions.

Args:
    data: Dictionary of key-value pairs to set/update in global data
    
Returns:
    self for method chaining

#### execute_swml
```python
execute_swml(swml_content, transfer: bool = False)
```

Execute SWML content with optional transfer behavior.

Args:
    swml_content: Can be:
        - String: Raw SWML JSON text
        - Dict: SWML data structure
        - SWML object: SignalWire SWML SDK object with .to_dict() method
    transfer: Boolean - whether call should exit agent after execution
    
Returns:
    self for method chaining

#### hangup
```python
hangup()
```

Terminate the call.

Returns:
    self for method chaining

#### hold
```python
hold(timeout: int = 300)
```

Put the call on hold with optional timeout.

Args:
    timeout: Timeout in seconds (max 900, default 300)
    
Returns:
    self for method chaining

#### wait_for_user
```python
wait_for_user(enabled: Optional[bool] = None, timeout: Optional[int] = None, answer_first: bool = False)
```

Control how agent waits for user input.

Args:
    enabled: Boolean to enable/disable waiting
    timeout: Number of seconds to wait
    answer_first: Special "answer_first" mode
    
Returns:
    self for method chaining

#### stop
```python
stop()
```

Stop the agent execution.

Returns:
    self for method chaining

#### say
```python
say(text: str)
```

Make the agent speak specific text.

Args:
    text: Text for agent to speak
    
Returns:
    self for method chaining

#### play_background_file
```python
play_background_file(filename: str, wait: bool = False)
```

Play audio or video file in background.

Args:
    filename: Audio/video filename/path
    wait: Whether to suppress attention-getting behavior during playback
    
Returns:
    self for method chaining

#### stop_background_file
```python
stop_background_file()
```

Stop currently playing background file.

Returns:
    self for method chaining

#### set_end_of_speech_timeout
```python
set_end_of_speech_timeout(milliseconds: int)
```

Adjust end of speech timeout - milliseconds of silence after speaking 
has been detected to finalize speech recognition.

Args:
    milliseconds: Timeout in milliseconds
    
Returns:
    self for method chaining

#### set_speech_event_timeout
```python
set_speech_event_timeout(milliseconds: int)
```

Adjust speech event timeout - milliseconds since last speech detection 
event to finalize recognition. Works better in noisy environments.

Args:
    milliseconds: Timeout in milliseconds
    
Returns:
    self for method chaining

#### remove_global_data
```python
remove_global_data(keys: Union[str, List[str]])
```

Remove global agent data variables.

Args:
    keys: Single key string or list of keys to remove
    
Returns:
    self for method chaining

#### set_metadata
```python
set_metadata(data: Dict[str, Any])
```

Set metadata scoped to current function's meta_data_token.

Args:
    data: Dictionary of key-value pairs for metadata
    
Returns:
    self for method chaining

#### remove_metadata
```python
remove_metadata(keys: Union[str, List[str]])
```

Remove metadata from current function's meta_data_token scope.

Args:
    keys: Single key string or list of keys to remove
    
Returns:
    self for method chaining

#### toggle_functions
```python
toggle_functions(function_toggles: List[Dict[str, Any]])
```

Enable/disable specific SWAIG functions.

Args:
    function_toggles: List of dicts with 'function' and 'active' keys
    
Returns:
    self for method chaining

#### enable_functions_on_timeout
```python
enable_functions_on_timeout(enabled: bool = True)
```

Enable function calls on speaker timeout.

Args:
    enabled: Whether to enable functions on timeout
    
Returns:
    self for method chaining

#### enable_extensive_data
```python
enable_extensive_data(enabled: bool = True)
```

Send full data to LLM for this turn only, then use smaller replacement 
in subsequent turns.

Args:
    enabled: Whether to send extensive data this turn only
    
Returns:
    self for method chaining

#### update_settings
```python
update_settings(settings: Dict[str, Any])
```

Update agent runtime settings.

Supported settings:
- frequency-penalty: Float (-2.0 to 2.0)
- presence-penalty: Float (-2.0 to 2.0) 
- max-tokens: Integer (0 to 4096)
- top-p: Float (0.0 to 1.0)
- confidence: Float (0.0 to 1.0)
- barge-confidence: Float (0.0 to 1.0)
- temperature: Float (0.0 to 2.0, clamped to 1.5)

Args:
    settings: Dictionary of settings to update
    
Returns:
    self for method chaining

#### switch_context
```python
switch_context(system_prompt: Optional[str] = None, user_prompt: Optional[str] = None, consolidate: bool = False, full_reset: bool = False)
```

Change agent context/prompt during conversation.

Args:
    system_prompt: New system prompt
    user_prompt: User message to add
    consolidate: Whether to summarize existing conversation
    full_reset: Whether to do complete context reset
    
Returns:
    self for method chaining

#### simulate_user_input
```python
simulate_user_input(text: str)
```

Queue simulated user input.

Args:
    text: Text to simulate as user input
    
Returns:
    self for method chaining

#### send_sms
```python
send_sms(to_number: str, from_number: str, body: Optional[str] = None, media: Optional[List[str]] = None, tags: Optional[List[str]] = None, region: Optional[str] = None)
```

Send a text message to a PSTN phone number using SWML.

This is a virtual helper that generates SWML to send SMS messages.
Either body or media (or both) must be provided.

Args:
    to_number: Phone number in E.164 format to send to
    from_number: Phone number in E.164 format to send from  
    body: Body text of the message (optional if media provided)
    media: Array of URLs to send in the message (optional if body provided)
    tags: Array of tags to associate with the message for UI searching
    region: Region to originate the message from
    
Returns:
    self for method chaining
    
Raises:
    ValueError: If neither body nor media is provided

#### pay
```python
pay(payment_connector_url: str, input_method: str = 'dtmf', status_url: Optional[str] = None, payment_method: str = 'credit-card', timeout: int = 5, max_attempts: int = 1, security_code: bool = True, postal_code: Union[bool, str] = True, min_postal_code_length: int = 0, token_type: str = 'reusable', charge_amount: Optional[str] = None, currency: str = 'usd', language: str = 'en-US', voice: str = 'woman', description: Optional[str] = None, valid_card_types: str = 'visa mastercard amex', parameters: Optional[List[Dict[str, str]]] = None, prompts: Optional[List[Dict[str, Any]]] = None)
```

Process payment using SWML pay action.

This is a virtual helper that generates SWML for payment processing.

Args:
    payment_connector_url: URL to make payment requests to (required)
    input_method: Method to collect payment details ("dtmf" or "voice")
    status_url: URL for status change notifications
    payment_method: Payment method ("credit-card" currently supported)
    timeout: Seconds to wait for next digit (default: 5)
    max_attempts: Number of retry attempts (default: 1)
    security_code: Whether to prompt for security code (default: True)
    postal_code: Whether to prompt for postal code, or actual postcode
    min_postal_code_length: Minimum postal code digits (default: 0)
    token_type: Payment type ("one-time" or "reusable", default: "reusable")
    charge_amount: Amount to charge as decimal string
    currency: Currency code (default: "usd")
    language: Language for prompts (default: "en-US")
    voice: TTS voice to use (default: "woman")
    description: Custom payment description
    valid_card_types: Space-separated card types (default: "visa mastercard amex")
    parameters: Array of name/value pairs for payment connector
    prompts: Array of custom prompt configurations
    
Returns:
    self for method chaining

#### record_call
```python
record_call(control_id: Optional[str] = None, stereo: bool = False, format: str = 'wav', direction: str = 'both', terminators: Optional[str] = None, beep: bool = False, input_sensitivity: float = 44.0, initial_timeout: float = 0.0, end_silence_timeout: float = 0.0, max_length: Optional[float] = None, status_url: Optional[str] = None)
```

Start background call recording using SWML.

This is a virtual helper that generates SWML to start recording the call 
in the background. Unlike foreground recording, the script continues 
executing while recording happens in the background.

Args:
    control_id: Identifier for this recording (for use with stop_record_call)
    stereo: Record in stereo (default: False)
    format: Recording format - "wav" or "mp3" (default: "wav") 
    direction: Audio direction - "speak", "listen", or "both" (default: "both")
    terminators: Digits that stop recording when pressed
    beep: Play beep before recording (default: False)
    input_sensitivity: Input sensitivity for recording (default: 44.0)
    initial_timeout: Time in seconds to wait for speech start (default: 0.0)
    end_silence_timeout: Time in seconds to wait in silence before ending (default: 0.0)
    max_length: Maximum recording length in seconds
    status_url: URL to send recording status events to
    
Returns:
    self for method chaining

#### stop_record_call
```python
stop_record_call(control_id: Optional[str] = None)
```

Stop an active background call recording using SWML.

This is a virtual helper that generates SWML to stop a recording that 
was started with record_call().

Args:
    control_id: Identifier for the recording to stop. If not provided,
               the most recent recording will be stopped.
    
Returns:
    self for method chaining

#### join_room
```python
join_room(name: str)
```

Join a RELAY room using SWML.

This is a virtual helper that generates SWML to join a RELAY room,
which enables multi-party communication and collaboration.

Args:
    name: The name of the room to join (required)
    
Returns:
    self for method chaining

#### sip_refer
```python
sip_refer(to_uri: str)
```

Send SIP REFER to a SIP call using SWML.

This is a virtual helper that generates SWML to send a SIP REFER
message, which is used for call transfer in SIP environments.

Args:
    to_uri: The SIP URI to send the REFER to (required)
    
Returns:
    self for method chaining

#### join_conference
```python
join_conference(name: str, muted: bool = False, beep: str = 'true', start_on_enter: bool = True, end_on_exit: bool = False, wait_url: Optional[str] = None, max_participants: int = 250, record: str = 'do-not-record', region: Optional[str] = None, trim: str = 'trim-silence', coach: Optional[str] = None, status_callback_event: Optional[str] = None, status_callback: Optional[str] = None, status_callback_method: str = 'POST', recording_status_callback: Optional[str] = None, recording_status_callback_method: str = 'POST', recording_status_callback_event: str = 'completed', result: Optional[Any] = None)
```

Join an ad-hoc audio conference with RELAY and CXML calls using SWML.

This is a virtual helper that generates SWML to join audio conferences
with extensive configuration options for call management and recording.

Args:
    name: Name of conference (required)
    muted: Whether to join muted (default: False)
    beep: Beep configuration - "true", "false", "onEnter", "onExit" (default: "true")
    start_on_enter: Whether conference starts when this participant enters (default: True)
    end_on_exit: Whether conference ends when this participant exits (default: False)
    wait_url: SWML URL for hold music (default: None for default hold music)
    max_participants: Maximum participants \<= 250 (default: 250)
    record: Recording mode - "do-not-record", "record-from-start" (default: "do-not-record")
    region: Conference region (default: None)
    trim: Trim silence - "trim-silence", "do-not-trim" (default: "trim-silence")
    coach: SWML Call ID or CXML CallSid for coaching (default: None)
    status_callback_event: Events to report - "start end join leave mute hold modify speaker announcement" (default: None)
    status_callback: URL for status callbacks (default: None)
    status_callback_method: HTTP method - "GET", "POST" (default: "POST")
    recording_status_callback: URL for recording status callbacks (default: None)
    recording_status_callback_method: HTTP method - "GET", "POST" (default: "POST")
    recording_status_callback_event: Recording events - "in-progress completed absent" (default: "completed")
    result: Switch on return_value when object \{\} or cond when array [] (default: None)
    
Returns:
    self for method chaining
    
Raises:
    ValueError: If beep value is invalid or max_participants exceeds 250

#### tap
```python
tap(uri: str, control_id: Optional[str] = None, direction: str = 'both', codec: str = 'PCMU', rtp_ptime: int = 20, status_url: Optional[str] = None)
```

Start background call tap using SWML.

This is a virtual helper that generates SWML to start background call tapping.
Media is streamed over Websocket or RTP to customer controlled URI.

Args:
    uri: Destination of tap media stream (required)
         Formats: rtp://IP:port, ws://example.com, or wss://example.com
    control_id: Identifier for this tap to use with stop_tap (optional)
                Default is generated and stored in tap_control_id variable
    direction: Direction of audio to tap (default: "both")
              "speak" = what party says
              "hear" = what party hears  
              "both" = what party hears and says
    codec: Codec for tap media stream - "PCMU" or "PCMA" (default: "PCMU")
    rtp_ptime: Packetization time in milliseconds for RTP (default: 20)
    status_url: URL for status change requests (optional)
    
Returns:
    self for method chaining
    
Raises:
    ValueError: If direction or codec values are invalid

#### stop_tap
```python
stop_tap(control_id: Optional[str] = None)
```

Stop an active tap stream using SWML.

This is a virtual helper that generates SWML to stop a tap stream
that was started with tap().

Args:
    control_id: ID of the tap to stop (optional)
               If not set, the last tap started will be stopped
    
Returns:
    self for method chaining

#### create_payment_prompt
```python
create_payment_prompt(for_situation: str, actions: List[Dict[str, str]], card_type: Optional[str] = None, error_type: Optional[str] = None)
```

Create a payment prompt structure for use with pay() method.

Args:
    for_situation: Situation to use prompt for (e.g., "payment-card-number")
    actions: List of actions with 'type' and 'phrase' keys
    card_type: Space-separated card types for this prompt
    error_type: Space-separated error types for this prompt
    
Returns:
    Dictionary representing the prompt structure

#### create_payment_action
```python
create_payment_action(action_type: str, phrase: str)
```

Create a payment action for use in payment prompts.

Args:
    action_type: "Say" for text-to-speech or "Play" for audio file
    phrase: Sentence to say or URL to play
    
Returns:
    Dictionary representing the action

#### create_payment_parameter
```python
create_payment_parameter(name: str, value: str)
```

Create a payment parameter for use with pay() method.

Args:
    name: Parameter name
    value: Parameter value
    
Returns:
    Dictionary representing the parameter

#### to_dict
```python
to_dict()
```

Convert to the JSON structure expected by SWAIG

The result must have at least one of:
- 'response': Text to be spoken by the AI
- 'action': Array of action objects

Optional:
- 'post_process': Boolean controlling when actions execute

Returns:
    Dictionary in SWAIG function response format


## SwmlRenderer

Renders SWML documents for SignalWire AI Agents with AI and SWAIG components

This class provides backward-compatible methods for rendering SWML documents
while also supporting the new SWMLService architecture. It can work either
standalone (legacy mode) or with a SWMLService instance.

### Methods

#### render_swml
```python
render_swml(prompt: Union[str, List[Dict[str, Any]]], post_prompt: Optional[str] = None, post_prompt_url: Optional[str] = None, swaig_functions: Optional[List[Dict[str, Any]]] = None, startup_hook_url: Optional[str] = None, hangup_hook_url: Optional[str] = None, prompt_is_pom: bool = False, params: Optional[Dict[str, Any]] = None, add_answer: bool = False, record_call: bool = False, record_format: str = 'mp4', record_stereo: bool = True, format: str = 'json', default_webhook_url: Optional[str] = None, service: Optional[SWMLService] = None)
```

Generate a complete SWML document with AI configuration

Args:
    prompt: Either a string prompt or a POM in list-of-dict format
    post_prompt: Optional post-prompt text (for summary)
    post_prompt_url: URL to receive the post-prompt result
    swaig_functions: List of SWAIG function definitions
    startup_hook_url: URL for startup hook
    hangup_hook_url: URL for hangup hook
    prompt_is_pom: Whether prompt is a POM object or raw text
    params: Additional AI params (temperature, etc)
    add_answer: Whether to auto-add the answer block after AI
    record_call: Whether to add a record_call block
    record_format: Format for recording the call
    record_stereo: Whether to record in stereo
    format: Output format, 'json' or 'yaml'
    default_webhook_url: Optional default webhook URL for all SWAIG functions
    service: Optional SWMLService instance to use
    
Returns:
    SWML document as a string

#### render_function_response_swml
```python
render_function_response_swml(response_text: str, actions: Optional[List[Dict[str, Any]]] = None, format: str = 'json', service: Optional[SWMLService] = None)
```

Generate a SWML document for a function response

Args:
    response_text: Text to say/display
    actions: List of SWML actions to execute
    format: Output format, 'json' or 'yaml'
    service: Optional SWMLService instance to use
    
Returns:
    SWML document as a string


## SessionManager

Manages security tokens for function calls

This implementation is completely stateless - it does not track call sessions
or store any information in memory. All validation is done using cryptographic
signatures with the tokens containing all necessary information.

### Methods

#### create_session
```python
create_session(call_id: Optional[str] = None)
```

Create a new session ID if one isn't provided

Args:
    call_id: Optional call ID, generated if not provided
    
Returns:
    The call_id for the session

#### generate_token
```python
generate_token(function_name: str, call_id: str)
```

Generate a secure self-contained token for a function call

Args:
    function_name: Name of the function to generate a token for
    call_id: Call session ID
    
Returns:
    A secure token

#### create_tool_token
```python
create_tool_token(function_name: str, call_id: str)
```

Alias for generate_token to maintain backward compatibility

Args:
    function_name: Name of the function to generate a token for
    call_id: Call session ID
    
Returns:
    A secure token

#### validate_token
```python
validate_token(call_id: str, function_name: str, token: str)
```

Validate a function call token

Args:
    call_id: Call session ID
    function_name: Name of the function being called
    token: Token to validate
    
Returns:
    True if valid, False otherwise

#### validate_tool_token
```python
validate_tool_token(function_name: str, token: str, call_id: str)
```

Alias for validate_token to maintain backward compatibility

Args:
    function_name: Name of the function being called
    token: Token to validate
    call_id: Call session ID
    
Returns:
    True if valid, False otherwise

#### activate_session
```python
activate_session(call_id: str)
```

Legacy method, does nothing but returns success

#### end_session
```python
end_session(call_id: str)
```

Legacy method, does nothing but returns success

#### get_session_metadata
```python
get_session_metadata(call_id: str)
```

Legacy method, always returns empty metadata

#### set_session_metadata
```python
set_session_metadata(call_id: str, key: str, value: Any)
```

Legacy method, does nothing but returns success

#### debug_token
```python
debug_token(token: str)
```

Debug a token without validating it

This method decodes the token and extracts its components for debugging purposes
without performing validation.

Args:
    token: The token to debug
    
Returns:
    Dictionary with token components and analysis


## StateManager

Abstract base class for state management

This defines the interface that all state manager implementations
must follow. State managers are responsible for storing, retrieving,
and managing call-specific state data.

### Methods

#### store
```python
store(call_id: str, data: Dict[str, Any])
```

Store state data for a call

Args:
    call_id: Unique identifier for the call
    data: Dictionary of state data to store
    
Returns:
    True if successful, False otherwise

#### retrieve
```python
retrieve(call_id: str)
```

Retrieve state data for a call

Args:
    call_id: Unique identifier for the call
    
Returns:
    Dictionary of state data or None if not found

#### update
```python
update(call_id: str, data: Dict[str, Any])
```

Update state data for a call

Args:
    call_id: Unique identifier for the call
    data: Dictionary of state data to update (merged with existing)
    
Returns:
    True if successful, False otherwise

#### delete
```python
delete(call_id: str)
```

Delete state data for a call

Args:
    call_id: Unique identifier for the call
    
Returns:
    True if successful, False otherwise

#### cleanup_expired
```python
cleanup_expired()
```

Clean up expired state data

Returns:
    Number of expired items cleaned up

#### exists
```python
exists(call_id: str)
```

Check if state exists for a call

Args:
    call_id: Unique identifier for the call
    
Returns:
    True if state exists, False otherwise


## FileStateManager

File-based state manager implementation

This implementation stores state data as JSON files in a directory.
Each call's state is stored in a separate file named by call_id.
Files older than expiry_days are automatically cleaned up.

This is suitable for development and low-volume deployments.
For production, consider using database or Redis implementations.

### Methods

#### store
```python
store(call_id: str, data: Dict[str, Any])
```

Store state data for a call

Args:
    call_id: Unique identifier for the call
    data: Dictionary of state data to store
    
Returns:
    True if successful, False otherwise

#### retrieve
```python
retrieve(call_id: str)
```

Retrieve state data for a call

Args:
    call_id: Unique identifier for the call
    
Returns:
    Dictionary of state data or None if not found

#### update
```python
update(call_id: str, data: Dict[str, Any])
```

Update state data for a call

Args:
    call_id: Unique identifier for the call
    data: Dictionary of state data to update (merged with existing)
    
Returns:
    True if successful, False otherwise

#### delete
```python
delete(call_id: str)
```

Delete state data for a call

Args:
    call_id: Unique identifier for the call
    
Returns:
    True if successful, False otherwise

#### cleanup_expired
```python
cleanup_expired()
```

Clean up expired state files

Returns:
    Number of expired files cleaned up


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


## AIVerbHandler

Handler for the SWML 'ai' verb

The 'ai' verb is complex and requires specialized handling, particularly
for managing prompts, SWAIG functions, and AI configurations.

### Methods

#### get_verb_name
```python
get_verb_name()
```

Get the name of the verb this handler handles

Returns:
    "ai" as the verb name

#### validate_config
```python
validate_config(config: Dict[str, Any])
```

Validate the configuration for the AI verb

Args:
    config: The configuration dictionary for the AI verb
    
Returns:
    (is_valid, error_messages) tuple

#### build_config
```python
build_config(prompt_text: Optional[str] = None, prompt_pom: Optional[List[Dict[str, Any]]] = None, contexts: Optional[Dict[str, Any]] = None, post_prompt: Optional[str] = None, post_prompt_url: Optional[str] = None, swaig: Optional[Dict[str, Any]] = None, kwargs = {})
```

Build a configuration for the AI verb

Args:
    prompt_text: Text prompt for the AI (mutually exclusive with prompt_pom)
    prompt_pom: POM structure for the AI prompt (mutually exclusive with prompt_text)
    contexts: Optional contexts and steps configuration (can be combined with text or pom)
    post_prompt: Optional post-prompt text
    post_prompt_url: Optional URL for post-prompt processing
    swaig: Optional SWAIG configuration
    **kwargs: Additional AI parameters
    
Returns:
    AI verb configuration dictionary


## SkillManager

Manages loading and lifecycle of agent skills

### Methods

#### load_skill
```python
load_skill(skill_name: str, skill_class: Type[SkillBase] = None, params: Optional[Dict[str, Any]] = None)
```

Load and setup a skill by name

Args:
    skill_name: Name of the skill to load
    skill_class: Optional skill class (if not provided, will try to find it)
    params: Optional parameters to pass to the skill
    
Returns:
    tuple: (success, error_message) - error_message is empty string if successful

#### unload_skill
```python
unload_skill(skill_identifier: str)
```

Unload a skill and cleanup

Args:
    skill_identifier: Either a skill name or an instance key
    
Returns:
    bool: True if successfully unloaded, False otherwise

#### list_loaded_skills
```python
list_loaded_skills()
```

List instance keys of currently loaded skills

#### has_skill
```python
has_skill(skill_identifier: str)
```

Check if skill is currently loaded

Args:
    skill_identifier: Either a skill name or an instance key
    
Returns:
    bool: True if loaded, False otherwise

#### get_skill
```python
get_skill(skill_identifier: str)
```

Get a loaded skill instance by identifier

Args:
    skill_identifier: Either a skill name or an instance key
    
Returns:
    SkillBase: The skill instance if found, None otherwise


## SchemaUtils

Utility class for loading and working with SWML schemas

### Methods

#### load_schema
```python
load_schema()
```

Load the JSON schema from the specified path

Returns:
    The schema as a dictionary

#### get_verb_properties
```python
get_verb_properties(verb_name: str)
```

Get the properties for a specific verb

Args:
    verb_name: The name of the verb (e.g., "ai", "answer", etc.)
    
Returns:
    The properties for the verb or an empty dict if not found

#### get_verb_required_properties
```python
get_verb_required_properties(verb_name: str)
```

Get the required properties for a specific verb

Args:
    verb_name: The name of the verb (e.g., "ai", "answer", etc.)
    
Returns:
    List of required property names for the verb or an empty list if not found

#### validate_verb
```python
validate_verb(verb_name: str, verb_config: Dict[str, Any])
```

Validate a verb configuration against the schema

Args:
    verb_name: The name of the verb (e.g., "ai", "answer", etc.)
    verb_config: The configuration for the verb
    
Returns:
    (is_valid, error_messages) tuple

#### get_all_verb_names
```python
get_all_verb_names()
```

Get all verb names defined in the schema

Returns:
    List of verb names

#### get_verb_parameters
```python
get_verb_parameters(verb_name: str)
```

Get the parameter definitions for a specific verb

Args:
    verb_name: The name of the verb (e.g., "ai", "answer", etc.)
    
Returns:
    Dictionary mapping parameter names to their definitions

#### generate_method_signature
```python
generate_method_signature(verb_name: str)
```

Generate a Python method signature for a verb

Args:
    verb_name: The name of the verb
    
Returns:
    A Python method signature string

#### generate_method_body
```python
generate_method_body(verb_name: str)
```

Generate the method body implementation for a verb

Args:
    verb_name: The name of the verb
    
Returns:
    The method body as a string


## EphemeralAgentConfig

An ephemeral configurator object that mimics AgentBase's configuration interface.

This allows dynamic configuration callbacks to use the same familiar methods
they would use during agent initialization, but for per-request configuration.

### Methods

#### add_hint
```python
add_hint(hint: str)
```

Add a simple string hint

#### add_hints
```python
add_hints(hints: List[str])
```

Add multiple string hints

#### add_language
```python
add_language(name: str, code: str, voice: str, kwargs = {})
```

Add a language configuration

#### add_pronunciation
```python
add_pronunciation(replace: str, with_text: str, ignore_case: bool = False)
```

Add a pronunciation rule

#### set_param
```python
set_param(key: str, value: Any)
```

Set a single AI parameter

#### set_params
```python
set_params(params: Dict[str, Any])
```

Set multiple AI parameters

#### set_global_data
```python
set_global_data(data: Dict[str, Any])
```

Set global data

#### update_global_data
```python
update_global_data(data: Dict[str, Any])
```

Update global data

#### set_prompt_text
```python
set_prompt_text(text: str)
```

Set raw prompt text

#### set_post_prompt
```python
set_post_prompt(text: str)
```

Set post-prompt text

#### prompt_add_section
```python
prompt_add_section(title: str, body: str = '', bullets: Optional[List[str]] = None, kwargs = {})
```

Add a prompt section

#### set_native_functions
```python
set_native_functions(function_names: List[str])
```

Set native functions

#### add_function_include
```python
add_function_include(url: str, functions: List[str], meta_data: Optional[Dict[str, Any]] = None)
```

Add a function include

#### extract_config
```python
extract_config()
```

Extract the configuration as a dictionary for applying to the real agent.

Returns:
    Dictionary containing all the configuration changes


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

