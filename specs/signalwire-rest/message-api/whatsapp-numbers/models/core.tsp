import "../../../types";

using TypeSpec.Http;
using Types;

@doc("Path parameter identifying a WhatsApp number by its SignalWire ID.")
model WhatsAppNumberPathID {
  @doc("The SignalWire identifier of the WhatsApp number.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

@doc("A WhatsApp phone number connected to your Space. Numbers are linked during the Meta embedded signup flow and used as the `from` address when sending messages.")
model WhatsAppNumber {
  @doc("The SignalWire identifier of the WhatsApp number.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  id: uuid;

  @doc("The Meta phone number ID for this WhatsApp number.")
  @example("102290129340398")
  business_phone_number_id: string;

  @doc("The WhatsApp number, prefixed with `whatsapp:`. Use this value as the `from` address when sending messages.")
  @example("whatsapp:+15557654321")
  phone_number: string;

  @doc("The ID of the resource (Call Flow, AI Agent, SWML script, etc.) that handles inbound calls to this number. Null if no calling handler is configured.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  calling_handler_resource_id: uuid | null;

  @doc("The ID of the resource that handles inbound messages to this number. Null if no messaging handler is configured.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  messaging_handler_resource_id: uuid | null;

  @doc("The business name as registered with Meta.")
  @example("Acme, Inc.")
  business_name: string | null;

  @doc("The WhatsApp Business Account ID (WABA ID) assigned by Meta.")
  @example("109876543210987")
  waba_id: string;

  @doc("The SignalWire identifier of the WhatsApp Business Account this number belongs to.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  whatsapp_business_id: uuid;

  @doc("Whether SIP calling is enabled for this number.")
  @example(false)
  voice_enabled: boolean;

  @doc("Whether this number can place and receive calls — true when a calling handler is configured and voice is enabled.")
  @example(false)
  voice_capable: boolean;

  @doc("The date and time when the record was created.")
  @example("2024-01-15T10:30:00Z")
  created_at: string;

  @doc("The date and time when the record was last updated.")
  @example("2024-01-15T10:30:00Z")
  updated_at: string;
}
