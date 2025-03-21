import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/space/relay-rest-api-previous-version",
    },
    {
      type: "category",
      label: "Addresses",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/addresses",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-addresses",
          label: "List all Addresses.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/create-address",
          label: "Create an address",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/get-address",
          label: "Retrieve an Address",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/delete-address",
          label: "Delete an Address",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Campaign Registry (Beta)",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/campaign-registry-beta",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/create-brand",
          label: "Create a Brand",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-brands",
          label: "List all Brands.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-brand",
          label: "Retrieve a Brand",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-campaigns",
          label: "List all Campaigns",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/create-campaign",
          label: "Create a Campaign",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-campaign",
          label: "Retrieve a Campaign",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/update-campaign",
          label: "Update a Campaign",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-number-assignments",
          label: "List all Phone Number Assignments",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-orders",
          label: "List all Phone Number Assignment Orders",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/create-order",
          label: "Create a Phone Number Assignment Order",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-order",
          label: "Retrieve a Phone Number Assignment Order",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/delete-number-assignment",
          label: "Delete a Phone Number Assignment",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Domain Applications",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/domain-applications",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-domain-applications",
          label: "List all Domain Applications",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/create-domain-application",
          label: "Create a Domain Application",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-domain-application",
          label: "Retrieve a Domain Application",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/update-domain-application",
          label: "Update a Domain Application",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/delete-domain-application",
          label: "Delete a Domain Application",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Number Groups",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/number-groups",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-number-groups",
          label: "List all Number Groups",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/create-number-group",
          label: "Create a Number Group",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-number-group",
          label: "Retrieve a Number Group",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/update-number-group",
          label: "Update a Number Group",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/delete-number-group",
          label: "Delete a Number Group",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Number Group Membership",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/number-group-membership",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-number-group-memberships",
          label: "List all Number Group Memberships",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/create-number-group-membership",
          label: "Create a Number Group Membership",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-number-group-membership",
          label: "Retrieve a Number Group Membership",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/delete-number-group-membership",
          label: "Delete a Number Group Membership",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Phone Numbers",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/phone-numbers",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-phone-numbers",
          label: "List all Phone Numbers",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/purchase-phone-number",
          label: "Purchase a Phone Number",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-phone-number",
          label: "Retrieve a Phone Number",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/update-phone-number",
          label: "Update a Phone Number",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/release-phone-number",
          label: "Release a Phone Number",
          className: "api-method delete",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/search-available-phone-numbers",
          label: "Search for available Phone Numbers to Purchase",
          className: "api-method get",
        },
      ],
    },
    {
      type: "category",
      label: "Phone Number Lookup",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/phone-number-lookup",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/lookup-phone-number",
          label: "Phone Number Lookup",
          className: "api-method get",
        },
      ],
    },
    {
      type: "category",
      label: "Recordings",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/recordings",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/recordings-list",
          label: "List Relay Recordings",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/recordings-get",
          label: "Get Relay Recording",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/recordings-delete",
          label: "Delete Relay Recording",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "SIP Endpoints",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/sip-endpoints",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-sip-endpoints",
          label: "List all SIP Endpoints.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/create-sip-endpoint",
          label: "Create a SIP Endpoint",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-sip-endpoint",
          label: "Retrieve a SIP Endpoint",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/update-sip-endpoint",
          label: "Update a SIP Endpoint",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/delete-sip-endpoint",
          label: "Delete a SIP Endpoint",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "SIP Profile",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/sip-profile",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-sip-profile",
          label: "Retrieve a SIP Profile",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/update-sip-profile",
          label: "Update a SIP Profile",
          className: "api-method put",
        },
      ],
    },
    {
      type: "category",
      label: "Multi-Factor Authentication",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/multi-factor-authentication",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/request-mfa-sms",
          label: "Request a MFA token via text message",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/request-mfa-call",
          label: "Request a MFA token via phone call",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/verify-mfa-token",
          label: "Verify a token",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Verified Caller IDs",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/space/verified-caller-i-ds",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/create-verified-caller-id",
          label: "Create a new Verified Caller ID",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/list-verified-caller-ids",
          label: "List all Verified Caller IDs",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/retrieve-verified-caller-id",
          label: "Retrieve a Verified Caller ID",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/update-verified-caller-id",
          label: "Update a Verified Caller ID",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/delete-verified-caller-id",
          label: "Delete a Verified Caller ID",
          className: "api-method delete",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/validate-verification-code",
          label: "Validate the Verification Code",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/space/redial-verification-call",
          label: "Redial Verification Call",
          className: "api-method post",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
