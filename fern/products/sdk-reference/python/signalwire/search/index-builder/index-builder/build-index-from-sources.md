---
slug: "/reference/python/signalwire/search/index-builder/index-builder/build-index-from-sources"
title: "build_index_from_sources"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.index_builder.IndexBuilder.build_index_from_sources"
  parent: "signalwire.search.index_builder.IndexBuilder"
  module: "signalwire.search.index_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/index_builder.py"
---
# `build_index_from_sources`

Build complete search index from multiple sources (files and directories)

## Signature

```python
build_index_from_sources(
    sources: List[Path],
    output_file: str,
    file_types: List[str],
    exclude_patterns: Optional[List[str]] = None,
    languages: List[str] = None,
    tags: Optional[List[str]] = None,
    overwrite: bool = False
)
```

## Parameters

| Name               | Type                  | Required | Default | Description                                        |
| ------------------ | --------------------- | -------- | ------- | -------------------------------------------------- |
| `sources`          | `List[Path]`          | yes      | —       | List of Path objects (files and/or directories)    |
| `output_file`      | `str`                 | yes      | —       | Output .swsearch file path                         |
| `file_types`       | `List[str]`           | yes      | —       | List of file extensions to include for directories |
| `exclude_patterns` | `Optional[List[str]]` | no       | `None`  | Glob patterns to exclude                           |
| `languages`        | `List[str]`           | no       | `None`  | List of languages to support                       |
| `tags`             | `Optional[List[str]]` | no       | `None`  | Global tags to add to all chunks                   |
| `overwrite`        | `bool`                | no       | `False` | —                                                  |

## Source

[`/src/signalwire/signalwire/search/index_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/index_builder.py)

Line 164.
