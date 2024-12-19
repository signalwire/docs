@doc("Ciphers")
enum CipherType {
  Type1: "AEAD_AES_256_GCM_8",
  Type2: "AES_256_CM_HMAC_SHA1_80",
  Type3: "AES_CM_128_HMAC_SHA1_80",
  Type4: "AES_256_CM_HMAC_SHA1_32",
  Type5: "AES_CM_128_HMAC_SHA1_32"
}

@doc("Codecs")
enum CodecType {
  Opus: "OPUS",
  G722: "G722",
  Pcmu: "PCMU",
  Pcma: "PCMA",
  G729: "G729",
  Vp8: "VP8",
  H264: "H264"
}

@doc("Encryption")
enum EncryptionType {
  Default: "default",
  Required: "required",
  Optional: "optional",
}

@doc("Call handler of the Sip Endpoint.")
enum CallHandlerType {
  Default: "default",
  Passthrough: "passthrough",
  BlockPstn: "block-pstn",
  RelayScript: "relay_script",
  LamlWebhook: "laml_webhook",
  LamlApplication: "laml_application",
  Dialogflow: "dialogflow",
  RelayContext: "relay_context",
  RelayConnector: "relay_connector",
  VideoRoom: "video_room",
  AiAgent: "ai_agent",
  CallFlow: "call_flow",
}

@doc("Call handler of the Sip Endpoint.")
enum CallHandlerPassthroughType {
  Default: "default",
  Passthrough: "passthrough",
  BlockPstn: "block-pstn",
}


alias CodecTypeArray = CodecType[];
alias CipherTypeArray = CipherType[];
