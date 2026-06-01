---
slug: "/reference/python/signalwire/cli/core/argparse-helpers/parse-function-arguments"
title: "parse_function_arguments"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.core.argparse_helpers.parse_function_arguments"
  parent: "signalwire.cli.core.argparse_helpers"
  module: "signalwire.cli.core.argparse_helpers"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/argparse_helpers.py"
---
# `parse_function_arguments`

Parse function arguments from command line with type coercion based on schema

## Signature

```python
parse_function_arguments(
    function_args_list: List[str],
    func_schema: Dict[str, Any]
) -> Dict[str, Any]
```

## Parameters

| Name                 | Type             | Required | Default | Description                                 |
| -------------------- | ---------------- | -------- | ------- | ------------------------------------------- |
| `function_args_list` | `List[str]`      | yes      | —       | List of command line arguments after --args |
| `func_schema`        | `Dict[str, Any]` | yes      | —       | Function schema with parameter definitions  |

## Returns

`Dict[str, Any]` — Dictionary of parsed function arguments

## Source

[`/src/signalwire/signalwire/cli/core/argparse_helpers.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/argparse_helpers.py)

Line 82.
