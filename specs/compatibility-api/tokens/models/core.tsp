using TypeSpec.Http;

model TokensAccountSidPath {
  @doc("The unique identifier for the project you want to use to authenticate this request.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @path
  AccountSid: uuid;
}

model TokenIdPath {
  @doc("The unique identifier of the project API token.")
  @example("ea14556a-984f-11ee-b9d1-0242ac120002")
  @path
  token_id: uuid;
}

@doc("API Token model.")
model Token {
  @doc("The unique identifier of the API Token.")
  @example("ea14556a-984f-11ee-b9d1-0242ac120002")
  id: uuid;

  @doc("The name of the API Token.")
  @example("John Doe's Token")
  @minLength(1)
  name: string;

  @doc("The permissions enabled for this token.")
  @example(#["calling", "fax", "messaging"])
  permissions: string[];
}

@doc("API Token model as returned when the token is created, including the token secret.")
model CreatedToken {
  ...Token;

  @doc("The API token secret, used as the password in HTTP Basic auth alongside the project ID. Returned only in this response and cannot be retrieved again; store it securely.")
  @example("swapi_0123456789ab0123456789ab0123456789ab")
  token: string;
}
