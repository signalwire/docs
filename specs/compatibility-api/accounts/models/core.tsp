using TypeSpec.Http;

model AccountPathSid {
  @doc("The Project ID that uniquely identifies the Project to retrieve.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  Sid: string;
}

@doc("The status of the Project.")
enum AccountStatus {
  Active: "active",
  Suspended: "suspended",
  Closed: "closed",
}

@doc("The type of the Project.")
enum AccountType {
  Trial: "Trial",
  Full: "Full",
}

@doc("A Map of sub-resources that are linked to the given Project.")
model SubresourceUris {
  @doc("URI for available phone numbers.")
  @format("uri")
  available_phone_numbers?: string;

  @doc("URI for calls.")
  @format("uri")
  calls?: string;

  @doc("URI for conferences.")
  @format("uri")
  conferences?: string;

  @doc("URI for incoming phone numbers.")
  @format("uri")
  incoming_phone_numbers?: string;

  @doc("URI for notifications.")
  @format("uri")
  notifications?: string;

  @doc("URI for outgoing caller IDs.")
  @format("uri")
  outgoing_caller_ids?: string;

  @doc("URI for recordings.")
  @format("uri")
  recordings?: string;

  @doc("URI for transcriptions.")
  @format("uri")
  transcriptions?: string;

  @doc("URI for addresses.")
  @format("uri")
  addresses?: string;

  @doc("URI for signing keys.")
  @format("uri")
  signing_keys?: string;

  @doc("URI for connect apps.")
  @format("uri")
  connect_apps?: string;

  @doc("URI for SIP.")
  @format("uri")
  sip?: string;

  @doc("URI for authorized connect apps.")
  @format("uri")
  authorized_connect_apps?: string;

  @doc("URI for usage.")
  @format("uri")
  usage?: string;

  @doc("URI for keys.")
  @format("uri")
  keys?: string;

  @doc("URI for applications.")
  @format("uri")
  applications?: string;

  @doc("URI for short codes.")
  @format("uri")
  short_codes?: string;

  @doc("URI for queues.")
  @format("uri")
  queues?: string;

  @doc("URI for messages.")
  @format("uri")
  messages?: string;
}

@doc("Account/Project model representing a SignalWire project.")
model Account {
  @doc("The authorization token for this Project. This token should be kept a secret and is not returned in a normal request.")
  @example("Redacted")
  auth_token?: string;

  @doc("The date, in RFC 2822 GMT format, this Project was created.")
  @example("Sat, 15 Sept 2018 10:00:00 +0000")
  date_created?: string;

  @doc("The date, in RFC 2822 GMT format, this Project was updated.")
  @example("Sat, 16 Sept 2018 10:00:00 +0000")
  date_updated?: string;

  @doc("The name of the Project, up to 250 characters long.")
  @example("My Project")
  friendly_name?: string;

  @doc("The Project ID that uniquely identifies the parent of the Project.")
  @format("uuid")
  owner_account_sid?: string;

  @doc("The Project ID that uniquely identifies the Project.")
  @format("uuid")
  sid?: string;

  @doc("The status of the Project. Possible values are: active, suspended, or closed.")
  status?: string;

  @doc("Whether or not the project is a sub-project.")
  subproject?: boolean;

  @doc("A Map of sub-resources that are linked to the given Project.")
  subresource_uris?: SubresourceUris;

  @doc("The type of the Project. Possible values are: Trial and Full.")
  @example("Full")
  type?: string;

  @doc("The URI for the Project.")
  @format("uri")
  uri?: string;
}
