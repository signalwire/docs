using TypeSpec.Http;

@doc("Request body for creating a cXML Bin.")
model CreateLamlBinRequest {
  @doc("A friendly name given to the cXML bin.")
  @example("Death Star IVR")
  Name: string;

  @doc("The contents of the cXML bins.")
  @example("<Response><Say>Hello!</Say></Response>")
  Contents?: string;
}

@doc("Request body for updating a cXML Bin.")
model UpdateLamlBinRequest {
  @doc("A friendly name given to the cXML bin.")
  @example("Death Star IVR")
  Name: string;

  @doc("The contents of the cXML bins.")
  @example("<Response><Say>Hello!</Say></Response>")
  Contents?: string;
}
