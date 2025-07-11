---
id: agents-sdk-concepts
slug: /sdks/agents-sdk/composition
title: Agent composition
sidebar_label: Overview
sidebar_position: 0
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

# Compose your agent

The SignalWire AI Agents SDK is built on a modular architecture that combines AI capabilities with web service functionality. 
Each agent is a standalone microservice that can handle requests, maintain state, and interact with external services.

## Core Components

- **Agents**: Self-contained AI personas with web service capabilities
- **SWAIG Functions**: AI-powered tools and functions
- **DataMap System**: Declarative API integration
- **Skills System**: Modular capabilities
- **State Management**: Conversation tracking and persistence

## Architecture Overview

The SignalWire AI Agents SDK provides a Python framework for building, deploying, and managing AI agents as microservices. These agents are self-contained web applications that expose HTTP endpoints to interact with the SignalWire platform. The SDK simplifies the creation of custom AI agents by handling common functionality like HTTP routing, prompt management, and tool execution.

## Core Components

### Class Hierarchy

The SDK is built around a clear class hierarchy:

- **SWMLService**: The foundation class providing SWML document creation and HTTP service capabilities
  - **AgentBase**: Extends SWMLService with AI agent-specific functionality
    - **Custom Agent Classes**: User implementations like SimpleAgent
    - **Prefab Agents**: Ready-to-use agent types for common scenarios

### Key Components

1. **SWML Document Management**
   - Schema validation for SWML documents
   - Dynamic SWML verb creation and validation
   - Document rendering and serving

2. **Prompt Object Model (POM)**
   - Structured format for defining AI prompts
   - Section-based organization (Personality, Goal, Instructions, etc.)
   - Programmatic prompt construction and manipulation

3. **SWAIG Function Framework**
   - Tool definition and registration system
   - Parameter validation using JSON schema
   - Security tokens for function execution
   - Handler registry for function execution

4. **HTTP Routing**
   - FastAPI-based web service
   - Endpoint routing for SWML, SWAIG, and other services
   - Custom routing callbacks for dynamic endpoint handling
   - SIP request routing for voice applications
   - Basic authentication

5. **State Management**
   - Session-based state tracking
   - Persistence options (file system, memory)
   - State lifecycle hooks (startup, hangup)

6. **Prefab Agents**
   - Ready-to-use agent implementations
   - Customizable configurations
   - Extensible designs for common use cases

7. **Skills System**
   - Modular skill architecture for extending agent capabilities
   - Automatic skill discovery from directory structure
   - Parameter-configurable skills for customization
   - Dependency validation (packages and environment variables)
   - Built-in skills (web_search, datetime, math)
