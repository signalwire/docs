import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@summary("SMSBase object")
model SMSBase {
  @doc("The phone number to send the SMS to.")
  to_number: string;

  @doc("""
    The phone number to send the SMS from.
    Default is the calling party's caller ID number.
    """)
  from_number: string;

  @doc("The region to use for the SMS.")
  region?: string;

  @doc("Array of tags to associate with the message to facilitate log searches.")
  tags?: string[];
}

@summary("SMSWithBody object")
model SMSWithBody is SMSBase {
  @doc("Required if `media` is not present. The body of the SMS message.")
  body: string;
}

@summary("SMSWithMedia object")
model SMSWithMedia is SMSBase {
  @doc("Required if `body` is not present. Array of media URLs to include in the message.")
  media: string[];

  @doc("Optional if `media` is present. The body of the SMS message.")
  body?: string;
}

alias SMSPlan = SMSWithBody | SMSWithMedia;

@summary("SendSMS object")
model SendSMS {
  @summary("send_sms")
  @doc("Send a text message to a PSTN phone number.")
  send_sms: SMSPlan;
}
