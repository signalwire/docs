namespace SWML.Calling;

// Properties shared by both target forms of `sip_refer`.
model SIPReferOptions {
  @doc("The HTTP or HTTPS URL to send status callback events to.")
  @example("https://example.com/refer-status")
  status_url?: url;

  @doc("Username to use for SIP authentication.")
  @example("sipuser")
  username?: string;

  @doc("Password to use for SIP authentication.")
  @example("sippassword")
  password?: string;
}

@doc("""
  The SIP URI to send the REFER to.
  At least one of `to_uri` or `to` is required. When both are set, `to_uri` takes precedence
  unless it is empty after variable expansion.
  """)
@example("sip:user@example.com")
scalar SIPReferToUri extends string;

@doc("""
  Alias for `to_uri`: the SIP URI to send the REFER to.
  Used when `to_uri` is not set or is empty after variable expansion.
  """)
@example("sip:user@example.com")
scalar SIPReferTo extends string;

@summary("sip_refer with to_uri")
model SIPReferByToUri {
  to_uri: SIPReferToUri;
  to?: SIPReferTo;
  ...SIPReferOptions;
}

@summary("sip_refer with to")
model SIPReferByTo {
  to_uri?: SIPReferToUri;
  to: SIPReferTo;
  ...SIPReferOptions;
}

@summary("sip_refer Method")
model SIPRefer {
  @summary("sip_refer")
  @doc("""
    Send SIP REFER to a SIP call.
    Set the target with `to_uri` or its alias `to`; at least one is required.
    """)
  sip_refer: SIPReferByToUri | SIPReferByTo;
}
