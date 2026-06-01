---
slug: "/reference/perl/signal-wire/pom/section/section"
title: "Section"
sdk_label: "Perl SDK"
icon: "perl"
lustri:
  auto_generated: true
  kind: "module"
  language: "perl"
  qualified_name: "SignalWire::POM::Section"
  module: "SignalWire.POM.Section"
  source_url: "https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire/POM/Section.pm"
---
# `Section`

<SignalWire::POM::Section> is a Perl port of `signalwire.pom.pom.Section` from the Python SignalWire SDK. Both implementations render byte-for-byte identical Markdown/XML/JSON output so prompts authored in either language can be consumed interchangeably.

**Synopsis**

```perl
use SignalWire::POM::Section;
```

```perl
my $section = SignalWire::POM::Section->new(
    title   => 'Greeting',
    body    => 'You are a helpful assistant.',
    bullets => ['Be polite', 'Be concise'],
);
```

```perl
my $sub = $section->add_subsection(
    title => 'Tone',
    body  => 'Speak warmly.',
);
```

```perl
print $section->render_markdown;
print $section->render_xml;
```

## Signature

```perl
package SignalWire::POM::Section
```

## See Also

- <SignalWire::POM::PromptObjectModel> — the top-level container that holds a list of Sections.

## Methods

- [`add_body`](/reference/perl/signal-wire/pom/section/section/add-body)
- [`add_bullets`](/reference/perl/signal-wire/pom/section/section/add-bullets)
- [`add_subsection`](/reference/perl/signal-wire/pom/section/section/add-subsection)
- [`BUILD`](/reference/perl/signal-wire/pom/section/section/build)
- [`render_markdown`](/reference/perl/signal-wire/pom/section/section/render-markdown)
- [`render_xml`](/reference/perl/signal-wire/pom/section/section/render-xml)
- [`to_hash`](/reference/perl/signal-wire/pom/section/section/to-hash)

## Source

[`lib/SignalWire/POM/Section.pm`](https://github.com/signalwire/signalwire-perl/blob/main/lib/SignalWire/POM/Section.pm)

Line 1.
