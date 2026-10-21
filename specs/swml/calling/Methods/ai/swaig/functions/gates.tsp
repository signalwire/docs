import "@typespec/json-schema";
import "./data_map";
import "../../_shared/fillers.tsp";
import "../../../../../Shared/Types";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// `on_fail` is a SWAIG function result: the platform hands it to the agent exactly as
// it would a `data_map` output, so it shares `Output`. Gate validation diverges in two
// places: a blocked function must never read as a success, so `response` is required
// here and its object form requires `tool_result`; and the gate parser refuses a
// single action object, so `action` must be an array.

@summary("Semantic gate tool result")
@doc("""
  The object form of an `on_fail` response. `tool_result` is what the agent sees as the function's
  result, and `tool_prompt` is an instruction placed right after it.
  """)
model SemanticGateToolResult {
  @doc("What the agent sees as the function's result. Must say that the function did not run.")
  @example("cancel_account was not run.")
  @minLength(1)
  tool_result: string;

  ...OmitProperties<SwaigToolResult, "tool_result">;
}

@summary("on_fail")
@doc("""
  What the agent gets when this is the first gate that fails, shaped like a
  [`data_map` output](/docs/swml/reference/calling/ai/swaig/functions/data-map). At most
  8 KB as compact JSON. Its actions run as written: `\${...}` variables in them are not expanded,
  though a `SWML` action resolves the variables in its own document when it runs.
  """)
model SemanticGateOnFail {
  @doc("""
    What the function returns to the agent. A non-empty string, or an object with `tool_result` and
    an optional `tool_prompt`. Realtime (speech-to-speech) agents don't use `tool_prompt`, so on
    those put everything the agent needs in `tool_result`.
    """)
  @example("cancel_account was not run. Ask the caller to confirm that they want to cancel.")
  response: SemanticGateResponseText | SemanticGateToolResult;

  @doc("Actions to run, as a function's response would. Must be an array, even for one action.")
  @example(#[#{ set_global_data: #{ cancel_attempted: true } }])
  action?: Action[];

  ...OmitProperties<Output, "response" | "action">;
}

@summary("criteria")
@doc("What counts as yes and what counts as no. Set `true`, `false`, or both.")
model SemanticGateCriteria {
  @doc("What a yes answer means. A non-empty string of at most 2 KB.")
  @example("The caller says they want to cancel.")
  @minLength(1)
  @maxLength(2048)
  `true`?: string;

  @doc("What a no answer means. A non-empty string of at most 2 KB.")
  @example("The caller asked about cancelling, or said something else.")
  @minLength(1)
  @maxLength(2048)
  `false`?: string;
}

@summary("gate")
@doc("""
  A yes/no question about the call that must come out yes before the function runs. A key not
  listed here is an error, not an ignored setting.
  """)
model SemanticGate {
  @doc("""
    A name for the gate, reported in the call records: 1 to 64 letters, digits, or underscores,
    unique within the function. Defaults to `gate_1`, `gate_2`, and so on, by position.
    """)
  @pattern("^[A-Za-z0-9_]{1,64}$")
  @example("explicit_request")
  id?: string;

  @doc("""
    The yes/no question, at most 8 KB. Name what it's about with the names of the inputs the gate
    reads, in backticks: `conversation`, `semantic_state`, `proposed_function`, and
    `visual_input`. `\${...}` variables from `global_data` are expanded when the check runs.
    """)
  @minLength(1)
  @maxLength(8192)
  @example("Has the caller explicitly asked to cancel their account in `conversation`?")
  question: string;

  @doc("What counts as yes and what counts as no, for the near misses the question alone leaves open.")
  @minProperties(1)
  @example(#{
    `true`: "The caller says they want to cancel.",
    `false`: "The caller asked about cancelling, or said something else.",
  })
  criteria?: SemanticGateCriteria;

  @doc("""
    The gate passes when the probability that the answer is yes is at or above this value. Above
    `0` and at most `1`. Higher is stricter.
    """)
  @minValueExclusive(0)
  @maxValue(1)
  @example(0.95)
  threshold: float;

  @doc("What the agent gets instead of the function's result when this is the first gate that fails.")
  @example(#{
    response: #{
      tool_result: "cancel_account was not run.",
      tool_prompt: "Ask the caller to confirm that they want to cancel.",
    },
  })
  on_fail: SemanticGateOnFail;

  @doc("""
    How many of the caller's newest video frames the gate looks at, as `visual_input`: `true` is
    `1`, a whole number from `0` to `5`, and `false` or `0` is none. If the call has no video frame
    to show, the gate fails without being asked, so a gate with `visual_input` always fails when
    the post-prompt agent calls the function after the call.
    """)
  @example(1)
  visual_input?: boolean | SemanticGateFrameCount;
}

// The JSON Schema length keywords count characters, while the platform's limits count
// UTF-8 bytes, so `@maxLength` here is the loosest correct bound: text within the byte
// limit always passes it, and multi-byte text can still be refused by the platform.

@summary("Frame count")
@doc("A number of the caller's newest video frames, from `0` (none) to `5`.")
@minValue(0)
@maxValue(5)
scalar SemanticGateFrameCount extends integer;

@summary("Response text")
@doc("The function's result as plain text. Must not be empty, and should say the function did not run.")
@minLength(1)
scalar SemanticGateResponseText extends string;

// Read only by `ai` agents: `amazon_bedrock` and `ai_sidecar` don't check gates and
// pick their function properties from an allowlist, so none of this reaches them.
@summary("Gated function settings")
model SemanticGateFunctionFields {
  @doc("""
    Semantic gates: 1 to 8 yes/no questions that must all pass before the function runs. When any
    fails, the function does not run and the agent gets the first failing gate's `on_fail` instead.
    A gated function needs a `description` and a `web_hook_url` (its own or from
    `SWAIG.defaults`) or a `data_map`. If any gate is invalid, the function is not added to the
    agent at all.
    """)
  @minItems(1)
  @maxItems(8)
  @example(#[
    #{
      id: "explicit_request",
      question: "Has the caller explicitly asked to cancel their account in `conversation`?",
      criteria: #{
        `true`: "The caller says they want to cancel.",
        `false`: "The caller asked about cancelling, or said something else.",
      },
      threshold: 0.95,
      on_fail: #{
        response: #{
          tool_result: "cancel_account was not run.",
          tool_prompt: "Ask the caller to confirm that they want to cancel.",
        },
      },
    }
  ])
  gates?: SemanticGate[];

  @doc("""
    What the agent says while the gates are checked, shaped like `fillers`. Ignored on a function
    without `gates`.
    """)
  @example(#{ default: #["Let me check that."] })
  gate_fillers?: FunctionFillers;

  @doc("""
    For a gated function without `gate_fillers`, whether its `fillers` play as soon as the agent
    calls it, during the gate check (`true`), or only after the gates pass (`false`). When unset,
    the function inherits `SWAIG.defaults.fillers_at_gates`, which is `true` unless you change it.
    """)
  @example(false)
  fillers_at_gates?: boolean | SWMLVar;

  @doc("""
    How many of the caller's newest video frames your `web_hook_url` receives with the function
    call, as `visual_input`: `true` is `1`, a whole number from `0` to `5`, and `false` or `0` is
    none. On a gated function, the frames are taken when the gates are checked, never later.
    Ignored on a `data_map` function.
    """)
  @example(1)
  visual_input?: boolean | SemanticGateFrameCount;
}
