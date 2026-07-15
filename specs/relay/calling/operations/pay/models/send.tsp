import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "../../../models/media.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  How the payment flow collects card details from the caller: `dtmf` reads them
  from the caller's keypad. `voice` is reserved for spoken input and is not yet
  available — use `dtmf` today.
  """)
@summary("Payment input mode")
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

@doc("Bank account type, for bank-debit (ACH) payment flows. Bank-debit is not yet supported — only `credit-card` payments work today.")
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
  @example("order_id")
  name: string;

  @doc("Parameter value.")
  @example("A1B2C3")
  value: string;
}

@doc("A single action (Say/Play) executed when a custom prompt is reached.")
model PayPromptAction {
  @doc("`Say` for text-to-speech, `Play` for playing an audio file.")
  @example("Say")
  type: PayPromptActionType;

  @doc("Sentence to speak (for `Say`) or audio URL to play (for `Play`).")
  @example("Please enter your card number.")
  phrase: string;
}

@doc("""
  A custom prompt that overrides the default the Pay flow uses for a given
  situation. The Pay flow is an interactive voice response (IVR) that prompts the
  caller for their card details.

  `card_type` and `error_type` are space-delimited strings, not arrays — e.g.
  `error_type: "timeout invalid-card-number invalid-card-type"`.
  """)
model PayPrompt {
  @doc("The situation this prompt applies to.")
  @example("payment-card-number")
  for: PayPromptFor;

  @doc("""
    Space-delimited card-type tokens this prompt applies to (subset of
    `visa mastercard amex maestro discover jcb diners-club`). Applies to all
    card types if unset.
    """)
  @example("visa mastercard amex")
  card_type?: string;

  @doc("""
    Which collection attempt(s) this prompt applies to, as a space-delimited list
    of attempt numbers (e.g. `"1 2"`). Applies to all attempts if unset.
    """)
  @example("1 2")
  attempt?: string;

  @doc("""
    Whether the caller must enter the same value twice for it to be accepted,
    as a string boolean (e.g. `"true"`). Applies to confirmation-style prompts.
    """)
  @example("true")
  require_matching_inputs?: string;

  @doc("""
    Space-delimited error-type tokens this prompt applies to. Accepted tokens:
    timeout, invalid-card-number, invalid-card-type, invalid-date,
    invalid-security-code, invalid-postal-code, session-in-progress,
    card-declined, invalid-bank-routing-number, invalid-bank-account-number,
    and input-matching-failed.
    """)
  @example("timeout invalid-card-number invalid-card-type")
  error_type?: string;

  @doc("Actions to execute for this prompt.")
  actions?: PayPromptAction[];

  @doc("""
    Media to play for this prompt as an ordered list of audio, TTS, silence, or
    ringtone elements (the same shape as `calling.play`). When set, it replaces
    `actions` for this prompt.
    """)
  play?: PlayMedia[];
}

model PayParams {
  ...CallAddress;

  @doc("Identifier used to control this active pay (e.g. `calling.pay.stop`).")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("How payment details are collected. Default `dtmf`. (Only `dtmf` supported.)")
  @example("dtmf")
  input?: PayInput = "dtmf";

  @doc("URL to request on each status change during the payment process.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;

  @doc("Payment method to use. Default `credit-card`. (Only `credit-card` supported.)")
  @example("credit-card")
  payment_method?: PayMethod = "credit-card";

  @doc("Bank account type, for bank-debit (ACH) payment flows. Default `consumer-checking`. Bank-debit is not yet supported — only `credit-card` payments work today.")
  @example("consumer-checking")
  bank_account_type?: PayBankAccountType = "consumer-checking";

  @doc("""
    Seconds the Pay IVR waits for the next digit before validating the captured
    digits, passed as a string, e.g. `"6"`. Default `"5"`.
    """)
  @pattern("^[0-9]+$")
  @example("6")
  timeout?: string = "5";

  @doc("""
    Number of times the Pay IVR retries when collecting card details, passed as a
    string, e.g. `"3"`. Default `"1"`.
    """)
  @pattern("^[0-9]+$")
  @example("3")
  max_attempts?: string = "1";

  @doc("""
    Whether to prompt for the card security code, passed as a string boolean
    (`"true"` or `"false"`). Default `"true"`.
    """)
  @example("false")
  security_code?: string = "true";

  @doc("""
    Whether to prompt for the billing postal code, passed as a string
    (`"true"`, `"false"`, or a known postcode so the IVR skips the prompt).
    Default `"true"`.
    """)
  @example("false")
  postal_code?: string = "true";

  @doc("""
    Minimum number of digits a caller must enter for the postal code, passed as a
    string, e.g. `"6"`. Default `"0"`.
    """)
  @pattern("^[0-9]+$")
  @example("6")
  min_postal_code_length?: string = "0";

  @doc("URL that collected payment details are POSTed to upon completion. Must be an `https://` URL.")
  @example("https://example.com/accept-payment")
  payment_connector_url: url;

  @doc("Whether the payment token is one-off or reusable. Default `reusable`.")
  @example("one-time")
  token_type?: PayTokenType = "reusable";

  @doc("""
    Amount to charge against the payment method. Decimal value with no currency
    prefix, passed as a string (e.g. `"15.00"`). Default `"0.00"`.
    """)
  @example("15.00")
  charge_amount?: string = "0.00";

  @doc("Currency of the charge amount. Default `usd`.")
  @example("usd")
  currency?: string = "usd";

  @doc("Language for prompts played to the caller. Default `en-US`.")
  @example("en-US")
  language?: string = "en-US";

  @doc("""
    Text-to-speech voice for prompts (free-form; passed through to TTS, e.g.
    `woman`, `man`, `polly.Sally`). Default `woman`.
    """)
  @example("polly.Sally")
  voice?: string = "woman";

  @doc("Fallback text-to-speech voice for prompts, used when `voice` is not set.")
  @example("woman")
  say_voice?: string;

  @doc("Custom description of the payment.")
  @example("book")
  description?: string;

  @doc("""
    Space-delimited list of card types allowed in this payment, not an array —
    subset of `visa mastercard amex maestro discover jcb diners-club`. Default
    `"visa mastercard amex"`.
    """)
  @example("amex mastercard visa jcb")
  valid_card_types?: string = "visa mastercard amex";

  @doc("Additional name/value pairs to POST to the payment connector.")
  parameters?: PayParameter[];

  @doc("Custom prompts that override the IVR defaults.")
  prompts?: PayPrompt[];
}

model PayStopParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the Pay session with `calling.pay`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
