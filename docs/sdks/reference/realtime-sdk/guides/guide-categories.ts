import { PropSidebarItem } from "@docusaurus/plugin-content-docs";


export const guideCategories: PropSidebarItem[] = [
        {
        type: "category",
        label: "Messaging",
        href: "/sdks/reference/realtime-sdk/guides/messaging",
        collapsed: false,
        collapsible: true,
        description: "Learn more about using the Messaging API with the Realtime SDK.",
        items: []
    },
    {
        type: "category",
        label: "Voice",
        href: "/sdks/reference/realtime-sdk/guides/voice",
        collapsed: false,
        collapsible: true,
        description: "Learn more about using the Voice API with the Realtime SDK.",
        items: []
    },
    {
        type: "link",
        label: "Upgrading to Relay v4",
        href: "/sdks/reference/realtime-sdk/guides/upgrading-to-relay-v4",
        description: "Learn how to upgrade to Relay v4.",
    }
]
