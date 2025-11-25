---
sidebar_position: 5
title: "Multi Agent"
---

## Multi-Agent Servers

> **Summary**: Run multiple agents on a single server using `AgentServer`. Each agent gets its own route, and you can configure SIP-based routing for username-to-agent mapping.

### When to Use AgentServer

| Single Agent (`agent.run()`) | AgentServer |
|------------------------------|-------------|
| One agent per process | Multiple agents per process |
| Simple deployment | Shared resources |
| Separate ports per agent | Single port, multiple routes |
| | SIP username routing |
| | Unified health checks |

### Basic AgentServer

```python
from signalwire_agents import AgentBase, AgentServer


class SalesAgent(AgentBase):
    def __init__(self):
        super().__init__(name="sales-agent")
        self.add_language("English", "en-US", "rime.spore")
        self.prompt_add_section("Role", "You are a sales representative.")


class SupportAgent(AgentBase):
    def __init__(self):
        super().__init__(name="support-agent")
        self.add_language("English", "en-US", "rime.spore")
        self.prompt_add_section("Role", "You are a support specialist.")


if __name__ == "__main__":
    server = AgentServer(host="0.0.0.0", port=3000)

    server.register(SalesAgent(), "/sales")
    server.register(SupportAgent(), "/support")

    server.run()
```

Agents are available at:

| Endpoint | Description |
|----------|-------------|
| `http://localhost:3000/sales` | Sales agent |
| `http://localhost:3000/support` | Support agent |
| `http://localhost:3000/health` | Built-in health check |

### AgentServer Configuration

```python
server = AgentServer(
    host="0.0.0.0",     # Bind address
    port=3000,          # Listen port
    log_level="info"    # debug, info, warning, error, critical
)
```

### Registering Agents

#### With Explicit Route

```python
server.register(SalesAgent(), "/sales")
```

#### Using Agent's Default Route

```python
class BillingAgent(AgentBase):
    def __init__(self):
        super().__init__(
            name="billing-agent",
            route="/billing"  # Default route
        )

server.register(BillingAgent())  # Uses "/billing"
```

### Server Architecture

```diagram
┌─────────────────────────────────────────────────────────────────────────────┐
│                        AgentServer Architecture                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│                          AgentServer                                        │
│                     (FastAPI Application)                                   │
│                              │                                              │
│         ┌────────────────────┼────────────────────┐                         │
│         │                    │                    │                         │
│         ▼                    ▼                    ▼                         │
│    ┌─────────┐         ┌─────────┐         ┌─────────┐                      │
│    │ /sales  │         │/support │         │/billing │                      │
│    │         │         │         │         │         │                      │
│    │ Sales   │         │ Support │         │ Billing │                      │
│    │ Agent   │         │ Agent   │         │ Agent   │                      │
│    └─────────┘         └─────────┘         └─────────┘                      │
│                                                                             │
│  Each agent has:                                                            │
│  • GET/POST /route         → SWML document                                  │
│  • POST /route/swaig       → Function calls                                 │
│  • POST /route/post_prompt → Post-prompt handling                           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Managing Agents

#### Get All Agents

```python
agents = server.get_agents()
for route, agent in agents:
    print(f"{route}: {agent.get_name()}")
```

#### Get Specific Agent

```python
sales_agent = server.get_agent("/sales")
```

#### Unregister Agent

```python
server.unregister("/sales")
```

### SIP Routing

Route SIP calls to specific agents based on username:

```python
from signalwire_agents import AgentBase, AgentServer


class SalesAgent(AgentBase):
    def __init__(self):
        super().__init__(name="sales-agent")
        self.add_language("English", "en-US", "rime.spore")
        self.prompt_add_section("Role", "You are a sales representative.")


class SupportAgent(AgentBase):
    def __init__(self):
        super().__init__(name="support-agent")
        self.add_language("English", "en-US", "rime.spore")
        self.prompt_add_section("Role", "You are a support specialist.")


if __name__ == "__main__":
    server = AgentServer()

    server.register(SalesAgent(), "/sales")
    server.register(SupportAgent(), "/support")

    # Enable SIP routing
    server.setup_sip_routing("/sip", auto_map=True)

    # Manual SIP username mapping
    server.register_sip_username("sales-team", "/sales")
    server.register_sip_username("help-desk", "/support")

    server.run()
```

When `auto_map=True`, the server automatically creates mappings:

- Agent name → route (e.g., "salesagent" → "/sales")
- Route path → route (e.g., "sales" → "/sales")

### SIP Routing Flow

```diagram
┌─────────────────────────────────────────────────────────────────────────────┐
│                        SIP Routing Flow                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  SIP Call to: sip:sales-team@example.com                                    │
│                        │                                                    │
│                        ▼                                                    │
│            ┌──────────────────────┐                                         │
│            │  POST /sip           │                                         │
│            │  (routing endpoint)  │                                         │
│            └──────────────────────┘                                         │
│                        │                                                    │
│                        ▼                                                    │
│            ┌──────────────────────┐                                         │
│            │ Extract username:    │                                         │
│            │ "sales-team"         │                                         │
│            └──────────────────────┘                                         │
│                        │                                                    │
│                        ▼                                                    │
│            ┌──────────────────────┐                                         │
│            │ Lookup route:        │                                         │
│            │ "/sales"             │                                         │
│            └──────────────────────┘                                         │
│                        │                                                    │
│                        ▼                                                    │
│            ┌──────────────────────┐                                         │
│            │ Return SWML from     │                                         │
│            │ Sales Agent          │                                         │
│            └──────────────────────┘                                         │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Health Check Endpoint

AgentServer provides a built-in health check:

```bash
curl http://localhost:3000/health
```

Response:

```json
{
    "status": "ok",
    "agents": 2,
    "routes": ["/sales", "/support"]
}
```

### Serverless Deployment

AgentServer supports serverless environments automatically:

```python
from signalwire_agents import AgentBase, AgentServer


class MyAgent(AgentBase):
    def __init__(self):
        super().__init__(name="my-agent")
        self.add_language("English", "en-US", "rime.spore")


server = AgentServer()
server.register(MyAgent(), "/agent")


## AWS Lambda handler
def lambda_handler(event, context):
    return server.run(event, context)


## CGI mode (auto-detected)
if __name__ == "__main__":
    server.run()
```

### Complete Example

```python
#!/usr/bin/env python3
## multi_agent_server.py - Server with multiple specialized agents
from signalwire_agents import AgentBase, AgentServer
from signalwire_agents.core.function_result import SwaigFunctionResult


class SalesAgent(AgentBase):
    def __init__(self):
        super().__init__(name="sales-agent")
        self.add_language("English", "en-US", "rime.spore")

        self.prompt_add_section(
            "Role",
            "You are a sales representative for Acme Corp."
        )

        self.define_tool(
            name="get_pricing",
            description="Get product pricing",
            parameters={
                "type": "object",
                "properties": {
                    "product": {"type": "string", "description": "Product name"}
                },
                "required": ["product"]
            },
            handler=self.get_pricing
        )

    def get_pricing(self, args, raw_data):
        product = args.get("product", "")
        # Pricing lookup logic
        return SwaigFunctionResult(f"The price for {product} is $99.99")


class SupportAgent(AgentBase):
    def __init__(self):
        super().__init__(name="support-agent")
        self.add_language("English", "en-US", "rime.spore")

        self.prompt_add_section(
            "Role",
            "You are a technical support specialist."
        )

        self.define_tool(
            name="create_ticket",
            description="Create a support ticket",
            parameters={
                "type": "object",
                "properties": {
                    "issue": {"type": "string", "description": "Issue description"}
                },
                "required": ["issue"]
            },
            handler=self.create_ticket
        )

    def create_ticket(self, args, raw_data):
        issue = args.get("issue", "")
        # Ticket creation logic
        return SwaigFunctionResult(f"Created ticket #12345 for: {issue}")


class BillingAgent(AgentBase):
    def __init__(self):
        super().__init__(name="billing-agent")
        self.add_language("English", "en-US", "rime.spore")

        self.prompt_add_section(
            "Role",
            "You help customers with billing questions."
        )


if __name__ == "__main__":
    # Create server
    server = AgentServer(host="0.0.0.0", port=3000)

    # Register agents
    server.register(SalesAgent(), "/sales")
    server.register(SupportAgent(), "/support")
    server.register(BillingAgent(), "/billing")

    # Enable SIP routing
    server.setup_sip_routing("/sip", auto_map=True)

    # Custom SIP mappings
    server.register_sip_username("sales", "/sales")
    server.register_sip_username("help", "/support")
    server.register_sip_username("accounts", "/billing")

    print("Agents available:")
    for route, agent in server.get_agents():
        print(f"  {route}: {agent.get_name()}")

    server.run()
```

### AgentServer Methods Summary

| Method | Purpose |
|--------|---------|
| `register(agent, route)` | Register an agent at a route |
| `unregister(route)` | Remove an agent |
| `get_agents()` | Get all registered agents |
| `get_agent(route)` | Get agent by route |
| `setup_sip_routing(route, auto_map)` | Enable SIP-based routing |
| `register_sip_username(username, route)` | Map SIP username to route |
| `run()` | Start the server |

### Best Practices

**DO:**
- Use meaningful route names (/sales, /support, /billing)
- Enable SIP routing for SIP-based deployments
- Monitor /health endpoint for availability
- Use consistent naming between routes and SIP usernames

**DON'T:**
- Register duplicate routes
- Forget to handle routing conflicts
- Mix agent.run() and AgentServer for the same agent

