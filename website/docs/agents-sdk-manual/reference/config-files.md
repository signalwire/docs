---
sidebar_position: 11
title: "Config Files"
---

## Config Files

> **Summary**: Reference for YAML and JSON configuration files used by the SignalWire Agents SDK.

### Overview

The SDK supports YAML and JSON configuration files for:

- Service settings (host, port, route)
- Security configuration (auth, SSL)
- Agent-specific settings

**File Discovery Order:**

1. `{agent_name}.yaml` / `{agent_name}.json`
2. `config.yaml` / `config.json`
3. `swml.yaml` / `swml.json`

### File Formats

Both YAML and JSON are supported:

**YAML (recommended)**:
```yaml
service:
  name: my-agent
  host: 0.0.0.0
  port: 8080
  route: /agent

security:
  basic_auth:
    username: agent_user
    password: secret_password
```

**JSON**:
```json
{
  "service": {
    "name": "my-agent",
    "host": "0.0.0.0",
    "port": 8080,
    "route": "/agent"
  },
  "security": {
    "basic_auth": {
      "username": "agent_user",
      "password": "secret_password"
    }
  }
}
```

### File Discovery

The SDK searches for config files in this order:

1. Explicit path via `config_file` parameter
2. `{agent_name}.yaml` or `{agent_name}.json`
3. `config.yaml` or `config.json`
4. `swml.yaml` or `swml.json`

### Service Section

```yaml
service:
  # Agent name/identifier
  name: my-agent

  # Host to bind (default: 0.0.0.0)
  host: 0.0.0.0

  # Port to bind (default: 3000)
  port: 8080

  # HTTP route path (default: /)
  route: /agent
```

### Security Section

```yaml
security:
  # Basic authentication credentials
  basic_auth:
    username: agent_user
    password: secret_password

  # SSL/TLS configuration
  ssl:
    enabled: true
    domain: agent.example.com
    cert_path: /etc/ssl/certs/agent.crt
    key_path: /etc/ssl/private/agent.key
```

### Configuration Sections

| Section | Purpose |
|---------|---------|
| `service` | Server settings (name, host, port, route) |
| `security` | Authentication and SSL configuration |
| `agent` | Agent-specific settings |
| `skills` | Skill configurations |
| `logging` | Logging configuration |

### Agent Section

```yaml
agent:
  # Auto-answer incoming calls
  auto_answer: true

  # Enable call recording
  record_call: false
  record_format: mp4
  record_stereo: true

  # Token expiration (seconds)
  token_expiry_secs: 3600

  # Use POM for prompts
  use_pom: true
```

### Skills Section

```yaml
skills:
  # Simple skill activation
  - name: datetime

  # Skill with configuration
  - name: native_vector_search
    params:
      index_path: ./knowledge.swsearch
      tool_name: search_docs

  # Multiple instances
  - name: web_search
    params:
      tool_name: search_products
      api_key: ${SEARCH_API_KEY}
```

### Logging Section

```yaml
logging:
  # Log level
  level: info

  # Output format
  format: structured

  # Disable logging
  mode: default  # or "off"
```

### Environment Variable Substitution

Config files support environment variable substitution:

```yaml
security:
  basic_auth:
    username: ${SWML_BASIC_AUTH_USER}
    password: ${SWML_BASIC_AUTH_PASSWORD}

skills:
  - name: weather
    params:
      api_key: ${WEATHER_API_KEY}
```

### Complete Example

```yaml
## config.yaml
service:
  name: support-agent
  host: 0.0.0.0
  port: 8080
  route: /support

security:
  basic_auth:
    username: ${AUTH_USER:-support_agent}
    password: ${AUTH_PASSWORD}
  ssl:
    enabled: true
    domain: support.example.com
    cert_path: /etc/ssl/certs/support.crt
    key_path: /etc/ssl/private/support.key

agent:
  auto_answer: true
  record_call: true
  record_format: mp3
  token_expiry_secs: 7200

skills:
  - name: datetime
  - name: native_vector_search
    params:
      index_path: ./support_docs.swsearch
      tool_name: search_support
      tool_description: Search support documentation

logging:
  level: info
```

### Using Config Files

#### Explicit Path

```python
from signalwire_agents import AgentBase

agent = AgentBase(
    name="my-agent",
    config_file="/path/to/config.yaml"
)
```

#### Auto-Discovery

```python
## Will look for my-agent.yaml, config.yaml, swml.yaml
agent = AgentBase(name="my-agent")
```

### Priority Order

Configuration values are resolved in this order (highest priority first):

1. Constructor parameters
2. Environment variables
3. Config file values
4. Default values

```python
## Constructor parameter takes precedence
agent = AgentBase(
    name="my-agent",
    port=9000,  # Overrides config file
    config_file="config.yaml"
)
```

### Config Validation

The SDK validates config files on load:

- Required fields are present
- Types are correct (port is integer, etc.)
- File paths exist (for SSL certificates)
- Environment variables are defined (if referenced)

### Multiple Configurations

For multi-agent deployments:

```
project/
   agents/
      sales_agent.py
      sales_agent.yaml
      support_agent.py
      support_agent.yaml
   config.yaml  # Shared defaults
```

Each agent will load its own config file based on agent name.


