import { PropSidebarItemCategory } from "@docusaurus/plugin-content-docs";



export const platformCategories: PropSidebarItemCategory[] = [
    {
        type: "category",
        label: "Basics",
        href: "/platform/basics",
        collapsed: false,
        collapsible: true,
        description: "Learn more about the basics of the SignalWire platform.",
        items: []
    },
    {
        type: "category",
        label: "Call Fabric",
        href: "/platform/call-fabric",
        collapsed: false,
        collapsible: true,
        description: "Learn more about the Call Fabric ecosystem.",
        items: []
    },
    {
        type: "category",
        label: "Dashboard",
        href: "/platform/dashboard",
        collapsed: false,
        collapsible: true,
        description: "Learn more about how to use the SignalWire Dashboard.",
        items: []
    },
    {
        type: "category",
        label: "Integrations",
        href: "/platform/integrations",
        collapsed: false,
        collapsible: true,
        description: "Learn more about how to integrate with SignalWire.",
        items: []
    },
    {
        type: "category",
        label: "Phone Numbers",
        href: "/platform/phone-numbers",
        collapsed: false,
        collapsible: true,
        description: "Learn more about how to use phone numbers with SignalWire.",
        items: []
    }
]
