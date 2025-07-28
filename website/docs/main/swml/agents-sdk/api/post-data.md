---
id: agents-sdk-reference-post-data
slug: /sdks/agents-sdk/api/post-data
title: POST Data Reference
sidebar_label: POST Data
keywords:
  - SignalWire
  - agents
  - sdk
  - ai
  - python
tags:
  - agents-sdk
  - api
  - methods
  - python
  - reference
---
 

# SignalWire SWAIG post_data Complete Reference

This document comprehensively details all possible keys that can be present in the `post_data` JSON object sent to SWAIG functions, based on analysis of the `execute_user_function` implementation in `server_code/mod_openai.c`.

## Overview

The `post_data` object is constructed differently depending on whether it's:
- **Webhook SWAIG Functions**: Traditional HTTP-based functions with Python handlers
- **DataMap Functions**: Serverless functions that execute on SignalWire servers

## Base post_data Keys (All Functions)

These keys are always present in `post_data` for both webhook and DataMap functions:

### Core Identification
| Key | Type | Description | Example |
|-----|------|-------------|---------|
| `app_name` | string | Name of the AI application | `"my_ai_agent"` |
| `function` | string | Name of the SWAIG function being called | `"search_knowledge"` |
| `call_id` | string | Unique UUID of the current call session | `"12345678-1234-5678-9012-123456789abc"` |
| `ai_session_id` | string | Unique UUID of the AI session | `"87654321-4321-8765-2109-cba987654321"` |

### Call Context
| Key | Type | Description | Example |
|-----|------|-------------|---------|
| `caller_id_name` | string | Caller ID name (if available) | `"John Doe"` |
| `caller_id_num` | string | Caller ID number (if available) | `"+15551234567"` |
| `channel_active` | boolean | Whether the channel is currently up | `true` |
| `channel_offhook` | boolean | Whether the channel is off-hook | `true` |
| `channel_ready` | boolean | Whether the AI session is ready | `true` |

### Function Details
| Key | Type | Description | Example |
|-----|------|-------------|---------|
| `argument` | object | Parsed function arguments | `{"query": "test search"}` |
| `argument_desc` | object | Function argument schema/description | `{"type": "object", "properties": {...}}` |
| `purpose` | string | Description of what the function does | `"Search knowledge base"` |

### Protocol Information
| Key | Type | Description | Example |
|-----|------|-------------|---------|
| `content_type` | string | Always "text/swaig" | `"text/swaig"` |
| `version` | string | SWAIG protocol version | `"1.0"` |
| `content_disposition` | string | Always "SWAIG Function" | `"SWAIG Function"` |

### Optional Context Data
| Key | Type | Description | Present When |
|-----|------|-------------|--------------|
| `global_data` | object | Application-level global data | App has global data set |
| `conversation_id` | string | Conversation identifier | App has conversation tracking |
| `project_id` | string | SignalWire project ID | Available in channel vars |
| `space_id` | string | SignalWire space ID | Available in channel vars |

## Conditional Keys (Webhook Functions Only)

These keys are only added for traditional webhook SWAIG functions (not DataMap):

### Metadata
| Key | Type | Description | Present When |
|-----|------|-------------|--------------|
| `meta_data_token` | string | Token for metadata access | Function has metadata token |
| `meta_data` | object | Function-level metadata object | Function has metadata token |

**Metadata Details:**
- `meta_data_token`: Either specified in function definition or auto-generated (hash of function name + webhook URL)
- `meta_data`: Function-level key/value store, similar to `global_data` but scoped per function
- Functions sharing the same token share access to the same metadata
- Can be manipulated via SWAIG actions in responses
- Persists across function calls for the same token

### SWML Integration
| Key | Type | Description | Present When |
|-----|------|-------------|--------------|
| `SWMLVars` | object | SWML variables | `swaig_post_swml_vars` parameter set |
| `SWMLCall` | object | SWML call state | `swaig_post_swml_vars` parameter set |

**SWML Variable Filtering:**
- `swaig_post_swml_vars=true`: Includes all SWML variables
- `swaig_post_swml_vars=[array]`: Includes only specified variables from the array
- Variables may come from other SWML verbs executed before the AI verb
- Part of SWML's variable system for cross-verb communication

### Conversation Data
| Key | Type | Description | Present When |
|-----|------|-------------|--------------|
| `call_log` | array | Processed conversation history | `swaig_post_conversation` parameter true |
| `raw_call_log` | array | Raw conversation history | `swaig_post_conversation` parameter true |

**Conversation History Structure:**
Both arrays use OpenAI conversation format with additional SignalWire fields:

```json
{
  "role": "assistant",
  "content": "Response text",
  "latency": 438,
  "utterance_latency": 445,
  "audio_latency": 599
}
```

**Key Differences:**
- `call_log`: May shrink after conversation resets (consolidation)
- `raw_call_log`: Preserves full history from beginning regardless of resets
- Both include timing data (latency, utterance_latency, audio_latency)
- User messages include confidence scores when available

## DataMap-Specific Additions

For DataMap functions, additional keys are merged into `post_data`:

### Enhanced Context Data
| Key | Type | Description | Source |
|-----|------|-------------|--------|
| `prompt_vars` | object | Template variables for AI prompts | Built from call context, SWML vars, and global_data |
| `global_data` | object | Application global data (same as base) | From SWML global_data section |

### Parsed Arguments
| Key | Type | Description | Processing |
|-----|------|-------------|-----------|
| `args` | object | First parsed argument object | Extracted from `argument.parsed[0]` |

**Argument Processing Details:**
- Each function has unique argument structure based on its JSON schema definition
- AI converts the schema to JSON string, engine parses and provides for expansion
- `args` contains the first parsed argument object for easy access in templates

### Processing Context
| Key | Type | Description | Purpose |
|-----|------|-------------|---------|
| `input` | object | Copy of entire post_data | Variable expansion context |

## prompt_vars Detailed Contents

The `prompt_vars` object contains template variables built from multiple sources:

### Call Information
| Key | Source | Description | Example |
|-----|--------|-------------|---------|
| `call_direction` | Call direction | "inbound" or "outbound" | `"inbound"` |
| `caller_id_name` | Channel variable | Caller's name | `"John Doe"` |
| `caller_id_number` | Channel variable | Caller's number | `"+15551234567"` |
| `local_date` | System time | Current date in local timezone | `"Friday, January 15, 2024"` |
| `spoken_date` | System time | Same as local_date | `"Friday, January 15, 2024"` |
| `local_time` | System time | Current time with timezone | `"02:30:15 PM -0500"` |
| `time_of_day` | Derived from hour | "morning", "afternoon", or "evening" | `"afternoon"` |
| `supported_languages` | App config | Available languages | `"English, Spanish, or French"` |
| `default_language` | App config | Primary language | `"English"` |

### SWML State Variables
| Key | Source | Description | Present When |
|-----|--------|-------------|--------------|
| `vars` | SWML serialized state | All SWML variables (excluding system vars) | SWML vars exist |
| `call` | SWML serialized state | SWML call object | SWML state exists |

### Global Data Overlay
All keys from the `global_data` object are merged into `prompt_vars`, with global_data taking precedence over built-in values.

## global_data Evolution

The `global_data` object has dynamic behavior:

### Initial State
- Populated from SWML `global_data` section at call start
- Contains caller ID information automatically
- Available to both webhook and DataMap functions

### Runtime Updates
- Can be modified by SWAIG actions during the call
- Changes persist for subsequent function calls
- Refreshed only when context switches occur
- Used as overlay for `prompt_vars` in DataMap functions

## DataMap Processing Enhancements

During DataMap processing, additional data may be added based on the processing path:

### Webhook Processing Path
When DataMap uses webhooks, additional keys are added to the webhook response data:

| Key | Type | Description | Added When |
|-----|------|-------------|-----------|
| `prompt_vars` | object | Prompt variables for expansion | Webhook processing |
| `global_data` | object | Global data for expansion | Webhook processing |
| `input` | object | Original input for context | Webhook processing |

### Foreach Processing
During `foreach` operations, a temporary key is added:

| Key | Type | Description | Scope |
|-----|------|-------------|-------|
| `this` | object | Current iteration item | During foreach loop only |

### Expression Processing
For expression evaluation, data is enriched with context variables for template expansion.

## Variable Expansion Context

All DataMap processing uses variable expansion for template processing with access to:

- All keys in the current data object
- Nested object access via dot notation: `${user.name}`
- Array access: `${items[0].value}`
- Encoding functions: `${enc:url:variable}`
- Built-in functions: `@{strftime %Y-%m-%d}`, `@{expr 2+2}`, etc.

**Template Functions:** For a complete list of available `@{}` template functions, see the DataMap processing guide and `expand_jsonvars` implementation in `swaig.c`.

## Error Handling

### DataMap Webhook Errors
When DataMap webhook processing fails, special error keys may be added:

| Key | Type | Description | When Present |
|-----|------|-------------|--------------|
| `parse_error` | boolean | JSON parsing failed | Webhook response not valid JSON |
| `protocol_error` | boolean | HTTP request failed | Network/connection issues |
| `http_code` | number | HTTP response code | Always present with errors |

These errors are only set when the webhook didn't fetch properly, allowing alternate error responses to be provided to users.

## Security and Permissions

Several keys are only included based on SWML application parameters:

### SWML Variables Permission
- **Parameter**: `swaig_post_swml_vars` (boolean or array)
- **Adds**: `SWMLVars`, `SWMLCall`
- **Behavior**: If true, includes all SWML vars; if array, includes only specified variables

### Conversation Permission
- **Parameter**: `swaig_post_conversation` (boolean)
- **Adds**: `call_log`, `raw_call_log`
- **Default**: false (not included unless explicitly enabled)

### SWML Execution Permission
- **Parameter**: `swaig_allow_swml` (boolean)
- **Controls**: Whether functions can execute SWML actions
- **Default**: true (enabled by default)

### Global Data Modification Permission
- **Parameter**: `swaig_set_global_data` (boolean)
- **Controls**: Whether functions can modify global_data
- **Default**: true (enabled by default)

## Implementation Notes

1. **DataMap vs Webhook**: The key difference is DataMap functions merge prompt_vars and create an `input` copy for variable expansion
2. **Variable Expansion**: DataMap functions process templates using the entire post_data as context
3. **Memory Management**: post_data is created fresh for each function call and cleaned up afterward
4. **Error Handling**: Missing or invalid data results in empty objects rather than missing keys
5. **Dynamic Content**: prompt_vars and global_data can vary between function calls based on call state
6. **Metadata Scope**: Function metadata is isolated per token, enabling function-specific data storage

## Example post_data Objects

### Webhook Function Example
```json
{
  "app_name": "customer_service_agent",
  "function": "search_knowledge",
  "call_id": "12345678-1234-5678-9012-123456789abc",
  "ai_session_id": "87654321-4321-8765-2109-cba987654321",
  "caller_id_name": "John Doe",
  "caller_id_num": "+15551234567",
  "channel_active": true,
  "channel_offhook": true,
  "channel_ready": true,
  "argument": {"query": "billing question"},
  "argument_desc": {"type": "object", "properties": {"query": {"type": "string"}}},
  "purpose": "Search the knowledge base for relevant information",
  "content_type": "text/swaig",
  "version": "1.0",
  "content_disposition": "SWAIG Function",
  "global_data": {"customer_tier": "premium"},
  "conversation_id": "conv_123",
  "project_id": "proj_abc",
  "space_id": "space_xyz",
  "meta_data_token": "func_abc123",
  "meta_data": {"search_count": 5, "last_query": "previous search"},
  "call_log": [
    {
      "role": "user",
      "content": "I have a billing question",
      "confidence": 0.95
    },
    {
      "role": "assistant", 
      "content": "I'd be happy to help with billing",
      "latency": 250,
      "utterance_latency": 300,
      "audio_latency": 450
    }
  ]
}
```

### DataMap Function Example
```json
{
  "app_name": "data_processor",
  "function": "process_data",
  "call_id": "12345678-1234-5678-9012-123456789abc",
  "ai_session_id": "87654321-4321-8765-2109-cba987654321",
  "channel_active": true,
  "channel_offhook": true,
  "channel_ready": true,
  "argument": {"data": [{"name": "item1"}, {"name": "item2"}]},
  "argument_desc": {"type": "object", "properties": {"data": {"type": "array"}}},
  "purpose": "Process array data with template expansion",
  "content_type": "text/swaig",
  "version": "1.0",
  "content_disposition": "SWAIG Function",
  "global_data": {"prefix": "processed_", "customer_tier": "premium"},
  "prompt_vars": {
    "call_direction": "inbound",
    "caller_id_name": "John Doe", 
    "caller_id_number": "+15551234567",
    "local_date": "Friday, January 15, 2024",
    "local_time": "02:30:15 PM -0500",
    "time_of_day": "afternoon",
    "supported_languages": "English",
    "default_language": "English",
    "customer_tier": "premium",
    "prefix": "processed_"
  },
  "args": {"data": [{"name": "item1"}, {"name": "item2"}]},
  "input": { /* copy of entire post_data */ }
}
```

## SWML Parameter Reference

The following SWML parameters control what data is included in post_data:

| Parameter | Type | Default | Purpose |
|-----------|------|---------|---------|
| `swaig_allow_swml` | boolean | true | Allow functions to execute SWML actions |
| `swaig_allow_settings` | boolean | true | Allow functions to modify AI settings |
| `swaig_post_conversation` | boolean | false | Include conversation history in post_data |
| `swaig_set_global_data` | boolean | true | Allow functions to modify global_data |
| `swaig_post_swml_vars` | boolean/array | false | Include SWML variables in post_data |

This reference covers all the keys that can appear in post_data based on the server implementation and configuration parameters. 
