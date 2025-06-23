---
id: agents-sdk-skills-overview
slug: /sdks/agents-sdk/skills
title: Skills
sidebar_label: Skills
--- 

# Skills

The Agents SDK includes a powerful, modular skills system that allows you to add capabilities to your agents with simple one-liner calls and configurable parameters.

The skills system provides one-liner integration with `agent.add_skill("skill_name")` and configurable parameters via `agent.add_skill("skill_name", {"param": "value"})`. 
Skills are automatically discovered when dropped in the directory, with built-in dependency validation for packages and environment variables. The modular architecture ensures skills are self-contained and reusable, while the extensible design makes it easy to create custom skills with parameters. You can also tune performance by configuring skills for speed versus comprehensiveness.

---

## Skills System

The Skills System allows you to extend your agents with powerful capabilities using simple one-liner calls. Skills are modular, reusable components that can be easily added to any agent and configured with parameters.

### Quick Start

```python
from signalwire_agents import AgentBase

class SkillfulAgent(AgentBase):
    def __init__(self):
        super().__init__(name="skillful-agent", route="/skillful")
        
        # Add skills with one-liners
        self.add_skill("web_search")    # Web search capability
        self.add_skill("datetime")      # Current date/time info
        self.add_skill("math")          # Mathematical calculations
        
        # Configure skills with parameters
        self.add_skill("web_search", {
            "num_results": 3,  # Get 3 search results instead of default 1
            "delay": 0.5       # Add delay between requests
        })
```

### Available Built-in Skills

#### Web Search Skill (`web_search`)
Provides web search capabilities using Google Custom Search API with web scraping.

**Requirements:**
- Packages: `beautifulsoup4`, `requests`

**Parameters:**
- `api_key` (required): Google Custom Search API key
- `search_engine_id` (required): Google Custom Search Engine ID
- `num_results` (default: 1): Number of search results to return
- `delay` (default: 0): Delay in seconds between requests
- `tool_name` (default: "web_search"): Custom name for the search tool
- `no_results_message` (default: "I couldn't find any results for '\{query}'. This might be due to a very specific query or temporary issues. Try rephrasing your search or asking about a different topic."): Custom message to return when no search results are found. Use `\{query}` as a placeholder for the search query.

**Multiple Instance Support:**
The web_search skill supports multiple instances with different search engines and tool names, allowing you to search different data sources:

**Example:**
```python
# Basic single instance
agent.add_skill("web_search", {
    "api_key": "your-google-api-key",
    "search_engine_id": "your-search-engine-id"
})
# Creates tool: web_search

# Fast single result (previous default)
agent.add_skill("web_search", {
    "api_key": "your-google-api-key",
    "search_engine_id": "your-search-engine-id",
    "num_results": 1,
    "delay": 0
})

# Multiple results with delay
agent.add_skill("web_search", {
    "api_key": "your-google-api-key",
    "search_engine_id": "your-search-engine-id",
    "num_results": 5,
    "delay": 1.0
})

# Multiple instances with different search engines
agent.add_skill("web_search", {
    "api_key": "your-google-api-key",
    "search_engine_id": "general-search-engine-id",
    "tool_name": "search_general",
    "num_results": 1
})
# Creates tool: search_general

agent.add_skill("web_search", {
    "api_key": "your-google-api-key",
    "search_engine_id": "news-search-engine-id",
    "tool_name": "search_news",
    "num_results": 3,
    "delay": 0.5
})
# Creates tool: search_news

# Custom no results message
agent.add_skill("web_search", {
    "api_key": "your-google-api-key",
    "search_engine_id": "your-search-engine-id",
    "no_results_message": "Sorry, I couldn't find information about '\{query}'. Please try a different search term."
})
```

#### DateTime Skill (`datetime`)
Provides current date and time information with timezone support.

**Requirements:**
- Packages: `pytz`

**Tools Added:**
- `get_current_time`: Get current time with optional timezone
- `get_current_date`: Get current date with optional timezone

**Example:**
```python
agent.add_skill("datetime")
# Agent can now tell users the current time and date
```

#### Math Skill (`math`)
Provides safe mathematical expression evaluation.

**Requirements:**
- None (uses built-in Python functionality)

**Tools Added:**
- `calculate`: Evaluate mathematical expressions safely

**Example:**
```python
agent.add_skill("math")
# Agent can now perform calculations like "2 + 3 * 4"
```

#### DataSphere Skill (`datasphere`)
Provides knowledge search capabilities using SignalWire DataSphere RAG stack.

**Requirements:**
- Packages: `requests`

**Parameters:**
- `space_name` (required): SignalWire space name
- `project_id` (required): SignalWire project ID 
- `token` (required): SignalWire authentication token
- `document_id` (required): DataSphere document ID to search
- `count` (default: 1): Number of search results to return
- `distance` (default: 3.0): Distance threshold for search matching
- `tags` (optional): List of tags to filter search results
- `language` (optional): Language code to limit search
- `pos_to_expand` (optional): List of parts of speech for synonym expansion (e.g., ["NOUN", "VERB"])
- `max_synonyms` (optional): Maximum number of synonyms to use for each word
- `tool_name` (default: "search_knowledge"): Custom name for the search tool
- `no_results_message` (default: "I couldn't find any relevant information for '\{query}' in the knowledge base. Try rephrasing your question or asking about a different topic."): Custom message when no results found

**Multiple Instance Support:**
The DataSphere skill supports multiple instances with different tool names, allowing you to search multiple knowledge bases:

**Example:**
```python
# Basic single instance
agent.add_skill("datasphere", {
    "space_name": "my-space",
    "project_id": "my-project",
    "token": "my-token",
    "document_id": "general-knowledge"
})
# Creates tool: search_knowledge

# Multiple instances for different knowledge bases
agent.add_skill("datasphere", {
    "space_name": "my-space",
    "project_id": "my-project", 
    "token": "my-token",
    "document_id": "product-docs",
    "tool_name": "search_products",
    "tags": ["Products", "Features"],
    "count": 3
})
# Creates tool: search_products

agent.add_skill("datasphere", {
    "space_name": "my-space",
    "project_id": "my-project",
    "token": "my-token", 
    "document_id": "support-kb",
    "tool_name": "search_support",
    "no_results_message": "I couldn't find support information about '\{query}'. Try contacting our support team.",
    "distance": 5.0
})
# Creates tool: search_support
```

#### Native Vector Search Skill (`native_vector_search`)
Provides local document search capabilities using vector similarity and keyword search. This skill works entirely offline with local `.swsearch` index files or can connect to remote search servers.

**Requirements:**
- Packages: `sentence-transformers`, `scikit-learn`, `numpy` (install with `pip install signalwire-agents[search]`)

**Parameters:**
- `tool_name` (default: "search_knowledge"): Custom name for the search tool
- `description` (default: "Search the local knowledge base for information"): Tool description
- `index_file` (optional): Path to local `.swsearch` index file
- `remote_url` (optional): URL of remote search server (e.g., `http://localhost:8001`)
- `index_name` (default: "default"): Index name on remote server (for remote mode)
- `build_index` (default: False): Auto-build index if missing
- `source_dir` (optional): Source directory for auto-building index
- `file_types` (default: ["md", "txt"]): File types to include when building index
- `count` (default: 3): Number of search results to return
- `distance_threshold` (default: 0.0): Minimum similarity score for results
- `tags` (optional): List of tags to filter search results
- `response_prefix` (optional): Text to prepend to all search responses
- `response_postfix` (optional): Text to append to all search responses
- `no_results_message` (default: "No information found for '\{query}'"): Custom message when no results found

**Multiple Instance Support:**
The native vector search skill supports multiple instances with different indexes and tool names:

**Example:**
```python
# Local mode with auto-build
agent.add_skill("native_vector_search", {
    "tool_name": "search_docs",
    "description": "Search SDK concepts guide",
    "build_index": True,
    "source_dir": "./docs",
    "index_file": "concepts.swsearch",
    "count": 5
})
# Creates tool: search_docs

# Remote mode connecting to search server
agent.add_skill("native_vector_search", {
    "tool_name": "search_knowledge",
    "description": "Search the knowledge base",
    "remote_url": "http://localhost:8001",
    "index_name": "concepts",
    "count": 3
})
# Creates tool: search_knowledge

# Multiple local indexes
agent.add_skill("native_vector_search", {
    "tool_name": "search_examples",
    "description": "Search code examples",
    "index_file": "examples.swsearch",
    "response_prefix": "From the examples:"
})
# Creates tool: search_examples

# Voice-optimized responses using concepts guide
agent.add_skill("native_vector_search", {
    "tool_name": "search_docs",
    "index_file": "concepts.swsearch",
    "response_prefix": "Based on the comprehensive SDK guide:",
    "response_postfix": "Would you like more specific information?",
    "no_results_message": "I couldn't find information about '\{query}' in the concepts guide."
})
```

**Building Search Indexes:**
Before using local mode, you need to build search indexes:

```bash
# Build index from documentation
python -m signalwire_agents.cli.build_search docs --output docs.swsearch

# Build with custom settings
python -m signalwire_agents.cli.build_search ./knowledge \
    --output knowledge.swsearch \
    --file-types md,txt,pdf \
    --chunk-size 500 \
    --verbose
```

For complete documentation on the search system, see [Local Search System](/sdks/agents-sdk/skills/search).

### Skill Management

```python
# Check what skills are loaded
loaded_skills = agent.list_skills()
print(f"Loaded skills: {', '.join(loaded_skills)}")

# Check if a specific skill is loaded
if agent.has_skill("web_search"):
    print("Web search is available")

# Remove a skill (if needed)
agent.remove_skill("math")
```

### Advanced Skill Configuration with swaig_fields

Skills support a special `swaig_fields` parameter that allows you to customize how SWAIG functions are registered. This parameter gets merged into the function decorator object, enabling the skill loader to add additional configuration to the tools.

```python
# Add a skill with swaig_fields to customize SWAIG function properties
agent.add_skill("math", {
    "precision": 2,  # Regular skill parameter
    "swaig_fields": {  # Special fields merged into SWAIG function
        "secure": False,  # Override default security requirement
        "fillers": {
            "en-US": ["Let me calculate that...", "Computing the result..."],
            "es-ES": ["Déjame calcular eso...", "Calculando el resultado..."]
        }
    }
})

# Add web search with custom security and fillers
agent.add_skill("web_search", {
    "num_results": 3,
    "delay": 0.5,
    "swaig_fields": {
        "secure": True,  # Require authentication
        "fillers": {
            "en-US": ["Searching the web...", "Looking that up...", "Finding information..."]
        }
    }
})
```

The `swaig_fields` can include any parameter accepted by `AgentBase.define_tool()`:
- `secure`: Boolean indicating if the function requires authentication
- `fillers`: Dictionary mapping language codes to arrays of filler phrases
- Any other fields supported by the SWAIG function system

This feature enables advanced customization of how skills integrate with the agent's SWAIG system.

### Error Handling

The skills system provides detailed error messages for common issues:

```python
try:
    agent.add_skill("web_search")
except ValueError as e:
    print(f"Failed to load skill: {e}")
    # Output: "Failed to load skill 'web_search': Missing required environment variables: ['GOOGLE_SEARCH_API_KEY']"
```

### Creating Custom Skills

You can create your own skills by extending the `SkillBase` class:

```python
from signalwire_agents.core.skill_base import SkillBase
from signalwire_agents.core.function_result import SwaigFunctionResult

class WeatherSkill(SkillBase):
    """A custom skill for weather information"""
    
    SKILL_NAME = "weather"
    SKILL_DESCRIPTION = "Get weather information for locations"
    SKILL_VERSION = "1.0.0"
    REQUIRED_PACKAGES = ["requests"]
    REQUIRED_ENV_VARS = ["WEATHER_API_KEY"]
    
    def setup(self) -> bool:
        """Setup the skill - validate dependencies and initialize"""
        if not self.validate_env_vars() or not self.validate_packages():
            return False
        
        # Get configuration parameters
        self.default_units = self.params.get('units', 'fahrenheit')
        self.timeout = self.params.get('timeout', 10)
        
        return True
    
    def register_tools(self) -> None:
        """Register tools with the agent"""
        self.define_tool_with_swaig_fields(
            name="get_weather",
            description="Get current weather for a location",
            parameters={
                "location": {
                    "type": "string",
                    "description": "City or location name"
                },
                "units": {
                    "type": "string",
                    "description": "Temperature units (fahrenheit or celsius)",
                    "enum": ["fahrenheit", "celsius"]
                }
            },
            handler=self._get_weather_handler
        )
    
    def _get_weather_handler(self, args, raw_data):
        """Handle weather requests"""
        location = args.get("location", "")
        units = args.get("units", self.default_units)
        
        if not location:
            return SwaigFunctionResult("Please provide a location")
        
        # Your weather API integration here
        weather_data = f"Weather for {location}: 72°F and sunny"
        return SwaigFunctionResult(weather_data)
    
    def get_hints(self) -> List[str]:
        """Return speech recognition hints"""
        return ["weather", "temperature", "forecast", "conditions"]
    
    def get_prompt_sections(self) -> List[Dict[str, Any]]:
        """Return prompt sections to add to agent"""
        return [
            {
                "title": "Weather Information",
                "body": "You can provide current weather information for any location.",
                "bullets": [
                    "Use get_weather tool when users ask about weather",
                    "Always specify the location clearly",
                    "Include temperature and conditions in your response"
                ]
            }
        ]
```

**Using the custom skill:**
```python
# Place the skill in signalwire_agents/skills/weather/skill.py
# Then use it in your agent:

agent.add_skill("weather", {
    "units": "celsius",
    "timeout": 15
})
```

### Skills with Dynamic Configuration

Skills work seamlessly with dynamic configuration:

```python
class DynamicSkillAgent(AgentBase):
    def __init__(self):
        super().__init__(name="dynamic-skill-agent")
        self.set_dynamic_config_callback(self.configure_per_request)
    
    def configure_per_request(self, query_params, body_params, headers, agent):
        # Add different skills based on request parameters
        tier = query_params.get('tier', 'basic')
        
        # Basic skills for all users
        agent.add_skill("datetime")
        agent.add_skill("math")
        
        # Premium skills for premium users
        if tier == 'premium':
            agent.add_skill("web_search", {
                "num_results": 5,
                "delay": 0.5
            })
        elif tier == 'basic':
            agent.add_skill("web_search", {
                "num_results": 1,
                "delay": 0
            })
```

### Best Practices

1. **Choose appropriate parameters**: Configure skills for your use case
   ```python
   # For speed (customer service)
   agent.add_skill("web_search", {"num_results": 1, "delay": 0})
   
   # For research (detailed analysis)
   agent.add_skill("web_search", {"num_results": 5, "delay": 1.0})
   ```

2. **Handle missing dependencies gracefully**:
   ```python
   try:
       agent.add_skill("web_search")
   except ValueError as e:
       self.logger.warning(f"Web search unavailable: {e}")
       # Continue without web search capability
   ```

3. **Document your custom skills**: Include clear descriptions and parameter documentation

4. **Test skills in isolation**: Create simple test scripts to verify skill functionality

For more detailed information about the skills system architecture and advanced customization, see the [Skills System Overview](/sdks/agents-sdk/skills).


---

## Quickstart

Integrate skills to your agent in a single line!

```python
from signalwire_agents import AgentBase

# Create an agent
agent = AgentBase("My Assistant")

# Add skills with one-liners:
agent.add_skill("web_search")   # Web search capability with default settings
agent.add_skill("datetime")     # Current date/time info  
agent.add_skill("math")         # Mathematical calculations

# Add skills with custom parameters:
agent.add_skill("web_search", {
    "num_results": 3,  # Get 3 search results instead of default 1
    "delay": 0.5       # Add 0.5s delay between requests instead of default 0
})

# Your agent now has all these capabilities automatically
```

## Architecture

The skills system consists of:

### Core Infrastructure
- **`SkillBase`** - Abstract base class for all skills with parameter support
- **`SkillManager`** - Handles loading/unloading and lifecycle management with parameters
- **`AgentBase.add_skill()`** - Simple method to add skills to agents with optional parameters

### Discovery & Registry  
- **`SkillRegistry`** - Auto-discovers skills from the `skills/` directory
- **Auto-discovery** - Skills are found automatically on import
- **Validation** - Checks dependencies and environment variables

### Built-in Skills
- **`web_search`** - Google Custom Search API integration with web scraping
- **`datetime`** - Current date/time information with timezone support
- **`math`** - Basic mathematical calculations

## Examples

### Basic usage
```python
from signalwire_agents import AgentBase

# Create agent and add skills
agent = AgentBase("Assistant", route="/assistant")
agent.add_skill("datetime")
agent.add_skill("math") 
agent.add_skill("web_search")  # Uses defaults: 1 result, no delay

# Start the agent
agent.run()
```

### Skills with custom parameters
```python
from signalwire_agents import AgentBase

# Create agent
agent = AgentBase("Research Assistant", route="/research")

# Add web search optimized for research (more results)
agent.add_skill("web_search", {
    "num_results": 5,   # Get more comprehensive results
    "delay": 1.0        # Be respectful to websites
})

# Add other skills without parameters
agent.add_skill("datetime")
agent.add_skill("math")

# Start the agent
agent.run()
```

### Different parameter configurations
```python
# Speed-optimized for quick responses
agent.add_skill("web_search", {
    "num_results": 1,
    "delay": 0
})

# Comprehensive research mode
agent.add_skill("web_search", {
    "num_results": 5,
    "delay": 1.0
})

# Balanced approach
agent.add_skill("web_search", {
    "num_results": 3,
    "delay": 0.5
})
```

### Check available skills
```python
from signalwire_agents.skills.registry import skill_registry

# List all discovered skills
for skill in skill_registry.list_skills():
    print(f"- {skill['name']}: {skill['description']}")
    if skill['required_env_vars']:
        print(f"  Requires: {', '.join(skill['required_env_vars'])}")
```

### Runtime skill management
```python
agent = AgentBase("Dynamic Agent")

# Add skills with different configurations
agent.add_skill("math")
agent.add_skill("datetime")
agent.add_skill("web_search", {"num_results": 2, "delay": 0.3})

# Check what's loaded
print("Loaded skills:", agent.list_skills())

# Remove a skill
agent.remove_skill("math")

# Check if specific skill is loaded
if agent.has_skill("datetime"):
    print("Date/time capabilities available")
```

## Quickstart

1. **Install dependencies:**
   ```bash
   pip install pytz beautifulsoup4 requests
   ```

2. **Run the demo:**
   ```bash
   python examples/skills_demo.py
   ```

3. **For web search, set environment variables:**
   ```bash
   export GOOGLE_SEARCH_API_KEY="your_api_key"
   export GOOGLE_SEARCH_ENGINE_ID="your_engine_id"
   ```

## Testing

Test the skills system with parameters:

```bash
python3 -c "
from signalwire_agents import AgentBase
from signalwire_agents.skills.registry import skill_registry

# Show discovered skills
print('Available skills:', [s['name'] for s in skill_registry.list_skills()])

# Create agent and load skills with parameters
agent = AgentBase('Test', route='/test')
agent.add_skill('datetime')
agent.add_skill('math')
agent.add_skill('web_search', {'num_results': 2, 'delay': 0.5})

print('Loaded skills:', agent.list_skills())
print('Skills system with parameters working!')
"
```
