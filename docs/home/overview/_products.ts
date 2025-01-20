import { ProductList } from "../../../src/components/HomepageFeatures/ProductButtons/ProductButtonContainer";

export const products: ProductList = [
  {
    name: "Voice",
    description: "High-performance realtime and compatible APIs",
    icon: {
      themeAware: true,
      path: 'product-buttons/ico-voice.svg',
    },
    link: "/voice",
  },
  {
    name: "Messaging",
    description: "Programmable, high- throughput, compliant SMS & MMS",
    icon: {
      themeAware: true,
      path: 'product-buttons/ico-sms.svg',
    },
    link: "/messaging",
  },
  {
    name: "Video",
    description: "Fully customizable audio/video conferencing apps",
    icon: {
      themeAware: true,
      path: 'product-buttons/ico-video.svg',
    },
    link: "/video",
  },
  {
    name: "Chat",
    description: "Implement seamless in-browser chat using PubSub",
    icon: {
      themeAware: true,
      path: 'product-buttons/ico-chat.svg',
    },
    link: "/chat",
  },
  {
    name: "Fax",
    description: "Programmable fax, certified SOC 2 Type II and HIPAA compliant",
    icon: {
      themeAware: true,
      path: 'product-buttons/ico-fax.svg',
    },
    link: "/fax",
  },
  {
    name: "SWML",
    description: "Powerful, lightweight, server-optional voice application scripts",
    icon: {
      themeAware: true,
      path: 'product-buttons/ico-swml.svg',
    },
    link: "/swml",
  },
  {
    name: "AI",
    description: "Integrated, powerful, scalable AI agents for your application",
    icon: {
      themeAware: true,
      path: 'product-buttons/ico-ai.svg',
    },
    link: "/ai",
  },
  {
    name: "Call Flow Builder",
    description: "Build drag-and-drop calling apps without code",
    icon: {
      themeAware: true,
      path: 'product-buttons/ico-flow.svg',
    },
    link: "/call-flow-builder",
  }
];
