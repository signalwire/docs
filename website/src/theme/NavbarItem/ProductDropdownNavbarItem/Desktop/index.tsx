import React, { useState, useRef, useEffect } from 'react';
import { useLocation } from '@docusaurus/router';
import { useActivePluginAndVersion, useActiveDocContext } from '@docusaurus/plugin-content-docs/client';
import clsx from 'clsx';
import { FaChevronDown } from 'react-icons/fa';
import { ProductItem } from '@site/secondaryNavbar';
import { useAllProducts, detectCurrentProduct, detectCurrentProductBySidebar } from '@theme/utils/productUtils';
import DropdownContent from '../DropdownContent';
import styles from './styles.module.scss';

export default function ProductDropdownDesktop(): React.JSX.Element {
  const dropdownRef = useRef<HTMLDivElement>(null);
  const [showDropdown, setShowDropdown] = useState(false);
  const location = useLocation();

  // Get active sidebar for product detection
  const activePluginAndVersion = useActivePluginAndVersion();
  const activeDocContext = useActiveDocContext(activePluginAndVersion?.activePlugin?.pluginId);
  const activeSidebar = activeDocContext?.activeDoc?.sidebar;

  // Get flat map of all products
  const allProducts = useAllProducts();

  // Determine current product based on sidebar first, then pathname
  const detectedProduct = React.useMemo(() => {
    // Try sidebar-based detection first (most reliable)
    if (activeSidebar) {
      const productBySidebar = detectCurrentProductBySidebar(activeSidebar, allProducts);
      if (productBySidebar) return productBySidebar;
    }

    // Fallback to URL matching for non-doc pages (blog, home, etc.)
    return detectCurrentProduct(location.pathname, allProducts, null);
  }, [activeSidebar, location.pathname, allProducts]);

  const product: ProductItem = detectedProduct
    ? allProducts[detectedProduct]
    : {
        title: "Browse Documentation"
      };

  // Close dropdown when navigating
  useEffect(() => {
    setShowDropdown(false);
  }, [location.pathname]);

  // Click-outside-to-close handling (from Docusaurus DropdownNavbarItem)
  useEffect(() => {
    const handleClickOutside = (
      event: MouseEvent | TouchEvent | FocusEvent,
    ) => {
      if (
        !dropdownRef.current ||
        dropdownRef.current.contains(event.target as Node)
      ) {
        return;
      }
      setShowDropdown(false);
    };

    document.addEventListener('mousedown', handleClickOutside);
    document.addEventListener('touchstart', handleClickOutside);
    document.addEventListener('focusin', handleClickOutside);

    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
      document.removeEventListener('touchstart', handleClickOutside);
      document.removeEventListener('focusin', handleClickOutside);
    };
  }, [dropdownRef]);

  return (
    <div ref={dropdownRef} className={styles.dropdownContainer}>
      <button
        aria-haspopup="true"
        aria-expanded={showDropdown}
        type="button"
        className={styles.dropdownButton}
        onClick={(e) => {
          e.preventDefault();
          setShowDropdown(!showDropdown);
        }}
        onKeyDown={(e) => {
          if (e.key === 'Enter') {
            e.preventDefault();
            setShowDropdown(!showDropdown);
          }
        }}>
        <span>{product.title}</span>
        <FaChevronDown
          className={clsx(styles.chevronIcon, showDropdown && styles.open)}
          aria-hidden="true"
        />
      </button>

      {/* Custom dropdown menu (Fern-style) */}
      {showDropdown && (
        <div className={styles.dropdownMenu}>
          <DropdownContent
            currentProduct={detectedProduct}
            onItemClick={() => setShowDropdown(false)}
          />
        </div>
      )}
    </div>
  );
}
