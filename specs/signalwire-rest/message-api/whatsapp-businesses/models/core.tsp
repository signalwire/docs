import "../../../types";

using TypeSpec.Http;
using Types;

@doc("A WhatsApp Business Account (WABA) connected to your SignalWire Space. Each business account can have its own set of phone numbers and message templates.")
model WhatsAppBusiness {
  @doc("The SignalWire identifier for the WhatsApp Business Account. Use this value as `whatsapp_business_id` when creating or listing templates.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  whatsapp_business_id: uuid;

  @doc("The business name as registered with Meta.")
  @example("Acme, Inc.")
  business_name: string | null;

  @doc("The Meta business portfolio ID associated with the account.")
  @example("1234567890")
  business_portfolio_id: string | null;

  @doc("The WhatsApp Business Account ID (WABA ID) assigned by Meta.")
  @example("109876543210987")
  waba_id: string;

  @doc("The date and time when the record was created.")
  @example("2024-01-15T10:30:00Z")
  created_at: string;

  @doc("The date and time when the record was last updated.")
  @example("2024-01-15T10:30:00Z")
  updated_at: string;
}
