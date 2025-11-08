import React, { useEffect, useRef, useState } from 'react';
import { useLocation } from '@docusaurus/router';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { FaChevronDown } from 'react-icons/fa';
import { useActivePluginAndVersion } from '@docusaurus/plugin-content-docs/client';
import { modalSections, ProductItem, ProductLink } from '@site/secondaryNavbar';
import styles from './styles.module.scss';

export default function SecondaryNavbar(): React.JSX.Element | null {
  const location = useLocation();
  const navbarRef = useRef<HTMLDivElement>(null);
  const placeholderRef = useRef<HTMLDivElement>(null);
  const [isFixed, setIsFixed] = useState(false);

  // Detect active version for versioned docs
  const activePluginAndVersion = useActivePluginAndVersion();
  const activeVersion = activePluginAndVersion?.activeVersion?.name;

  // Create a flat map of all products from modalSections
  const allProducts = React.useMemo(() => {
    return modalSections.reduce<Record<string, ProductItem>>((acc, section) => {
      return { ...acc, ...section.items };
    }, {});
  }, []);

  // Determine current product based on pathname (fully dynamic from config)
  const currentProduct = React.useMemo(() => {
    const pathname = location.pathname;

    // Collect all product/link pairs from config
    const allLinks: Array<{ productKey: string; link: string }> = [];

    for (const [productKey, productConfig] of Object.entries(allProducts)) {
      // Handle versioned products (check versions.current.links)
      let productLinks: ProductLink[] | undefined = productConfig.links;

      if (productConfig.versions) {
        // For versioned products, use current version links for detection
        productLinks = productConfig.versions.current?.links || [];
      }

      if (productLinks) {
        for (const link of productLinks) {
          allLinks.push({ productKey, link: link.link });
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

    // Return null if no match (secondary navbar won't show)
    return null;
  }, [location.pathname, allProducts]);

  const product: ProductItem | null = currentProduct ? allProducts[currentProduct] : null;

  // Get version-specific links if product has versioned configs
  const productLinks = React.useMemo<ProductLink[]>(() => {
    if (!product) return [];

    // Check if product has version-specific configs
    if (product.versions && activeVersion) {
      // Get links for active version (no fallback - must be explicitly configured)
      return product.versions[activeVersion]?.links || [];
    }

    // Fallback to default links for non-versioned products
    return product.links || [];
  }, [product, activeVersion]);

  // Handle fixed positioning when scrolling past main navbar (Weaviate approach)
  useEffect(() => {
    const handleScroll = () => {
      const mainNavbar = document.querySelector('.navbar') as HTMLElement | null;
      if (mainNavbar && navbarRef.current) {
        // Check if we've scrolled past the main navbar
        if (window.scrollY > mainNavbar.offsetHeight) {
          setIsFixed(true);
        } else {
          setIsFixed(false);
        }
      }
    };

    // Check initial position (handles anchor links on page load)
    handleScroll();

    window.addEventListener('scroll', handleScroll);
    window.addEventListener('load', handleScroll);

    return () => {
      window.removeEventListener('scroll', handleScroll);
      window.removeEventListener('load', handleScroll);
    };
  }, []);

  // Don't show if no product or only 1 link
  if (!product || !productLinks || productLinks.length <= 1) {
    return null;
  }

  return (
    <>
      <div
        ref={navbarRef}
        className={clsx(styles.secondaryNavbar, isFixed && styles.fixedTop)}
      >
        <nav className={styles.navLinks}>
          {productLinks.map((item, index) => {
            if (item.dropdown) {
              // Dropdown support (optional)
              return (
                <div key={index} className={styles.dropdown}>
                  <span className={styles.dropdownToggle}>
                    {item.label}
                    <FaChevronDown aria-hidden="true" />
                  </span>
                  <div className={styles.dropdownMenu}>
                    {item.dropdown.map((subItem, subIndex) => (
                      <Link
                        key={subIndex}
                        to={subItem.link}
                        className={styles.dropdownItem}
                      >
                        {subItem.label}
                      </Link>
                    ))}
                  </div>
                </div>
              );
            }

            // Regular link - determine if active based on pathname
            const isActive = location.pathname.startsWith(item.link);

            return (
              <Link
                key={index}
                to={item.link}
                className={clsx(
                  styles.navLink,
                  isActive && styles.activeLink
                )}
              >
                {item.label}
              </Link>
            );
          })}
        </nav>
      </div>
      {/* Placeholder to prevent content jump when navbar becomes fixed */}
      {isFixed && (
        <div ref={placeholderRef} className={styles.placeholder} />
      )}
    </>
  );
}
