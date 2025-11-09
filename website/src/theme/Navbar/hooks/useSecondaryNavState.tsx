import { useMemo } from 'react';
import { useLocation } from '@docusaurus/router';
import { useActivePluginAndVersion, useActiveDocContext } from '@docusaurus/plugin-content-docs/client';
import { ProductItem, ProductLink } from '@site/secondaryNavbar';
import { useAllProducts } from '@theme/utils/productUtils';

export function useSecondaryNavState() {
  const location = useLocation();
  const activePluginAndVersion = useActivePluginAndVersion();
  const activeVersion = activePluginAndVersion?.activeVersion?.name;

  // Get the active document's sidebar name
  const activeDocContext = useActiveDocContext(activePluginAndVersion?.activePlugin?.pluginId);
  const activeSidebar = activeDocContext?.activeDoc?.sidebar;

  // Get flat map of all products from shared utility
  const allProducts = useAllProducts();

  // Detect current product based on pathname
  const currentProduct = useMemo(() => {
    const pathname = location.pathname;
    const allLinks: Array<{ productKey: string; link: string }> = [];

    for (const [productKey, productConfig] of Object.entries(allProducts)) {
      let productLinks: ProductLink[] | undefined = productConfig.links;
      if (productConfig.versions) {
        productLinks = productConfig.versions.current?.links || [];
      }
      if (productLinks) {
        for (const link of productLinks) {
          allLinks.push({ productKey, link: link.link });
        }
      }
    }

    allLinks.sort((a, b) => b.link.length - a.link.length);

    for (const { productKey, link } of allLinks) {
      if (pathname.startsWith(link)) {
        return productKey;
      }
    }

    return null;
  }, [location.pathname, allProducts]);

  const product: ProductItem | null = currentProduct ? allProducts[currentProduct] : null;

  // Get version-specific links
  const productLinks = useMemo<ProductLink[]>(() => {
    if (!product) return [];

    if (product.versions && activeVersion) {
      return product.versions[activeVersion]?.links || [];
    }

    return product.links || [];
  }, [product, activeVersion]);

  return { currentProduct, product, productLinks, activeSidebar };
}
