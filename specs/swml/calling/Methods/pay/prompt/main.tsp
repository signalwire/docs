import "@typespec/json-schema";
import "../../../../Shared/Types/main.tsp";
import "./actions.tsp";
import "./play.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

model PayPrompts {
  @doc("""
    Array of action objects to execute for this prompt. These actions can either play an audio file or speak a phrase.
    Ignored when `play` is set. A prompt with neither `play` nor a non-empty `actions` array doesn't replace the default prompt.
    """)
  actions?: PayPromptAction[];

  @doc("""
    Array of media items to play for this prompt: audio files, text-to-speech, silence, or ringtones.
    When `play` is present it takes precedence and `actions` is ignored, even if `play` is empty.
    """)
  play?: PayPromptPlayItem[];

  @doc("""
    The payment step this prompt is for.
    
    - `payment-card-number`: Collect the payment card number.
    - `expiration-date`: Collect the payment card expiration date.
    - `security-code`: Collect the payment card security code.
    - `postal-code`: Collect the payment card postal code.
    - `bank-routing-number`: Collect the bank routing number.
    - `bank-account-number`: Collect the bank account number.
    - `payment-processing`: The step used during the payment processing.
    - `payment-completed`: The step used when the payment connector responds with HTTP `200`.
    - `payment-failed`: The step used when collection fails or the payment connector responds with another HTTP status.
    - `payment-canceled`: The step used when the payment is canceled.
    """)
  @example("payment-card-number")
  for:
    | "payment-card-number"
    | "expiration-date"
    | "security-code"
    | "postal-code"
    | "bank-routing-number"
    | "bank-account-number"
    | "payment-processing"
    | "payment-completed"
    | "payment-failed"
    | "payment-canceled"
    | SWMLVar;

  @doc("""
    Space-separated list of the attempts (`1`, `2`, or `3`) this prompt applies to, such as `"1"` or `"2 3"`.
    Attempts count per payment detail being collected, not per payment: each detail starts again at attempt `1`.
    """)
  @example("1 2")
  attempt?: string = "1 2 3";

  @doc("""
    Space-separated list of card types this prompt applies to. Unrecognized values are ignored;
    if no value is recognized, the prompt applies to every card type.
    
    Supported card types:
        - `visa`
        - `mastercard`
        - `amex`
        - `maestro`
        - `discover`
        - `jcb`
        - `diners-club`
    """)
  @example("visa mastercard amex")
  card_type?: string;

  @doc("""
    Space-separated list of error types this prompt applies to.
    
    Available error types:
        - `timeout` - User input timeout
        - `invalid-card-number` - Failed card validation
        - `invalid-card-type` - Unsupported card type
        - `invalid-date` - Invalid expiration date
        - `invalid-security-code` - Invalid CVV format
        - `invalid-postal-code` - Invalid postal code format
        - `invalid-bank-routing-number` - Invalid bank routing number
        - `invalid-bank-account-number` - Invalid bank account number
        - `input-matching-failed` - Input matching failed (accepted as a filter value)
        - `card-declined` - Payment declined
        - `bank-account-declined` - Bank account payment declined
        - `invalid-bank-account-type` - Unsupported bank account type
    """)
  @example("timeout invalid-card-number")
  error_type?: string;
}
