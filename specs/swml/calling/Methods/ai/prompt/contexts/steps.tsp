import "@typespec/json-schema";
import "../../_shared/pom.tsp";
import "../../../../../Shared/Types";
using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("Step reset")
@doc("Resets the conversation with new instructions when the step becomes active.")
model StepReset {
  @doc("The new instructions. Variables such as `\${caller_id_number}` are expanded, as in `prompt.text`.")
  @example("You are now confirming the order details with the caller.")
  system_prompt?: string;

  @doc("""
    A message added as if the caller had said it, right after the reset.
    When `consolidate` is not `true`, defaults to `hello`.
    Variables are expanded, as in `prompt.text`.
    """)
  @example("I'd like to confirm my order.")
  user_prompt?: string;

  @doc("""
    If `true`, the conversation so far is summarized and the summary is carried over after the reset.
    **Default:** `false`.
    """)
  @example(true)
  consolidate?: boolean = false;

  @doc("""
    If `true`, `system_prompt` replaces the agent's original prompt. Otherwise the conversation is cleared
    and `system_prompt` is added as a new instruction. **Default:** `false`.
    """)
  @example(false)
  full_reset?: boolean = false;
}

@summary("Expected answer: digit count")
model ExpectedAnswerDigits {
  @doc("The exact number of digits in the answer, from `1` to `64`.")
  @minValue(1)
  @maxValue(64)
  @example(8)
  digits: int32;
}

@summary("Expected answer: digit range")
model ExpectedAnswerDigitRange {
  @doc("The fewest digits the answer can have, from `1` to `64`, and no greater than `max_digits`.")
  @minValue(1)
  @maxValue(64)
  @example(10)
  min_digits: int32;

  @doc("The most digits the answer can have, from `1` to `64`.")
  @minValue(1)
  @maxValue(64)
  @example(11)
  max_digits: int32;
}

// Any other shape, such as `digits` together with `min_digits`, is ignored.
@summary("Expected answer")
union ExpectedAnswer {
  ExpectedAnswerDigits,
  ExpectedAnswerDigitRange,
}

const expectedAnswerDescription: string = """
  How many digits the answer has, so speech recognition can stop waiting once the caller has said that many.
  Set `digits` for an exact count, or `min_digits` and `max_digits` for a range; any other shape is ignored.
  It stays in effect until a step or question with a different `expected_answer`, or none, replaces it.
  Takes effect with Deepgram speech recognition.
  """;

@summary("Gather question")
model GatherQuestion {
  @doc("The key the answer is stored under in `global_data`, or under `output_key` when it is set.")
  @example("full_name")
  key: string;

  @doc("""
    The question to ask the caller. The AI asks it in its own words, or, when the question is said by the
    platform (`say`), the platform speaks this text as written, with variables such as
    `\${global_data.name}` expanded.
    """)
  @example("What is your full name?")
  question: string;

  @doc("The type of the answer, as a JSON Schema type such as `string`, `number`, `integer`, or `boolean`. **Default:** `string`.")
  @example("string")
  type?: string = "string";

  @doc("If `true`, the AI reads the answer back and gets the caller's confirmation before accepting it. **Default:** `false`.")
  @example(true)
  confirm?: boolean = false;

  @doc("Extra instructions for this question, added after the question.")
  @example("Ask for the name exactly as it appears on the account.")
  prompt?: string;

  @doc("Names of SWAIG functions the AI can call while asking this question. Other functions are unavailable during the question.")
  @example(#["lookup_account"])
  functions?: string[];

  @doc("""
    If `true`, the answers to the other questions in this gather are hidden from the AI while it asks this one,
    so it must ask rather than work out the answer. **Default:** the `isolated` value of `gather_info`.
    """)
  @example(true)
  isolated?: boolean;

  @doc("""
    If `true`, the platform speaks `question` word for word as the agent's turn; if `false`, the AI asks it.
    **Default:** the `say_questions` value of `gather_info`.
    """)
  @example(false)
  say?: boolean;

  @doc("""
    ${expectedAnswerDescription}
    While this question is asked, it overrides the step's `expected_answer`. **Default:** the step's `expected_answer`.
    """)
  expected_answer?: ExpectedAnswer;
}

@summary("Gather info")
@doc("""
  Asks the caller a list of questions, one at a time, and stores the answers in `global_data`.
  The AI submits each answer with the `gather_submit` function, which is refused until the caller has
  said something since the question was asked.
  """)
model GatherInfo {
  @doc("The questions to ask, in order. At least one is required.")
  @minItems(1)
  questions: GatherQuestion[];

  @doc("""
    Instructions sent with each question, after the context's prompt. With `history: keep`, they're sent with
    the first question only. A gather without `prompt` or `pom` asks its questions without the context's prompt.
    """)
  @example("I need to collect a few details before I can book your ride.")
  prompt?: string;

  @doc("The same instructions as `prompt`, as a Prompt Object Model (POM). Used when `prompt` is not set.")
  @minItems(1)
  pom?: POM[];

  @doc("""
    A `global_data` key to store all the answers under, as an object keyed by each question's `key`.
    When omitted, each answer is stored directly in `global_data` under its `key`.
    """)
  @example("customer_info")
  output_key?: string;

  @doc("""
    What to do after the last question is answered: `next_step` moves to the following step, and any other
    value is the name of the step to move to. When omitted, the conversation stays on the current step.
    """)
  @example("next_step")
  completion_action?: string;

  @doc("""
    If `true`, the answers to the other questions are hidden from the AI while it asks each question.
    A question's own `isolated` overrides this. **Default:** `false`.
    """)
  @example(false)
  isolated?: boolean = false;

  @doc("""
    If `true`, the platform speaks each question's `question` text word for word as the agent's turn, instead of
    having the AI ask it. The AI can't skip, reword, or merge a question said this way, and it still collects
    and submits the answer. A question's own `say` overrides this. **Default:** `false`.
    """)
  @example(true)
  say_questions?: boolean = false;
}

@summary("Base context step with common properties")
model ContextStepsBase {
  @doc("The name of the step. The name must be unique within the context. The name is used for referencing the step in the context.")
  @pattern("^(?!next$).*$")
  @example("Take Pizza order")
  name: string;

  @doc("""
    The criteria that must be met for the AI to proceed to the next step.
    The criteria is an instruction given to the AI.
    It's **highly** recommended you create a custom criteria for the step to get the intended behavior.
    """)
  @example("Customer wants to order Pizza")
  step_criteria?: string;

  @doc("""
    An array of strings, where each string is the name of a SWAIG.function that can be executed from this step.
    When omitted, the functions that were already available stay available. An empty array makes none of the
    SWAIG functions available during this step.
    """)
  @example(#["Take Order", "Confirm Order", "Confirm Address"])
  functions?: string[];

  @doc("""
    An array of context names the AI can switch to from this step with `change_context`, matched
    case-insensitively. Each must be a context in your `contexts` object. When the key is omitted or the
    array is empty, the AI isn't offered `change_context` during this step. A request for a context that
    isn't listed is refused. A `change_context` action returned by a SWAIG function can still switch to any context.
    """)
  @example(#["Place Order", "Confirm Order"])
  valid_contexts?: string[];

  @doc("""
    If `true`, the AI responds to this step's instructions without waiting for the caller to speak first.
    It does not move to the next step on its own; set `skip_to_next_step` as well for that. **Default:** `false`.
    """)
  @example(true)
  skip_user_turn?: boolean = false;

  @doc("""
    Used together with `skip_user_turn`: after the AI's response, the conversation moves to the next step.
    Has no effect on its own. **Default:** `false`.
    """)
  @example(true)
  skip_to_next_step?: boolean = false;

  @doc("""
    A boolean value that determines if the step is the last in the context. If `true`, the context ends after this step.
    Cannot be used along with the `valid_steps` parameter. When the step follows a gather, the gather's last question and
    its instructions leave the AI's view, unless `history` is `keep`. **Default:** `false`.
    """)
  @example(true)
  end?: boolean = false;

  @doc("""
    An array of step names the AI can move to from this step with `next_step`, matched case-insensitively.
    Include `next` to allow the following step. When the key is omitted, the AI can move to the next step in
    the context. An empty array removes `next_step` while this step is current. The AI also isn't offered
    `next_step` on a context's last step when `next` is the only choice, or while a gather question is asked.
    A request for a step that isn't listed is refused. A `change_step` action returned by a SWAIG function, and
    a gather's `completion_action`, can still move to any step.
    """)
  @example(#["get order", "confirm order"])
  valid_steps?: string[];

  @doc("""
    How much of the earlier conversation the AI sees when this step begins: `keep`, `default`, `hide`,
    `isolate`, or `spoken`, matched case-insensitively. Any other value is read as `default`.
    **Default:** the context's `history`.
    """)
  @example("isolate")
  history?: ContextHistoryMode;

  @doc(expectedAnswerDescription)
  expected_answer?: ExpectedAnswer;

  @doc("""
    Resets the conversation with new instructions when this step becomes active, and makes this the last
    step in the context, like `end`. When `reset` is set, the step's `text`, `pom` and `gather_info` are
    not used; put the new instructions in `reset.system_prompt`.
    """)
  reset?: StepReset;

  @doc("""
    Asks the caller a list of questions and stores the answers in `global_data`. While questions remain,
    the AI asks them one at a time and doesn't move to another step. A step with `gather_info` doesn't
    need `text` or `pom`.
    """)
  gather_info?: GatherInfo;
}

@summary("Context step with POM (Prompt Object Model)")
model ContextPOMSteps is ContextStepsBase {
  @doc("""
    The instructions for this step, as a Prompt Object Model (POM). Variables are expanded again before each
    AI request when they change during the step.
    """)
  pom: POM[];
}

@summary("Context step with text prompt")
model ContextTextSteps is ContextStepsBase {
  @doc("""
    The prompt or instructions given to the AI at this step. Variables such as `\${global_data.order_id}` are
    expanded again before each AI request when they change during the step, so a value a function sets later
    in the step is the one the AI reads.
    """)
  @example("Your name is Franklin and you are taking orders for Franklin's Pizza.")
  text: string;
}

// `reset` and `gather_info` each make `text`/`pom` optional: a step with either one
// needs no instructions of its own.
@summary("Context step with reset")
model ContextResetSteps {
  ...OmitProperties<ContextStepsBase, "reset">;

  @doc("""
    Resets the conversation with new instructions when this step becomes active, and makes this the last
    step in the context, like `end`. When `reset` is set, the step's `text`, `pom` and `gather_info` are
    not used; put the new instructions in `reset.system_prompt`.
    """)
  reset: StepReset;
}

@summary("Context step with gather_info")
model ContextGatherSteps {
  ...OmitProperties<ContextStepsBase, "gather_info">;

  @doc("""
    Asks the caller a list of questions and stores the answers in `global_data`. While questions remain,
    the AI asks them one at a time and doesn't move to another step. A step with `gather_info` doesn't
    need `text` or `pom`.
    """)
  gather_info: GatherInfo;
}

@summary("Context step - supports either POM or text-based steps")
union ContextSteps {
  ContextPOMSteps,
  ContextTextSteps,
  ContextResetSteps,
  ContextGatherSteps,
}
