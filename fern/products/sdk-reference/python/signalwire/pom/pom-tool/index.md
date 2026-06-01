---
slug: "/reference/python/signalwire/pom/pom-tool"
title: "pom_tool"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.pom.pom_tool"
  parent: "signalwire.pom"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom_tool.py"
---
# `pom_tool`

POM Tool - Command line utility for working with Prompt Object Model files

> \[!NOTE]
> pom\_tool \<input\_file> \[--output=<format>] \[--outfile=<file>] \[--merge\_pom="<section name>:<filename>"]
> pom\_tool (-h | --help)

> \[!NOTE]
> -h --help           Show this help message
> \--output=<format>   Output format: md, xml, json, yaml \[default: md]
> \--outfile=<file>    Output file (if not specified, prints to stdout)
> \--merge\_pom=<arg>   Merge another POM into a section: "<section name>:<filename>"

## Signature

```python
module pom_tool
```

## Functions

- [`detect_file_format`](/reference/python/signalwire/pom/pom-tool/detect-file-format) — Detect if the file is JSON or YAML based on extension and content.
- [`load_pom`](/reference/python/signalwire/pom/pom-tool/load-pom) — Load a POM from a file, auto-detecting the format.
- [`main`](/reference/python/signalwire/pom/pom-tool/main) — Main entry point for the POM tool.
- [`render_pom`](/reference/python/signalwire/pom/pom-tool/render-pom) — Render the POM in the specified format.

## Source

[`/src/signalwire/signalwire/pom/pom_tool.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom_tool.py)
