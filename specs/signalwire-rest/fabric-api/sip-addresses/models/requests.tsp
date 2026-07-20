import "./core.tsp";
import "../../../_globally_shared/enums.tsp";
import "../enums.tsp";

model SipAddressCreateRequest {
  @doc("URL-safe name for the SIP address — lowercase letters, numbers, and hyphens only (no spaces or other special characters). Must be unique within the project and is used to build the address's SIP URI.")
  @example("sales-line")
  @maxLength(50)
  @pattern("^[a-z0-9]+(-[a-z0-9]+)*$")
  name: string;

  @doc("SIP username used to reach this address (no spaces). Defaults to `*`, which accepts any username.")
  @example("agent")
  user?: string = "*";

  @doc("ID of the Domain this address should be grouped under. Defaults to your project's default Domain.")
  @example("9c8b7a6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d")
  context_id?: uuid;

  @doc("ID of the resource that handles inbound calls to this address. Must reference a resource in the caller's project.")
  @example("1f2e3d4c-5b6a-7980-a1b2-c3d4e5f60718")
  calling_handler_resource_id: uuid;

  @doc("Whether to enforce IP authentication for this address.")
  @example(true)
  ip_auth_enabled?: boolean = false;

  @doc("Whitelisted IP/CIDR entries. Required (at least one) when `ip_auth_enabled` is `true`. Maximum 256 entries.")
  @example(#["10.0.0.0/24"])
  @maxItems(256)
  ip_auth?: string[] = #[];

  @doc("Non-empty subset of enabled codecs.")
  @example(#[SipAddressCodec.OPUS])
  @minItems(1)
  codecs?: SipAddressCodec[] = #[SipAddressCodec.PCMU, SipAddressCodec.PCMA];

  @doc("Non-empty subset of enabled SRTP ciphers.")
  @example(#[Ciphers.AES_256_CM_HMAC_SHA1_80])
  @minItems(1)
  ciphers?: Ciphers[] = #[
    Ciphers.AEAD_AES_256_GCM_8,
    Ciphers.AES_256_CM_HMAC_SHA1_80,
    Ciphers.AES_CM_128_HMAC_SHA1_80,
    Ciphers.AES_256_CM_HMAC_SHA1_32,
    Ciphers.AES_CM_128_HMAC_SHA1_32
  ];

  @doc("SRTP encryption requirement for calls to this address.")
  @example(SipAddressEncryption.Required)
  encryption?: SipAddressEncryption = SipAddressEncryption.Optional;

  @doc("Write-only SIP registration password. Never returned in any response.")
  @example("sup3r-s3cret")
  password?: string;
}

model SipAddressUpdateRequest {
  @doc("URL-safe name for the SIP address — lowercase letters, numbers, and hyphens only (no spaces or other special characters). Must be unique within the project. Defaults to the current value when omitted.")
  @example("renamed-line")
  @maxLength(50)
  @pattern("^[a-z0-9]+(-[a-z0-9]+)*$")
  name?: string;

  @doc("SIP username used to reach this address (no spaces).")
  @example("agent")
  user?: string;

  @doc("ID of the Domain this address should be grouped under. Defaults to the address's current Domain when omitted.")
  @example("9c8b7a6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d")
  context_id?: uuid;

  @doc("Whether to enforce IP authentication for this address.")
  @example(true)
  ip_auth_enabled?: boolean;

  @doc("Whitelisted IP/CIDR entries. Required (at least one) when `ip_auth_enabled` is `true`. Maximum 256 entries.")
  @example(#["10.0.0.0/24"])
  @maxItems(256)
  ip_auth?: string[];

  @doc("Non-empty subset of enabled codecs.")
  @example(#[SipAddressCodec.OPUS])
  @minItems(1)
  codecs?: SipAddressCodec[];

  @doc("Non-empty subset of enabled SRTP ciphers.")
  @example(#[Ciphers.AES_256_CM_HMAC_SHA1_80])
  @minItems(1)
  ciphers?: Ciphers[];

  @doc("SRTP encryption requirement for calls to this address.")
  @example(SipAddressEncryption.Required)
  encryption?: SipAddressEncryption;

  @doc("Write-only SIP registration password. Never returned in any response.")
  @example("sup3r-s3cret")
  password?: string;
}
