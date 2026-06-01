---
slug: "/reference/java/com/signalwire/sdk/sdk/signalwire"
title: "Signalwire"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.Signalwire"
  parent: "com.signalwire.sdk"
  module: "com.signalwire.sdk"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/Signalwire.java"
  visibility: "public"
---
# `Signalwire`

Top-level convenience entry points \u2014 mirror Python's
`signalwire/__init__.py` package-level helpers
(`RestClient`, `register_skill`,
`add_skill_directory`, `list_skills_with_params`).

<p>This is a static-only utility class; it cannot be instantiated. The
 helpers delegate to the underlying classes (RestClient, SkillRegistry)
 so they're a strict thin layer.

 <p>The audit projects each method onto the canonical Python
 `signalwire.<name>` free-function path via a per-port
 `FREE_FUNCTION_PROJECTIONS` entry in
 `scripts/enumerate_signatures.py`.

**Modifiers:** `final`

## Signature

```java
public final class Signalwire
```

## Methods

- [`addSkillDirectory`](/reference/java/com/signalwire/sdk/sdk/signalwire/add-skill-directory) — Add a directory to search for skills.
- [`listSkillsWithParams`](/reference/java/com/signalwire/sdk/sdk/signalwire/list-skills-with-params) — Get complete schema for all available skills.
- [`registerSkill`](/reference/java/com/signalwire/sdk/sdk/signalwire/register-skill) — Register a custom skill class with the global `SkillRegistry`.
- [`RestClient`](/reference/java/com/signalwire/sdk/sdk/signalwire/rest-client) — Construct a `RestClient` from positional or keyword credentials.

## Source

[`src/main/java/com/signalwire/sdk/Signalwire.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/Signalwire.java)

Line 34.
