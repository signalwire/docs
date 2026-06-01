---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs"
title: "prefabs"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
---
# `prefabs`

Package prefabs provides pre-built agent patterns that extend AgentBase with common conversational workflows such as information gathering, surveys, reception/routing, FAQ answering, and virtual concierge services.

## Signature

```go
package prefabs
```

## Functions

- [`NewBedrockAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/new-bedrock-agent) — NewBedrockAgent creates a BedrockAgent with Bedrock-specific SWML rendering.
- [`NewConciergeAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/new-concierge-agent) — NewConciergeAgent creates an agent that provides concierge services for a venue.
- [`NewFAQBotAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/new-faq-bot-agent) — NewFAQBotAgent creates an agent that answers frequently asked questions.
- [`NewInfoGathererAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/new-info-gatherer-agent) — NewInfoGathererAgent creates an agent that asks a series of questions and stores the answers in global data. Pass nil Questions to enable dynamic mode; call SetQuestionCallback on the returned agent to supply per-request questions.
- [`NewReceptionistAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/new-receptionist-agent) — NewReceptionistAgent creates an agent that greets callers and transfers them to the appropriate department.
- [`NewSurveyAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/new-survey-agent) — NewSurveyAgent creates an agent that conducts a structured survey.
- [`NewSurveyQuestion`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/new-survey-question) — NewSurveyQuestion constructs a SurveyQuestion with Required:true, matching Python SurveyAgent.\_validate\_questions which defaults required=True when unspecified. Callers opt out with WithOptional().
- [`WithOptional`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/with-optional) — WithOptional marks a question as not required. Matches Python's required=False escape hatch on SurveyAgent questions.
- [`WithQuestionChoices`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/with-question-choices) — WithQuestionChoices sets the choice list for multiple\_choice questions.
- [`WithQuestionID`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/with-question-id) — WithQuestionID sets the question ID.
- [`WithQuestionScale`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/with-question-scale) — WithQuestionScale sets the scale for rating questions (answers run 1..n).
- [`WithQuestionType`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/with-question-type) — WithQuestionType sets the question type ("rating", "multiple\_choice", "yes\_no", "open\_ended").

## Type Aliases

- [`SurveyQuestionOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/survey-question-option) — SurveyQuestionOption configures a question during construction.

## Classes

- [`Amenity`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/amenity) — Amenity describes a venue amenity with its hours, location, and extra details.
- [`BedrockAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-agent) — BedrockAgent wraps AgentBase and configures it to emit the "amazon\_bedrock" SWML verb instead of the standard "ai" verb.
- [`BedrockOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/bedrock-options) — BedrockOptions configures a new BedrockAgent.
- [`ConciergeAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/concierge-agent) — ConciergeAgent acts as a virtual concierge for a venue, answering questions about amenities, services, hours, and directions.
- [`ConciergeOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/concierge-options) — ConciergeOptions configures a new ConciergeAgent.
- [`Department`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/department) — Department describes a destination the receptionist can transfer to.
- [`FAQ`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/faq) — FAQ represents a single frequently asked question and its answer.
- [`FAQBotAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/faq-bot-agent) — FAQBotAgent answers frequently asked questions by matching user queries against a provided FAQ database.
- [`FAQBotOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/faq-bot-options) — FAQBotOptions configures a new FAQBotAgent.
- [`InfoGathererAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/info-gatherer-agent) — InfoGathererAgent collects answers to a series of questions sequentially. Supports both static (questions provided at construction) and dynamic (questions determined per-request via SetQuestionCallback) modes.
- [`InfoGathererOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/info-gatherer-options) — InfoGathererOptions configures a new InfoGathererAgent. Set Questions to nil to enable dynamic callback mode via SetQuestionCallback.
- [`Question`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/question) — Question describes a single question in an InfoGatherer sequence.
- [`ReceptionistAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/receptionist-agent) — ReceptionistAgent greets callers and routes them to the appropriate department.
- [`ReceptionistOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/receptionist-options) — ReceptionistOptions configures a new ReceptionistAgent.
- [`SurveyAgent`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/survey-agent) — SurveyAgent conducts structured surveys with typed questions.
- [`SurveyOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/survey-options) — SurveyOptions configures a new SurveyAgent.
- [`SurveyQuestion`](/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/survey-question) — SurveyQuestion describes a single question in a survey.
