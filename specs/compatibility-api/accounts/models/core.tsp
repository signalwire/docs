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
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/AvailablePhoneNumbers.json")
  available_phone_numbers?: string;

  @doc("URI for calls.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls.json")
  calls?: string;

  @doc("URI for conferences.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Conferences.json")
  conferences?: string;

  @doc("URI for incoming phone numbers.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/IncomingPhoneNumbers.json")
  incoming_phone_numbers?: string;

  @doc("URI for notifications.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Notifications.json")
  notifications?: string;

  @doc("URI for outgoing caller IDs.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/OutgoingCallerIds.json")
  outgoing_caller_ids?: string;

  @doc("URI for recordings.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Recordings.json")
  recordings?: string;

  @doc("URI for transcriptions.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Transcriptions.json")
  transcriptions?: string;

  @doc("URI for addresses.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Addresses.json")
  addresses?: string;

  @doc("URI for signing keys.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/SigningKeys.json")
  signing_keys?: string;

  @doc("URI for connect apps.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/ConnectApps.json")
  connect_apps?: string;

  @doc("URI for SIP.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/SIP.json")
  sip?: string;

  @doc("URI for authorized connect apps.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/AuthorizedConnectApps.json")
  authorized_connect_apps?: string;

  @doc("URI for usage.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Usage.json")
  usage?: string;

  @doc("URI for keys.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Keys.json")
  keys?: string;

  @doc("URI for applications.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Applications.json")
  applications?: string;

  @doc("URI for short codes.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/ShortCodes.json")
  short_codes?: string;

  @doc("URI for queues.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Queues.json")
  queues?: string;

  @doc("URI for messages.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Messages.json")
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
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  owner_account_sid?: string;

  @doc("The Project ID that uniquely identifies the Project.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  sid?: string;

  @doc("The status of the Project.")
  status?: AccountStatus;

  @doc("Whether or not the project is a sub-project.")
  @example(false)
  subproject?: boolean;

  @doc("A Map of sub-resources that are linked to the given Project.")
  subresource_uris?: SubresourceUris;

  @doc("The type of the Project.")
  type?: AccountType;

  @doc("The URI for the Project.")
  @format("uri")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af.json")
  uri?: string;
}
