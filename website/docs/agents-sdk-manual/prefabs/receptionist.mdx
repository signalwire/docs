---
sidebar_position: 4
title: "Receptionist"
---

## Receptionist

> **Summary**: ReceptionistAgent greets callers, collects their information, and transfers them to the appropriate department based on their needs.

### Basic Usage

```python
from signalwire_agents.prefabs import ReceptionistAgent

agent = ReceptionistAgent(
    departments=[
        {
            "name": "sales",
            "description": "Product inquiries, pricing, and purchasing",
            "number": "+15551234567"
        },
        {
            "name": "support",
            "description": "Technical help and troubleshooting",
            "number": "+15551234568"
        },
        {
            "name": "billing",
            "description": "Payment questions and account issues",
            "number": "+15551234569"
        }
    ]
)

if __name__ == "__main__":
    agent.run()
```

### Department Format

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | Yes | Department identifier (e.g., "sales") |
| `description` | string | Yes | What the department handles |
| `number` | string | Yes | Phone number for transfer |

### Constructor Parameters

```python
ReceptionistAgent(
    departments=[...],                              # List of department dicts (required)
    name="receptionist",                            # Agent name
    route="/receptionist",                          # HTTP route
    greeting="Thank you for calling. How can I help you today?",
    voice="rime.spore",                             # Voice ID
    **kwargs                                        # Additional AgentBase arguments
)
```

### Built-in Functions

ReceptionistAgent provides these SWAIG functions automatically:

| Function | Description |
|----------|-------------|
| `collect_caller_info` | Collect caller's name and reason for calling |
| `transfer_call` | Transfer to a specific department |

### Call Flow

```diagram
┌─────────────────────────────────────────────────────────────────────────────┐
│                     Receptionist Flow                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  1. Greeting                                                                │
│      │  "Thank you for calling. How can I help you today?"                  │
│      │                                                                      │
│      ▼                                                                      │
│  2. Collect Information                                                     │
│      │  • Caller's name                                                     │
│      │  • Reason for calling                                                │
│      │                                                                      │
│      ▼                                                                      │
│  3. AI calls collect_caller_info()                                          │
│      │  Stores info in global_data                                          │
│      │                                                                      │
│      ▼                                                                      │
│  4. Determine Department                                                    │
│      │  AI matches reason to department                                     │
│      │                                                                      │
│      ▼                                                                      │
│  5. Confirm Transfer                                                        │
│      │  "I'll transfer you to sales. Is that correct?"                      │
│      │                                                                      │
│      ▼                                                                      │
│  6. AI calls transfer_call()                                                │
│      │  Connects to department number                                       │
│      │                                                                      │
│      ▼                                                                      │
│  7. Call Transferred                                                        │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Complete Example

```python
#!/usr/bin/env python3
## company_receptionist.py - Custom receptionist agent
from signalwire_agents.prefabs import ReceptionistAgent


agent = ReceptionistAgent(
    departments=[
        {
            "name": "sales",
            "description": "New orders, pricing, quotes, and product information",
            "number": "+15551001001"
        },
        {
            "name": "support",
            "description": "Technical issues, troubleshooting, and product help",
            "number": "+15551001002"
        },
        {
            "name": "billing",
            "description": "Invoices, payments, refunds, and account questions",
            "number": "+15551001003"
        },
        {
            "name": "hr",
            "description": "Employment, careers, and benefits",
            "number": "+15551001004"
        }
    ],
    greeting="Thank you for calling Acme Corporation. How may I direct your call?",
    voice="rime.spore",
    name="acme-receptionist"
)

## Add custom prompt section
agent.prompt_add_section(
    "Company",
    "You are the receptionist for Acme Corporation, a leading technology company."
)

if __name__ == "__main__":
    agent.run()
```

### Best Practices

#### Departments
- Use clear, distinct department names
- Write descriptions that help AI route correctly
- Include common reasons in descriptions
- Verify transfer numbers are correct

#### Greeting
- Keep greeting professional and welcoming
- Include company name if appropriate
- Ask how to help (prompts caller to state need)

#### Transfers
- Always confirm before transferring
- Use final=True for permanent transfers
- Test all transfer numbers


