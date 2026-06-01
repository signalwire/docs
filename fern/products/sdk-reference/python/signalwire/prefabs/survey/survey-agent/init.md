---
slug: "/reference/python/signalwire/prefabs/survey/survey-agent/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.prefabs.survey.SurveyAgent.__init__"
  parent: "signalwire.prefabs.survey.SurveyAgent"
  module: "signalwire.prefabs.survey"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/survey.py"
---
# `__init__`

Initialize a survey agent

## Signature

```python
__init__(
    survey_name: str,
    questions: List[Dict[str, Any]],
    introduction: Optional[str] = None,
    conclusion: Optional[str] = None,
    brand_name: Optional[str] = None,
    max_retries: int = 2,
    name: str = 'survey',
    route: str = '/survey',
    **kwargs = {}
)
```

## Parameters

| Name           | Type                   | Required | Default     | Description                                       |
| -------------- | ---------------------- | -------- | ----------- | ------------------------------------------------- |
| `survey_name`  | `str`                  | yes      | —           | Name of the survey                                |
| `questions`    | `List[Dict[str, Any]]` | yes      | —           | List of question objects with the following keys: |
| `introduction` | `Optional[str]`        | no       | `None`      | Optional custom introduction message              |
| `conclusion`   | `Optional[str]`        | no       | `None`      | Optional custom conclusion message                |
| `brand_name`   | `Optional[str]`        | no       | `None`      | Optional brand or company name                    |
| `max_retries`  | `int`                  | no       | `2`         | Maximum number of times to retry invalid answers  |
| `name`         | `str`                  | no       | `'survey'`  | Name for the agent (default: "survey")            |
| `route`        | `str`                  | no       | `'/survey'` | HTTP route for the agent (default: "/survey")     |
| `...kwargs`    | —                      | no       | `{}`        | —                                                 |

## Source

[`/src/signalwire/signalwire/prefabs/survey.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/survey.py)

Line 55.
