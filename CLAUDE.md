# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the SignalWire Fern documentation configuration repository. It uses [Fern](https://buildwithfern.com/) to generate API documentation and SDKs from TypeSpec specifications. The project manages API specifications for SignalWire's communication services (Calling, Voice, Message, Fax, Chat, Video, etc.) and SWML (SignalWire Markup Language) schema definitions.

## Common Commands

This project uses **yarn workspaces**. Always run `yarn install` from the root.

```bash
# Install all dependencies (run from root)
yarn install

# Development server (runs fern check first)
yarn start

# Build documentation preview
yarn build

# Validate Fern configuration
yarn fern-check

# Check external links in documentation (requires --sitemap)
yarn check-links --sitemap https://signalwire.docs.buildwithfern.com/sitemap.xml

# Build TypeSpec specifications
yarn build:specs              # Build all REST API specs
yarn build:specs:all          # Build REST APIs + SWML schema

# Format TypeSpec files
yarn format:specs
yarn format:specs:check
```

## Architecture

### Directory Structure

- **fern/** - Fern configuration and generated outputs
  - `fern.config.json` - Organization and version settings
  - `docs.yml` - Main documentation configuration (instances, styling, products)
  - `apis/` - Generated OpenAPI specs organized by API (Calling, Chat, Fabric, etc.)
  - `products/` - Product navigation configuration
  - `docs/` - Static assets, fonts, and styles

- **specs/** - TypeSpec source files for API definitions
  - `signalwire-rest/` - REST API specifications using TypeSpec HTTP decorators
  - `swml/` - SWML JSON schema specifications
  - `_shared/` - Shared types across specs
  - `compatibility-api/` - Legacy API specs (do not edit directly)

- **scripts/** - Build and utility scripts
  - `check-links.js` - Link checker with GitHub verification (requires `--sitemap` URL)
  - `utils/logger.js` - Shared logging utility

### TypeSpec → OpenAPI → Fern Pipeline

1. API definitions are authored in TypeSpec (`.tsp` files) under `specs/`
2. Running `tsp compile` generates OpenAPI YAML to `fern/apis/{ApiName}/openapi.yaml`
3. Fern reads OpenAPI specs with optional `overrides.yml` and `generators.yml` per API
4. Output configuration in each API's `tspconfig.yaml` determines the destination path

### API Structure Pattern

Each REST API in `specs/signalwire-rest/` follows this pattern:
- `main.tsp` - API metadata, server config, authentication
- `tspconfig.yaml` - Extends root config, specifies output path to `fern/apis/`
- Resource directories with endpoint definitions

Each API in `fern/apis/` contains:
- `openapi.yaml` - Generated from TypeSpec (or copied directly for some APIs)
- `generators.yml` - Fern parsing options and SDK generation settings
- `overrides.yml` - Fern-specific customizations (auth, SDK method names, base paths)

### SWML Schema

The `specs/swml/` directory defines the SignalWire Markup Language JSON schema:
- `main.tsp` - Root SWML object and section definitions
- `Methods/` - Individual SWML method definitions (ai, connect, play, prompt, etc.)
- `Shared/` - Shared types for SWML methods
- Output goes to `specs/swml/tsp-output/@typespec/json-schema/`

### Shared Types

`specs/signalwire-rest/types/` contains reusable TypeSpec types:
- `scalar-types/` - Basic type definitions
- `composite-types/` - Complex type compositions
- `status-codes/` - HTTP status code models

`specs/signalwire-rest/_globally_shared/const.tsp` contains shared constants (server URLs, contact info, license).

## Key Conventions

- TypeSpec files use `@typespec/openapi3` emitter for REST APIs
- TypeSpec files use `@typespec/json-schema` emitter for SWML
- API authentication is Basic Auth with project_id/token
- Fern overrides use `x-fern-*` extensions for SDK customization
- Product navigation is defined in `fern/products/rest-api.yml`
- Instance URL is configured in `fern/docs.yml` (fern reads this automatically)
