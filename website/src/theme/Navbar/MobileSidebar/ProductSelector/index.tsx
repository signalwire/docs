import React, { useState } from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { FaChevronDown } from 'react-icons/fa';
import { useNavbarMobileSidebar } from '@docusaurus/theme-common/internal';
import { ProductItem } from '@site/secondaryNavbar';
import { useAllProducts, renderIcon } from '@theme/utils/productUtils';
import { useSecondaryNavState } from '@theme/Navbar/hooks/useSecondaryNavState';
import styles from './styles.module.scss';

export default function ProductSelector(): React.JSX.Element | null {
  const [isExpanded, setIsExpanded] = useState(false);
  const mobileSidebar = useNavbarMobileSidebar();
  const allProducts = useAllProducts();
  const { currentProduct } = useSecondaryNavState();

  // Get current product info
  const product: ProductItem = currentProduct && allProducts[currentProduct]
    ? allProducts[currentProduct]
    : {
        title: "Browse Documentation"
      };

  // Get all products as array for the expanded list
  const productList = Object.entries(allProducts).map(([key, value]) => ({
    key,
    ...value,
  }));

  const handleProductClick = () => {
    setIsExpanded(false);
    mobileSidebar.toggle(); // Close sidebar on navigation
  };

  return (
    <div className={styles.productSelectorContainer}>
      {/* Current Product Button */}
      <button
        className={clsx(styles.productButton, 'menu__list-item')}
        onClick={() => setIsExpanded(!isExpanded)}
        aria-expanded={isExpanded}
      >
        <div className={styles.productButtonContent}>
          {renderIcon(product.icon, styles.productIcon)}
          <div className={styles.productInfo}>
            <div className={styles.productTitle}>{product.title}</div>
            {product.description && (
              <div className={styles.productDescription}>{product.description}</div>
            )}
          </div>
        </div>
        <FaChevronDown
          className={clsx(styles.chevron, isExpanded && styles.expanded)}
          aria-hidden="true"
        />
      </button>

      {/* Expanded Product List */}
      {isExpanded && (
        <div className={styles.productList}>
          {productList.map(({ key, ...value }) => {
            const isActive = key === currentProduct;
            return (
              <Link
                key={key}
                to={value.link}
                className={clsx(
                  styles.productItem,
                  'menu__link',
                  isActive && styles.active
                )}
                onClick={handleProductClick}
              >
                {renderIcon(value.icon, styles.productItemIcon)}
                <div className={styles.productItemText}>
                  <div className={styles.productItemTitle}>{value.title}</div>
                  {value.description && (
                    <div className={styles.productItemDescription}>
                      {value.description}
                    </div>
                  )}
                </div>
              </Link>
            );
          })}
        </div>
      )}
    </div>
  );
}
