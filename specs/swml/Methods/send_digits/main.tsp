@summary("SendDigits object")
model SendDigits {
  @summary("send_digits")
  @doc("Send DTMF digits.")
  send_digits: {
    @doc("The DTMF digits to send.")
    digits: string;
  };
}
