---
slug: "/reference/python/signalwire/skills/native-vector-search/skill/native-vector-search-skill/get-parameter-schema"
title: "get_parameter_schema"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.skills.native_vector_search.skill.NativeVectorSearchSkill.get_parameter_schema"
  parent: "signalwire.skills.native_vector_search.skill.NativeVectorSearchSkill"
  module: "signalwire.skills.native_vector_search.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/native_vector_search/skill.py"
---
# `get_parameter_schema`

Get parameter schema for Native Vector Search skill

This skill supports three modes of operation:

1. Network Mode: Set 'remote\_url' to connect to a remote search server
2. Local pgvector: Set backend='pgvector' with connection\_string and collection\_name
3. Local SQLite: Set 'index\_file' to use a local .swsearch file (default)

**Modifiers:** `classmethod`

## Signature

```python
@classmethod
get_parameter_schema() -> Dict[str, Dict[str, Any]]
```

## Returns

`Dict[str, Dict[str, Any]]`

## Source

[`/src/signalwire/signalwire/skills/native_vector_search/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/native_vector_search/skill.py)

Line 31.
