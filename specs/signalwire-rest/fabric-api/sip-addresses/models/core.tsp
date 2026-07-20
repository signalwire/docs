import "../../../types";
import "../../../_globally_shared/enums.tsp";
import "../../../_globally_shared/const.tsp";
import "../enums.tsp";

using TypeSpec.Http;

model SipAddressPathID {
  @doc("Unique ID of a SIP Address.")
  @example("b3f1c0a2-0f6e-4a9d-9b2a-1c2d3e4f5a6b")
  @path
  id: uuid;
}

model SipAddress {
  @doc("Unique identifier for the SIP address.")
  @example("b3f1c0a2-0f6e-4a9d-9b2a-1c2d3e4f5a6b")
  id: uuid;

  @doc("The object type. Always `sip_address`.")
  @example("sip_address")
  type: "sip_address";

  @doc("ID of the resource this address belongs to.")
  @example("8a7b6c5d-4e3f-2a1b-0c9d-8e7f6a5b4c3d")
  resource_id: uuid;

  @doc("URL-safe name for the SIP address. Used to build its SIP URI.")
  @example("support-line")
  name: string;

  @doc("Human-friendly label for the SIP address. Defaults to `name`.")
  @example("support-line")
  display_name: string;

  @doc("The Domain this address is grouped under — for example, `public` for your account's default Domain.")
  @example("public")
  context: string;

  @doc("Full SIP URI for this address.")
  @example("sip:my-space-support-line@sip.signalwire.com")
  uri: string;

  @doc("SIP username used to reach this address. `*` accepts any username.")
  @example("*")
  user: string;

  @doc("SRTP encryption requirement for calls to this address.")
  @example(SipAddressEncryption.Optional)
  encryption: SipAddressEncryption;

  @doc("Enabled codecs for calls to this address.")
  @example(#[SipAddressCodec.PCMU, SipAddressCodec.PCMA])
  codecs: SipAddressCodec[];

  @doc("Enabled SRTP ciphers for calls to this address.")
  @example(#[
    Ciphers.AEAD_AES_256_GCM_8,
    Ciphers.AES_256_CM_HMAC_SHA1_80,
    Ciphers.AES_CM_128_HMAC_SHA1_80,
    Ciphers.AES_256_CM_HMAC_SHA1_32,
    Ciphers.AES_CM_128_HMAC_SHA1_32
  ])
  ciphers: Ciphers[];

  @doc("Whether IP authentication is enforced for this address.")
  @example(false)
  ip_auth_enabled: boolean;

  @doc("Whitelisted IP/CIDR entries used when `ip_auth_enabled` is `true`.")
  @example(#[])
  ip_auth: string[];

  @doc("ID of the resource that handles inbound calls to this address.")
  @example("1f2e3d4c-5b6a-7980-a1b2-c3d4e5f60718")
  calling_handler_resource_id: uuid;

  @doc("Date and time when the SIP address was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Date and time when the SIP address was last updated.")
  @example(UTC_TIME_EXAMPLE)
  updated_at: utcDateTime;
}

model SipAddressListQuery {
  @doc("The number of results per page.")
  @query
  @minValue(1)
  @maxValue(1000)
  page_size?: int32 = 50;

  @doc("The page index, used together with `page_token`.")
  @query
  @minValue(0)
  page_number?: int32 = 0;

  @doc("Opaque cursor token from a previous response's `links.next` or `links.prev`. Begins with `PA` or `PB`.")
  @query
  page_token?: string;
}
