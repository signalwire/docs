---
slug: "/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main"
title: "main"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/cmd/swaig-test"
  module: "github.com.signalwire.signalwire-go.cmd.swaig-test"
---
# `main`

Command swaig-test is a CLI tool for testing SWAIG agents by exercising their HTTP endpoints. Unlike the Python SDK's swaig-test which loads agent files dynamically, this tool operates against a running agent server.

Usage:

```
swaig-test --url http://user:pass@localhost:3000/ --dump-swml
swaig-test --url http://user:pass@localhost:3000/ --list-tools
swaig-test --url http://user:pass@localhost:3000/ --exec get_weather --param location=London
```

Binary-introspection mode (no HTTP):

```
swaig-test --example swmlservice_swaig_standalone --list-tools
```

In `--example` mode the CLI runs `go run ./examples/<NAME>` with SWAIG\_LIST\_TOOLS=1 set in the subprocess environment. The SDK's Service.Serve() honors that env var by printing the registered tool registry between **SWAIG\_TOOLS\_BEGIN** / **SWAIG\_TOOLS\_END** sentinels and exiting 0 BEFORE binding any port. The CLI captures stdout, slices between the sentinels, parses the JSON, and pretty-prints — no HTTP, no /swaig endpoint, no rendered-SWML walk required.

Simulator support for `--simulate-serverless` mode.

In the Python SDK, `swaig-test` can load an agent from a source file and dispatch invocations through the chosen serverless adapter in-process. Go has no equivalent dynamic-loader for compiled binaries, so the simulator is split in two:

1. A library API (this file) that sets/clears the mode-detection env vars, dispatches a synthetic Lambda Function URL event through pkg/lambda, and restores the outer environment on exit. Tests and in-process callers (e.g. users who embed `swaig-test` in their own test suites) drive the simulator through this API.
2. A flag on the `swaig-test` CLI (see main.go) that validates the requested platform against what the port actually implements and surfaces a clear error for unsupported platforms (Phase 9 of the porting guide). The flag also works with --url: it sets the mode-detection env vars for the duration of the invocation so the server-side URL generation goes through the platform branch.

The simulator mirrors the behaviour of Python's `signalwire/cli/simulation/mock_env.py`:

- Platform preset env vars are applied (AWS\_LAMBDA\_FUNCTION\_NAME etc).
- Conflicting env vars — most importantly SWML\_PROXY\_URL\_BASE — are cleared so platform-specific URL generation is actually exercised.
- The original env is restored on exit, whether the simulated call succeeded, errored, or panicked. Leaking env across simulations would corrupt later tests in the same process.

## Signature

```go
package main
```

## Examples

**Example 1**

```go
swaig-test --url http://user:pass@localhost:3000/ --dump-swml
swaig-test --url http://user:pass@localhost:3000/ --list-tools
swaig-test --url http://user:pass@localhost:3000/ --exec get_weather --param location=London
```

**Example 2**

```go
swaig-test --example swmlservice_swaig_standalone --list-tools
```

**Example 3**

```go
swaig-test --url http://user:pass@localhost:3000/ --dump-swml
swaig-test --url http://user:pass@localhost:3000/ --list-tools
swaig-test --url http://user:pass@localhost:3000/ --exec get_weather --param location=London
```

**Example 4**

```go
swaig-test --example swmlservice_swaig_standalone --list-tools
```

## Functions

- [`SimulateDumpSWMLViaLambda`](/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/simulate-dump-swml-via-lambda) — SimulateDumpSWMLViaLambda activates the Lambda environment, calls the factory to construct the agent (so any env-captured state reflects the simulated Lambda environment), issues a POST to the agent's route through the Lambda adapter, and returns the response body (the SWML document JSON). It's the library-side equivalent of `swaig-test --simulate-serverless lambda --dump-swml`, usable from in-process tests.
- [`SimulateExecToolViaLambda`](/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/simulate-exec-tool-via-lambda) — SimulateExecToolViaLambda activates the Lambda environment, calls the factory to construct the agent (so any env-captured state reflects the simulated Lambda environment), and dispatches a SWAIG tool invocation through the Lambda adapter at `<agentRoute>/swaig`. Returns the raw response body.
- [`SimulateLambdaInvocation`](/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/simulate-lambda-invocation) — SimulateLambdaInvocation runs a single synthetic Lambda Function URL event against the given handler with the Lambda environment active. It does NOT touch env vars itself — call activateLambdaEnv first and defer restore() so the env change has the right scope.

## Type Aliases

- [`HandlerFactory`](/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/handler-factory) — HandlerFactory is a zero-arg function that constructs the http.Handler under test. The factory is called AFTER the simulator has activated the platform env vars, so any env-var-driven state the agent captures at construction (notably SWML\_PROXY\_URL\_BASE, which pkg/swml.Service reads in its constructor) reflects the simulated environment rather than the outer shell.

## Classes

- [`BasicAuth`](/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/basic-auth) — BasicAuth bundles a username/password pair for convenience.
- [`LambdaSimResult`](/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/lambda-sim-result) — LambdaSimResult is the decoded result of one synthetic Lambda invocation. Status is the HTTP status returned by the handler, Body is the response body (already base64-decoded if the adapter marked it so), and Headers mirrors the Lambda response envelope's flattened single-value map.
- [`SimulateLambdaOptions`](/reference/go/github.com/signalwire/signalwire-go/cmd/swaig-test/main/simulate-lambda-options) — SimulateLambdaOptions tunes an in-process Lambda simulation.
