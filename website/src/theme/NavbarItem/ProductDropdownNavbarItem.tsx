import React, { useEffect } from 'react';
import { useLocation } from '@docusaurus/router';
import clsx from 'clsx';
import { FaChevronDown } from 'react-icons/fa';
import { IconType } from 'react-icons';
import { useModalContext } from '@theme/Layout/ModalContext';
import { modalSections, ProductItem, ProductLink } from '@site/secondaryNavbar';
import styles from './ProductDropdownNavbarItem/styles.module.scss';

export default function ProductDropdownNavbarItem(): React.JSX.Element | null {
  const { isModalOpen, setModalOpen, setCurrentProduct } = useModalContext();
  const location = useLocation();

  // Create a flat map of all products from modalSections
  const allProducts = React.useMemo(() => {
    return modalSections.reduce<Record<string, ProductItem>>((acc, section) => {
      return { ...acc, ...section.items };
    }, {});
  }, []);

  // Determine current product based on pathname (fully dynamic from config)
  const detectedProduct = React.useMemo(() => {
    const pathname = location.pathname;

    // Collect all product/link pairs from config
    const allLinks: Array<{ productKey: string; link: string }> = [];

    for (const [productKey, productConfig] of Object.entries(allProducts)) {
      // Handle versioned products (check versions.current.links or versions[version].links)
      let productLinks: ProductLink[] | undefined = productConfig.links;

      if (productConfig.versions) {
        // For versioned products, use current version links
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

    // Default to platform if no match found
    return 'platform';
  }, [location.pathname, allProducts]);

  // Update context when detected product changes
  useEffect(() => {
    setCurrentProduct(detectedProduct);
  }, [detectedProduct, setCurrentProduct]);

  const product: ProductItem | undefined = allProducts[detectedProduct];
  const Icon: IconType | string | undefined = product?.icon;

  // Close modal when navigating
  useEffect(() => {
    setModalOpen(false);
  }, [location.pathname, setModalOpen]);

  // Keyboard shortcut: Cmd/Ctrl+U
  useEffect(() => {
    const handleKeyDown = (event: KeyboardEvent) => {
      if ((event.metaKey || event.ctrlKey) && event.key.toLowerCase() === 'u') {
        setModalOpen((prev: boolean) => !prev);
        event.preventDefault();
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [setModalOpen]);

  if (!product) {
    return null;
  }

  // Render icon safely
  const renderIcon = () => {
    if (!Icon) return null;

    if (typeof Icon === 'string') {
      return <i className={clsx(Icon, styles.productIcon)} aria-hidden="true" />;
    }

    const IconComponent = Icon as IconType;
    return <IconComponent className={styles.productIcon} aria-hidden="true" />;
  };

  return (
    <button
      className={clsx('navbar__item', styles.productButton)}
      onClick={() => setModalOpen(true)}
      aria-label="Select product"
      aria-expanded={isModalOpen}
    >
      {renderIcon()}
      <span className={styles.productTitle}>{product.title}</span>
      <FaChevronDown className={styles.arrowIcon} aria-hidden="true" />
    </button>
  );
}
