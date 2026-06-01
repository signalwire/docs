---
slug: "/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model"
title: "PromptObjectModel"
sdk_label: "Perl SDK"
icon: "perl"
lustri:
  auto_generated: true
  kind: "module"
  language: "perl"
  qualified_name: "SignalWire::POM::PromptObjectModel"
  module: "SignalWire.POM.PromptObjectModel"
  source_url: "https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire/POM/PromptObjectModel.pm"
---
# `PromptObjectModel`

<SignalWire::POM::PromptObjectModel> is a Perl port of `signalwire.pom.pom.PromptObjectModel` from the Python SignalWire SDK. It owns an ordered list of <SignalWire::POM::Section> objects and provides JSON / YAML serialisation, Markdown / XML rendering, recursive title-based search, and POM-merging via `add_pom_as_subsection`.

The serialised form is byte-for-byte identical to the Python reference; prompts authored in either language can be loaded by the other.

**Synopsis**

```perl
use SignalWire::POM::PromptObjectModel;
```

```perl
my $pom = SignalWire::POM::PromptObjectModel->new;
my $sec = $pom->add_section(
    title => 'Greeting',
    body  => 'You are a helpful assistant.',
);
$sec->add_subsection(
    title => 'Tone',
    body  => 'Speak warmly.',
);
```

```perl
print $pom->render_markdown;
print $pom->render_xml;
```

```perl
my $json = $pom->to_json;
my $back = SignalWire::POM::PromptObjectModel->from_json($json);
```

## Signature

```perl
package SignalWire::POM::PromptObjectModel
```

## See Also

- \[<SignalWire::POM::Section>]\(xref://<SignalWire::POM::Section>)

## Methods

- [`add_pom_as_subsection`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/add-pom-as-subsection)
- [`add_section`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/add-section)
- [`find_section`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/find-section)
- [`from_json`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/from-json)
- [`from_yaml`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/from-yaml)
- [`render_markdown`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/render-markdown)
- [`render_xml`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/render-xml)
- [`to_hash`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/to-hash)
- [`to_json`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/to-json)
- [`to_yaml`](/reference/perl/signal-wire/pom/prompt-object-model/prompt-object-model/to-yaml)

## Source

[`lib/SignalWire/POM/PromptObjectModel.pm`](https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire/POM/PromptObjectModel.pm)

Line 1.
