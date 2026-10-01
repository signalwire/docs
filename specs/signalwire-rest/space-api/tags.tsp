import "@typespec/openapi3";

const SPACE_TAG = "Space";

const SPACE_TAG_METADATA = #{
  description: "Read and rename the space, and manage its geographic permissions. Authenticates with a Personal access token.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on SignalWire REST APIs",
  },
};

const SPACE_MEMBERS_TAG = "Space Members";

const SPACE_MEMBERS_TAG_METADATA = #{
  description: "Invite, update, and remove space members, and control which projects each member can reach. Authenticates with a Personal access token.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on SignalWire REST APIs",
  },
};

const SPACE_BALANCE_TAG = "Space Balance";

const SPACE_BALANCE_TAG_METADATA = #{
  description: "Read the space balance, top it up, and manage low balance notifications and auto top-up. Authenticates with a Personal access token.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on SignalWire REST APIs",
  },
};

const SPACE_BILLING_TAG = "Space Billing";

const SPACE_BILLING_TAG_METADATA = #{
  description: "Manage the billing profile, download monthly statements, read usage and payment history, and manage payment methods. Authenticates with a Personal access token.",
  externalDocs: #{
    url: "https://signalwire.com/docs/apis",
    description: "Developer documentation on SignalWire REST APIs",
  },
};
