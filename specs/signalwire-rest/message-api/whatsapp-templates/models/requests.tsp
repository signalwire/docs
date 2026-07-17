import "./core.tsp";

using TypeSpec.Http;
using Types;

@doc("Query parameters for listing templates.")
model ListWhatsAppTemplatesQuery {
  @query
  @doc("Filter to templates belonging to a specific WhatsApp Business Account.")
  whatsapp_business_id?: uuid;

  @query
  @doc("Filter by approval status.")
  status?: WhatsAppTemplateStatus;
}

@doc("Request body for creating a message template.")
model CreateWhatsAppTemplateRequest {
  @doc("The WhatsApp Business Account the template belongs to. List your accounts at `GET /api/messaging/whatsapp/businesses`.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  whatsapp_business_id: uuid;

  @doc("The template name. Maximum 512 characters; lowercase letters, numbers, and underscores only.")
  @maxLength(512)
  @pattern("^[a-z0-9_]*$")
  @example("order_update")
  name: string;

  @doc("The template language code.")
  @example("en_US")
  language: string;

  @doc("The template category.")
  @example(WhatsAppTemplateCategory.utility)
  category: WhatsAppTemplateCategory;

  @doc("How the template's variable placeholders are referenced.")
  @example(WhatsAppTemplateParameterFormat.positional)
  parameter_format: WhatsAppTemplateParameterFormat;

  @doc("The template's components. Must include a `BODY` component. Each component is an object whose fields depend on its `type` — see the request example.")
  @example(#[
    #{
      type: "HEADER",
      format: "TEXT",
      text: "Order Update for {{1}}",
      example: #{ header_text: #["Jane Smith"] },
    },
    #{
      type: "BODY",
      text: "Your order {{1}} is currently {{2}}.",
      example: #{ body_text: #[#["ORD-9821", "out for delivery"]] },
    },
    #{
      type: "FOOTER",
      text: "Thank you for shopping with us.",
    },
    #{
      type: "BUTTONS",
      buttons: #[
        #{ type: "QUICK_REPLY", text: "Track Order" },
        #{ type: "URL", text: "Contact Support", url: "https://example.com/support" },
      ],
    },
  ])
  components: WhatsAppTemplateComponent[];
}

@doc("Request body for updating a template. Provide `category`, `components`, or both. A template can only be updated while it is not yet approved.")
model UpdateWhatsAppTemplateRequest {
  @doc("The updated template category. Required if `components` is omitted.")
  @example(WhatsAppTemplateCategory.marketing)
  category?: WhatsAppTemplateCategory;

  @doc("The updated components. Required if `category` is omitted.")
  components?: WhatsAppTemplateComponent[];
}
