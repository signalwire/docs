import React, { useEffect } from 'react';
import { useLocation } from '@docusaurus/router';
import clsx from 'clsx';
import { FaChevronDown } from 'react-icons/fa';
import { IconType } from 'react-icons';
import { useModalContext } from '@theme/Navbar/ModalContext';
import { ProductItem, ProductLink } from '@site/secondaryNavbar';
import { useAllProducts, detectCurrentProduct } from '@theme/utils/productUtils';
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
      className={styles.productButton}
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
