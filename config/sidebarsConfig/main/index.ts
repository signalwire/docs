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
 */

import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";
import homeSidebar from "./home-sidebar";
import clientSdksSidebar from "./client-sdk-sidebar";
import apiSidebar from "./rest-api-sidebar";
import swmlTechRefSidebar from "./swml-sidebar";
import compatibilityAPI from "./compatibility-api-sidebar";
import cantinaSidebar from "./cantina-sidebar";

const mainSidebars: SidebarsConfig = {
    ...homeSidebar,
    ...clientSdksSidebar,
    ...apiSidebar,
    ...swmlTechRefSidebar,
    ...compatibilityAPI,
    ...cantinaSidebar,
  };

export default mainSidebars;