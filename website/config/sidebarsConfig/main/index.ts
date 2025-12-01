/**
 * Main docs instance sidebar configurations
 *
 * These are the sidebar configurations for the main Docusaurus preset/instance.
 * This includes:
 * - Home/Platform documentation
 * - Client SDK overview pages
 * - REST API documentation
 * - SWML documentation
 * - Compatibility API documentation
 * - Cantina documentation
 * - Call Flow Builder documentation
 */

import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";
import homeSidebar from "./home-sidebar";
import sdksSidebar from "./sdks-sidebar";
import restApiSidebars from "./rest-api-sidebar";
import swmlTechRefSidebar from "./swml-sidebar";
import compatibilityAPI from "./compatibility-api-sidebar";
import cantinaSidebar from "./cantina-sidebar";
import callFlowBuilderSidebar from "./call-flow-builder-sidebar";

const mainSidebars: SidebarsConfig = {
    ...homeSidebar,
    ...sdksSidebar,
    ...restApiSidebars,
    ...swmlTechRefSidebar,
    ...compatibilityAPI,
    ...cantinaSidebar,
    ...callFlowBuilderSidebar,
  };

export default mainSidebars;