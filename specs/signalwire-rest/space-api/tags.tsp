const ADDRESSES_TAG = "Addresses";
const ADDRESSES_TAG_METADATA = #{
  description: "Manage addresses for regulatory compliance and phone number provisioning.",
};

const CAMPAIGN_REGISTRY_TAG = "Campaign Registry (Beta)";
const CAMPAIGN_REGISTRY_TAG_METADATA = #{
  description: "Manage 10DLC campaign registration for A2P messaging compliance.",
};

const DOMAIN_APPLICATIONS_TAG = "Domain Applications";
const DOMAIN_APPLICATIONS_TAG_METADATA = #{
  description: "Manage domain applications for call handling configuration.",
};

const NUMBER_GROUPS_TAG = "Number Groups";
const NUMBER_GROUPS_TAG_METADATA = #{
  description: "Manage number groups for organizing phone numbers.",
};

const NUMBER_GROUP_MEMBERSHIP_TAG = "Number Group Membership";
const NUMBER_GROUP_MEMBERSHIP_TAG_METADATA = #{
  description: "Manage phone number memberships within number groups.",
};

const PHONE_NUMBERS_TAG = "Phone Numbers";
const PHONE_NUMBERS_TAG_METADATA = #{
  description: "Manage phone numbers for your SignalWire project.",
};

const IMPORTED_PHONE_NUMBERS_TAG = "Imported Phone Numbers";
const IMPORTED_PHONE_NUMBERS_TAG_METADATA = #{
  description: "Import and manage phone numbers from external providers.",
};

const PHONE_NUMBER_LOOKUP_TAG = "Phone Number Lookup";
const PHONE_NUMBER_LOOKUP_TAG_METADATA = #{
  description: "Look up information about phone numbers.",
};

const RECORDINGS_TAG = "Recordings";
const RECORDINGS_TAG_METADATA = #{ description: "Manage call recordings." };

const SIP_ENDPOINTS_TAG = "SIP Endpoints";
const SIP_ENDPOINTS_TAG_METADATA = #{
  description: "Manage SIP endpoints for voice communication.",
  `x-displayName`: "SIP Endpoints",
};

const SIP_PROFILE_TAG = "SIP Profile";
const SIP_PROFILE_TAG_METADATA = #{
  description: "Manage SIP profile settings.",
  `x-displayName`: "SIP Profile",
};

const MFA_TAG = "Multi-Factor Authentication";
const MFA_TAG_METADATA = #{
  description: "Multi-factor authentication adds security to your application by requesting a user to be verified via voice or via text message. It can also be used for One Time Password flows (OTP).",
};

const VERIFIED_CALLER_IDS_TAG = "Verified Caller IDs";
const VERIFIED_CALLER_IDS_TAG_METADATA = #{
  description: "Manage verified caller IDs for phone numbers not purchased through SignalWire.",
};

const QUEUES_TAG = "Queues";
const QUEUES_TAG_METADATA = #{
  description: "Manage call queues for handling incoming calls.",
};

const QUEUE_MEMBERS_TAG = "Queue Members";
const QUEUE_MEMBERS_TAG_METADATA = #{
  description: "Manage members within call queues.",
};

const SHORT_CODES_TAG = "Short Codes";
const SHORT_CODES_TAG_METADATA = #{
  description: "Manage short codes for SMS and MMS messaging.",
};
