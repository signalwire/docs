---
slug: "/reference/python/signalwire/cli/execution/datamap-exec/execute-datamap-function"
title: "execute_datamap_function"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.execution.datamap_exec.execute_datamap_function"
  parent: "signalwire.cli.execution.datamap_exec"
  module: "signalwire.cli.execution.datamap_exec"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/execution/datamap_exec.py"
---
# `execute_datamap_function`

Execute a DataMap function following the actual DataMap processing pipeline:

1. Expressions (pattern matching)
2. Webhooks (try each sequentially until one succeeds)
3. Foreach (within successful webhook)
4. Output (from successful webhook)
5. Fallback output (if all webhooks fail)

## Signature

```python
execute_datamap_function(
    datamap_config: Dict[str, Any],
    args: Dict[str, Any],
    verbose: bool = False
) -> Dict[str, Any]
```

## Parameters

| Name             | Type             | Required | Default | Description                      |
| ---------------- | ---------------- | -------- | ------- | -------------------------------- |
| `datamap_config` | `Dict[str, Any]` | yes      | —       | DataMap configuration dictionary |
| `args`           | `Dict[str, Any]` | yes      | —       | Function arguments               |
| `verbose`        | `bool`           | no       | `False` | Enable verbose output            |

## Returns

`Dict[str, Any]` — Function result (should be string or dict with 'response' key)

## Source

[`/src/signalwire/signalwire/cli/execution/datamap_exec.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/execution/datamap_exec.py)

Line 124.
