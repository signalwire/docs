---
slug: "/reference/perl/signal-wire/signal-wire"
title: "SignalWire"
sdk_label: "Perl SDK"
icon: "perl"
lustri:
  auto_generated: true
  kind: "module"
  language: "perl"
  qualified_name: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire.pm"
---
# `SignalWire`

SignalWire is the Perl port of the SignalWire AI Agents SDK. It provides a framework for building, deploying, and managing AI agents as self-contained web applications that expose HTTP endpoints to interact with the SignalWire platform.

**CORE MODULES**

- <SignalWire::Agent::AgentBase> - Base class for all AI agents

- <SignalWire::SWML::Service> - SWML document management

- <SignalWire::SWAIG::FunctionResult> - Tool response builder with actions

- <SignalWire::DataMap> - Declarative server-side API tools

- <SignalWire::Contexts> - Workflow context management

- <SignalWire::Server::AgentServer> - Multi-agent HTTP server

- <SignalWire::Relay::Client> - WebSocket-based call control

- <SignalWire::REST::RestClient> - REST API client

**DATAMAP TOOLS**

Declarative API calls evaluated server-side, no webhook required:

```perl
use SignalWire::DataMap;
```

```perl
my $tool = SignalWire::DataMap->new('get_weather')
    ->description('Get weather for a location')
    ->parameter('city', 'string', 'City name', required => 1)
    ->webhook('GET', 'https://api.weather.com/v1?q=${args.city}')
    ->output(SignalWire::SWAIG::FunctionResult->new(
        'Weather: ${response.temp}°F'
    ));
```

```perl
$agent->register_swaig_function($tool->to_swaig_function);
```

**ENVIRONMENT VARIABLES**

- `SWML_BASIC_AUTH_USER` / `SWML_BASIC_AUTH_PASSWORD` - Override auto-generated basic auth credentials

- `SIGNALWIRE_PROJECT_ID` - Project ID for Relay and REST clients

- `SIGNALWIRE_API_TOKEN` - API token for Relay and REST clients

- `SIGNALWIRE_SPACE` - SignalWire space hostname

**KEY FEATURES**

- **Prompt Object Model** - Structured, section-based prompt management

- **Local Tools** - Define tool handlers that execute in your agent process

- **DataMap Tools** - Server-side API integration without webhooks

- **Skills System** - Modular, reusable capabilities (datetime, math, web search, etc.)

- **Contexts** - Branching workflow management for multi-step conversations

- **Prefabs** - Ready-made agent types (InfoGatherer, Survey, Receptionist, etc.)

- **Multi-Agent Server** - Host multiple agents in a single process

- **RELAY Client** - Real-time WebSocket call control

- **REST Client** - Synchronous HTTP API for SignalWire resources

**LICENSE**

This is free software licensed under the MIT License.

**LOCAL TOOLS**

Handler subroutines that execute within your agent process:

```perl
$agent->define_tool(
    name        => 'lookup_order',
    description => 'Look up an order by ID',
    parameters  => {
        type       => 'object',
        properties => {
            order_id => { type => 'string', description => 'Order ID' },
        },
        required => ['order_id'],
    },
    handler => sub {
        my ($args, $raw) = @_;
        my $order = get_order($args->{order_id});
        return SignalWire::SWAIG::FunctionResult->new(
            "Order status: $order->{status}"
        );
    },
);
```

**SKILLS**

Pre-built capabilities added with a single call:

```perl
$agent->add_skill('datetime');
$agent->add_skill('math');
$agent->add_skill('web_search', {
    api_key          => $ENV{GOOGLE_SEARCH_API_KEY},
    search_engine_id => $ENV{GOOGLE_SEARCH_ENGINE_ID},
});
```

**SOURCE**

<https://github.com/signalwire/signalwire-agents-perl>

**Synopsis**

```perl
use SignalWire::Agent::AgentBase;
```

```perl
my $agent = SignalWire::Agent::AgentBase->new(
    name  => 'my_agent',
    route => '/agent',
    host  => '0.0.0.0',
    port  => 3000,
);
```

```perl
# Build structured prompts
$agent->prompt_add_section('Role', 'You are a helpful assistant.');
$agent->prompt_add_section('Rules',
    body   => ['Be concise', 'Be friendly'],
    bullet => '*',
);
```

```perl
# Define tools with local handlers
$agent->define_tool(
    name        => 'get_time',
    description => 'Get the current time',
    parameters  => { type => 'object', properties => {} },
    handler     => sub {
        my ($args, $raw) = @_;
        require SignalWire::SWAIG::FunctionResult;
        return SignalWire::SWAIG::FunctionResult->new(
            "The time is " . localtime
        );
    },
);
```

```perl
# Add built-in skills
$agent->add_skill('datetime');
$agent->add_skill('math');
```

```perl
# Start the HTTP server
$agent->run();
```

## Signature

```perl
package SignalWire
```

## Methods

- [`add_skill_directory`](/reference/perl/signal-wire/signal-wire/add-skill-directory)
- [`list_skills_with_params`](/reference/perl/signal-wire/signal-wire/list-skills-with-params)
- [`register_skill`](/reference/perl/signal-wire/signal-wire/register-skill)
- [`RestClient`](/reference/perl/signal-wire/signal-wire/rest-client)

## Modules

- [`Contexts`](/reference/perl/signal-wire/signal-wire/contexts)
- [`DataMap`](/reference/perl/signal-wire/signal-wire/data-map)
- [`Logging`](/reference/perl/signal-wire/signal-wire/logging)
- [`Utils`](/reference/perl/signal-wire/signal-wire/utils)

## Source

[`lib/SignalWire.pm`](https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire.pm)

Line 1.
