import "../../../types";

using TypeSpec.Http;
using Types;

@doc("The category of a WhatsApp message template.")
enum WhatsAppTemplateCategory {
  @doc("Transactional messages: order updates, account alerts, and similar.")
  utility: "utility",

  @doc("Promotional messages: offers, announcements, and similar.")
  marketing: "marketing",

  @doc("One-time passwords and verification codes.")
  authentication: "authentication",
}

@doc("How a template's variable placeholders are referenced.")
enum WhatsAppTemplateParameterFormat {
  @doc("Placeholders referenced by descriptive labels, e.g. `{{first_name}}`.")
  named: "named",

  @doc("Placeholders referenced by position, e.g. `{{1}}`, `{{2}}`.")
  positional: "positional",
}

@doc("The Meta approval status of a template. A template must be `approved` before it can be used to send messages.")
enum WhatsAppTemplateStatus {
  approved: "approved",
  archived: "archived",
  deleted: "deleted",
  disabled: "disabled",
  flagged: "flagged",
  in_appeal: "in_appeal",
  limit_exceeded: "limit_exceeded",
  locked: "locked",
  paused: "paused",
  pending: "pending",
  reinstated: "reinstated",
  pending_deletion: "pending_deletion",
  rejected: "rejected",
}

@doc("""
  A template component. The `type` is one of `HEADER`, `BODY`, `FOOTER`, or `BUTTONS`. Additional fields depend on the component type — for example, a `BODY` carries `text`, while `BUTTONS` carries a `buttons` array. See the create example for the full shape.
  """)
model WhatsAppTemplateComponent {
  @doc("The component type: `HEADER`, `BODY`, `FOOTER`, or `BUTTONS`.")
  @example("BODY")
  type: string;

  ...Record<unknown>;
}

@doc("Path parameter identifying a template. Accepts either the SignalWire template ID or the Meta template ID.")
model WhatsAppTemplatePathID {
  @doc("The template ID — either the SignalWire ID (a UUID) or the Meta template ID (a numeric string). Both are accepted.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: string;
}

@doc("A WhatsApp message template.")
model WhatsAppTemplate {
  @doc("The SignalWire identifier of the template.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  id: uuid;

  @doc("The template name. Lowercase letters, numbers, and underscores only.")
  @example("order_update")
  name: string;

  @doc("The template category.")
  @example(WhatsAppTemplateCategory.utility)
  category: WhatsAppTemplateCategory;

  @doc("The template's components (header, body, footer, buttons).")
  components: WhatsAppTemplateComponent[];

  @doc("The template language code.")
  @example("en_US")
  language: string;

  @doc("How the template's variable placeholders are referenced.")
  @example(WhatsAppTemplateParameterFormat.positional)
  parameter_format: WhatsAppTemplateParameterFormat;

  @doc("Meta's identifier for the template.")
  @example("1164792772433648")
  template_id: string;

  @doc("The Meta approval status of the template.")
  @example(WhatsAppTemplateStatus.approved)
  template_status: WhatsAppTemplateStatus;

  @doc("The SignalWire identifier of the WhatsApp Business Account the template belongs to.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  whatsapp_business_id: uuid;

  @doc("The date and time when the template was created.")
  @example("2024-01-15T10:30:00Z")
  created_at: string;

  @doc("The date and time when the template was last updated.")
  @example("2024-01-15T10:30:00Z")
  updated_at: string;

  @doc("The date and time when the template was discarded, if applicable.")
  @example("2024-01-15T10:30:00Z")
  discarded_at?: string;
}
