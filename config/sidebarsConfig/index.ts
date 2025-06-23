/*
* Configuration for the site's sidebars.
*
* Used by: docusaurus.config.js
* Within: config.presets.sidebarPath
*
* Docusaurus technical reference: https://docusaurus.io/docs/sidebar
*
* This file is used to import all the sidebar configurations for the main docs instance.
* Each sidebar configuration is imported from the sidebar files in the main folder.
*/

import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";
import homeSidebar from './main/home-sidebar';
import clientSdksSidebar from './main/client-sdk-sidebar';
import apiSidebar from './main/rest-api-sidebar';
import swmlTechRefSidebar from './main/swml-sidebar';
import compatibilityAPI from './main/compatibility-api-sidebar';
import cantinaSidebar from './main/cantina-sidebar';

const sidebars: SidebarsConfig = {
  ...homeSidebar,
  ...clientSdksSidebar,
  ...apiSidebar,
  ...swmlTechRefSidebar,
  ...compatibilityAPI,
  ...cantinaSidebar,
};

export default sidebars;