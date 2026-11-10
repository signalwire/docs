import "@typespec/http";
import "./core.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Space;

@doc("Request body for charging a payment method and depositing the amount to the balance.")
model CreateTopUpRequest {
  @doc("The amount to charge and deposit, in microdollars. At least 5,000,000 (5.00 USD) and a whole number of cents, so a multiple of 10,000.")
  @minValue(5000000)
  @example(25000000)
  amount_in_microdollars: int64;

  @doc("The payment method to charge. Must name a payment method on this space (`payment_method_invalid`). List them with [List payment methods](/docs/apis/rest/space/billing/list-payment-methods).")
  @example("7a8b9c0d-1e2f-4304-8516-27384950a6b7")
  payment_method_id: uuid;
}

@doc("Request body for updating low balance notifications and auto top-up. The update writes the whole setting, so omitted fields take their defaults.")
model UpdateLowBalanceSettingRequest {
  @doc("The balance, in microdollars, below which notifications and auto top-up trigger. A whole number of cents, at least 5,000,000 (5.00 USD) and at most 1,000,000,000,000 (1,000,000 USD). Defaults to the platform default when omitted.")
  @minValue(5000000)
  @maxValue(1000000000000)
  @example(6000000)
  threshold_in_microdollars?: int64;

  @doc("Whether to send an email when the balance falls below the threshold.")
  @example(true)
  send_email?: boolean = true;

  @doc("Whether to send a webhook when the balance falls below the threshold.")
  @example(false)
  send_webhook?: boolean = false;

  @doc("The URL to send the low balance webhook to. Required when `send_webhook` is `true` (`webhook_url_missing`).")
  @example("https://example.com/hooks/low-balance")
  webhook_url?: string;

  @doc("The HTTP method for the low balance webhook: `GET` or `POST`.")
  @example(LowBalanceWebhookMethod.POST)
  webhook_method?: LowBalanceWebhookMethod = LowBalanceWebhookMethod.POST;

  @doc("Whether to top the balance up automatically when it falls below the threshold. Some spaces are required to keep auto top-up on; disabling it there is rejected with `send_topup_cannot_be_disabled`.")
  @example(true)
  send_topup?: boolean = false;

  @doc("The amount, in microdollars, to deposit on each auto top-up. Required when `send_topup` is `true` (`topup_amount_missing`). A whole number of cents and at least 10,000,000 (10.00 USD).")
  @minValue(10000000)
  @example(20000000)
  topup_amount_in_microdollars?: int64;

  @doc("The payment method to charge on each auto top-up. Required when `send_topup` is `true` (`topup_payment_method_missing`) and must name a payment method on this space (`topup_payment_method_invalid`).")
  @example("7a8b9c0d-1e2f-4304-8516-27384950a6b7")
  topup_payment_method_id?: uuid;
}
