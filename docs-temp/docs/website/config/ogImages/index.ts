import { PluginConfig } from "@docusaurus/types";
import { signalwireOgGenerator } from "./signalwireOgGenerator";

export const ogImagesPlugin: PluginConfig = [
  require.resolve("../../src/plugins/docusaurus-plugin-og/index.ts"),
  {
    assetsDir: "config/ogImages/assets",
    canvasGenerator: signalwireOgGenerator,
  },
];
