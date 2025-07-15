---
id: agents-sdk-guides-agent
slug: /sdks/agents-sdk/guides/agent-guide
title: Agent Guide
sidebar_label: Agent Guide
keywords:
  - SignalWire
  - agents
  - sdk
  - ai
  - python
tags:
  - agents-sdk
  - python
---
 

# SignalWire AI Agent Guide

## Introduction

The `AgentBase` class provides the foundation for creating AI-powered agents using the SignalWire AI Agent SDK. It extends the `SWMLService` class, inheriting all its SWML document creation and serving capabilities, while adding AI-specific functionality.

Key features of `AgentBase` include:

- Structured prompt building with POM (Prompt Object Model)
- SWAIG function definitions for AI tool access
- Multilingual support
- Agent configuration (hint handling, pronunciation rules, etc.)
- State management for conversations

This guide explains how to create and customize your own AI agents, with examples based on the SDK's sample implementations.

## Architecture Overview

The Agent SDK architecture consists of several layers:

1. **SWMLService**: The base layer for SWML document creation and serving
2. **AgentBase**: Extends SWMLService with AI agent functionality
3. **Custom Agents**: Your specific agent implementations that extend AgentBase

Here's how these components relate to each other:

```
┌─────────────┐
│ Your Agent  │ (Extends AgentBase with your specific functionality)
└─────▲───────┘
      │
┌─────┴───────┐
│  AgentBase  │ (Adds AI functionality to SWMLService)
└─────▲───────┘
      │
┌─────┴───────┐
│ SWMLService │ (Provides SWML document creation and web service)
└─────────────┘
```

## API Reference

### Constructor Parameters

- `name`: Agent name/identifier (required)
- `route`: HTTP route path (default: "/")
- `host`: Host to bind to (default: "0.0.0.0")
- `port`: Port to bind to (default: 3000)
- `basic_auth`: Optional (username, password) tuple
- `use_pom`: Whether to use POM for prompts (default: True)
- `token_expiry_secs`: Security token expiry time (default: 3600)
- `auto_answer`: Auto-answer calls (default: True)
- `record_call`: Record calls (default: False)
- `schema_path`: Optional path to schema.json file
- `suppress_logs`: Whether to suppress structured logs (default: False)

### Prompt Methods

- `prompt_add_section(title, body=None, bullets=None, numbered=False, numbered_bullets=False)`
- `prompt_add_subsection(parent_title, title, body=None, bullets=None)`
- `prompt_add_to_section(title, body=None, bullet=None, bullets=None)`
- `set_prompt_text(prompt_text)` or `set_prompt(prompt_text)`
- `set_post_prompt(prompt_text)`
- `setPersonality(text)` - Convenience method that calls prompt_add_section
- `setGoal(text)` - Convenience method that calls prompt_add_section
- `setInstructions(bullets)` - Convenience method that calls prompt_add_section

### SWAIG Methods

- `@AgentBase.tool(name, description, parameters={}, secure=True, fillers=None)`
- `define_tool(name, description, parameters, handler, secure=True, fillers=None)`
- `set_native_functions(function_names)`
- `add_native_function(function_name)`
- `remove_native_function(function_name)`
- `add_function_include(url, functions, meta_data=None)`

### Configuration Methods

- `add_hint(hint)` and `add_hints(hints)`
- `add_pattern_hint(hint, pattern, replace, ignore_case=False)`
- `add_pronunciation(replace, with_text, ignore_case=False)`
- `add_language(name, code, voice, speech_fillers=None, function_fillers=None, engine=None, model=None)`
- `set_param(key, value)` and `set_params(params_dict)`
- `set_global_data(data_dict)` and `update_global_data(data_dict)`

### State Methods

- `get_state(call_id)`
- `set_state(call_id, data)` 
- `update_state(call_id, data)`
- `clear_state(call_id)`
- `cleanup_expired_state()`

### SIP Routing Methods

- `enable_sip_routing(auto_map=True, path="/sip")`: Enable SIP routing for an agent
- `register_sip_username(sip_username)`: Register a SIP username for an agent
- `auto_map_sip_usernames()`: Automatically register SIP usernames based on agent attributes

#### AgentServer SIP Methods

- `setup_sip_routing(route="/sip", auto_map=True)`: Set up central SIP routing for a server
- `register_sip_username(username, route)`: Map a SIP username to an agent route

### Service Methods

- `serve(host=None, port=None)`: Start the web server
- `as_router()`: Return a FastAPI router for this agent
- `on_swml_request(request_data=None, callback_path=None)`: Customize SWML based on request data and path
- `on_summary(summary, raw_data=None)`: Handle post-prompt summaries
- `on_function_call(name, args, raw_data=None)`: Process SWAIG function calls
- `register_routing_callback(callback_fn, path="/sip")`: Register a callback for custom path routing
- `set_web_hook_url(url)`: Override the default web_hook_url with a supplied URL string
- `set_post_prompt_url(url)`: Override the default post_prompt_url with a supplied URL string

### Endpoint Methods

The SDK provides several endpoints for different purposes:

- Root endpoint (`/`): Serves the main SWML document
- SWAIG endpoint (`/swaig`): Handles SWAIG function calls
- Post-prompt endpoint (`/post_prompt`): Processes conversation summaries
- Check-for-input endpoint (`/check_for_input`): Supports checking for new input from external systems
- Debug endpoint (`/debug`): Serves the SWML document with debug headers
- SIP routing endpoint (configurable, default `/sip`): Handles SIP routing requests

## Testing

The SignalWire AI Agent SDK provides comprehensive testing capabilities through the `swaig-test` CLI tool, which allows you to test agents locally and simulate serverless environments without deployment.

### Local Agent Testing

Test your agents locally before deployment:

```bash
# Discover agents in a file
swaig-test examples/my_agent.py

# List available functions
swaig-test examples/my_agent.py --list-tools

# Test SWAIG functions
swaig-test examples/my_agent.py --exec get_weather --location "New York"

# Generate SWML documents
swaig-test examples/my_agent.py --dump-swml
```

### Serverless Environment Simulation

Test your agents in simulated serverless environments to ensure they work correctly when deployed:

#### AWS Lambda Testing

```bash
# Basic Lambda environment simulation
swaig-test examples/my_agent.py --simulate-serverless lambda --dump-swml

# Test with custom Lambda configuration
swaig-test examples/my_agent.py --simulate-serverless lambda \
  --aws-function-name my-production-function \
  --aws-region us-west-2 \
  --exec my_function --param value

# Test function execution in Lambda context
swaig-test examples/my_agent.py --simulate-serverless lambda \
  --exec get_weather --location "Miami" \
  --full-request
```

#### CGI Environment Testing

```bash
# Test CGI environment
swaig-test examples/my_agent.py --simulate-serverless cgi \
  --cgi-host my-server.com \
  --cgi-https \
  --dump-swml

# Test function in CGI context
swaig-test examples/my_agent.py --simulate-serverless cgi \
  --cgi-host example.com \
  --exec my_function --param value
```

#### Google Cloud Functions Testing

```bash
# Test Cloud Functions environment
swaig-test examples/my_agent.py --simulate-serverless cloud_function \
  --gcp-project my-project \
  --gcp-function-url https://my-function.cloudfunctions.net \
  --dump-swml
```

#### Azure Functions Testing

```bash
# Test Azure Functions environment
swaig-test examples/my_agent.py --simulate-serverless azure_function \
  --azure-env production \
  --azure-function-url https://my-function.azurewebsites.net \
  --exec my_function
```

### Environment Variable Management

Use environment files for consistent testing across different platforms:

```bash
# Create environment file for production testing
cat > production.env << EOF
AWS_LAMBDA_FUNCTION_NAME=prod-my-agent
AWS_REGION=us-east-1
API_KEY=prod_api_key_123
DEBUG=false
TIMEOUT=60
EOF

# Test with environment file
swaig-test examples/my_agent.py --simulate-serverless lambda \
  --env-file production.env \
  --exec critical_function --input "test"

# Override specific variables
swaig-test examples/my_agent.py --simulate-serverless lambda \
  --env-file production.env \
  --env DEBUG=true \
  --dump-swml
```

### Cross-Platform Testing

Test the same agent across multiple platforms to ensure compatibility:

```bash
# Test across all platforms
for platform in lambda cgi cloud_function azure_function; do
  echo "Testing $platform..."
  swaig-test examples/my_agent.py --simulate-serverless $platform \
    --exec my_function --param value
done

# Compare SWML generation across platforms
swaig-test examples/my_agent.py --simulate-serverless lambda --dump-swml > lambda.swml
swaig-test examples/my_agent.py --simulate-serverless cgi --cgi-host example.com --dump-swml > cgi.swml
diff lambda.swml cgi.swml
```

### Webhook URL Verification

The serverless simulation automatically generates platform-appropriate webhook URLs:

| Platform | Example Webhook URL |
|----------|-------------------|
| Lambda (Function URL) | `https://abc123.lambda-url.us-east-1.on.aws/swaig/` |
| Lambda (API Gateway) | `https://api123.execute-api.us-east-1.amazonaws.com/prod/swaig/` |
| CGI | `https://example.com/cgi-bin/agent.cgi/swaig/` |
| Cloud Functions | `https://my-function-abc123.cloudfunctions.net/swaig/` |
| Azure Functions | `https://my-function.azurewebsites.net/swaig/` |

Verify webhook URLs are generated correctly:

```bash
# Check Lambda webhook URL
swaig-test examples/my_agent.py --simulate-serverless lambda \
  --dump-swml --format-json | jq '.sections.main[1].ai.SWAIG.defaults.web_hook_url'

# Check CGI webhook URL
swaig-test examples/my_agent.py --simulate-serverless cgi \
  --cgi-host my-production-server.com \
  --dump-swml --format-json | jq '.sections.main[1].ai.SWAIG.defaults.web_hook_url'
```

### Testing Best Practices

1. **Test locally first**: Always test your agent in local mode before serverless simulation
2. **Test target platforms**: Test on all platforms where you plan to deploy
3. **Use environment files**: Create reusable environment configurations for different stages
4. **Verify webhook URLs**: Ensure URLs are generated correctly for your target platform
5. **Test function execution**: Verify that functions work correctly in serverless context
6. **Use verbose mode**: Enable `--verbose` for debugging environment setup and execution

### Multi-Agent Testing

For files with multiple agents, specify which agent to test:

```bash
# Discover available agents
swaig-test multi_agent_file.py --list-agents

# Test specific agent
swaig-test multi_agent_file.py --agent-class MyAgent --simulate-serverless lambda --dump-swml

# Test different agents across platforms
swaig-test multi_agent_file.py --agent-class AgentA --simulate-serverless lambda --exec function1
swaig-test multi_agent_file.py --agent-class AgentB --simulate-serverless cgi --cgi-host example.com --exec function2
```

For more detailed testing documentation, see the [CLI Testing Guide](/sdks/agents-sdk/cli).

## Examples

### Simple Question-Answering Agent

```python
from signalwire_agents import AgentBase
from signalwire_agents.core.function_result import SwaigFunctionResult
from datetime import datetime

class SimpleAgent(AgentBase):
    def __init__(self):
        super().__init__(
            name="simple",
            route="/simple",
            use_pom=True
        )
        
        # Configure agent personality
        self.prompt_add_section("Personality", body="You are a friendly and helpful assistant.")
        self.prompt_add_section("Goal", body="Help users with basic tasks and answer questions.")
        self.prompt_add_section("Instructions", bullets=[
            "Be concise and direct in your responses.",
            "If you don't know something, say so clearly.",
            "Use the get_time function when asked about the current time."
        ])
        
    @AgentBase.tool(
        name="get_time",
        description="Get the current time",
        parameters={}
    )
    def get_time(self, args, raw_data):
        """Get the current time"""
        now = datetime.now()
        formatted_time = now.strftime("%H:%M:%S")
        return SwaigFunctionResult(f"The current time is {formatted_time}")

def main():
    agent = SimpleAgent()
    print("Starting agent server...")
    print("Note: Works in any deployment mode (server/CGI/Lambda)")
    agent.run()

if __name__ == "__main__":
    main()
```

### Multi-Language Customer Service Agent

```python
class CustomerServiceAgent(AgentBase):
    def __init__(self):
        super().__init__(
            name="customer-service",
            route="/support",
            use_pom=True
        )
        
        # Configure agent personality
        self.prompt_add_section("Personality", 
                               body="You are a helpful customer service representative for SignalWire.")
        self.prompt_add_section("Knowledge", 
                               body="You can answer questions about SignalWire products and services.")
        self.prompt_add_section("Instructions", bullets=[
            "Greet customers politely",
            "Answer questions about SignalWire products",
            "Use check_account_status when customer asks about their account",
            "Use create_support_ticket for unresolved issues"
        ])
        
        # Add language support
        self.add_language(
            name="English",
            code="en-US",
            voice="en-US-Neural2-F",
            speech_fillers=["Let me think...", "One moment please..."],
            function_fillers=["I'm looking that up...", "Let me check that..."]
        )
        
        self.add_language(
            name="Spanish",
            code="es",
            voice="rime.spore:multilingual",
            speech_fillers=["Un momento por favor...", "Estoy pensando..."]
        )
        
        # Enable languages
        self.set_params({"languages_enabled": True})
        
        # Add company information
        self.set_global_data({
            "company_name": "SignalWire",
            "support_hours": "9am-5pm ET, Monday through Friday",
            "support_email": "support@signalwire.com"
        })
    
    @AgentBase.tool(
        name="check_account_status",
        description="Check the status of a customer's account",
        parameters={
            "account_id": {
                "type": "string",
                "description": "The customer's account ID"
            }
        }
    )
    def check_account_status(self, args, raw_data):
        account_id = args.get("account_id")
        # In a real implementation, this would query a database
        return SwaigFunctionResult(f"Account {account_id} is in good standing.")
    
    @AgentBase.tool(
        name="create_support_ticket",
        description="Create a support ticket for an unresolved issue",
        parameters={
            "issue": {
                "type": "string",
                "description": "Brief description of the issue"
            },
            "priority": {
                "type": "string",
                "description": "Ticket priority",
                "enum": ["low", "medium", "high", "critical"]
            }
        }
    )
    def create_support_ticket(self, args, raw_data):
        issue = args.get("issue", "")
        priority = args.get("priority", "medium")
        
        # Generate a ticket ID (in a real system, this would create a database entry)
        ticket_id = f"TICKET-{hash(issue) % 10000:04d}"
        
        return SwaigFunctionResult(
            f"Support ticket {ticket_id} has been created with {priority} priority. " +
            "A support representative will contact you shortly."
        )

def main():
    agent = CustomerServiceAgent()
    print("Starting customer service agent...")
    print("Note: Works in any deployment mode (server/CGI/Lambda)")
    agent.run()

if __name__ == "__main__":
    main()
```

{/*

# Build index from the comprehensive concepts guide
sw-search docs/signalwire_agents_concepts_guide.md --output concepts.swsearch

# Build from multiple sources
sw-search docs/signalwire_agents_concepts_guide.md examples README.md --output comprehensive.swsearch

# Traditional directory approach with custom settings
sw-search ./knowledge \
    --output knowledge.swsearch \
    --file-types md,txt,pdf \
    --chunking-strategy sentence \
    --max-sentences-per-chunk 8 \
    --verbose

*/}
