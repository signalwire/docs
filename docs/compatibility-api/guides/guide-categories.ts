import { PropSidebarItemCategory } from "@docusaurus/plugin-content-docs";



export const guideCategories: PropSidebarItemCategory[] = [
    {
        type: "category",
        label: "General",
        href: "/compatibility-api/guides/general",
        collapsed: false,
        collapsible: true,
        description: "General guides for using the Compatibility API.",
        items: []
    },
    {
        type: "category",
        label: "Voice",
        href: "/compatibility-api/guides/voice",
        collapsed: false,
        collapsible: true,
        description: "Guides for using the Compatible Voice API.",
        items: []
    },
    {
        type: "category",
        label: "Messaging",
        href: "/compatibility-api/guides/messaging",
        collapsed: false,
        collapsible: true,
        description: "Guides for using the Compatible Messaging API.",
        items: []
    }
]
