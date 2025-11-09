import { useMemo } from 'react';
import { useThemeConfig } from '@docusaurus/theme-common';
import { modalSections, ProductItem } from '@site/secondaryNavbar';
import type { Props as NavbarItemConfig } from '@theme/NavbarItem';

/**
 * Shared utility: Creates a flat map of all products from modalSections
 * Used by: useSecondaryNavState, ProductDropdownNavbarItem
 */
export function useAllProducts(): Record<string, ProductItem> {
  return useMemo(() => {
    return modalSections.reduce<Record<string, ProductItem>>((acc, section) => {
      return { ...acc, ...section.items };
    }, {});
  }, []);
}

/**
 * Shared utility: Gets navbar items from theme config
 * Used by: Navbar/Content, MobileSidebar/PrimaryMenu
 */
export function useNavbarItems(): NavbarItemConfig[] {
  // TODO temporary casting until ThemeConfig type is improved
  return useThemeConfig().navbar.items as NavbarItemConfig[];
}
