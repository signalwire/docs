---
sidebar_position: 4
title: "Datamap"
---

## DataMap

> **Summary**: DataMap provides serverless API integration - define functions that call REST APIs directly from SignalWire's infrastructure without running code on your server.

### When to Use DataMap

| Use Handler Functions When | Use DataMap When |
|----------------------------|------------------|
| Complex business logic | Simple REST API calls |
| Database access needed | No custom logic required |
| Multi-step processing | Want serverless deployment |
| External service integration with custom handling | Pattern-based responses |
| | Variable substitution only |

### DataMap Flow

**DataMap Execution Steps:**

1. **AI decides to call function**
   - Function: `get_weather`
   - Args: `{"city": "Seattle"}`

2. **SignalWire executes DataMap** (no webhook to your server!)
   - `GET https://api.weather.com?city=Seattle`

3. **API response processed**
   - Response: `{"temp": 65, "condition": "cloudy"}`

4. **Output template filled**
   - Result: "Weather in Seattle: 65 degrees, cloudy"

### Basic DataMap

```python
from signalwire_agents import AgentBase
from signalwire_agents.core.data_map import DataMap
from signalwire_agents.core.function_result import SwaigFunctionResult


class WeatherAgent(AgentBase):
    def __init__(self):
        super().__init__(name="weather-agent")
        self.add_language("English", "en-US", "rime.spore")

        # Create DataMap
        weather_dm = (
            DataMap("get_weather")
            .description("Get current weather for a city")
            .parameter("city", "string", "City name", required=True)
            .webhook("GET", "https://api.weather.com/v1/current?key=API_KEY&q=${enc:args.city}")
            .output(SwaigFunctionResult(
                "The weather in ${args.city} is ${response.current.condition.text}, "
                "${response.current.temp_f} degrees Fahrenheit"
            ))
        )

        # Register it
        self.register_swaig_function(weather_dm.to_swaig_function())
```

### Variable Substitution

DataMap supports these variable patterns:

| Pattern | Description |
|---------|-------------|
| `${args.param}` | Function argument value |
| `${enc:args.param}` | URL-encoded argument (use in webhook URLs) |
| `${lc:args.param}` | Lowercase argument value |
| `${fmt_ph:args.phone}` | Format as phone number |
| `${response.field}` | API response field |
| `${response.arr[0]}` | Array element in response |
| `${global_data.key}` | Global session data |
| `${meta_data.key}` | Call metadata |

#### Chained Modifiers

Modifiers are applied right-to-left:

| Pattern | Result |
|---------|--------|
| `${enc:lc:args.param}` | First lowercase, then URL encode |
| `${lc:enc:args.param}` | First URL encode, then lowercase |

#### Examples

| Pattern | Result |
|---------|--------|
| `${args.city}` | "Seattle" (in body/output) |
| `${enc:args.city}` | "Seattle" URL-encoded (in URLs) |
| `${lc:args.city}` | "seattle" (lowercase) |
| `${enc:lc:args.city}` | "seattle" lowercased then URL-encoded |
| `${fmt_ph:args.phone}` | "+1 (555) 123-4567" |
| `${response.temp}` | "65" |
| `${response.items[0].name}` | "First item" |
| `${global_data.user_id}` | "user123" |

### DataMap Builder Methods

#### description() / purpose()

Set the function description:

```python
DataMap("my_function")
    .description("Look up product information by SKU")
```

#### parameter()

Add a function parameter:

```python
.parameter("sku", "string", "Product SKU code", required=True)
.parameter("include_price", "boolean", "Include pricing info", required=False)
.parameter("category", "string", "Filter by category", enum=["electronics", "clothing", "food"])
```

#### webhook()

Add an API call:

```python
## GET request
.webhook("GET", "https://api.example.com/products?sku=${enc:args.sku}")

## POST request
.webhook("POST", "https://api.example.com/search")

## With headers
.webhook("GET", "https://api.example.com/data",
         headers={"Authorization": "Bearer ${global_data.api_key}"})
```

#### body()

Set request body for POST/PUT:

```python
.webhook("POST", "https://api.example.com/search")
.body({
    "query": "${args.search_term}",
    "limit": 5
})
```

#### output()

Set the response for a webhook:

```python
.output(SwaigFunctionResult(
    "Found product: ${response.name}. Price: $${response.price}"
))
```

#### fallback_output()

Set fallback if all webhooks fail:

```python
.fallback_output(SwaigFunctionResult(
    "Sorry, the service is currently unavailable"
))
```

### Complete Example

```python
#!/usr/bin/env python3
## weather_datamap_agent.py - Weather agent using DataMap
from signalwire_agents import AgentBase
from signalwire_agents.core.data_map import DataMap
from signalwire_agents.core.function_result import SwaigFunctionResult


class WeatherAgent(AgentBase):
    def __init__(self):
        super().__init__(name="weather-agent")
        self.add_language("English", "en-US", "rime.spore")

        self.prompt_add_section("Role", "You help users check the weather.")

        weather_dm = (
            DataMap("get_weather")
            .description("Get current weather conditions for a city")
            .parameter("city", "string", "City name", required=True)
            .webhook(
                "GET",
                "https://api.weatherapi.com/v1/current.json"
                "?key=YOUR_API_KEY&q=${enc:args.city}"
            )
            .output(SwaigFunctionResult(
                "Current weather in ${args.city}: "
                "${response.current.condition.text}, "
                "${response.current.temp_f} degrees Fahrenheit"
            ))
            .fallback_output(SwaigFunctionResult(
                "Sorry, I couldn't get weather data for ${args.city}"
            ))
        )

        self.register_swaig_function(weather_dm.to_swaig_function())


if __name__ == "__main__":
    agent = WeatherAgent()
    agent.run()
```

### DataMap Best Practices

**DO:**
- Use for simple API integrations
- Set fallback_output for resilience
- Use error_keys to detect API errors
- Test with swaig-test before deploying

**DON'T:**
- Put API keys directly in URLs (use secure storage)
- Use for complex multi-step logic
- Forget to handle all error cases
- Assume API responses will always have expected structure


