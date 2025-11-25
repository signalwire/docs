---
sidebar_position: 3
title: "Serverless"
---

## Serverless Deployment

> **Summary**: Deploy agents to AWS Lambda, Google Cloud Functions, or Azure Functions. The SDK automatically detects serverless environments and adapts accordingly.

### Serverless Overview

| Platform | Detection | Handler |
|----------|-----------|---------|
| AWS Lambda | `AWS_LAMBDA_FUNCTION_NAME` | `agent.run(event, ctx)` |
| Google Cloud Functions | `FUNCTION_TARGET` | `agent.run(request)` |
| Azure Functions | `AZURE_FUNCTIONS_ENV` | `agent.run(req)` |

**Benefits:**
- Auto-scaling
- Pay per invocation
- No server management
- High availability

### AWS Lambda

#### Basic Lambda Handler

```python
from signalwire_agents import AgentBase


class MyAgent(AgentBase):
    def __init__(self):
        super().__init__(name="my-agent")
        self.add_language("English", "en-US", "rime.spore")
        self.prompt_add_section("Role", "You are a helpful assistant.")


## Create agent instance
agent = MyAgent()


def lambda_handler(event, context):
    """AWS Lambda entry point"""
    return agent.run(event, context)
```

#### Lambda with API Gateway

Configure API Gateway to pass requests to your Lambda:

```yaml
## serverless.yml (Serverless Framework)
service: signalwire-agent

provider:
  name: aws
  runtime: python3.11
  region: us-east-1

functions:
  agent:
    handler: handler.lambda_handler
    events:
      - http:
          path: /
          method: any
      - http:
          path: /{proxy+}
          method: any
```

#### Lambda Environment Variables

```yaml
## In serverless.yml
provider:
  environment:
    SWML_BASIC_AUTH_USER: ${env:SWML_BASIC_AUTH_USER}
    SWML_BASIC_AUTH_PASSWORD: ${env:SWML_BASIC_AUTH_PASSWORD}
```

#### Lambda Request Flow

```diagram
┌─────────────────────────────────────────────────────────────────────────────┐
│                     Lambda Request Flow                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  SignalWire                                                                 │
│      │                                                                      │
│      ▼                                                                      │
│  ┌──────────────────┐                                                       │
│  │   API Gateway    │  HTTPS endpoint                                       │
│  └──────────────────┘                                                       │
│      │                                                                      │
│      ▼                                                                      │
│  ┌──────────────────┐                                                       │
│  │   Lambda         │  agent.run(event, context)                            │
│  │   Function       │                                                       │
│  └──────────────────┘                                                       │
│      │                                                                      │
│      │  Path: /           → Return SWML document                            │
│      │  Path: /swaig      → Execute SWAIG function                          │
│      │                                                                      │
│      ▼                                                                      │
│  ┌──────────────────┐                                                       │
│  │   Response       │  JSON response to SignalWire                          │
│  └──────────────────┘                                                       │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Google Cloud Functions

#### Cloud Functions Handler

```python
from signalwire_agents import AgentBase


class MyAgent(AgentBase):
    def __init__(self):
        super().__init__(name="my-agent")
        self.add_language("English", "en-US", "rime.spore")
        self.prompt_add_section("Role", "You are a helpful assistant.")


## Create agent instance
agent = MyAgent()


def main(request):
    """Google Cloud Functions entry point"""
    return agent.run(request)
```

#### Deploying to Cloud Functions

```bash
gcloud functions deploy signalwire-agent \
  --runtime python311 \
  --trigger-http \
  --allow-unauthenticated \
  --entry-point main \
  --set-env-vars SWML_BASIC_AUTH_USER=user,SWML_BASIC_AUTH_PASSWORD=pass
```

#### requirements.txt

```
signalwire-agents>=1.0.3
```

### Azure Functions

#### Azure Functions Handler

```python
import azure.functions as func
from signalwire_agents import AgentBase


class MyAgent(AgentBase):
    def __init__(self):
        super().__init__(name="my-agent")
        self.add_language("English", "en-US", "rime.spore")
        self.prompt_add_section("Role", "You are a helpful assistant.")


## Create agent instance
agent = MyAgent()


def main(req: func.HttpRequest) -> func.HttpResponse:
    """Azure Functions entry point"""
    return agent.run(req)
```

#### function.json

```json
{
    "scriptFile": "__init__.py",
    "bindings": [
        {
            "authLevel": "anonymous",
            "type": "httpTrigger",
            "direction": "in",
            "name": "req",
            "methods": ["get", "post"],
            "route": "{*path}"
        },
        {
            "type": "http",
            "direction": "out",
            "name": "$return"
        }
    ]
}
```

### Testing Serverless Locally

Use `swaig-test` to simulate serverless environments:

```bash
## Simulate AWS Lambda
swaig-test my_agent.py --simulate-serverless lambda --dump-swml

## Simulate Google Cloud Functions
swaig-test my_agent.py --simulate-serverless cloud_function --dump-swml

## Simulate Azure Functions
swaig-test my_agent.py --simulate-serverless azure_function --dump-swml
```

### Force Mode Override

For testing, you can force a specific execution mode:

```python
## Force Lambda mode
agent.run(event={}, context=None, force_mode='lambda')

## Force Cloud Functions mode
agent.run(request, force_mode='google_cloud_function')

## Force Azure mode
agent.run(req, force_mode='azure_function')
```

### Serverless Best Practices

#### Cold Starts
- Keep dependencies minimal
- Initialize agent outside handler function
- Use provisioned concurrency for low latency

#### Timeouts
- Set appropriate timeout (Lambda: up to 15 min)
- Account for external API calls
- Monitor and optimize slow functions

#### Memory
- Allocate sufficient memory
- More memory = more CPU in Lambda
- Monitor memory usage

#### State
- Design for statelessness
- Use external storage for persistent data
- Don't rely on local filesystem

### Multi-Agent Serverless

Deploy multiple agents with AgentServer:

```python
from signalwire_agents import AgentBase, AgentServer


class SalesAgent(AgentBase):
    def __init__(self):
        super().__init__(name="sales-agent")
        self.add_language("English", "en-US", "rime.spore")


class SupportAgent(AgentBase):
    def __init__(self):
        super().__init__(name="support-agent")
        self.add_language("English", "en-US", "rime.spore")


server = AgentServer()
server.register(SalesAgent(), "/sales")
server.register(SupportAgent(), "/support")


def lambda_handler(event, context):
    """Lambda handler for multi-agent server"""
    return server.run(event, context)
```

### Environment Detection

The SDK detects serverless environments automatically:

| Environment Variable | Platform |
|---------------------|----------|
| `AWS_LAMBDA_FUNCTION_NAME` | AWS Lambda |
| `LAMBDA_TASK_ROOT` | AWS Lambda |
| `FUNCTION_TARGET` | Google Cloud Functions |
| `K_SERVICE` | Google Cloud Functions |
| `GOOGLE_CLOUD_PROJECT` | Google Cloud Functions |
| `AZURE_FUNCTIONS_ENVIRONMENT` | Azure Functions |
| `FUNCTIONS_WORKER_RUNTIME` | Azure Functions |


