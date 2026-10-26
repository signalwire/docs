import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";
import "./parameters.tsp";
import "./prompt/main.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// Literal payment connector URL: the scheme must be https. A SWML variable reference is accepted
// separately (see `payment_connector_url`) and must resolve to an HTTPS URL.
@pattern("^https://")
scalar PayConnectorUrl extends url;

@summary("pay Method")
model Pay {
  @doc("""
    Enables secure payment processing during voice calls. When implemented, it manages the entire payment flow
    including data collection, validation, and processing through your configured payment gateway.
    """)
  pay: {
    @doc("""
      The URL to make POST requests with all the gathered payment details. Must be an HTTPS URL,
      or a SWML variable that resolves to one.
      This URL is used to process the final payment transaction and return the results through the response.
      
      Visit [pay documentation](/docs/swml/reference/calling/pay#payment_connector_url) for more important information.
      """)
    @example("https://example.com/payment-connector")
    payment_connector_url: PayConnectorUrl | SWMLVar;

    @doc("The amount to charge against payment method passed in the request. `Float` value with no currency prefix passed as string. When omitted, `0.00` is sent to your payment connector.")
    @example("29.99")
    charge_amount?: string = "0.00";

    @doc("Uses the ISO 4217 currency code of the charge amount.")
    @example("usd")
    currency?: string = "usd";

    @doc("Custom description of the payment provided in the request.")
    @example("Monthly subscription payment")
    description?: string;

    @doc("The method of how to collect the payment details. Currently only `dtmf` mode is supported.")
    @example("dtmf")
    input?: "dtmf" = "dtmf";

    @doc("Language to use for prompts being played to the caller by the `pay` method.")
    @example("en-US")
    language?: string = "en-US";

    @doc("""
      Number of attempts the caller gets to enter each payment detail, such as the card number or expiration date.
      Each detail is counted separately. Set a value from `1` to `3`.
      Values outside that range are ignored, and the default `1` is used instead.
      With the default `1`, the caller gets no retry after a failed entry.
      """)
    @example(3)
    max_attempts?: integer | SWMLVar = 1;

    @doc("The minimum length of the postal code the user must enter.")
    @example(5)
    min_postal_code_length?: integer | SWMLVar = 0;

    @doc("Array of parameter objects to pass to your payment processor. The parameters are user-defined key-value pairs.")
    parameters?: PayParameters[];

    @doc("""
      The payment method to collect from the caller.
      
      Allowed values:
      - `credit-card`: collect a card number, expiration date, and (by default) security code and postal code.
      - `ach-debit`: collect a bank routing number and bank account number.
      
      Whether your payment processor accepts a given method is up to your payment connector.
      """)
    @example("credit-card")
    payment_method?: "credit-card" | "ach-debit" = "credit-card";

    @doc("""
      The bank account type sent to your payment connector. Applies when `payment_method` is `ach-debit`.
      
      Allowed values:
      - `consumer-checking`
      - `consumer-savings`
      - `commercial-checking`
      """)
    @example("consumer-savings")
    bank_account_type?: "consumer-checking" | "consumer-savings" | "commercial-checking" = "consumer-checking";

    @doc("""
      Whether to prompt for the postal code, passed as a string. Applies to card payments.
      Use `"true"` to prompt or `"false"` to skip the prompt. Pass a postal code instead, such as `"94107"`, when you
      already know it: the caller isn't prompted and that value is sent to your payment connector.
      """)
    @example("true")
    postal_code?: string = "true";

    @doc("Array of prompt objects for customizing the audio prompts during different stages of the payment process.")
    prompts?: PayPrompts[];

    @doc("""
      Alternative name for `voice`. Used only when `voice` is not set.
      """)
    @example("woman")
    say_voice?: string;

    @doc("""
      Whether to prompt for the card security code, passed as the string `"true"` or `"false"`. Applies to card payments.
      """)
    @example("true")
    security_code?: "true" | "false" | SWMLVar = "true";

    @doc("""
      The URL to send requests for each status change during the payment process.
      
      Visit [pay documentation](/docs/swml/reference/calling/pay#status_url-request-body) for more important information.
      """)
    @example("https://example.com/payment-status")
    status_url?: url;

    @doc("""
      Limit in seconds that pay method waits for the caller to press another digit before moving on to validate the digits captured.
      Values below `3` are ignored, and the default `5` is used instead.
      """)
    @example(5)
    timeout?: integer | SWMLVar = 5;

    @doc("""
      Whether the payment is a one off payment or re-occurring.
      
      Allowed values:
      - `one-time`
      - `reusable`
      """)
    @example("one-time")
    token_type?: "one-time" | "reusable" = "reusable";

    @doc("""
      List of payment cards allowed to use in the requested payment process separated by space.
      
      Allowed values:
      - `visa`
      - `mastercard`
      - `amex`
      - `maestro`
      - `discover`
      - `jcb`
      - `diners-club`
      """)
    @example("visa mastercard amex")
    valid_card_types?: string = "visa mastercard amex";

    @doc("""
      Text-to-speech voice to use. Please refer to [TTS documentation](/docs/platform/voice/tts) for more information.
      When `voice` is not set, `say_voice` is used. When neither is set, the `say_voice` SWML variable is used
      if it is set; otherwise the voice is `woman`.
      """)
    @example("woman")
    voice?: string = "woman";
  };
}
