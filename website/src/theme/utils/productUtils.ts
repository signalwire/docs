import { useMemo } from 'react';
import { useThemeConfig } from '@docusaurus/theme-common';
import { modalSections, ProductItem, ProductLink } from '@site/secondaryNavbar';
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

/**
 * Detects the current product based on pathname by matching against all product links.
 *
 * Algorithm:
 * 1. Collects all links from all products (including versioned products and dropdown items)
 * 2. Sorts by link length (longest first) to match most specific paths first
 * 3. Returns the product key of the first matching link
 *
 * @param pathname - The current pathname to match against
 * @param allProducts - Record of all products to search through
 * @param defaultProduct - Optional default product key to return if no match found
 * @returns The detected product key, or defaultProduct, or null if no match and no default
 *
 * Used by: useSecondaryNavState, ProductDropdownNavbarItem
 */
export function detectCurrentProduct(
  pathname: string,
  allProducts: Record<string, ProductItem>,
  defaultProduct?: string | null
): string | null {
  // Collect all product/link pairs from config
  const allLinks: Array<{ productKey: string; link: string }> = [];

  for (const [productKey, productConfig] of Object.entries(allProducts)) {
    // Handle versioned products (check versions.current.links)
    let productLinks: ProductLink[] | undefined = productConfig.links;

    if (productConfig.versions) {
      // For versioned products, use current version links
      productLinks = productConfig.versions.current?.links || [];
    }

    if (productLinks) {
      for (const link of productLinks) {
        if (link.link) {
          // Regular link - add it directly
          allLinks.push({ productKey, link: link.link });
        } else if (link.dropdown) {
          // Dropdown link - add all children's links for matching
          for (const dropdownItem of link.dropdown) {
            allLinks.push({ productKey, link: dropdownItem.link });
          }
        }
      }
    }
  }

  // Sort by link length (longest first) to match most specific paths first
  // This prevents "/" from matching everything
  allLinks.sort((a, b) => b.link.length - a.link.length);

  // Find first matching link
  for (const { productKey, link } of allLinks) {
    if (pathname.startsWith(link)) {
      return productKey;
    }
  }

  // Return default or null if no match found
  return defaultProduct !== undefined ? defaultProduct : null;
}
