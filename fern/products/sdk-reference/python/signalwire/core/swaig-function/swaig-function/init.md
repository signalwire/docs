---
slug: "/reference/python/signalwire/core/swaig-function/swaig-function/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swaig_function.SWAIGFunction.__init__"
  parent: "signalwire.core.swaig_function.SWAIGFunction"
  module: "signalwire.core.swaig_function"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swaig_function.py"
---
# `__init__`

Initialize a new SWAIG function.

## Signature

```python
__init__(
    name: str,
    handler: Callable,
    description: str,
    parameters: Dict[str, Dict] = None,
    secure: bool = False,
    fillers: Optional[Dict[str, List[str]]] = None,
    wait_file: Optional[str] = None,
    wait_file_loops: Optional[int] = None,
    webhook_url: Optional[str] = None,
    required: Optional[List[str]] = None,
    is_typed_handler: bool = False,
    **extra_swaig_fields = {}
)
```

## Parameters

| Name                    | Type                             | Required | Default | Description                                                                                                                                                                                                                                                                                      |
| ----------------------- | -------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `name`                  | `str`                            | yes      | —       | Function name. Becomes the `name` field in the OpenAI tool schema sent to the model — what the model emits when it decides to call this tool.                                                                                                                                                    |
| `handler`               | `Callable`                       | yes      | —       | Python callable invoked when the model calls this tool.                                                                                                                                                                                                                                          |
| `description`           | `str`                            | yes      | —       | LLM-facing description. The model reads this on every turn to decide whether to call the tool. Be specific about WHEN to use it and what makes it the right choice over sibling tools — vague descriptions are the most common cause of "model has the right tool but doesn't call it" failures. |
| `parameters`            | `Dict[str, Dict]`                | no       | `None`  | JSON Schema for the arguments. Per-property `description` strings inside the schema are also LLM-facing — write them as instructions to the model on how to fill in each argument.                                                                                                               |
| `secure`                | `bool`                           | no       | `False` | Whether this function requires SWAIG token validation.                                                                                                                                                                                                                                           |
| `fillers`               | `Optional[Dict[str, List[str]]]` | no       | `None`  | Optional dictionary of filler phrases by language code (deprecated, use wait\_file).                                                                                                                                                                                                             |
| `wait_file`             | `Optional[str]`                  | no       | `None`  | Optional URL to audio file to play while function executes.                                                                                                                                                                                                                                      |
| `wait_file_loops`       | `Optional[int]`                  | no       | `None`  | Optional number of times to loop the wait\_file.                                                                                                                                                                                                                                                 |
| `webhook_url`           | `Optional[str]`                  | no       | `None`  | Optional external webhook URL to use instead of local handling.                                                                                                                                                                                                                                  |
| `required`              | `Optional[List[str]]`            | no       | `None`  | Optional list of required parameter names.                                                                                                                                                                                                                                                       |
| `is_typed_handler`      | `bool`                           | no       | `False` | Whether the handler uses type-hinted parameters (auto-wrapped).                                                                                                                                                                                                                                  |
| `...extra_swaig_fields` | —                                | no       | `{}`    | —                                                                                                                                                                                                                                                                                                |

## Source

[`/src/signalwire/signalwire/core/swaig_function.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swaig_function.py)

Line 44.
