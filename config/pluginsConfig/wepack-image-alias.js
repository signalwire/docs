const path = require("path");

export function imageAlias(context, options) {
  return {
    name: "docusaurus-plugin-image-alias",
    configureWebpack(config, isServer) {
      return {
        resolve: {
          alias: {
            "@image": path.resolve(context.siteDir, "./images"),
          },
        },
      };
    },
  };
}
