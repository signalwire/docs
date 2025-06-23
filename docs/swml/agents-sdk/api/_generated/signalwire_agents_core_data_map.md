---
title: "data_map"
---

# data_map

Copyright (c) 2025 SignalWire

This file is part of the SignalWire AI Agents SDK.

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

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


## DataMap

Builder class for creating SWAIG data_map configurations.

This provides a fluent interface for building data_map tools that execute
on the SignalWire server without requiring webhook endpoints. Works similar
to SwaigFunctionResult but for building data_map structures.

Example usage:
    # Simple API call - output goes inside webhook
    data_map = (DataMap('get_weather')
        .purpose('Get current weather information')
        .parameter('location', 'string', 'City name', required=True)
        .webhook('GET', 'https://api.weather.com/v1/current?key=API_KEY&q=$\{location\}')
        .output(SwaigFunctionResult('Weather in $\{location\}: $\{response.current.condition.text\}, $\{response.current.temp_f\}°F'))
    )
    
    # Multiple webhooks with fallback
    data_map = (DataMap('search_multi')
        .purpose('Search with fallback APIs')
        .parameter('query', 'string', 'Search query', required=True)
        .webhook('GET', 'https://api.primary.com/search?q=$\{query\}')
        .output(SwaigFunctionResult('Primary result: $\{response.title\}'))
        .webhook('GET', 'https://api.fallback.com/search?q=$\{query\}')
        .output(SwaigFunctionResult('Fallback result: $\{response.title\}'))
        .fallback_output(SwaigFunctionResult('Sorry, all search APIs are unavailable'))
    )
    
    # Expression-based responses (no API calls)
    data_map = (DataMap('file_control')
        .purpose('Control file playback')
        .parameter('command', 'string', 'Playback command')
        .parameter('filename', 'string', 'File to control', required=False)
        .expression('$\{args.command\}', r'start.*', SwaigFunctionResult().add_action('start_playbook', \{'file': '$\{args.filename\}'\}))
        .expression('$\{args.command\}', r'stop.*', SwaigFunctionResult().add_action('stop_playback', True))
    )
    
    # API with array processing
    data_map = (DataMap('search_docs')
        .purpose('Search documentation')
        .parameter('query', 'string', 'Search query', required=True)
        .webhook('POST', 'https://api.docs.com/search', headers=\{'Authorization': 'Bearer TOKEN'\})
        .body(\{'query': '$\{query\}', 'limit': 3\})
        .output(SwaigFunctionResult('Found: $\{response.results[0].title\} - $\{response.results[0].summary\}'))
        .foreach('$\{response.results\}')
    )

### Methods

#### purpose
```python
purpose(description: str)
```

Set the function description/purpose

Args:
    description: Human-readable description of what this function does
    
Returns:
    Self for method chaining

#### description
```python
description(description: str)
```

Set the function description (alias for purpose)

Args:
    description: Human-readable description of what this function does
    
Returns:
    Self for method chaining

#### parameter
```python
parameter(name: str, param_type: str, description: str, required: bool = False, enum: Optional[List[str]] = None)
```

Add a function parameter

Args:
    name: Parameter name
    param_type: JSON schema type (string, number, boolean, array, object)
    description: Parameter description
    required: Whether parameter is required
    enum: Optional list of allowed values
    
Returns:
    Self for method chaining

#### expression
```python
expression(test_value: str, pattern: Union[str, Pattern], output: SwaigFunctionResult, nomatch_output: Optional[SwaigFunctionResult] = None)
```

Add an expression pattern for pattern-based responses

Args:
    test_value: Template string to test (e.g., "$\{args.command\}")
    pattern: Regex pattern string or compiled Pattern object to match against
    output: SwaigFunctionResult to return when pattern matches
    nomatch_output: Optional SwaigFunctionResult to return when pattern doesn't match
    
Returns:
    Self for method chaining

#### webhook
```python
webhook(method: str, url: str, headers: Optional[Dict[str, str]] = None, form_param: Optional[str] = None, input_args_as_params: bool = False, require_args: Optional[List[str]] = None)
```

Add a webhook API call

Args:
    method: HTTP method (GET, POST, PUT, DELETE, etc.)
    url: API endpoint URL (can include $\{variable\} substitutions)
    headers: Optional HTTP headers
    form_param: Send JSON body as single form parameter with this name
    input_args_as_params: Merge function arguments into params
    require_args: Only execute if these arguments are present
    
Returns:
    Self for method chaining

#### webhook_expressions
```python
webhook_expressions(expressions: List[Dict[str, Any]])
```

Add expressions that run after the most recent webhook completes

Args:
    expressions: List of expression definitions to check post-webhook
    
Returns:
    Self for method chaining

#### body
```python
body(data: Dict[str, Any])
```

Set request body for the last added webhook (POST/PUT requests)

Args:
    data: Request body data (can include $\{variable\} substitutions)
    
Returns:
    Self for method chaining

#### params
```python
params(data: Dict[str, Any])
```

Set request params for the last added webhook (alias for body)

Args:
    data: Request params data (can include $\{variable\} substitutions)
    
Returns:
    Self for method chaining

#### foreach
```python
foreach(foreach_config: Union[str, Dict[str, Any]])
```

        Process an array from the webhook response using foreach mechanism
        
        Args:
            foreach_config: Either:
                - String: JSON path to array in response (deprecated, kept for compatibility)
                - Dict: Foreach configuration with keys:
                    - input_key: Key in API response containing the array
                    - output_key: Name for the built string variable
                    - max: Maximum number of items to process (optional)
                    - append: Template string to append for each item
            
        Returns:
            Self for method chaining
            
        Example:
            .foreach(\{
                "input_key": "results",
                "output_key": "formatted_results", 
                "max": 3,
                "append": "Result: $\{this.title\} - $\{this.summary\}
"
            \})

#### output
```python
output(result: SwaigFunctionResult)
```

Set the output result for the most recent webhook

Args:
    result: SwaigFunctionResult defining the response for this webhook
    
Returns:
    Self for method chaining

#### fallback_output
```python
fallback_output(result: SwaigFunctionResult)
```

Set a fallback output result at the top level (used when all webhooks fail)

Args:
    result: SwaigFunctionResult defining the fallback response
    
Returns:
    Self for method chaining

#### error_keys
```python
error_keys(keys: List[str])
```

Set error keys for the most recent webhook (if webhooks exist) or top-level

Args:
    keys: List of JSON keys whose presence indicates an error
    
Returns:
    Self for method chaining

#### global_error_keys
```python
global_error_keys(keys: List[str])
```

Set top-level error keys (applies to all webhooks)

Args:
    keys: List of JSON keys whose presence indicates an error
    
Returns:
    Self for method chaining

#### to_swaig_function
```python
to_swaig_function()
```

Convert this DataMap to a SWAIG function definition

Returns:
    Dictionary with function definition and data_map instead of url


## create_simple_api_tool

```python
create_simple_api_tool(name: str, url: str, response_template: str, parameters: Optional[Dict[str, Dict]] = None, method: str = 'GET', headers: Optional[Dict[str, str]] = None, body: Optional[Dict[str, Any]] = None, error_keys: Optional[List[str]] = None)
```

Create a simple API tool with minimal configuration

Args:
    name: Function name
    url: API endpoint URL
    response_template: Template for formatting the response
    parameters: Optional parameter definitions
    method: HTTP method (default: GET)
    headers: Optional HTTP headers
    body: Optional request body (for POST/PUT)
    error_keys: Optional list of error indicator keys
    
Returns:
    Configured DataMap object


## create_expression_tool

```python
create_expression_tool(name: str, patterns: Dict[str, Tuple[str, SwaigFunctionResult]], parameters: Optional[Dict[str, Dict]] = None)
```

Create an expression-based tool for pattern matching responses

Args:
    name: Function name
    patterns: Dictionary mapping test_values to (pattern, SwaigFunctionResult) tuples
    parameters: Optional parameter definitions
    
Returns:
    Configured DataMap object

