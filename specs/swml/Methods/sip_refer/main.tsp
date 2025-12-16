@summary("SIPRefer object")
model SIPRefer {
  @summary("sip_refer")
  @doc("Send SIP REFER to a SIP call.")
  sip_refer: {
    @doc("The SIP URI to send the REFER to.")
    @example("sip:user@example.com")
    to_uri: string;

    @doc("The HTTP or HTTPS URL to send status callback events to.")
    @example("https://example.com/refer-status")
    status_url?: url;

    @doc("SIP authentication username")
    @example("sipuser")
    sip_auth_username?: string;

    @doc("SIP authentication password")
    @example("sippassword")
    sip_auth_password?: string;
  };
}
