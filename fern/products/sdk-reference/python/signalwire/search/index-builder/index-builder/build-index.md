---
slug: "/reference/python/signalwire/search/index-builder/index-builder/build-index"
title: "build_index"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.index_builder.IndexBuilder.build_index"
  parent: "signalwire.search.index_builder.IndexBuilder"
  module: "signalwire.search.index_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/index_builder.py"
---
# `build_index`

Build complete search index from a single directory

## Signature

```python
build_index(
    source_dir: str,
    output_file: str,
    file_types: List[str],
    exclude_patterns: Optional[List[str]] = None,
    languages: List[str] = None,
    tags: Optional[List[str]] = None
)
```

## Parameters

| Name               | Type                  | Required | Default | Description                        |
| ------------------ | --------------------- | -------- | ------- | ---------------------------------- |
| `source_dir`       | `str`                 | yes      | —       | Directory to scan for documents    |
| `output_file`      | `str`                 | yes      | —       | Output .swsearch file path         |
| `file_types`       | `List[str]`           | yes      | —       | List of file extensions to include |
| `exclude_patterns` | `Optional[List[str]]` | no       | `None`  | Glob patterns to exclude           |
| `languages`        | `List[str]`           | no       | `None`  | List of languages to support       |
| `tags`             | `Optional[List[str]]` | no       | `None`  | Global tags to add to all chunks   |

## Source

[`/src/signalwire/signalwire/search/index_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/index_builder.py)

Line 283.
