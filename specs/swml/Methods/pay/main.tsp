import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
import "./parameters.tsp";
import "./prompt/main.tsp";

using TypeSpec.JsonSchema;

model Pay {
  @doc("""
    Enables secure payment processing during voice calls. When implemented, it manages the entire payment flow
    including data collection, validation, and processing through your configured payment gateway.
    """)
  pay: {
    @doc("""
      The URL to make POST requests with all the gathered payment details.
      This URL is used to process the final payment transaction and return the results through the response.

      Visit https://developer.signalwire.com/swml/methods/pay/payment_connector_url for more important information.
      """)
    @example("https://example.com/payment-connector")
    payment_connector_url: url;

    @doc("The amount to charge against payment method passed in the request. `Float` value with no currency prefix passed as string.")
    @example("29.99")
    charge_amount?: string;

    @doc("Uses the ISO 4217 currency code of the charge amount. Default is `usd`.")
    @example("usd")
    currency?: string;

    @doc("Custom description of the payment provided in the request.")
    @example("Monthly subscription payment")
    description?: string;

    @doc("The method of how to collect the payment details. Currently only `dtmf` mode is supported.")
    @example("dtmf")
    input?: "dtmf";

    @doc("Language to use for prompts being played to the caller by the `pay` method. Default is `en-US`.")
    @example("en-US")
    language?: string;

    @doc("Number of times the `pay` method will retry to collect payment details. Default is `1`.")
    @example(3)
    max_attempts?: integer | SWMLVar;

    @doc("The minimum length of the postal code the user must enter. Default is `0`.")
    @example(5)
    min_postal_code_length?: integer | SWMLVar;

    @doc("Array of parameter objects to pass to your payment processor. The parameters are user-defined key-value pairs.")
    parameters?: PayParameters[];

    @doc("Indicates the payment method which is going to be used in this payment request. Currently only `credit-card` is supported.")
    @example("credit-card")
    payment_method?: "credit-card";

    @doc("Takes `true`, `false` or real postalcode (if it's known beforehand) to let pay method know whether to prompt for postal code.")
    @example(true)
    postal_code?: boolean | string;

    @doc("Array of prompt objects for customizing the audio prompts during different stages of the payment process.")
    prompts?: PayPrompts[];

    @doc("Takes true or false to let pay method know whether to prompt for security code. Default is `true`.")
    @example(true)
    security_code?: boolean | SWMLVar;

    @doc("""
      The URL to send requests for each status change during the payment process.

      See http://localhost:3000/swml/methods/pay#status_url_request_body for more important information.
      """)
    @example("https://example.com/payment-status")
    status_url?: url;

    @doc("Limit in seconds that pay method waits for the caller to press another digit before moving on to validate the digits captured.")
    @example(5)
    timeout?: integer | SWMLVar;

    @doc("""
      Whether the payment is a one off payment or re-occurring. Default is `reusable`.

      Allowed values:
      - `one-time`
      - `reusable`
      """)
    @example("one-time")
    token_type?: "one-time" | "reusable";

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
    valid_card_types?: string;

    @doc("""
      Space-separated list of error types this prompt applies to.

      Allowed Error Types:
      - `payment-card-number` - Collect the payment card number.
      - `expiration-date` - Collect the payment card expiration date.
      - `security-code` - Collect the payment card security code.
      - `postal-code` - Collect the payment card postal code.
      - `payment-processing` - The step used during the payment processing.
      - `payment-completed` - The step used when the payment is completed.
      - `payment-failed` - The step used when the payment fails.
      - `payment-canceled` - The step used when the payment is cancelled.
      """)
    @example("payment-card-number expiration-date")
    error_type?: string;

    @doc("Text-to-speech voice to use. Defaults is 'woman'. Please refer to https://developer.signalwire.com//voice/getting-started/voice-and-languages for more information.")
    @example("woman")
    voice?: string;
  };
}
