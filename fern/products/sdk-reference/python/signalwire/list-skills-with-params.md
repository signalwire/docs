---
slug: "/reference/python/signalwire/list-skills-with-params"
title: "list_skills_with_params"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.list_skills_with_params"
  parent: "signalwire"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/__init__.py"
---
# `list_skills_with_params`

Get complete schema for all available skills including parameter metadata

This function returns a comprehensive schema for all available skills,
including their metadata and parameter definitions. This is useful for
GUI configuration tools, API documentation, or programmatic skill discovery.

> \[!NOTE]
>
> > > > schema = list\_skills\_with\_params()
> > > > print(schema\['web\_search']\['parameters']\['api\_key'])
> > > > {
> > > > 'type': 'string',
> > > > 'description': 'Google Custom Search API key',
> > > > 'required': True,
> > > > 'hidden': True,
> > > > 'env\_var': 'GOOGLE\_SEARCH\_API\_KEY'
> > > > }

## Signature

```python
list_skills_with_params()
```

## Returns

Dict\[str, Dict\[str, Any]]: Complete skill schema where keys are skill names

## Source

[`/src/signalwire/signalwire/__init__.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/__init__.py)

Line 70.
