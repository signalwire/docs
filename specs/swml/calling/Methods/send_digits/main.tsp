namespace SWML.Calling;
@summary("send_digits Method")
model SendDigits {
  @summary("send_digits")
  @doc("""
    Send digit presses as DTMF tones.
    For a live inbound call that hasn't been answered yet, the method first attempts to answer it.
    """)
  send_digits: {
    @doc("""
      The digits to send. Valid values are 0123456789*#ABCDWw; A, B, C and D can also be lowercase.
      Character W is a 1 second delay, and w is a 500ms delay.
      After variable expansion, the value must contain at least one valid character and at most 99 characters,
      counting W and w. A longer sequence is not sent.
      """)
    @example("1234#")
    digits: string;
  };
}
