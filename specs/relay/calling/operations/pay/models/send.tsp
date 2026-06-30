import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared enums (pay / play family)
// ═════════════════════════════════════════════════════════════════════════════

@doc("""
  How the Pay IVR collects payment details. Only `dtmf` is currently supported.
  """)
union PayInput {
  "dtmf",
  "voice",
}

@doc("""
  Payment method used for the Pay request. Only `credit-card` is supported.
  """)
union PayMethod {
  "credit-card",
}

@doc("Bank account type, for bank-debit payment flows.")
union PayBankAccountType {
  "consumer-checking",
  "consumer-savings",
  "commercial-checking",
}

@doc("Whether the tokenized payment is a one-off charge or reusable for recurring billing.")
union PayTokenType {
  "one-time",
  "reusable",
}

@doc("Situation a custom Pay prompt applies to.")
union PayPromptFor {
  "payment-card-number",
  "expiration-date",
  "security-code",
  "postal-code",
  "bank-routing-number",
  "bank-account-number",
  "payment-processing",
  "payment-completed",
  "payment-failed",
  "payment-canceled",
}

@doc("Action performed by a Pay prompt: `Say` (text-to-speech) or `Play` (audio file).")
union PayPromptActionType {
  "Say",
  "Play",
}

@doc("A name/value pair POSTed to the payment connector alongside payment details.")
model PayParameter {
  @doc("Parameter name.")
  name: string;

  @doc("Parameter value.")
  value: string;
}

@doc("A single action (Say/Play) executed when a custom prompt is reached.")
model PayPromptAction {
  @doc("`Say` for text-to-speech, `Play` for playing an audio file.")
  type: PayPromptActionType;

  @doc("Sentence to speak (for `Say`) or audio URL to play (for `Play`).")
  phrase: string;
}

@doc("""
  A custom prompt overriding the Pay IVR default for a given situation.

  `card_type` and `error_type` are SPACE-DELIMITED token strings on the wire (not
  arrays) — e.g. `error_type: "timeout invalid-card-number invalid-card-type"`.
  """)
model PayPrompt {
  @doc("The situation this prompt applies to.")
  for: PayPromptFor;

  @doc("""
    Space-delimited card-type tokens this prompt applies to (subset of
    `visa mastercard amex maestro discover jcb diners-club`). Applies to all
    card types if unset.
    """)
  card_type?: string;

  @doc("""
    Which collection attempt(s) this prompt applies to, as a space-delimited list
    of attempt numbers (e.g. `"1 2"`). Applies to all attempts if unset.
    """)
  attempt?: string;

  @doc("""
    Whether the caller must enter the same value twice for it to be accepted,
    as a string boolean (e.g. `"true"`). Applies to confirmation-style prompts.
    """)
  require_matching_inputs?: string;

  @doc("""
    Space-delimited error-type tokens this prompt applies to. Documented tokens:
    timeout, invalid-card-number, invalid-card-type, invalid-date,
    invalid-security-code, invalid-postal-code, session-in-progress,
    card-declined. (The gateway parser additionally recognizes
    invalid-bank-routing-number, invalid-bank-account-number, and
    input-matching-failed.)
    """)
  error_type?: string;

  @doc("Actions to execute for this prompt.")
  actions?: PayPromptAction[];
}

model PayParams {
  ...CallAddress;

  @doc("Identifier used to control this active pay (e.g. `calling.pay.stop`).")
  control_id: string;

  @doc("How payment details are collected. Default `dtmf`. (Only `dtmf` supported.)")
  input?: PayInput = "dtmf";

  @doc("URL to request on each status change during the payment process.")
  status_url?: url;

  @doc("Payment method to use. Default `credit-card`. (Only `credit-card` supported.)")
  payment_method?: PayMethod = "credit-card";

  @doc("Bank account type, for bank-debit payment flows. Default `consumer-checking`.")
  bank_account_type?: PayBankAccountType = "consumer-checking";

  @doc("""
    Seconds the Pay IVR waits for the next digit before validating the captured
    digits, as a string of digits on the wire (e.g. `"6"`). Default `"5"`.
    """)
  @pattern("^[0-9]+$")
  timeout?: string = "5";

  @doc("""
    Number of times the Pay IVR retries when collecting card details, as a string
    of digits on the wire (e.g. `"3"`). Default `"1"`.
    """)
  @pattern("^[0-9]+$")
  max_attempts?: string = "1";

  @doc("""
    Whether to prompt for the card security code, as a string boolean on the wire
    (`"true"` or `"false"`). Default `"true"`.
    """)
  security_code?: string = "true";

  @doc("""
    Whether to prompt for the billing postal code, as a string on the wire
    (`"true"`, `"false"`, or a known postcode so the IVR skips the prompt).
    Default `"true"`.
    """)
  postal_code?: string = "true";

  @doc("""
    Minimum number of digits a caller must enter for the postal code, as a string
    of digits on the wire (e.g. `"6"`). Default `"0"`.
    """)
  @pattern("^[0-9]+$")
  min_postal_code_length?: string = "0";

  @doc("URL that collected payment details are POSTed to upon completion. Must be an `https://` URL.")
  payment_connector_url: url;

  @doc("Whether the payment token is one-off or reusable. Default `reusable`.")
  token_type?: PayTokenType = "reusable";

  @doc("""
    Amount to charge against the payment method. Decimal value with no currency
    prefix, passed as a string (e.g. `"15.00"`). Default `"0.00"`.
    """)
  charge_amount?: string = "0.00";

  @doc("Currency of the charge amount. Default `usd`.")
  currency?: string = "usd";

  @doc("Language for prompts played to the caller. Default `en-US`.")
  language?: string = "en-US";

  @doc("""
    Text-to-speech voice for prompts (free-form; passed through to TTS, e.g.
    `woman`, `man`, `polly.Sally`). Default `woman`.
    """)
  voice?: string = "woman";

  @doc("Custom description of the payment.")
  description?: string;

  @doc("""
    SPACE-DELIMITED list of card types allowed in this payment (not an array) —
    subset of `visa mastercard amex maestro discover jcb diners-club`. Default
    `"visa mastercard amex"`.
    """)
  valid_card_types?: string = "visa mastercard amex";

  @doc("Additional name/value pairs to POST to the payment connector.")
  parameters?: PayParameter[];

  @doc("Custom prompts that override the IVR defaults.")
  prompts?: PayPrompt[];
}

model PayStopParams {
  ...CallAddress;

  @doc("The `control_id` assigned in `calling.pay`.")
  control_id: string;
}
