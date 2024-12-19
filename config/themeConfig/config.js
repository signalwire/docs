/**
 * Configuration for the site's theme.
 *
 * Used by: docusaurus.config.js
 * Within: config.themeConfig
 *
 * Docusaurus technical reference: https://docusaurus.io/docs/api/themes/configuration
 */

const Themes = require("prism-react-renderer").themes;
const lightCodeTheme = Themes.github;
const darkCodeTheme = Themes.dracula;

module.exports = {
  footer: require("./footer"), // footer of the site. All footer options can be modified at the /config/themeConfig/footer.js file.
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
    selector: ".markdown img:not(.nolightbox)",
    options: {
      margin: 18,
      scrollOffset: 0,
    },
  },
};
