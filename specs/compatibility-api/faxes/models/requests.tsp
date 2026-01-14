using TypeSpec.Http;

@doc("Request body for sending a fax.")
model SendFaxRequest {
  @doc("The URL hosting the received media.")
  @example("https://example.com/fax.pdf")
  MediaUrl: string;

  @doc("The phone number, in E.164 format, the fax was sent to.")
  @example("+13104456789")
  To: string;

  @doc("The phone number, in E.164 format, the fax was sent from.")
  @example("+13103383454")
  From: string;

  @doc("The quality of the fax.")
  @example("standard")
  Quality?: "standard" | "fine" | "superfine";

  @doc("The URL to send a `POST` request when the status of a fax changes.")
  @example("https://your-api-endpoint.com/path")
  StatusCallback?: string;
}

@doc("Request body for updating a fax.")
model UpdateFaxRequest {
  @doc("The status of the fax.")
  @example("canceled")
  Status?: "queued" | "processing" | "sending" | "delivered" | "receiving" | "received" | "no-answer" | "busy" | "failed" | "canceled";
}
