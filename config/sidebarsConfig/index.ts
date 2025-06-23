/*
* Configuration for the site's sidebars.
*
* Used by: docusaurus.config.js
* Within: config.presets.sidebarPath
*
* Docusaurus technical reference: https://docusaurus.io/docs/sidebar
*
* This file is used to import all the sidebar configurations for the site.
* Each sidebar configuration is imported from the sidebar files in the /config/sidebarsConfig folder.
* These sidebar configurations are then added to the `sidebars` object.
* The `sidebars` object is then exported at the bottom of the file.
* The `sidebars` object is then imported into the `/config/presets.js` file. 
*/

import type { SidebarsConfig } from "@docusaurus/plugin-content-docs";
import homeSidebar from './home-sidebar';
import clientSdksSidebar from './client-sdk-sidebar';
import browserSdkTechRefSidebar from './relay-browser-sidebar';
import realtimeSdkTechRefSidebar from './relay-realtime-sidebar';
import apiSidebar from './rest-api-sidebar';
import swmlTechRefSidebar from './swml-sidebar';
import compatibilityAPI from './compatibility-api-sidebar';
import cantinaSidebar from './cantina-sidebar';
import freeswitchSidebar from './freeswitch';
const sidebars: SidebarsConfig = {
  ...homeSidebar,
  ...clientSdksSidebar,
  ...browserSdkTechRefSidebar,
  ...realtimeSdkTechRefSidebar,
  ...apiSidebar,
  ...swmlTechRefSidebar,
  ...compatibilityAPI,
  ...cantinaSidebar,
  ...freeswitchSidebar,
};

export default sidebars;