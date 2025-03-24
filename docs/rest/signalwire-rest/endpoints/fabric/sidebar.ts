import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/fabric/call-fabric-api",
    },
    {
      type: "category",
      label: "AI Agents: Custom",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/ai-agents-custom",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-ai-agent-addresses",
          label: "List AI Agent Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-ai-agents",
          label: "List AI Agents",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/create-ai-agent",
          label: "Create AI Agent",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-ai-agent",
          label: "Get AI Agent",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-ai-agent",
          label: "Update AI Agent",
          className: "api-method patch",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-ai-agent",
          label: "Delete AI Agent",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "AI Agents: Dialogflow",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/ai-agents-dialogflow",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-dialogflow-agent-addresses",
          label: "List Dialogflow Agent Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-dialogflow-agents",
          label: "List Dialogflow Agents",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-dialogflow-agent",
          label: "Get Dialogflow Agent",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-dialogflow-agent",
          label: "Update Dialogflow Agent",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-dialogflow-agent",
          label: "Delete Dialogflow Agent",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Call Flows",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/call-flows",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-call-flow-addresses",
          label: "List Call Flow Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-call-flow-versions",
          label: "List Call Flow Versions",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/deploy-call-flow-version",
          label: "Deploy a Call Flow Version",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-call-flows",
          label: "List Call Flows",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/create-call-flow",
          label: "Create Call Flow",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-call-flow",
          label: "Get Call Flow",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-call-flow",
          label: "Update Call Flow",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-call-flow",
          label: "Delete Call Flow",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "cXML Application",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/c-xml-application",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/cxml-applications-list",
          label: "List cXML Applications",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/cxml-applications-create",
          label: "Create cXML Application",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/cxml-application-addresses-list",
          label: "List cXML Application Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/cxml-applications-read",
          label: "Get cXML Application",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/cxml-applications-update",
          label: "Update cXML Application",
          className: "api-method patch",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/cxml-applications-delete",
          label: "Delete cXML Application",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "External LAML Handler",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/external-laml-handler",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-laml-handlers-list",
          label: "List External LAML Handlers",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-laml-handlers-create",
          label: "Create External LAML Handler",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-laml-handler-addresses-list",
          label: "List External LAML Handler Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-laml-handlers-read",
          label: "Get External LAML Handler",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-laml-handlers-update",
          label: "Update External LAML Handler",
          className: "api-method patch",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-laml-handlers-delete",
          label: "Delete External LAML Handler",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "External SWML Handler",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/external-swml-handler",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-swml-handlers-list",
          label: "List External SWML Handlers",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-swml-handlers-create",
          label: "Create External SWML Handler",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-swml-handler-addresses-list",
          label: "List External SWML Handler Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-swml-handlers-read",
          label: "Get External SWML Handler",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-swml-handlers-update",
          label: "Update External SWML Handler",
          className: "api-method patch",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/external-swml-handlers-delete",
          label: "Delete External SWML Handler",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Fabric Address",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/fabric-address",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/fabric-addresses-list",
          label: "List Fabric Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/fabric-addresses-read",
          label: "Get Fabric Address",
          className: "api-method get",
        },
      ],
    },
    {
      type: "category",
      label: "FreeSWITCH Connectors",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/free-switch-connectors",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-freeswitch-connector-addresses",
          label: "List FreeSWITCH Connector Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-freeswitch-connectors",
          label: "List FreeSWITCH Connectors",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/create-freeswitch-connector",
          label: "Create FreeSWITCH Connector",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-freeswitch-connector",
          label: "Get FreeSWITCH Connector",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-freeswitch-connector",
          label: "Update FreeSWITCH Connector",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-freeswitch-connector",
          label: "Delete FreeSWITCH Connector",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "LAML Applications",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/laml-applications",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-laml-application-addresses",
          label: "List LAML Application Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-laml-applications",
          label: "List LAML Applications",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-laml-application",
          label: "Get LAML Application",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-laml-application",
          label: "Update LAML Application",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-laml-application",
          label: "Delete LAML Application",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "LAML Bins",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/laml-bins",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-laml-bin-addresses",
          label: "List LAML Bin Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-laml-bins",
          label: "List LAML Bins",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/laml-bin-create",
          label: "Create LaML Bin",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-laml-bin",
          label: "Get LAML Bin",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-laml-bin",
          label: "Update LAML Bin",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-laml-bin",
          label: "Delete LAML Bin",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Relay Applications",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/relay-applications",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-relay-application-addresses",
          label: "List Relay Application Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-relay-applications",
          label: "List Relay Applications",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/create-relay-application",
          label: "Create Relay Application",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-relay-application",
          label: "Get Relay Application",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-relay-application",
          label: "Update Relay Application",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-relay-application",
          label: "Delete Relay Application",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Resources",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/resources",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-resource-addresses",
          label: "List Resource Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-resources",
          label: "List Resources",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-resource",
          label: "Get Resource",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-resource",
          label: "Delete Resource",
          className: "api-method delete",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/assign-resource-to-phone-route",
          label: "Assign a Resource as Call/Message handler on a Phone Number",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/assign-resource-to-domain-application",
          label: "Assign a Resource as Call handler on a Domain Application",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/assign-resource-to-sip-endpoint",
          label: "Assign a Resource as Call handler on a SIP endpoint",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "SIP Endpoints",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/sip-endpoints",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-sip-endpoint-addresses",
          label: "List SIP endpoint Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-sip-endpoints",
          label: "List SIP endpoints",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/create-sip-endpoint",
          label: "Create SIP endpoint",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-sip-endpoint",
          label: "Get SIP endpoint",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-sip-endpoint",
          label: "Update SIP endpoint",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-sip-endpoint",
          label: "Delete SIP endpoint",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Subscribers",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/subscribers",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscribers-list",
          label: "List Subscribers",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscribers-create",
          label: "Create Subscriber",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscribers-get",
          label: "Get Subscriber",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscribers-update",
          label: "Update Subscriber",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscribers-delete",
          label: "Delete Subscriber",
          className: "api-method delete",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscriber-tokens-create",
          label: "Create Subscriber Token",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/invite-tokens-create",
          label: "Create a Subscriber Invite Token",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscriber-addresses-list",
          label: "List Subscriber Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscriber-sip-endpoint-list",
          label: "List Subscriber SIP Endpoints",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscriber-sip-endpoint-create",
          label: "Create Subscriber SIP Endpoint",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscriber-sip-endpoint-read",
          label: "Get Subscriber SIP Endpoint",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscriber-sip-endpoint-update",
          label: "Update Subscriber SIP Endpoint",
          className: "api-method patch",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/subscriber-sip-endpoint-delete",
          label: "Delete Subscriber SIP Endpoint",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "SWML Applications",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/swml-applications",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-swml-application-addresses",
          label: "List SWML Application Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-s-wml-applications",
          label: "List SWML Applications",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/create-swml-application",
          label: "Create SWML Application",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-swml-application",
          label: "Get SWML Application",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-swml-application",
          label: "Update SWML Application",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-swml-application",
          label: "Delete SWML Application",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "SWML Scripts",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/swml-scripts",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-swml-script-addresses",
          label: "List SWML Script Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-swml-scripts",
          label: "List SWML Scripts",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/swml-script-create",
          label: "Create SWML Script",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-swml-script",
          label: "Get SWML Script",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-swml-script",
          label: "Update SWML Script",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-swml-script",
          label: "Delete SWML Script",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Conference Rooms",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/conference-rooms",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-conference-room-addresses",
          label: "List Conference Room Addresses",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/list-conference-rooms",
          label: "List Conference Rooms",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/create-conference-room",
          label: "Create Conference Room",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/get-conference-room",
          label: "Get Conference Room",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/update-conference-room",
          label: "Update Conference Room",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/delete-conference-room",
          label: "Delete Conference Room",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Subscriber Guest Token",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/fabric/subscriber-guest-token",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/fabric/guest-tokens-create",
          label: "Create Subscriber Guest Token",
          className: "api-method post",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
