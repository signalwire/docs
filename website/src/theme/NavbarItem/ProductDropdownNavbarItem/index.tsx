import React, { useEffect } from 'react';
import { useLocation } from '@docusaurus/router';
import { FaChevronDown } from 'react-icons/fa';
import { useModalContext } from '@theme/Navbar/ModalContext';
import { ProductItem } from '@site/secondaryNavbar';
import { useAllProducts, detectCurrentProduct, renderIcon } from '@theme/utils/productUtils';
import { useKeyboardShortcut } from '@theme/hooks/useKeyboardShortcut';
import styles from './styles.module.scss';

interface Props {
  mobile?: boolean;
}

export default function ProductDropdownNavbarItem({ mobile = false }: Props): React.JSX.Element | null {
  // Don't render in mobile sidebar
  if (mobile) {
    return null;
  }


  const { isModalOpen, setModalOpen, setCurrentProduct } = useModalContext();
  const location = useLocation();

  // Get flat map of all products from shared utility
  const allProducts = useAllProducts();

  // Determine current product based on pathname (fully dynamic from config)
  const detectedProduct = React.useMemo(() => {
    return detectCurrentProduct(location.pathname, allProducts, 'platform');
  }, [location.pathname, allProducts]);

  // Update context when detected product changes
  useEffect(() => {
    setCurrentProduct(detectedProduct);
  }, [detectedProduct, setCurrentProduct]);

  const product: ProductItem | undefined = allProducts[detectedProduct];

  // Close modal when navigating
  useEffect(() => {
    setModalOpen(false);
  }, [location.pathname, setModalOpen]);

  // Keyboard shortcut: Cmd/Ctrl+U
  useKeyboardShortcut('u', () => setModalOpen((prev: boolean) => !prev), {
    ctrlCmd: true,
    preventDefault: true,
  });

  if (!product) {
    return null;
  }

  return (
    <button
      className={styles.productButton}
      onClick={() => setModalOpen(true)}
      aria-label="Select product"
      aria-expanded={isModalOpen}
    >
      {renderIcon(product.icon, styles.productIcon)}
      <span className={styles.productTitle}>{product.title}</span>
      <FaChevronDown className={styles.arrowIcon} aria-hidden="true" />
    </button>
  );
}
