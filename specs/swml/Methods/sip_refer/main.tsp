@summary("SIPRefer object")
model SIPRefer {
  @summary("sip_refer")
  @doc("Send SIP REFER to a SIP call.")
  sip_refer: {
    @doc("The SIP URI to send the REFER to.")
    to_uri: string;

    @doc("The HTTP or HTTPS URL to send status callback events to.")
    status_url?: url;

    @doc("SIP authentication username")
    sip_auth_username?: string;

    @doc("SIP authentication password")
    sip_auth_password?: string;
  };
}
