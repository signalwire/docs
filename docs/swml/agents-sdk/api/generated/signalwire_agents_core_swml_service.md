---
title: "swml_service"
---

# swml_service

Copyright (c) 2025 SignalWire

This file is part of the SignalWire AI Agents SDK.

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

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


## VerbHandlerRegistry

Registry for SWML verb handlers

This class maintains a registry of handlers for special SWML verbs
and provides methods for accessing and using them.

### Methods

#### register_handler
```python
register_handler(handler: SWMLVerbHandler)
```

Register a new verb handler

Args:
    handler: The handler to register

#### get_handler
```python
get_handler(verb_name: str)
```

Get the handler for a specific verb

Args:
    verb_name: The name of the verb
    
Returns:
    The handler if found, None otherwise

#### has_handler
```python
has_handler(verb_name: str)
```

Check if a handler exists for a specific verb

Args:
    verb_name: The name of the verb
    
Returns:
    True if a handler exists, False otherwise


## SWMLVerbHandler

Base interface for SWML verb handlers

This abstract class defines the interface that all SWML verb handlers
must implement. Verb handlers provide specialized logic for complex
SWML verbs that cannot be handled generically.

### Methods

#### get_verb_name
```python
get_verb_name()
```

Get the name of the verb this handler handles

Returns:
    The verb name as a string

#### validate_config
```python
validate_config(config: Dict[str, Any])
```

Validate the configuration for this verb

Args:
    config: The configuration dictionary for this verb
    
Returns:
    (is_valid, error_messages) tuple

#### build_config
```python
build_config(kwargs = {})
```

Build a configuration for this verb from the provided arguments

Args:
    **kwargs: Keyword arguments specific to this verb
    
Returns:
    Configuration dictionary


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

