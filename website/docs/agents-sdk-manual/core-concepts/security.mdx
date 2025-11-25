---
sidebar_position: 5
title: "Security"
---

## Security

> **Summary**: The SDK provides layered security through HTTP Basic Authentication for all requests and optional per-function token validation for sensitive operations.

### Security Layers

The SignalWire Agents SDK implements multiple security layers:

#### Layer 1: Transport Security (HTTPS)
- TLS encryption in transit
- Certificate validation

#### Layer 2: HTTP Basic Authentication
- Username/password validation
- Applied to all webhook endpoints

#### Layer 3: Function Token Security (Optional)
- Per-function security tokens
- Cryptographic validation

### HTTP Basic Authentication

Every request to your agent is protected by HTTP Basic Auth.

#### How It Works

1. **SignalWire sends request** with `Authorization: Basic <base64-encoded-credentials>` header
2. **Agent extracts header** and Base64 decodes credentials
3. **Agent splits** the decoded string into username and password
4. **Agent compares** credentials against configured values
5. **Result**: Match returns 200 + response; No match returns 401 Denied

#### Configuring Credentials

**Option 1: Environment Variables (Recommended for production)**

```bash
## Set explicit credentials
export SWML_BASIC_AUTH_USER=my_secure_username
export SWML_BASIC_AUTH_PASSWORD=my_very_secure_password_here
```

**Option 2: Let SDK Generate Credentials (Development)**

If you don't set credentials, the SDK:

- Uses username: `signalwire`
- Generates a random password on each startup
- Prints the password to the console

```bash
$ python my_agent.py
INFO: Agent 'my-agent' starting...
INFO: Basic Auth credentials:
INFO:   Username: signalwire
INFO:   Password: a7b3x9k2m5n1p8q4  # Use this in SignalWire webhook config
```

#### Credentials in Your Agent

```python
from signalwire_agents import AgentBase
import os


class MyAgent(AgentBase):
    def __init__(self):
        super().__init__(
            name="my-agent",
            # Credentials from environment or defaults
            basic_auth_user=os.getenv("SWML_BASIC_AUTH_USER"),
            basic_auth_password=os.getenv("SWML_BASIC_AUTH_PASSWORD")
        )
```

### Function Token Security

For sensitive operations, enable per-function token validation.

#### How Function Tokens Work

**SWML Generation (GET /)**

1. Agent generates SWML
2. For each secure function, generate unique token
3. Token embedded in function's `web_hook_url`

```json
"functions": [{
  "function": "transfer_funds",
  "web_hook_url": "https://agent.com/swaig?token=abc123xyz..."
}]
```

**Function Call (POST /swaig)**

1. SignalWire calls webhook URL with token
2. Agent extracts token from request
3. Agent validates token cryptographically
4. If valid, execute function
5. If invalid, reject with 403

#### Enabling Token Security

```python
from signalwire_agents import AgentBase, SwaigFunctionResult


class SecureAgent(AgentBase):
    def __init__(self):
        super().__init__(name="secure-agent")

        # Regular function - Basic Auth only
        self.define_tool(
            name="get_balance",
            description="Get account balance",
            parameters={...},
            handler=self.get_balance
        )

        # Secure function - Basic Auth + Token validation
        self.define_tool(
            name="transfer_funds",
            description="Transfer funds between accounts",
            parameters={...},
            handler=self.transfer_funds,
            secure=True  # Enable token security
        )

    def get_balance(self, args, raw_data):
        return SwaigFunctionResult("Balance is $150.00")

    def transfer_funds(self, args, raw_data):
        # This only executes if token is valid
        return SwaigFunctionResult("Transfer complete")
```

#### Token Generation

Tokens are generated using cryptographic hashing:

```python
## Simplified view of token generation
import hashlib
import secrets

def generate_function_token(function_name, secret_key, call_context):
    """Generate a secure token for a function."""
    # Combine function name, secret, and context
    token_input = f"{function_name}:{secret_key}:{call_context}"

    # Generate cryptographic hash
    token = hashlib.sha256(token_input.encode()).hexdigest()

    return token
```

### HTTPS Configuration

For production, enable HTTPS:

#### Using SSL Certificates

```bash
## Environment variables for SSL
export SWML_SSL_ENABLED=true
export SWML_SSL_CERT_PATH=/path/to/cert.pem
export SWML_SSL_KEY_PATH=/path/to/key.pem
export SWML_DOMAIN=my-agent.example.com
```

```python
from signalwire_agents import AgentBase


class SecureAgent(AgentBase):
    def __init__(self):
        super().__init__(
            name="secure-agent",
            ssl_enabled=True,
            ssl_cert_path="/path/to/cert.pem",
            ssl_key_path="/path/to/key.pem"
        )
```

#### Using a Reverse Proxy (Recommended)

Most production deployments use a reverse proxy for SSL:

**Traffic Flow**: SignalWire → HTTPS → nginx/Caddy (SSL termination) → HTTP → Your Agent (localhost:3000)

**Benefits**:

- SSL handled by proxy
- Easy certificate management
- Load balancing
- Additional security headers

Set the proxy URL so your agent generates correct webhook URLs:

```bash
export SWML_PROXY_URL_BASE=https://my-agent.example.com
```

### Security Best Practices

#### 1. Never Commit Credentials

```gitignore
## .gitignore
.env
.env.local
*.pem
*.key
```

#### 2. Use Strong Passwords

```bash
## Generate a strong password
python -c "import secrets; print(secrets.token_urlsafe(32))"
```

#### 3. Validate All Inputs

```python
def transfer_funds(self, args, raw_data):
    amount = args.get("amount")
    to_account = args.get("to_account")

    # Validate inputs
    if not amount or not isinstance(amount, (int, float)):
        return SwaigFunctionResult("Invalid amount specified")

    if amount <= 0:
        return SwaigFunctionResult("Amount must be positive")

    if amount > 10000:
        return SwaigFunctionResult(
            "Transfers over $10,000 require additional verification"
        )

    if not to_account or len(to_account) != 10:
        return SwaigFunctionResult("Invalid account number")

    # Proceed with transfer
    return SwaigFunctionResult(f"Transferred ${amount} to account {to_account}")
```

#### 4. Use Secure Functions for Sensitive Operations

```python
## Mark sensitive functions as secure
self.define_tool(
    name="delete_account",
    description="Delete a customer account",
    parameters={...},
    handler=self.delete_account,
    secure=True  # Always use token security for destructive operations
)

self.define_tool(
    name="change_password",
    description="Change account password",
    parameters={...},
    handler=self.change_password,
    secure=True
)

self.define_tool(
    name="transfer_funds",
    description="Transfer money",
    parameters={...},
    handler=self.transfer_funds,
    secure=True
)
```

#### 5. Log Security Events

```python
import logging


class SecureAgent(AgentBase):
    def __init__(self):
        super().__init__(name="secure-agent")
        self.logger = logging.getLogger(__name__)

    def transfer_funds(self, args, raw_data):
        call_id = raw_data.get("call_id")
        caller = raw_data.get("caller_id_num")
        amount = args.get("amount")
        to_account = args.get("to_account")

        # Log the sensitive operation
        self.logger.info(
            f"Transfer initiated: call_id={call_id}, "
            f"caller={caller}, amount={amount}, to={to_account}"
        )

        # Process transfer
        result = self.process_transfer(amount, to_account)

        self.logger.info(
            f"Transfer completed: call_id={call_id}, result={result}"
        )

        return SwaigFunctionResult(f"Transfer of ${amount} complete")
```

#### 6. Implement Rate Limiting

```python
from collections import defaultdict
from time import time


class RateLimitedAgent(AgentBase):
    def __init__(self):
        super().__init__(name="rate-limited-agent")
        self.call_counts = defaultdict(list)
        self.rate_limit = 10  # calls per minute

    def check_rate_limit(self, caller_id):
        """Check if caller has exceeded rate limit."""
        now = time()
        minute_ago = now - 60

        # Clean old entries
        self.call_counts[caller_id] = [
            t for t in self.call_counts[caller_id] if t > minute_ago
        ]

        # Check limit
        if len(self.call_counts[caller_id]) >= self.rate_limit:
            return False

        # Record this call
        self.call_counts[caller_id].append(now)
        return True

    def get_balance(self, args, raw_data):
        caller = raw_data.get("caller_id_num")

        if not self.check_rate_limit(caller):
            return SwaigFunctionResult(
                "You've made too many requests. Please wait a moment."
            )

        # Process normally
        return SwaigFunctionResult("Your balance is $150.00")
```

### Configuring SignalWire Webhooks

When setting up your phone number in SignalWire:

| Setting | Value |
|---------|-------|
| Handle Calls Using | SWML Script |
| SWML Script URL | `https://my-agent.example.com/` |
| Request Method | POST |
| Authentication | HTTP Basic Auth |
| Username | Your configured username |
| Password | Your configured password |

### Summary

| Security Feature | When to Use | How to Enable |
|-----------------|-------------|---------------|
| **Basic Auth** | Always | Automatic (set env vars for custom) |
| **Function Tokens** | Sensitive operations | `secure=True` on define_tool |
| **HTTPS** | Production | SSL certs or reverse proxy |
| **Input Validation** | All functions | Manual validation in handlers |
| **Rate Limiting** | Public-facing agents | Manual implementation |
| **Logging** | All security events | Python logging module |

### Next Steps

You now understand the core concepts of the SignalWire Agents SDK. Let's move on to building agents.


