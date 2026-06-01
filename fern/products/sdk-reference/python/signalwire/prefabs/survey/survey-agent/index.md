---
slug: "/reference/python/signalwire/prefabs/survey/survey-agent"
title: "SurveyAgent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.prefabs.survey.SurveyAgent"
  parent: "signalwire.prefabs.survey"
  module: "signalwire.prefabs.survey"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/survey.py"
---
# `SurveyAgent`

A prefab agent designed to conduct automated surveys with users.

This agent will:

1. Introduce the survey purpose and structure
2. Ask predefined questions in sequence
3. Collect and validate responses
4. Provide a summary of collected responses

> \[!NOTE]
> agent = SurveyAgent(
> survey\_name="Customer Satisfaction Survey",
> introduction="We'd like to get your feedback on your recent experience.",
> questions=\[
> {
> "id": "satisfaction",
> "text": "How satisfied were you with our service?",
> "type": "rating",
> "scale": 5,
> "required": True
> },
> {
> "id": "comments",
> "text": "Do you have any additional comments?",
> "type": "open\_ended",
> "required": False
> }
> ]
> )

## Signature

```python
class SurveyAgent(AgentBase)
```

## Inheritance

**Extends:** [AgentBase](/reference/python/signalwire/core/agent-base/agent-base)

## Properties

| Name           | Type           | Required | Default | Description |
| -------------- | -------------- | -------- | ------- | ----------- |
| `brand_name`   | `brand_name`   | yes      | —       | —           |
| `conclusion`   | `conclusion`   | yes      | —       | —           |
| `introduction` | `introduction` | yes      | —       | —           |
| `max_retries`  | `max_retries`  | yes      | —       | —           |
| `questions`    | `questions`    | yes      | —       | —           |
| `survey_name`  | `survey_name`  | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/prefabs/survey/survey-agent/init) — Initialize a survey agent
- [`log_response`](/reference/python/signalwire/prefabs/survey/survey-agent/log-response) — Log a validated response to a survey question
- [`on_summary`](/reference/python/signalwire/prefabs/survey/survey-agent/on-summary) — Process the survey results summary
- [`validate_response`](/reference/python/signalwire/prefabs/survey/survey-agent/validate-response) — Validate if a response meets the requirements for a specific question

## Source

[`/src/signalwire/signalwire/prefabs/survey.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/survey.py)

Line 23.
