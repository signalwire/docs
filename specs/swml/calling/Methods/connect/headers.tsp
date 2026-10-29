namespace SWML.Calling;
@summary("ConnectHeaders object")
model ConnectHeaders {
  @doc("""
    The name of the header. Must be a valid SIP header name, 3 to 256 characters long, that either
    starts with `X-` or is one of `Privacy`, `P-Asserted-Identity`, or `User-to-User`.
    Names starting with `SignalWire`, `X-SignalWire`, `X-CID`, or `X-SW-Xregion` are reserved and can't be set.
    A `Privacy` header takes effect only with the value `id`, which hides the caller's number.
    """)
  @minLength(3)
  @maxLength(256)
  @example("X-Custom-Header")
  name: string;

  @doc("The value of the header. Can't be empty or contain line breaks.")
  @minLength(1)
  @example("custom-value")
  value: string;
}
