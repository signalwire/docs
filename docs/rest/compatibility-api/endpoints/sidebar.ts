import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/compatibility-api/endpoints/cxml-api",
    },
    {
      type: "category",
      label: "Accounts",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/accounts",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-accounts",
          label: "List Accounts",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-subprojects",
          label: "Create Subprojects",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/get-account",
          label: "Find an Account by ID",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-account",
          label: "Update an Account",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Applications",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/applications",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-application",
          label: "Create an Application",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-applications",
          label: "List Applications",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/get-application",
          label: "Find an Application by ID",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-application",
          label: "Update an Application",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-application",
          label: "Delete an application.",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Available Phone Numbers",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/available-phone-numbers",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/search-local-available-phone-numbers",
          label: "Search for available phone numbers that match your criteria.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/search-toll-free-available-phone-numbers",
          label: "Find toll-free numbers.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-available-phone-number-resources",
          label: "List of AvailablePhoneNumber resources",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-available-phone-number-resources-by-country",
          label: "List of AvailablePhoneNumber resources by country",
          className: "api-method get",
        },
      ],
    },
    {
      type: "category",
      label: "Calls",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/calls",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-all-calls",
          label: "List all Calls",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-a-call",
          label: "Create a Call",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-a-call",
          label: "Retrieve a Call",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-a-call",
          label: "Update a call",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-a-call",
          label: "Delete a call",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Conference Participants",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/conference-participants",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-participant",
          label: "Retrieve a Participant",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-participant",
          label: "Update a Participant",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-participant",
          label: "Delete a Participant",
          className: "api-method delete",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-all-participants",
          label: "List all active Participants",
          className: "api-method get",
        },
      ],
    },
    {
      type: "category",
      label: "Conferences",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/conferences",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-conference",
          label: "Retrieve a Conference",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-conference",
          label: "Update Conference",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-all-conferences",
          label: "List All Conference",
          className: "api-method get",
        },
      ],
    },
    {
      type: "category",
      label: "Faxes",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/faxes",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-all-faxes",
          label: "List all Faxes",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/send-fax",
          label: "Send a Fax",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-fax",
          label: "Retrieve a fax.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-fax",
          label: "Update a fax",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-fax",
          label: "Delete a fax.",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Fax Media",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/fax-media",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-all-fax-media",
          label: "List All Fax Media",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-medias",
          label: "Retrieve a fax media instance.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-fax-media",
          label: "Delete Fax Media.",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Incoming Phone Numbers",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/incoming-phone-numbers",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-incoming-phone-numbers",
          label: "List All Incoming Phone Numbers",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-incoming-phone-number",
          label: "Create an Incoming Phone Number",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-incoming-phone-number",
          label: "Retrieve an incoming phone number",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-incoming-phone-number",
          label: "Update an Incoming Phone Number",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-incoming-phone-number",
          label: "Delete an incoming phone number.",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "cXML Bins",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/c-xml-bins",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-cxml-applications",
          label: "List All cXML Bins",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-cxml-application",
          label: "Create an cXML Bin",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-cxml-application",
          label: "Retrieve an cXML Bin",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-cxml-application",
          label: "Update an cXML Bin",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-cxml-application",
          label: "Delete an cXML Bin",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Messages",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/messages",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-messages",
          label: "List All Messages",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-message",
          label: "Create a Message",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-message",
          label: "Retrieve a Message",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-message",
          label: "Update a Message",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-message",
          label: "Delete a Message.",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Media",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/media",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-media",
          label: "List All Media",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-media",
          label: "Retrieve a Media.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-message-media",
          label: "Delete Message Media.",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Recordings",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/recordings",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-recordings",
          label: "List All Recordings",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-recording",
          label: "Retrieve a Recording.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-recording",
          label: "Delete a Recording.",
          className: "api-method delete",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-recording",
          label: "Create a Recording.",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-recording",
          label: "Update a Recording",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Recording Transcriptions",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/recording-transcriptions",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-transcriptions",
          label: "List All Transcriptions",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-transcription",
          label: "Retrieve a Transcription.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-transcription",
          label: "Delete a Recording Transcription.",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Queues",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/queues",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-queues",
          label: "List All Queues",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-queue",
          label: "Create a Queue.",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-queue",
          label: "Retrieve a Queue.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-queue",
          label: "Update a Queue.",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-queue",
          label: "Delete a Queue.",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Queue Members",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/queue-members",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/list-all-queue-members",
          label: "List All Queue Members",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/retrieve-queue-member",
          label: "Retrieve a Queue Member.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-queue-member",
          label: "Update a Queue Member.",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Streams",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/streams",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-stream",
          label: "Create a Stream.",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-stream",
          label: "Stop a Stream",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Tokens",
      link: {
        type: "doc",
        id: "rest/compatibility-api/endpoints/tokens",
      },
      items: [
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/create-token",
          label: "Generate a new API Token",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/update-token",
          label: "Update an API Token",
          className: "api-method patch",
        },
        {
          type: "doc",
          id: "rest/compatibility-api/endpoints/delete-token",
          label: "Delete an API Token",
          className: "api-method delete",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
