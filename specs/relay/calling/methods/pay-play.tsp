import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared enums (pay / play family)
// ═════════════════════════════════════════════════════════════════════════════

/**
 * How the Pay IVR collects payment details. Only `dtmf` is currently supported.
 */
union PayInput {
  "dtmf",
  "voice",
}

/**
 * Payment method used for the Pay request. Only `credit-card` is supported.
 */
union PayMethod {
  "credit-card",
}

/** Bank account type, for bank-debit payment flows. */
union PayBankAccountType {
  "consumer-checking",
  "consumer-savings",
  "commercial-checking",
}

/** Whether the tokenized payment is a one-off charge or reusable for recurring billing. */
union PayTokenType {
  "one-time",
  "reusable",
}

/** Situation a custom Pay prompt applies to. */
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

/** Action performed by a Pay prompt: `Say` (text-to-speech) or `Play` (audio file). */
union PayPromptActionType {
  "Say",
  "Play",
}

// ═════════════════════════════════════════════════════════════════════════════
// calling.pay
// ═════════════════════════════════════════════════════════════════════════════

/** A name/value pair POSTed to the payment connector alongside payment details. */
model PayParameter {
  /** Parameter name. */
  name: string;

  /** Parameter value. */
  value: string;
}

/** A single action (Say/Play) executed when a custom prompt is reached. */
model PayPromptAction {
  /** `Say` for text-to-speech, `Play` for playing an audio file. */
  type: PayPromptActionType;

  /** Sentence to speak (for `Say`) or audio URL to play (for `Play`). */
  phrase: string;
}

/**
 * A custom prompt overriding the Pay IVR default for a given situation.
 *
 * `card_type` and `error_type` are SPACE-DELIMITED token strings on the wire (not
 * arrays) — e.g. `error_type: "timeout invalid-card-number invalid-card-type"`.
 */
model PayPrompt {
  /** The situation this prompt applies to. */
  for: PayPromptFor;

  /**
   * Space-delimited card-type tokens this prompt applies to (subset of
   * `visa mastercard amex maestro discover jcb diners-club`). Applies to all
   * card types if unset.
   */
  card_type?: string;

  /**
   * Which collection attempt(s) this prompt applies to, as a space-delimited list
   * of attempt numbers (e.g. `"1 2"`). Applies to all attempts if unset.
   */
  attempt?: string;

  /**
   * Whether the caller must enter the same value twice for it to be accepted,
   * as a string boolean (e.g. `"true"`). Applies to confirmation-style prompts.
   */
  require_matching_inputs?: string;

  /**
   * Space-delimited error-type tokens this prompt applies to. Documented tokens:
   * timeout, invalid-card-number, invalid-card-type, invalid-date,
   * invalid-security-code, invalid-postal-code, session-in-progress,
   * card-declined. (The gateway parser additionally recognizes
   * invalid-bank-routing-number, invalid-bank-account-number, and
   * input-matching-failed.)
   */
  error_type?: string;

  /** Actions to execute for this prompt. */
  actions?: PayPromptAction[];
}

model PayParams {
  ...CallAddress;

  /** Identifier used to control this active pay (e.g. `calling.pay.stop`). */
  control_id: string;

  /** How payment details are collected. Default `dtmf`. (Only `dtmf` supported.) */
  input?: PayInput = "dtmf";

  /** URL to request on each status change during the payment process. */
  status_url?: url;

  /** Payment method to use. Default `credit-card`. (Only `credit-card` supported.) */
  payment_method?: PayMethod = "credit-card";

  /** Bank account type, for bank-debit payment flows. Default `consumer-checking`. */
  bank_account_type?: PayBankAccountType = "consumer-checking";

  /**
   * Seconds the Pay IVR waits for the next digit before validating the captured
   * digits, as a string of digits on the wire (e.g. `"6"`). Default `"5"`.
   */
  @pattern("^[0-9]+$")
  timeout?: string = "5";

  /**
   * Number of times the Pay IVR retries when collecting card details, as a string
   * of digits on the wire (e.g. `"3"`). Default `"1"`.
   */
  @pattern("^[0-9]+$")
  max_attempts?: string = "1";

  /**
   * Whether to prompt for the card security code, as a string boolean on the wire
   * (`"true"` or `"false"`). Default `"true"`.
   */
  security_code?: string = "true";

  /**
   * Whether to prompt for the billing postal code, as a string on the wire
   * (`"true"`, `"false"`, or a known postcode so the IVR skips the prompt).
   * Default `"true"`.
   */
  postal_code?: string = "true";

  /**
   * Minimum number of digits a caller must enter for the postal code, as a string
   * of digits on the wire (e.g. `"6"`). Default `"0"`.
   */
  @pattern("^[0-9]+$")
  min_postal_code_length?: string = "0";

  /** URL to POST collected payment details to upon completion. */
  payment_connector_url: url;

  /** Whether the payment token is one-off or reusable. Default `reusable`. */
  token_type?: PayTokenType = "reusable";

  /**
   * Amount to charge against the payment method. Decimal value with no currency
   * prefix, passed as a string (e.g. `"15.00"`). Default `"0.00"`.
   */
  charge_amount?: string = "0.00";

  /** Currency of the charge amount. Default `usd`. */
  currency?: string = "usd";

  /** Language for prompts played to the caller. Default `en-US`. */
  language?: string = "en-US";

  /**
   * Text-to-speech voice for prompts (free-form; passed through to TTS, e.g.
   * `woman`, `man`, `polly.Sally`). Default `woman`.
   */
  voice?: string = "woman";

  /** Custom description of the payment. */
  description?: string;

  /**
   * SPACE-DELIMITED list of card types allowed in this payment (not an array) —
   * subset of `visa mastercard amex maestro discover jcb diners-club`. Default
   * `"visa mastercard amex"`.
   */
  valid_card_types?: string = "visa mastercard amex";

  /** Additional name/value pairs to POST to the payment connector. */
  parameters?: PayParameter[];

  /** Custom prompts that override the IVR defaults. */
  prompts?: PayPrompt[];
}

model PayResult {
  ...RelayResult;

  /** Echo of the `control_id` from the request. */
  control_id?: string;
}

/**
 * Start a Pay IVR session on an active call: collect card details via DTMF and
 * POST them to a payment connector.
 */
@rpcMethod("calling.pay")
@summary("Collect a payment via the Pay IVR")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "pay-1",
    input: "dtmf",
    status_url: "https://example.com/status-webhook",
    payment_method: "credit-card",
    timeout: "6",
    max_attempts: "3",
    security_code: "false",
    postal_code: "false",
    min_postal_code_length: "6",
    payment_connector_url: "https://example.com/accept-payment",
    token_type: "one-time",
    charge_amount: "15.00",
    currency: "usd",
    language: "en-US",
    voice: "polly.Sally",
    description: "book",
    valid_card_types: "amex mastercard visa jcb",
    parameters: #[#{ name: "customer_id", value: "93652a3c-1234-dcba-abcd-7980d413bv31" }],
    prompts: #[
      #{
        for: "payment-card-number",
        error_type: "invalid-card-number timeout invalid-card-type",
        actions: #[#{ type: "Say", phrase: "You entered an invalid card number. Please try again." }],
      }
    ],
  },
  returnType: #{ code: "200", message: "Processing payment", control_id: "pay-1" },
})
op pay(...PayParams): PayResult | CallPayEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.pay.stop
// ─────────────────────────────────────────────────────────────────────────────

model PayStopParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.pay`. */
  control_id: string;
}

model PayStopResult {
  ...RelayResult;
}

/** Stop an active Pay IVR session. */
@rpcMethod("calling.pay.stop")
@summary("Stop an active pay")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "pay-1",
  },
  returnType: #{ code: "200", message: "Stopping payment" },
})
op payStop(...PayStopParams): PayStopResult;

// ═════════════════════════════════════════════════════════════════════════════
// calling.play — media elements
//
// `play[]` is a discriminated union on `type`: audio | tts | silence | ringtone.
// Distinct from common.tsp's `Ringback` (connect ringback) — kept separate so
// the emitter emits exactly these four play variants for the play method.
// ═════════════════════════════════════════════════════════════════════════════

// The `PlayMedia` union (audio|tts|silence|ringtone) is defined in common.tsp —
// shared with `calling.play_and_collect`.

model PlayParams {
  ...CallAddress;

  /** Identifier used to control this active play (pause/resume/stop/volume). */
  control_id: string;

  /**
   * Playback volume, -40dB to +40dB (`0` = original audio, `-40` = muted;
   * amplitude gain factor `10^(value/20)`).
   */
  @minValue(-40)
  @maxValue(40)
  volume?: float64;

  /**
   * Which side of the call hears the media: `listen` (what the called party
   * hears), `speak`, or `both`. Default `listen`.
   */
  direction?: "listen" | "speak" | "both" = "listen";

  /** HTTP(s) URL to POST play events to. */
  status_url?: url;

  /** Ordered list of media elements to play. */
  play: PlayMedia[];

  /**
   * Number of times to play the sequence. `0` loops until the call ends or the
   * play is stopped. Default `1`.
   */
  @minValue(0)
  loop?: int32 = 1;
}

model PlayResult {
  ...RelayResult;

  /** Echo of the `control_id` from the request. */
  control_id?: string;
}

// NOTE: no @opExample here — `play: PlayMedia[]` is a @discriminator union, and TypeSpec
// value-checking does not narrow a discriminated base to its variant, so an inline frame
// example can't carry real `params`. The PlayMedia variant models in common.tsp carry
// schema-level @example values instead.
/** Play a sequence of media elements (audio/TTS/silence/ringtone) to a call. */
@rpcMethod("calling.play")
@summary("Play media to a call")
op play(...PlayParams): PlayResult | CallPlayEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.play.pause
// ─────────────────────────────────────────────────────────────────────────────

model PlayPauseParams {
  ...CallAddress;

  /** The playing `control_id` assigned in `calling.play`. */
  control_id: string;
}

model PlayPauseResult {
  ...RelayResult;
}

/** Pause an active play. */
@rpcMethod("calling.play.pause")
@summary("Pause an active play")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "play-1",
  },
  returnType: #{ code: "200", message: "Paused play" },
})
op playPause(...PlayPauseParams): PlayPauseResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.play.resume
// ─────────────────────────────────────────────────────────────────────────────

model PlayResumeParams {
  ...CallAddress;

  /** The playing `control_id` assigned in `calling.play`. */
  control_id: string;
}

model PlayResumeResult {
  ...RelayResult;
}

/** Resume an active paused play. */
@rpcMethod("calling.play.resume")
@summary("Resume a paused play")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "play-1",
  },
  returnType: #{ code: "200", message: "Resumed play" },
})
op playResume(...PlayResumeParams): PlayResumeResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.play.stop
// ─────────────────────────────────────────────────────────────────────────────

model PlayStopParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.play`. */
  control_id: string;
}

model PlayStopResult {
  ...RelayResult;
}

/** Stop an active play. */
@rpcMethod("calling.play.stop")
@summary("Stop an active play")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "play-1",
  },
  returnType: #{ code: "200", message: "Stopping play" },
})
op playStop(...PlayStopParams): PlayStopResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.play.volume
// ─────────────────────────────────────────────────────────────────────────────

model PlayVolumeParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.play`. */
  control_id: string;

  /**
   * Playback volume, -40dB to +40dB (`0` = original audio, `-40` = muted;
   * amplitude gain factor `10^(value/20)`).
   */
  @minValue(-40)
  @maxValue(40)
  volume: float64;
}

model PlayVolumeResult {
  ...RelayResult;
}

/** Adjust the volume of an active play. */
@rpcMethod("calling.play.volume")
@summary("Adjust the volume of an active play")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "play-1",
    volume: 3.0,
  },
  returnType: #{ code: "200", message: "Changed play volume" },
})
op playVolume(...PlayVolumeParams): PlayVolumeResult;
