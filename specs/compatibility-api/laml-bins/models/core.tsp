using TypeSpec.Http;

model LamlBinsAccountSidPath {
  @doc("The unique identifier for the account this Bin is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  AccountSid: string;
}

model LamlBinSidPath {
  @doc("The unique identifier of the cXML bin.")
  @example("5184b831-184f-4209-872d-ccdccc80f2f1")
  @format("uuid")
  @path
  Sid: string;
}

@doc("cXML Bin model.")
model LamlBin {
  @doc("The unique identifier of the cXML bin on SignalWire.")
  @format("uuid")
  @example("5184b831-184f-4209-872d-ccdccc80f2f1")
  sid?: string;

  @doc("The date and time, in ISO 8601 format, the Bin was created.")
  @example("2019-11-26T20:00:00Z")
  date_created?: string;

  @doc("The date and time, in ISO 8601 format, the Bin was updated.")
  @example("Sat, 15 Sept 2018 10:00:00 +0000")
  date_updated?: string;

  @doc("The date and time, in ISO 8601 format, the Bin was last accessed.")
  @example("2020-06-05T20:00:00Z")
  date_last_accessed?: string;

  @doc("The unique identifier for the account this Bin is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  account_sid?: string;

  @doc("A friendly name given to the cXML bin.")
  @example("Death Star IVR")
  name?: string;

  @doc("The contents of the cXML bins.")
  @example("<Response><Say>Hello!</Say></Response>")
  contents?: string;

  @doc("The unique URL to the raw contents of the cXML Application.")
  @example("https://example.signalwire.com/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/LamlBins/5184b831-184f-4209-872d-ccdccc80f2f1")
  request_url?: string;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version?: string;

  @doc("The URL of this resource.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/LamlBins/5184b831-184f-4209-872d-ccdccc80f2f1.json")
  uri?: string;
}
