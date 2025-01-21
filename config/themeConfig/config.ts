/**
 * Configuration for the site's theme.
 *
 * Used by: docusaurus.config.ts
 * Within: config.themeConfig
 *
 * Docusaurus technical reference: https://docusaurus.io/docs/api/themes/configuration
 */

import { themes as PrismThemes } from "prism-react-renderer";
import type { ThemeConfig } from "@docusaurus/preset-classic";
import footerItems from "./footer";

const lightCodeTheme = PrismThemes.github;
const darkCodeTheme = PrismThemes.dracula;

const config: ThemeConfig = {
  footer: footerItems,
  docs: {
    sidebar: {
      autoCollapseCategories: true,
      hideable: true,
    },
  },
  prism: {
    theme: lightCodeTheme,
    darkTheme: darkCodeTheme,
    additionalLanguages: [
      "dart",
      "ocaml",
      "r",
      "php",
      "csharp",
      "ruby",
      "java",
      "ini",
      "bash",
      "json",
      "powershell",
    ],
    magicComments: [
      // We don't care about the className; this is only to make docusaurus filter out the comment.
      {
        className: "prettier-ignore",
        line: "prettier-ignore",
      },
    ],
  },
  colorMode: {
    defaultMode: "light",
    disableSwitch: true,
    respectPrefersColorScheme: false,
  },

  // Theme configuration for lightbox (plugin-image-zoom)
  imageZoom: {
    selector: ".lightbox img, img.lightbox",
    options: {
      margin: 80,
      scrollOffset: 0,
    },
  },
};

export default config;
