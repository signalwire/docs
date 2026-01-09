# TypeSpec to OpenAPI Conversion Guide

This guide provides comprehensive guidelines for converting OpenAPI specifications to TypeSpec equivalents, based on the patterns observed in the SignalWire REST API specifications.

## Directory Structure Best Practices

### Standard API Directory Layout

```
specs/signalwire-rest/
├── {api-name}/
│   ├── _spec_.yaml              # OpenAPI metadata/config
│   ├── main.tsp                 # Main API definition
│   ├── {resource}/
│   │   ├── main.tsp             # Resource endpoints
│   │   └── models/
│   │       ├── core.tsp         # Core data models
│   │       ├── requests.tsp     # Request models
│   │       ├── responses.tsp    # Response models
│   │       ├── errors.tsp       # Error models
│   │       ├── enums.tsp        # Enumeration types
│   │       └── examples.tsp     # Example data/constants
│   └── tsp-output/
│       └── @typespec/
│           └── openapi3/
│               └── openapi.yaml # Generated OpenAPI spec
├── types/                       # Shared types across APIs
│   ├── main.tsp
│   ├── status-codes/
│   ├── scalar-types/
│   └── composite-types/
└── tspconfig.yaml              # TypeSpec configuration
```

### Key Principles

1. **Separation of Concerns**: Each file has a specific purpose
2. **Hierarchical Organization**: Resources are organized in logical hierarchies
3. **Shared Types**: Common types are centralized in the `types/` directory
4. **Generated Output**: TypeSpec compiles to OpenAPI in `tsp-output/` directory

## File Organization Patterns

### Main API File (`main.tsp`)

The main API file should contain:
- Service-level decorators and metadata
- Server configuration
- Authentication setup
- Imports of all resource modules
- Root namespace definition

```typescript
import "@typespec/http";
import "../types";
import "./calls";

using TypeSpec.Http;
using Types.StatusCodes;

@service(#{
  title: "Calling API",
})
@server("https://{space_name}.signalwire.com/api/calling", "Endpoint", {
  space_name: string = "{Your_Space_Name}";
})
@useAuth(BasicAuth)
@doc("API to create/manage SignalWire's Calls.")
namespace CallingAPI;
```

### Resource Main Files

Resource-specific main files should:
- Define the resource's route
- Import all required models
- Define the interface with operations
- Group related operations logically

```typescript
import "@typespec/http";
import "../../types";
import "./models/requests.tsp";
import "./models/responses.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/calls")
namespace CallingAPI.Calls {
    @tag("Calls")
    @friendlyName("Calls")
    interface Calls {
        @summary("Create a Call")
        @doc("Creates a new call with the specified parameters.")
        create(@body request: CallCreateRequest):
        { @statusCode statusCode: 201; @body call: CallResponse; } |
        StatusCode401 |
        StatusCode404 |
        CallCreate422Error;
    }
}
```

## Model Definition Guidelines

### Core Models (`core.tsp`)

Define the fundamental data structures:

```typescript
model Call {
    @doc("The unique identifier of the call.")
    @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
    id: string;

    @doc("The origin number or address.")
    @example("sip:from-sip@example.com")
    from: string;

    @doc("The destination number or address.")
    @example("sip:to-sip@example.com")
    to: string;

    @doc("The status of the call.")
    @example("queued")
    status: "answered" | "queued" | "initiated" | "ringing" | "ending" | "ended";
}
```

### Request Models (`requests.tsp`)

Define request payloads and parameters:

```typescript
@summary("Create call")
model CallCreateRequest {
    @doc("The `dial` command is used to create a new call.")
    @example("dial")
    command: "dial";

    @doc("Parameters for the dial command.")
    params: CallCreateRequestParams;
}

model CallCreateRequestParams {
    @doc("The address that initiated the call.")
    @example("sip:from-sip@example.com")
    from: string;

    @doc("The address that received the call.")
    @example("sip:to-sip@example.com")
    to: string;
}
```

### Response Models (`responses.tsp`)

Define response structures:

```typescript
import "./core.tsp";
import "../../../types/status-codes";

using Types.StatusCodes;

model CallResponse {...Call}

@example(#{
    errors: #[#{
      type: "validation_error",
      code: "missing_required_parameter",
      message: "url must be a valid http or https url",
      attribute: "url"
    }]
})
model CallCreate422Error is Types.StatusCodes.StatusCode422;
```

## API Interface Structure

### HTTP Method Decorators

Use appropriate HTTP method decorators:

```typescript
interface ResourceOperations {
    // GET operations (default)
    list(): ResourceListResponse;
    
    // POST operations
    @post create(@body request: CreateRequest): CreateResponse;
    
    // PUT operations
    @put update(@body request: UpdateRequest): UpdateResponse;
    
    // PATCH operations
    @patch(#{ implicitOptionality: true }) 
    partialUpdate(@body request: PartialUpdateRequest): UpdateResponse;
    
    // DELETE operations
    @delete delete(@path id: string): { @statusCode statusCode: 204; };
}
```

### Path Parameters

Define path parameters using the `@path` decorator:

```typescript
model ResourcePathID {
    @doc("Unique ID of the resource.")
    @path
    id: uuid;
}

interface ResourceOperations {
    read(...ResourcePathID): ResourceResponse;
    update(...ResourcePathID, @body request: UpdateRequest): ResourceResponse;
    delete(...ResourcePathID): { @statusCode statusCode: 204; };
}
```

### Status Code Handling

Use union types for multiple response possibilities:

```typescript
interface ResourceOperations {
    create(@body request: CreateRequest):
        { @statusCode statusCode: 201; @body resource: ResourceResponse; } |
        StatusCode401 |
        StatusCode404 |
        ResourceCreate422Error;
}
```

### Response Format Patterns

#### Direct Array Responses
For endpoints that return arrays directly (not wrapped in an object):

```typescript
// Option 1: Using the array type directly
list(): ResourceResponse[] | StatusCode401 | StatusCode404;

// Option 2: Using an alias (defined in responses.tsp)
// In responses.tsp:
alias ResourceListResponse = ResourceResponse[];
// In main.tsp:
list(): ResourceListResponse | StatusCode401 | StatusCode404;
```

#### Object Responses with Explicit Status
For endpoints that return single objects or need explicit status codes:

```typescript
// Single object with status code
read(@path id: string):
    { @statusCode statusCode: 200; @body resource: ResourceResponse; } |
    StatusCode401 |
    StatusCode404;

// Creating a resource (201 status)
create(@body request: CreateRequest):
    { @statusCode statusCode: 201; @body resource: ResourceResponse; } |
    StatusCode401 |
    StatusCode422;
```

#### Wrapped Array Responses
For endpoints that return arrays wrapped in an object (e.g., with pagination):

```typescript
// In responses.tsp:
model ResourceListResponse {
    data: ResourceResponse[];
    links?: PaginationLinks;
}

// In main.tsp:
list(): ResourceListResponse | StatusCode401 | StatusCode404;
```

#### No Content Responses
For DELETE operations or other endpoints with no response body:

```typescript
delete(@path id: string):
    { @statusCode statusCode: 204; } |
    StatusCode401 |
    StatusCode404;
```

## Import and Namespace Management

### Import Hierarchy

Follow this import pattern:

```typescript
// 1. TypeSpec core imports
import "@typespec/http";
import "@typespec/openapi3";

// 2. Shared types imports
import "../../types";

// 3. Local model imports
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";

// 4. Using statements
using TypeSpec.Http;
using Types.StatusCodes;
```

### Namespace Structure

Organize namespaces hierarchically:

```typescript
// Root namespace
namespace CallingAPI;

// Resource namespace
namespace CallingAPI.Calls;

// Shared types namespace
namespace Types.StatusCodes;
```

## Documentation Standards

### Model Documentation

Every model property should have:
- `@doc` decorator with clear description
- `@example` decorator with realistic example
- `@summary` decorator for complex models

```typescript
model User {
    @doc("The unique identifier for the user.")
    @example("user_123456")
    id: string;

    @doc("The user's email address.")
    @example("user@example.com")
    email: string;

    @doc("The user's current status.")
    @example("active")
    status: "active" | "inactive" | "pending";
}
```

### Operation Documentation

Operations should include:
- `@summary` with concise description
- `@doc` with detailed explanation
- `@opExample` for complex operations with examples

```typescript
@summary("Create a new user")
@doc("Creates a new user account with the provided information.")
@opExample(#{
    parameters: createUserExample
}, #{
    title: "Create basic user",
    description: "Create a new user with minimal required fields"
})
create(@body request: CreateUserRequest): CreateUserResponse;
```

## Error Handling Patterns

### Standard Error Models

Define consistent error structures:

```typescript
namespace Types.StatusCodes {
    @error
    model StatusCode404 {
        @statusCode statusCode: 404;
        @bodyRoot error: "Not Found";
    }

    @error
    model StatusCode401 {
        @statusCode statusCode: 401;
        @bodyRoot error: "Unauthorized";
    }

    model StatusCode422Error {
        @doc("Error type.")
        type: string;

        @doc("Error code.")
        code: string;

        @doc("Error message.")
        message: string;

        @doc("Request parameter associated with this error.")
        attribute: string;
    }

    @error
    model StatusCode422 {
        @statusCode statusCode: 422;
        errors: StatusCode422Error[];
    }
}
```

### Error Response Patterns

Include appropriate error responses for each operation:

```typescript
interface Operations {
    create(@body request: CreateRequest):
        { @statusCode statusCode: 201; @body resource: ResourceResponse; } |
        StatusCode401 |    // Unauthorized
        StatusCode404 |    // Not Found
        StatusCode422;     // Validation Error
}
```

## Model Composition Patterns

### Inheritance and Composition

Use TypeSpec's composition features effectively:

```typescript
// Base model
model BaseResource {
    @doc("The unique identifier.")
    id: string;

    @doc("Creation timestamp.")
    created_at: string;

    @doc("Last update timestamp.")
    updated_at: string;
}

// Extended model using spread operator
model User {
    ...BaseResource;
    
    @doc("The user's email address.")
    email: string;
    
    @doc("The user's display name.")
    display_name: string;
}

// Alternative using inheritance
model User is BaseResource {
    @doc("The user's email address.")
    email: string;
}
```

### Union Types

Use union types for flexible request/response structures:

```typescript
// Discriminated union for different request types
@oneOf
union CreateRequest {
    CreateWithURL: CreateRequestWithURL;
    CreateWithData: CreateRequestWithData;
}

// Simple union for status values
model Resource {
    status: "active" | "inactive" | "pending";
}
```

## Common Pitfalls and Solutions

### 1. Missing Import Statements

**Problem**: TypeSpec compilation fails due to missing imports.

**Solution**: Always import required dependencies:

```typescript
import "@typespec/http";        // For HTTP decorators
import "@typespec/openapi3";    // For OpenAPI-specific features
import "../types";              // For shared types
```

### 2. Inconsistent Namespace Usage

**Problem**: Models and operations not properly namespaced.

**Solution**: Use consistent namespace hierarchy:

```typescript
namespace API.Resource {
    model ResourceModel { ... }
    
    interface ResourceOperations { ... }
}
```

### 3. Missing Documentation

**Problem**: Generated OpenAPI lacks proper documentation.

**Solution**: Add comprehensive documentation:

```typescript
@doc("Clear description of what this model represents")
@example("realistic_example_value")
model MyModel {
    @doc("Description of this property")
    @example("example_value")
    property: string;
}
```

### 4. Incorrect Status Code Usage

**Problem**: Wrong HTTP status codes for operations.

**Solution**: Use semantically correct status codes:

```typescript
// Correct
create(): { @statusCode statusCode: 201; @body resource: Resource; }  // Created
update(): { @statusCode statusCode: 200; @body resource: Resource; }  // OK
delete(): { @statusCode statusCode: 204; }                            // No Content

// Incorrect
create(): { @statusCode statusCode: 200; @body resource: Resource; }  // Should be 201
```

### 5. Poor Error Handling

**Problem**: Missing or inconsistent error responses.

**Solution**: Include all relevant error responses:

```typescript
interface Operations {
    create(@body request: CreateRequest):
        { @statusCode statusCode: 201; @body resource: Resource; } |
        StatusCode400 |  // Bad Request
        StatusCode401 |  // Unauthorized
        StatusCode422;   // Validation Error
}
```

## TypeSpec to OpenAPI Compilation

### Configuration

Ensure proper TypeSpec configuration in `tspconfig.yaml`:

```yaml
extends: "@typespec/openapi3/all"
options:
  "@typespec/openapi3":
    output-file: "openapi.yaml"
    emitters:
      - "@typespec/openapi3"
```

### Compilation Process

1. **Write TypeSpec**: Create `.tsp` files following the patterns above
2. **Compile**: Run TypeSpec compiler to generate OpenAPI
3. **Validate**: Check generated OpenAPI for correctness
4. **Iterate**: Refine TypeSpec based on output

### Best Practices for OpenAPI Generation

1. **Use Semantic Decorators**: Prefer `@doc`, `@summary`, `@example` over comments
2. **Structure for Readability**: Organize models and operations logically
3. **Validate Examples**: Ensure examples are realistic and valid
4. **Test Generated Output**: Verify the generated OpenAPI meets requirements

## Quick Reference Templates

### Basic API Structure

```typescript
import "@typespec/http";
import "../types";
import "./resource";

using TypeSpec.Http;
using Types.StatusCodes;

@service(#{
  title: "My API",
})
@server("https://api.example.com", "API Endpoint")
@useAuth(BasicAuth)
@doc("Description of my API")
namespace MyAPI;
```

### Basic Resource Interface

```typescript
@route("/resources")
namespace MyAPI.Resources {
    @tag("Resources")
    @friendlyName("Resources")
    interface Resources {
        @summary("List resources")
        list(): ResourceListResponse | StatusCode401 | StatusCode404;

        @summary("Create resource")
        @post create(@body request: CreateResourceRequest):
            { @statusCode statusCode: 201; @body resource: ResourceResponse; } |
            StatusCode401 | StatusCode422;

        @summary("Get resource")
        read(@path id: string):
            { @statusCode statusCode: 200; @body resource: ResourceResponse; } |
            StatusCode401 | StatusCode404;

        @summary("Update resource")
        @put update(@path id: string, @body request: UpdateResourceRequest):
            { @statusCode statusCode: 200; @body resource: ResourceResponse; } |
            StatusCode401 | StatusCode404 | StatusCode422;

        @summary("Delete resource")
        @delete delete(@path id: string):
            { @statusCode statusCode: 204; } |
            StatusCode401 | StatusCode404;
    }
}
```

This guide provides the foundation for converting OpenAPI specifications to TypeSpec equivalents while maintaining consistency with the established patterns in the SignalWire documentation project.