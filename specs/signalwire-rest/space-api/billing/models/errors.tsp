import "../../../types/status-codes";

using Types.StatusCodes;

namespace SignalWireAPI.Space;

@doc("""
  The request failed validation. `contact_email` was not an array
  (`contact_email_must_be_array`), was empty (`contact_email_missing`), or held an
  address that is not a valid email address (`contact_email_address_invalid`); a
  required field was blank; `tax_id_number` was omitted on a space that requires it;
  or a postpay space tried to set `monthly_invoices` to `false` (`monthly_invoices_locked`).
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "contact_email_address_invalid",
      message: "billing@example is not a valid email address.",
      attribute: "contact_email",
      url: "https://signalwire.com/docs/apis/error-codes#contact_email_address_invalid",
    }
  ],
})
model UpdateBillingProfileStatusCode422 is StatusCode422;

@doc("""
  `month` is not formatted `YYYY-MM` (`invalid_month`), is before the month the space was
  created (`month_precedes_space_creation`), or is after the current month
  (`month_is_in_the_future`).
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "month_precedes_space_creation",
      message: "Month is before this space existed.",
      attribute: "month",
      url: "https://signalwire.com/docs/apis/error-codes#month_precedes_space_creation",
    }
  ],
})
model BillingMonthStatusCode422 is StatusCode422;

@doc("""
  `month` is not formatted `YYYY-MM` (`invalid_month`), is before the month the space was
  created (`month_precedes_space_creation`), or is after the current month
  (`month_is_in_the_future`); or the month has not closed yet, so no PDF exists for it
  (`pdf_requires_a_closed_month`).
  """)
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "pdf_requires_a_closed_month",
      message: "A PDF statement is only available for a closed month.",
      attribute: "month",
      url: "https://signalwire.com/docs/apis/error-codes#pdf_requires_a_closed_month",
    }
  ],
})
model BillingStatementPdfStatusCode422 is StatusCode422;

@doc("`page_number` is above 0 without a `page_token` (`page_token_required`), or a date filter could not be parsed.")
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "page_token_required",
      message: "A page token is required if the page_number value is greater than 0.",
      attribute: "page_token",
      url: "https://signalwire.com/docs/apis/error-codes#page_token_required",
    }
  ],
})
model PaymentHistoryStatusCode422 is StatusCode422;

@doc("The card is the active auto top-up source (`payment_method_is_active_topup_source`). Change or disable auto top-up with [Update low balance settings](/docs/apis/rest/space/balance/update-low-balance-setting) first.")
@example(#{
  statusCode: 422,
  errors: #[
    #{
      type: "validation_error",
      code: "payment_method_is_active_topup_source",
      message: "This payment method is the active auto top-up source and cannot be deleted.",
      attribute: null,
      url: "https://signalwire.com/docs/apis/error-codes#payment_method_is_active_topup_source",
    }
  ],
})
model DeletePaymentMethodStatusCode422 is StatusCode422;
