---
slug: "/reference/python/signalwire/cli/core/argparse-helpers/custom-argument-parser"
title: "CustomArgumentParser"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.cli.core.argparse_helpers.CustomArgumentParser"
  parent: "signalwire.cli.core.argparse_helpers"
  module: "signalwire.cli.core.argparse_helpers"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/argparse_helpers.py"
---
# `CustomArgumentParser`

Custom ArgumentParser with better error handling

## Signature

```python
class CustomArgumentParser(argparse.ArgumentParser)
```

## Inheritance

**Extends:** `argparse.ArgumentParser`

## Methods

- [`__init__`](/reference/python/signalwire/cli/core/argparse-helpers/custom-argument-parser/init)
- [`error`](/reference/python/signalwire/cli/core/argparse-helpers/custom-argument-parser/error) — Override error method to provide user-friendly error messages
- [`parse_args`](/reference/python/signalwire/cli/core/argparse-helpers/custom-argument-parser/parse-args) — Override parse\_args to provide custom error handling for missing arguments
- [`print_usage`](/reference/python/signalwire/cli/core/argparse-helpers/custom-argument-parser/print-usage) — Override print\_usage to suppress output when we want custom error handling

## Source

[`/src/signalwire/signalwire/cli/core/argparse_helpers.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/argparse_helpers.py)

Line 20.
