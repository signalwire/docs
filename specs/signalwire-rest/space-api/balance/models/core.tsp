import "../../../types";

namespace SignalWireAPI.Space;

@doc("The HTTP method used to deliver the low balance webhook.")
enum LowBalanceWebhookMethod {
  GET,
  POST,
}

@summary("Balance")
@doc("The current balance of the space and its auto top-up state. Amounts are given in microdollars (millionths of a US dollar) and again in dollars.")
model Balance {
  @doc("The object type. Always `balance`.")
  @example("balance")
  type: "balance";

  @doc("The current balance in microdollars.")
  @example(12000000)
  balance_in_microdollars: int64;

  @doc("The current balance in US dollars. The same value as `balance_in_microdollars`.")
  @example(12.0)
  current_balance: float64;

  @doc("The low balance threshold in microdollars.")
  @example(5000000)
  low_balance_threshold_in_microdollars: int64;

  @doc("The low balance threshold in US dollars. The same value as `low_balance_threshold_in_microdollars`.")
  @example(5.0)
  low_balance_threshold: float64;

  @doc("Whether auto top-up is enabled.")
  @example(false)
  auto_topup_enabled: boolean;
}

@summary("Balance adjustment")
@doc("A change to the space balance: a top-up, an auto top-up, or a credit or debit applied by SignalWire.")
model BalanceAdjustment {
  @doc("The object type. Always `balance_adjustment`.")
  @example("balance_adjustment")
  type: "balance_adjustment";

  @doc("The unique identifier of the adjustment.")
  @example("6f708192-a3b4-4c5d-9e6f-708192a3b4c5")
  id: uuid;

  @doc("The kind of adjustment, for example `balance_top_up`, `auto_balance_top_up`, `balance_credit_by_signalwire`, `balance_debit_by_signalwire`, `coupon_code_credit`, or `sign_up_free_credit`.")
  @example("balance_top_up")
  kind: string;

  @doc("The signed amount in microdollars. Credits and debits carry the sign they were recorded with.")
  @example(25000000)
  amount_in_microdollars: int64;

  @doc("The same amount in US dollars.")
  @example(25.0)
  amount: float64;

  @doc("The date and time when the adjustment was recorded.")
  @example(utcDateTime.fromISO("2026-08-20T14:19:00Z"))
  created_at: utcDateTime;

  @doc("The last four digits of the card that was charged, or `null` when the adjustment was not charged to a card.")
  @example("4242")
  payment_method_last4: string | null;
}

@summary("Low balance setting")
@doc("How the space is notified when its balance falls below the threshold, and whether it tops itself up automatically.")
model LowBalanceSetting {
  @doc("The object type. Always `low_balance_setting`.")
  @example("low_balance_setting")
  type: "low_balance_setting";

  @doc("The balance, in microdollars, below which notifications and auto top-up trigger. Falls back to the platform default when never configured.")
  @example(6000000)
  threshold_in_microdollars: int64;

  @doc("The threshold in US dollars. The same value as `threshold_in_microdollars`.")
  @example(6.0)
  threshold: float64;

  @doc("Whether an email is sent when the balance falls below the threshold.")
  @example(true)
  send_email: boolean;

  @doc("Whether a webhook is sent when the balance falls below the threshold.")
  @example(false)
  send_webhook: boolean;

  @doc("The URL the low balance webhook is sent to, or `null` when none is set.")
  @example("https://example.com/hooks/low-balance")
  webhook_url: string | null;

  @doc("The HTTP method used for the low balance webhook, or `null` when none is set.")
  @example(LowBalanceWebhookMethod.POST)
  webhook_method: LowBalanceWebhookMethod | null;

  @doc("Whether auto top-up is enabled.")
  @example(true)
  send_topup: boolean;

  @doc("The amount, in microdollars, deposited by each auto top-up. Can be `null`.")
  @example(20000000)
  topup_amount_in_microdollars: int64 | null;

  @doc("The auto top-up amount in US dollars. The same value as `topup_amount_in_microdollars`.")
  @example(20.0)
  topup_amount: float64 | null;

  @doc("The payment method charged by auto top-up, or `null` when none is set.")
  @example("7a8b9c0d-1e2f-4304-8516-27384950a6b7")
  topup_payment_method_id: uuid | null;
}
