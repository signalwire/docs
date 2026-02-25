import "../../../_shared/webhook/decorator.tsp";

@summary("SMS status callback")
@doc("""
  Payload sent by SignalWire to your SMS Status Callback URL when the status of an SMS/MMS message changes.

  Configure this callback using the `StatusCallback` parameter when
  [sending an outgoing message](/rest/compatibility-api/endpoints/create-message).

  There are 8 possible message statuses:

  | Status | Description |
  |--------|-------------|
  | `queued` | The API request was processed and the message is waiting to be sent. |
  | `sending` | The message is being transmitted to the nearest upstream carrier. |
  | `sent` | The nearest upstream carrier has accepted the message. |
  | `delivered` | The nearest upstream carrier confirmed receipt of the message. |
  | `undelivered` | SignalWire received notice from the upstream carrier that the message was not delivered. |
  | `failed` | SignalWire could not send the message. There is no charge for failed messages. |
  | `receiving` | SignalWire has received and is currently processing an inbound message. |
  | `received` | The inbound message has been received by a number in your account. |

  **Note:** SignalWire only marks a message as `delivered` when it receives a Delivery Receipt (DLR)
  from the receiving carrier confirming entry into the end carrier's network. `sent` means the message
  left SignalWire and reached the downstream peer. Some carriers send delayed DLRs; others send none
  at all. MMS messages never receive DLRs, so they will only ever reach `sent` status.
  """)
model SmsStatusCallbackPayload {
  @doc("""
    The current status of the message at the time of the callback.
    One of: `queued`, `sending`, `sent`, `delivered`, `undelivered`, `failed`, `receiving`, `received`.
    """)
  MessageStatus: "queued" | "sending" | "sent" | "delivered" | "undelivered" | "failed" | "receiving" | "received";

  @doc("If the message has failed or is undelivered, the error code may provide more information about what went wrong.")
  ErrorCode?: string;

  @doc("The unique ID of this message.")
  MessageSid: string;

  @doc("The unique ID of the project this message is associated with.")
  AccountSid: string;

  @doc("The From number of the message.")
  From: string;

  @doc("The To number of the message.")
  To: string;

  @doc("The body of the message.")
  Body: string;

  @doc("The number of media files that were included with the message.")
  NumMedia: int32;

  @doc("""
    The number of segments that make up the entire message.
    If the body exceeds 160 GSM-7 characters or 70 UCS-2 characters, it is automatically split into
    smaller segments that are annotated for reconstruction on the recipient handset.
    """)
  NumSegments: int32;
}

@summary("10DLC status callback")
@doc("""
  Payload sent by SignalWire to your 10DLC Status Callback URL when the state of a 10DLC registration
  object changes. Use this webhook to monitor the lifecycle of messaging brands, campaigns, number
  assignment orders, and number assignments in real time.

  ### Brand event types

  | State transition | Event type | Description |
  |------------------|------------|-------------|
  | `pending` → `completed` | `brand_activated` | The brand has been successfully verified and activated. |
  | `pending` → `unverified` | `brand_unverified` | Brand verification failed or additional information is required. |
  | `unverified` → `completed` | `brand_activated` | The brand was previously unverified but is now active. |

  ### Campaign event types

  | State transition | Event type | Description |
  |------------------|------------|-------------|
  | `pending` → `active` | `campaign_activated` | The campaign has been approved and is now active. |
  | `active` → `inactive` | `campaign_deactivated` | The campaign has been deactivated and can no longer send. |

  ### Number assignment order event types

  | State transition | Event type | Description |
  |------------------|------------|-------------|
  | `pending` → `processed` | `number_assignment_order_processed` | The order has been processed and numbers assigned. |

  ### Number assignment event types

  | State transition | Event type | Description |
  |------------------|------------|-------------|
  | `pending` → `failed` | `number_assignment_failed` | The number was not assigned to the campaign. |
  | `failed` → `pending` | `number_assignment_pending` | A failed assignment is being retried. |
  | `pending` → `completed` | `number_assignment_activated` | The number has been successfully assigned to the campaign. |
  """)
model TenDlcStatusCallbackPayload {
  @doc("The unique ID of the project this object is associated with.")
  project_id: string;

  @doc("The timestamp of when the event occurred, in ISO 8601 format.")
  event_at: string;

  @doc("The category of the event.")
  event_category: "brand" | "campaign" | "number_assignment_order" | "number_assignment";

  @doc("""
    The specific type of event that occurred.
    One of: `brand_activated`, `brand_unverified`, `campaign_activated`, `campaign_deactivated`,
    `number_assignment_order_processed`, `number_assignment_failed`, `number_assignment_pending`,
    `number_assignment_activated`.
    """)
  event_type: "brand_activated" | "brand_unverified" | "campaign_activated" | "campaign_deactivated" | "number_assignment_order_processed" | "number_assignment_failed" | "number_assignment_pending" | "number_assignment_activated";

  @doc("The current state of the object after the event. Possible values depend on the object type.")
  state: string;

  @doc("The unique identifier for the brand. Present in all event types.")
  brand_id: string;

  @doc("The unique identifier for the campaign. Present in campaign, number assignment order, and number assignment events.")
  campaign_id?: string;

  @doc("The unique identifier for the number assignment order. Present in number assignment order and number assignment events.")
  number_assignment_order_id?: string;

  @doc("The unique identifier for the number assignment. Present only in number assignment events.")
  number_assignment_id?: string;

  @doc("The unique identifier for the phone route itself. Present only in number assignment events.")
  phone_number_id?: string;

  @doc("The phone number in E.164 format. Present only in number assignment events.")
  phone_number?: string;
}
