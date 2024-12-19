import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";

const sidebar: SidebarsConfig = {
  apisidebar: [
    {
      type: "doc",
      id: "rest/signalwire-rest/endpoints/video/video-api",
    },
    {
      type: "category",
      label: "Rooms",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/video/rooms",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/create-room",
          label: "Create a Room",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-rooms",
          label: "List Rooms",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/get-room-by-name",
          label: "Find a Room by its unique name.",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/get-room",
          label: "Find a Room by ID",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/update-room",
          label: "Update a Room",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/delete-room",
          label: "Delete a Room",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Streams",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/video/streams",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-streams-by-room-id",
          label: "List Streams by Room Id",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/create-stream-by-room-id",
          label: "Create a Stream for a Room",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-streams-by-conference-id",
          label: "List Streams by Conference",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/create-stream-by-conference-id",
          label: "Create a Stream for a Conference",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/get-stream",
          label: "Find a Stream by ID",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/delete-stream",
          label: "Delete a Stream",
          className: "api-method delete",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/update-stream",
          label: "Update a Stream",
          className: "api-method put",
        },
      ],
    },
    {
      type: "category",
      label: "Room Sessions",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/video/room-sessions",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-room-sessions",
          label: "List Room Sessions",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/get-room-session",
          label: "Find a Room Session by ID",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-room-recordings-by-session",
          label: "List a Room Session's Recordings",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-room-session-members-by-session",
          label: "List a Room Session's Members",
          className: "api-method get",
        },
      ],
    },
    {
      type: "category",
      label: "Room Tokens",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/video/room-tokens",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/create-room-token",
          label: "Generate a new Video Room Token",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Room Recordings",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/video/room-recordings",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-room-recordings",
          label: "List Room Recordings",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/get-room-recording",
          label: "Find a Room Recording by ID",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/delete-room-recording",
          label: "Delete a Room Recording.",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Conferences",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/video/conferences",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/create-video-conference",
          label: "Create a Video Conference",
          className: "api-method post",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-video-conferences",
          label: "List Video Conferences",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/get-video-conference",
          label: "Find a Video Conference by ID",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/update-video-conference",
          label: "Update a Video Conference",
          className: "api-method put",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/delete-video-conference",
          label: "Delete a Video Conference",
          className: "api-method delete",
        },
      ],
    },
    {
      type: "category",
      label: "Conference Tokens",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/video/conference-tokens",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-conference-tokens",
          label: "List Conference Tokens",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/get-conference-token",
          label: "Find a Conference Token by ID",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/reset-conference-token",
          label: "Reset a Conference Token by ID",
          className: "api-method post",
        },
      ],
    },
    {
      type: "category",
      label: "Logs",
      link: {
        type: "doc",
        id: "rest/signalwire-rest/endpoints/video/logs",
      },
      items: [
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/list-logs",
          label: "List Logs",
          className: "api-method get",
        },
        {
          type: "doc",
          id: "rest/signalwire-rest/endpoints/video/get-log",
          label: "Find a Log by ID",
          className: "api-method get",
        },
      ],
    },
  ],
};

export default sidebar.apisidebar;
