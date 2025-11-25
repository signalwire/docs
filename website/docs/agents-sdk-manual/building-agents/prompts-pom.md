---
sidebar_position: 3
title: "Prompts Pom"
---

## Prompts & POM

> **Summary**: The Prompt Object Model (POM) provides a structured way to build AI prompts using sections, subsections, and bullets rather than raw text.

### Why POM?

| Aspect | Raw Text Prompt | POM Structured Prompt |
|--------|-----------------|----------------------|
| **Format** | One long string | Organized sections with body, bullets, subsections |
| **Maintainability** | Hard to maintain | Easy to modify individual sections |
| **Structure** | No structure | Clear hierarchy (Role → Guidelines → Rules) |
| **Extensibility** | Difficult to extend | Reusable components |

**Raw Text Problems:**
- Everything mixed together in one string
- Hard to find and update specific instructions
- Difficult to share sections between agents

**POM Benefits:**
- Sections keep concerns separated
- Bullets make lists scannable
- Subsections add depth without clutter
- Renders to clean, formatted markdown

### POM Structure

```diagram
┌─────────────────────────────────────────────────────────────────────────────┐
│                          POM Hierarchy                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  Prompt                                                                     │
│  │                                                                          │
│  ├── Section: "Role"                                                        │
│  │   └── body: "You are a customer service agent..."                        │
│  │                                                                          │
│  ├── Section: "Guidelines"                                                  │
│  │   ├── body: "Follow these guidelines:"                                   │
│  │   └── bullets:                                                           │
│  │       • "Be professional"                                                │
│  │       • "Ask clarifying questions"                                       │
│  │       • "Keep responses concise"                                         │
│  │                                                                          │
│  └── Section: "Rules"                                                       │
│      ├── body: "Adhere to these rules:"                                     │
│      └── subsections:                                                       │
│          ├── Subsection: "Security"                                         │
│          │   └── bullets: ["Never share passwords", ...]                    │
│          └── Subsection: "Privacy"                                          │
│              └── bullets: ["Don't ask for SSN", ...]                        │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Adding Sections

#### Basic Section with Body

```python
from signalwire_agents import AgentBase


class MyAgent(AgentBase):
    def __init__(self):
        super().__init__(name="my-agent")

        # Simple section with body text
        self.prompt_add_section(
            "Role",
            "You are a helpful customer service representative for Acme Corp."
        )
```

#### Section with Bullets

```python
## Section with bullet points
self.prompt_add_section(
    "Guidelines",
    body="Follow these guidelines when speaking with customers:",
    bullets=[
        "Be professional and courteous at all times",
        "Ask clarifying questions when the request is unclear",
        "Keep responses concise - this is a voice conversation",
        "Offer to transfer to a human if you cannot help"
    ]
)
```

#### Section with Numbered Bullets

```python
## Use numbered list instead of bullets
self.prompt_add_section(
    "Process",
    body="Follow this process for each call:",
    bullets=[
        "Greet the customer warmly",
        "Identify the reason for their call",
        "Resolve the issue or transfer",
        "Thank them and end the call"
    ],
    numbered_bullets=True  # 1. 2. 3. instead of bullets
)
```

### Subsections

Add nested structure within sections:

```python
## First, create the parent section
self.prompt_add_section(
    "Policies",
    body="Follow company policies in these areas:"
)

## Then add subsections
self.prompt_add_subsection(
    "Policies",           # Parent section title
    "Returns",            # Subsection title
    body="For return requests:",
    bullets=[
        "Items can be returned within 30 days",
        "Receipt is required for cash refunds",
        "Exchanges are always available"
    ]
)

self.prompt_add_subsection(
    "Policies",
    "Billing",
    body="For billing inquiries:",
    bullets=[
        "Verify customer identity first",
        "Review last 3 statements",
        "Offer payment plans if needed"
    ]
)
```

### Declarative Prompts (PROMPT_SECTIONS)

Define prompts declaratively as a class attribute:

```python
class DeclarativeAgent(AgentBase):
    PROMPT_SECTIONS = {
        "Role": "You are a friendly assistant for a pizza restaurant.",

        "Menu Knowledge": [
            "Small pizza: $10",
            "Medium pizza: $14",
            "Large pizza: $18",
            "Toppings: $1.50 each"
        ],

        "Order Process": {
            "body": "When taking orders:",
            "bullets": [
                "Confirm the size first",
                "List available toppings",
                "Repeat the order back",
                "Provide total price"
            ]
        },

        "Policies": {
            "body": "Restaurant policies:",
            "subsections": [
                {
                    "title": "Delivery",
                    "body": "Delivery information:",
                    "bullets": [
                        "Free delivery over $25",
                        "$5 fee under $25",
                        "30-45 minute delivery time"
                    ]
                },
                {
                    "title": "Pickup",
                    "bullets": [
                        "Ready in 15-20 minutes",
                        "Call when you arrive"
                    ]
                }
            ]
        }
    }

    def __init__(self):
        super().__init__(name="pizza-agent")
        self.add_language("English", "en-US", "rime.spore")
```

### POM Builder Direct Access

For advanced use, access the POM builder directly:

```python
class AdvancedAgent(AgentBase):
    def __init__(self):
        super().__init__(name="advanced-agent")

        # Direct POM access
        self.pom.section("Role").body(
            "You are an expert technical support agent."
        )

        self.pom.section("Expertise").bullets([
            "Network troubleshooting",
            "Software installation",
            "Hardware diagnostics"
        ])

        # Chain multiple calls
        (self.pom
            .section("Process")
            .body("Follow these steps:")
            .numbered_bullets([
                "Identify the issue",
                "Run diagnostics",
                "Apply solution",
                "Verify resolution"
            ]))
```

### Post-Call Prompts

Configure what happens after the call ends:

```python
## Set post-prompt for call summary
self.set_post_prompt(
    "Summarize this call including: "
    "1) The customer's issue "
    "2) How it was resolved "
    "3) Any follow-up needed"
)

## Alternative: Full post-prompt configuration
self.set_post_prompt_data({
    "text": "Generate a detailed call summary.",
    "temperature": 0.3,
    "top_p": 0.9
})
```

### Voice-Optimized Prompts

Write prompts optimized for voice conversations:

```python
class VoiceOptimizedAgent(AgentBase):
    def __init__(self):
        super().__init__(name="voice-agent")
        self.add_language("English", "en-US", "rime.spore")

        self.prompt_add_section(
            "Voice Guidelines",
            body="Optimize all responses for voice:",
            bullets=[
                "Keep sentences short - under 20 words",
                "Avoid technical jargon unless necessary",
                "Use conversational language, not formal",
                "Pause naturally between topics",
                "Don't list more than 3 items at once",
                "Spell out acronyms on first use"
            ]
        )

        self.prompt_add_section(
            "Response Style",
            bullets=[
                "Start responses with the key information",
                "Confirm understanding before long explanations",
                "Ask 'Does that make sense?' after complex topics",
                "Use filler words naturally: 'Let me check that for you'"
            ]
        )
```

### Prompt Best Practices

#### 1. Lead with Role Definition

```python
## Good - clear role first
self.prompt_add_section(
    "Role",
    "You are Sarah, a senior customer service representative "
    "at TechCorp with 5 years of experience helping customers "
    "with software products."
)
```

#### 2. Separate Concerns

```python
## Good - each section has one purpose
self.prompt_add_section("Role", "...")
self.prompt_add_section("Knowledge", "...")
self.prompt_add_section("Guidelines", "...")
self.prompt_add_section("Restrictions", "...")

## Bad - everything mixed together
self.prompt_add_section("Instructions",
    "You are an agent. Be nice. Don't share secrets. "
    "You know about products. Follow the rules..."
)
```

#### 3. Use Bullets for Lists

```python
## Good - scannable bullets
self.prompt_add_section(
    "Products",
    body="You can help with these products:",
    bullets=["Basic Plan - $10/mo", "Pro Plan - $25/mo", "Enterprise - Custom"]
)

## Bad - inline list
self.prompt_add_section(
    "Products",
    "Products include Basic Plan at $10/mo, Pro Plan at $25/mo, "
    "and Enterprise with custom pricing."
)
```

#### 4. Be Specific About Restrictions

```python
## Good - explicit restrictions
self.prompt_add_section(
    "Restrictions",
    bullets=[
        "Never share customer passwords or security codes",
        "Do not process refunds over $500 without transfer",
        "Cannot modify account ownership",
        "Must verify identity before account changes"
    ]
)
```

### Generated Prompt Output

POM converts your structure to formatted text:

```
## Role

You are Sarah, a customer service representative for Acme Corp.

## Guidelines

Follow these guidelines:

* Be professional and courteous
* Ask clarifying questions when needed
* Keep responses concise for voice

## Policies

### Returns

For return requests:

* Items can be returned within 30 days
* Receipt required for cash refunds

### Billing

For billing inquiries:

* Verify customer identity first
* Review recent statements
```


