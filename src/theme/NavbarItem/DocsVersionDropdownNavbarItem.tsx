import React from 'react';
import DocsVersionDropdownNavbarItem from '@theme-original/NavbarItem/DocsVersionDropdownNavbarItem';
import type DocsVersionDropdownNavbarItemType from '@theme/NavbarItem/DocsVersionDropdownNavbarItem';
import type {WrapperProps} from '@docusaurus/types';
import { useActivePlugin, useAllDocsData } from '@docusaurus/plugin-content-docs/client';

type Props = WrapperProps<typeof DocsVersionDropdownNavbarItemType>;

export default function DocsVersionDropdownNavbarItemWrapper(props: Props): JSX.Element | null {
  const { docsPluginId } = props;
  
  // Get the currently active docs plugin and all docs data
  const activePlugin = useActivePlugin();
  const allDocsData = useAllDocsData();
  
  // Auto-detect mode: if no docsPluginId provided, use the active plugin
  const targetPluginId = docsPluginId || activePlugin?.pluginId;
  
  // Only show the version dropdown if:
  // 1. We're currently on a docs page (activePlugin exists)
  // 2. The target plugin has multiple versions available
  // 3. Either matches the provided plugin ID or is auto-detected from active plugin
  if (!activePlugin || !targetPluginId) {
    return null;
  }
  
  // Check if the target plugin has multiple versions
  const pluginData = allDocsData[targetPluginId];
  const hasMultipleVersions = pluginData && Object.keys(pluginData.versions).length > 1;
  
  // For explicit plugin ID: only show if we're on matching docs and it's not default
  if (docsPluginId) {
    const isOnMatchingPluginDocs = activePlugin.pluginId === docsPluginId;
    const isPluginSpecificDropdown = docsPluginId !== 'default';
    
    if (!isOnMatchingPluginDocs || !isPluginSpecificDropdown || !hasMultipleVersions) {
      return null;
    }
  }
  // For auto-detect mode: only show if current plugin has multiple versions and isn't default
  else {
    const isNotDefaultPlugin = activePlugin.pluginId !== 'default';
    
    if (!isNotDefaultPlugin || !hasMultipleVersions) {
      return null;
    }
  }
  
  return (
    <>
      <DocsVersionDropdownNavbarItem {...props} docsPluginId={targetPluginId} />
    </>
  );
}
