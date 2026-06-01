---
slug: "/reference/python/signalwire/search/document-processor/document-processor/create-chunks"
title: "create_chunks"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.document_processor.DocumentProcessor.create_chunks"
  parent: "signalwire.search.document_processor.DocumentProcessor"
  module: "signalwire.search.document_processor"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/document_processor.py"
---
# `create_chunks`

Create chunks from document content using specified chunking strategy

## Signature

```python
create_chunks(
    content: str,
    filename: str,
    file_type: str
) -> List[Dict[str, Any]]
```

## Parameters

| Name        | Type  | Required | Default | Description                                                               |
| ----------- | ----- | -------- | ------- | ------------------------------------------------------------------------- |
| `content`   | `str` | yes      | —       | Document content (string) - should be the actual content, not a file path |
| `filename`  | `str` | yes      | —       | Name of the file (for metadata)                                           |
| `file_type` | `str` | yes      | —       | File extension/type                                                       |

## Returns

`List[Dict[str, Any]]` — List of chunk dictionaries

## Source

[`/src/signalwire/signalwire/search/document_processor.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/document_processor.py)

Line 128.
