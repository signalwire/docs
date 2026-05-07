# SWML Inbound Message Handling

references [feature epic](https://github.com/signalwire/cloud-product/issues/18177)
references [internal documentation](https://github.com/signalwire/relay-apis/blob/6e3e2053f8e851f48dd4d5009f8d75cd5d7bb546/inbound_swml_message_handling.md) 

This ticket is intended as the source of truth for public docs - however, the internal documentation covers everything in more depth, along with internal-only details (backend infrastructure, job processing, retry behavior, feature-flag gating, and features not yet approved for publication). Consult the internal spec for clarifying behavior, or reach out to Cassie with any questions!

## What is this feature?

SWML now supports handling **inbound messages**, in addition to its existing support for calls, conferences, and AI Agents. When a message arrives on a phone number configured with a SWML message handler, SignalWire fetches and processes the SWML document, and optionally sends an outbound reply.

This is the SWML equivalent of the existing LaML message handling system.

> [!WARNING]
> **SWML inbound message handling is only available to companies using the new or hybrid UIs/APIs.** Legacy mode companies will not get access to this feature.

## Why did we do this?

Customers using SWML for voice have asked for a single, consistent declarative format for handling both calls *and* messages on the same platform. Previously, customers who wanted inbound message handling had to fall back to LaML. This feature gives them a SWML-native path with more expressive flow control (sections, subroutines, variable expansion, branching, retry loops, external HTTP requests) than LaML offers for messaging.

## Changes requested

1. **Add a new "SWML Inbound Message Handling" page** under the SWML documentation section.
2. **Extend the existing SWML schema reference** to include the message-handling methods (`reply`, `receive`, `request`, `switch`, `execute`, `return`, `transfer`, `label`, `goto`) and the `message.*` variable context.
3. **Add examples** covering simple and full mode documents, branching, subroutines, transfers, retry loops, and media replies.
4. **Document the phone number handler assignment flow** for SWML Scripts and SWML Webhooks used for messaging.
5. **Add a LaML ↔ SWML parity reference** for common inbound message handling patterns.

## How does it work?

### Document modes

- **Simple mode** — a single top-level `reply` or `receive` key. An empty document (`{}`) is treated as an implicit `receive`.
- **Full mode** — a top-level `sections` key with named sections. Execution starts at `sections.main`. Each section contains an array of steps that execute sequentially.

### Execution semantics

- Steps execute strictly sequentially.
- `reply` does **not** end execution — subsequent steps continue to run.
- `receive` is a no-op — accepts the message without replying.
- `request` failures are **soft** — they set `request_result` but do not stop execution.
- `transfer` is a **tail call** — replaces the current document; no return.
- `execute` calls a named section as a subroutine; control returns to the caller when the section completes.
- `goto` jumps to a `label` within the current section (cannot cross subroutine boundaries).
- The script ends when all steps complete — there is no persistent state between inbound messages.

### Document Fetch
When we receive an inbound message with an external webhook SWML handler, we will POST the following body to the webhook on document fetch.

```
{
  "message": {
    "message_id": "msg-uuid",
    "project_id": "project-uuid",
    "space_id": "space-uuid",
    "direction": "inbound",
    "type": "sms",
    "from": "+15551231234",
    "to": "+15553214321",
    "body": "Hello, I need help",
    "media": [],
    "segments": 1,
    "timestamp": "2024-01-15T10:30:00Z"
  },
  "params": {}
}
```

| Field | Type | Description |
|-------|------|-------------|
| `message_id` | String | Unique message identifier |
| `project_id` | String | SignalWire project UUID |
| `space_id` | String | SignalWire space UUID |
| `direction` | String | `inbound` |
| `type` | String | `sms` or `mms` |
| `from` | String | Sender phone number (E.164) |
| `to` | String | Recipient phone number (E.164) |
| `body` | String | Message text content |
| `media` | Array | MMS media attachments |
| `segments` | Integer | Number of SMS segments |
| `timestamp` | String | ISO 8601 timestamp |

| Field | Type | Description |
|-------|------|-------------|
| `url` | String | URL to download media |
| `content_type` | String | MIME type |
| `size` | Integer | File size in bytes |

We will do the same when the `transfer` method passes a SWML Webhook URL, except the `params` will include any relevant context from the transfer method as well.

### Methods

#### `reply`
Creates and sends an outbound message in response to the inbound message.

| Parameter    | Type   | Required                       | Default                | Description                                                       |
|--------------|--------|--------------------------------|------------------------|-------------------------------------------------------------------|
| `body`       | String | Required if `media` is missing | —                      | The message body text                                             |
| `media`      | Array  | Required if `body` is missing  | `[]`                   | Array of media URLs to attach (converts to MMS, max 8)            |
| `to`         | String | No                             | Inbound message `from` | Destination phone number (E.164)                                  |
| `from`       | String | No                             | Inbound message `to`   | Sending number — must be a PhoneRoute or ShortCode in the project |
| `status_url` | String | No                             | —                      | URL for delivery status callbacks                                 |

Supports string shorthand (`reply: "text"`) and hash form. An inline `switch` is also supported for branching based on message content.

##### Status callbacks (`status_url`)

The `status_url` on `reply` registers a delivery status callback for the **outbound reply message** — not for the inbound message that triggered the SWML document. It behaves the same way as the status callback on any other outbound message sent through SignalWire.

- Fires as the outbound reply moves through delivery states.
- Callback delivery is independent of SWML execution: the SWML document completes as soon as the reply is accepted (`reply_result: "queued"`); delivery-state callbacks fire afterwards.
- If `reply` is called multiple times in a single document, each reply's `status_url` is registered independently for its own outbound message.

When the `status_url` is set, SignalWire sends an HTTP `POST` to that URL each time the outbound reply transitions to a new state. The callback payload has the following shape:

```json
{
  "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "project_id": "b2c3d4e5-f6a7-8901-bcde-f12345678901",
  "status": "delivered",
  "to": "+15551234567",
  "from": "+15559876543",
  "body": "Hello World!",
  "number_of_segments": 1,
  "timestamp": "2026-03-17T22:26:57Z",
  "error_code": null,
  "error_message": null
}
```

**Possible `status` values:**

| Status        | Description                                                                   |
|---------------|-------------------------------------------------------------------------------|
| `queued`      | Message has been created and queued for delivery.                             |
| `initiated`   | Message delivery has been initiated.                                          |
| `sent`        | Message has been sent to the carrier network.                                 |
| `delivered`   | Message was successfully delivered to the recipient.                          |
| `undelivered` | Message could not be delivered to the recipient.                              |
| `failed`      | Message delivery failed. Check `error_code` and `error_message` for details.  |
| `read`        | Message has been read by the recipient (when supported by the channel).       |

#### `receive`
Accepts the inbound message without sending a reply. No parameters.

#### `request`
Makes an HTTP request to an external URL. Response can optionally be parsed into variables for use in later steps.

| Parameter        | Type          | Required | Default | Description                                              |
|------------------|---------------|----------|---------|----------------------------------------------------------|
| `url`            | String        | Yes      | —       | URL to request                                           |
| `method`         | String        | No       | `POST`  | HTTP method                                              |
| `headers`        | Hash          | No       | `{}`    | HTTP headers                                             |
| `body`           | Hash/String   | No       | `nil`   | Request body (JSON-encoded automatically)                |
| `timeout`        | Number        | No       | `5.0`   | Timeout in seconds (clamped to max 5)                    |
| `save_variables` | Boolean       | No       | `false` | Parse JSON response into `request_response.*` variables  |

#### `switch`
Branches based on a variable value, with optional text transforms (`lowercase`, `uppercase`, `trim`, `lowercase_trim`, `uppercase_trim`). Usable inline under `reply` (simple mode) or as a top-level step (full mode).

| Parameter   | Type   | Required | Description                                  |
|-------------|--------|----------|----------------------------------------------|
| `variable`  | String | Yes      | Variable path to match (e.g. `message.body`) |
| `transform` | String | No       | Transform to apply before matching           |
| `case`      | Hash   | Yes      | Map of values to outcomes                    |
| `default`   | Any    | No       | Fallback if no case matches                  |

#### `execute`
Calls a named section as a subroutine.

| Parameter | Type   | Required | Description                                               |
|-----------|--------|----------|-----------------------------------------------------------|
| `dest`    | String | Yes      | Name of the section to execute                            |
| `params`  | Hash   | No       | Parameters accessible as `params.*` in the called section |

#### `return`
Returns from the current section. When used inside a subroutine, control returns to the caller with an optional `return_value`. In `main`, stops execution entirely.

#### `transfer`
Fetches and executes a new SWML document from a URL. **Tail call — does not return.**

| Parameter | Type   | Required | Default | Description                          |
|-----------|--------|----------|---------|--------------------------------------|
| `dest`    | String | Yes      | —       | URL to fetch the new SWML document   |
| `method`  | String | No       | `POST`  | HTTP method                          |
| `params`  | Hash   | No       | `{}`    | Parameters included in request body  |

#### `label` / `goto`
`label` marks a position in the current section. `goto` jumps to a named label (same section only).

| `goto` Parameter | Type    | Required | Default | Description                             |
|------------------|---------|----------|---------|-----------------------------------------|
| `label`          | String  | Yes      | —       | Name of the label to jump to            |
| `max`            | Integer | No       | `100`   | Maximum number of jumps before stopping |

### Variable expansion

SWML supports `%{variable.path}` placeholders in string values. Variables are expanded after the document is parsed, before methods execute. Expansion is **pure substitution only** — no expressions, method calls, or operators. Unresolvable paths are replaced with an empty string.

**Available variables:**

| Variable                  | Description                                                                        |
|---------------------------|------------------------------------------------------------------------------------|
| `message.to`              | Destination number                                                                 |
| `message.from`            | Sender number                                                                      |
| `message.body`            | Message body text                                                                  |
| `message.project_id`      | Associated project ID                                                              |
| `message.kind`            | Message kind (`sms`, `mms`)                                                        |
| `message.status`          | Message status                                                                     |
| `params.*`                | Parameters passed via `execute` or `transfer`                                      |
| `return_value`            | Value returned by the last `execute` subroutine via `return`                       |
| `request_result`          | Result of last `request`: `"success"`, `"failed"`, `"timeout"`, `"limit_exceeded"` |
| `request_response.*`      | Parsed JSON response (when `save_variables: true`)                                 |
| `request_response_code`   | HTTP status code from last `request`                                               |
| `request_response_body`   | Raw response body from last `request` (truncated to 64 KB)                         |
| `reply_result`            | Result of last `reply`: `"queued"` or `"failed"`                                   |
| `reply_message_id`        | Message segment ID of last successful `reply`                                      |

### Platform limits

| Limit                           | Value     | On Exceed                                        |
|---------------------------------|-----------|--------------------------------------------------|
| Max steps per message           | 100       | Stop execution                                   |
| Max goto iterations (per label) | 100       | Stop execution                                   |
| Max request calls               | 10        | Skip request, `request_result: "limit_exceeded"` |
| Max request timeout             | 5 seconds | `request_result: "timeout"`                      |
| Max `request_response_body`     | 64 KB     | Truncate                                         |
| Max media attachments per reply | 8         | Reply fails                                      |

## How do customers assign a SWML Script or Webhook as a message handler?

SWML message handlers can be assigned through the dashboard or via API.

**Dashboard — Phone Number Settings:**
1. Navigate to **Phone Numbers** in the dashboard
2. Select the phone number to configure
3. Under **Message Handling**, assign a SWML Script or SWML Webhook

**API — assign a resource to a phone number:**

```
POST /api/fabric/resources/:resource_id/phone_routes
```

| Parameter        | Type   | Required | Description                                        |
|------------------|--------|----------|----------------------------------------------------|
| `resource_id`    | UUID   | Yes      | Path param — the ID of the SWML resource           |
| `phone_route_id` | UUID   | Yes      | The phone route to assign the handler to           |
| `handler`        | String | Yes      | `"messaging"` for message handling                 |

**SWML Scripts** use a `script_type` field (`"calling"` or `"messaging"`) on the `POST /api/fabric/resources/swml_scripts` and corresponding `PUT` endpoints.

**SWML Webhooks** use a `used_for` field (`"calling"` or `"messaging"`) on the `POST /api/fabric/resources/swml_webhooks` and corresponding `PUT` endpoints.

When adding a phone number address from a resource's detail page, the handler type is inferred from the resource's `script_type` / `used_for` field. When assigning via the Phone Route page or the API above, the handler type is specified explicitly.

## What happens on failure? How do customers see their inbound messages and outbound replies?

**Visibility:**
- Inbound messages appear in the Messaging logs with their status (`received`, `failed`) and, if failed, an `error_code` and `error_message`.
- Outbound replies created by a successful `reply` step appear as standard outbound messages.
- For programmatic access, customers can list messages via `GET /api/messaging/logs` and look up an individual message (inbound or outbound) via `GET /api/messaging/logs/:id`.

**Failure behavior:**
- If the SWML document fails to fetch, parse, or execute, the inbound message is marked as `failed` with an error code describing the cause.
- Transient document-fetch errors (network/timeout) are automatically retried; deterministic errors (invalid document, validation failures) are not.
- `reply` validation failures (invalid `from`, invalid `to`, missing body/media, exceeds character limit, inactive campaign, etc.) mark the inbound message as `failed` with a specific error code and do **not** create a partial outbound message.
- `request` HTTP failures are soft — they set `request_result` so the document can branch on them without failing the message.

**Customer-visible error codes** (non-exhaustive; full list to include in the rendered page):

| Error Code                                | Meaning                                                         |
|-------------------------------------------|-----------------------------------------------------------------|
| `unrouteable_message`                     | Unrouteable message received                                    |
| `insufficient_balance`                    | Insufficient account balance to receive the message             |
| `message_filtered`                        | Message filtered                                                |
| `http_retrieval_error`                    | SWML document retrieval timed out or failed                     |
| `url_failed_to_parse`                     | Provided URL could not be parsed                                |
| `json_or_yaml_required`                   | Document must be valid JSON or YAML                             |
| `swml_invalid_document`                   | Document may only contain one of `reply`, `receive`, `sections` |
| `swml_missing_entry_point`                | Document must contain `reply`, `receive`, or `sections`         |
| `swml_invalid_section_format`             | `main` section must be an array of steps                        |
| `swml_unsupported_method`                 | Unsupported SWML method                                         |
| `swml_reply_failed`                       | Failed to create reply message                                  |
| `swml_reply_media_limit_exceeded`         | Reply exceeds the 8-media-attachment maximum                    |
| `swml_reply_body_or_media_required`       | Reply must have a body or media                                 |
| `swml_reply_invalid_from_number`          | Reply `from` is not a valid number in this project              |
| `swml_reply_invalid_to_number`            | Reply `to` has an invalid format                                |
| `swml_reply_missing_messaging_capability` | Reply `from` is not SMS/MMS-capable                             |
| `swml_reply_character_limit_exceeded`     | Reply body exceeds the character limit                          |
| `swml_reply_inactive_campaign`            | Reply `from` must belong to an active campaign                  |
| `swml_switch_no_match`                    | `switch` matched no case and no `default` was provided          |
| `swml_switch_invalid_transform`           | `switch` used an invalid transform                              |
| `swml_section_not_found`                  | Referenced section not found                                    |
| `swml_transfer_failed`                    | `transfer` destination is required                              |
| `swml_transfer_fetch_failed`              | Failed to fetch the transferred SWML document                   |
| `swml_transfer_document_invalid`          | Transferred SWML document is invalid                            |
| `swml_goto_label_not_found`               | `goto` label not found in current section                       |
| `swml_request_url_required`               | `request` URL is required                                       |


## LaML vs SWML Parity

A few examples to serve as a starter parity reference - this is non exhaustive, but covers some of the common LaML inbound message handling cases.

### Simple Reply

**LaML:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Message>Thanks for your message!</Message>
</Response>
```

**SWML:**
```yaml
reply: "Thanks for your message!"
```

### Reply with Media

**LaML:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Message>
    <Body>Here's the document you requested</Body>
    <Media>https://example.com/document.pdf</Media>
  </Message>
</Response>
```

**SWML:**
```yaml
reply:
  body: "Here's the document you requested"
  media:
    - "https://example.com/document.pdf"
```

### Reply with Status Callback

**LaML:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Message statusCallback="https://example.com/status">
    Your order is confirmed
  </Message>
</Response>
```

**SWML:**
```yaml
reply:
  body: "Your order is confirmed"
  status_url: "https://example.com/status"
```

### Forward Message

**LaML:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response>
   <Message to="+1223334444" from="+12223334444"> Your number {{To}} got a message from {{From}}! The body was: {{Body}}</Message>
</Response>
```

**SWML:**
```json
{
   "reply": {
      "to": "+1223334444",
      "from": "+12223334444",
      "body": "Your number %{message.to} got a message from %{message.from}! The body was: %{message.body}"
   }
}
```