import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
import "./parameters.tsp";
import "./prompt/main.tsp";

using TypeSpec.JsonSchema;

model Pay {
  @doc("""
    The `pay` object. Enables secure payment processing during a call.
     When implemented, it handles the complete payment flow including data collection, validation, and processing through your configured
     payment gateway.
    """)
  pay: {
    @doc("""
      The URL to make POST requests with all the gathered payment details.
      This URL is used to process the final payment transaction and return the results through the response.
      
      Visit https://developer.signalwire.com//swml/methods/pay/payment_connector_url for more important information.
      """)
    payment_connector_url: url;

    @doc("The amount to charge against payment method passed in the request. `Float` value with no currency prefix passed as string.")
    charge_amount?: string;

    @doc("Uses the ISO 4217 currency code of the charge amount. Default is `usd`.")
    currency?: string;

    @doc("Custom description of the payment provided in the request.")
    description?: string;

    @doc("The method of how to collect the payment details. Currently only `dtmf` mode is supported.")
    input?: "dtmf";

    @doc("""
      The language of the payment prompt. Default is `en-US`.
      
      Supported languages can be found here: https://developer.signalwire.com/swml/methods/pay/language
      """)
    language?: string;

    @doc("Number of times the `pay` method will retry to collect payment details. Default is `1`.")
    max_attempts?: integer | SWMLVar;

    @doc("The minimum length of the postal code the user must enter. Default is `0`.")
    min_postal_code_length?: integer | SWMLVar;

    @doc("Array of parameter objects to pass to your payment processor. The parameters are user-defined key-value pairs.")
    parameters?: PayParameters[];

    @doc("Indicates the payment method which is going to be used in this payment request. Currently only `credit-card` is supported.")
    payment_method?: "credit-card";

    @doc("Takes `true`, `false` or real postalcode (if it's known beforehand) to let pay method know whether to prompt for postal code.")
    postal_code?: boolean | string;

    @doc("Array of prompt objects for customizing the audio prompts during different stages of the payment process.")
    prompts?: PayPrompts[];

    @doc("Takes true or false to let pay method know whether to prompt for security code. Default is `true`.")
    security_code?: boolean | SWMLVar;

    @doc("""
      The URL to send requests for each status change during the payment process.
      
      See http://localhost:3000/swml/methods/pay#status_url_request_body for more important information.
      """)
    status_url?: url;

    @doc("Limit in seconds that pay method waits for the caller to press another digit before moving on to validate the digits captured.")
    timeout?: integer | SWMLVar;

    @doc("""
      Whether the payment is a one off payment or re-occurring. Default is `reusable`.
      
      Allowed values: 
      - `one-time`
      - `reusable`
      """)
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
    error_type?: string;

    @doc("Text-to-speech voice to use. Defaults is 'woman'. Please refer to https://developer.signalwire.com//voice/getting-started/voice-and-languages for more information.")
    voice?: string;
  };
}
