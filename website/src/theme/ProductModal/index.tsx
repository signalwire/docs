import React, { useEffect } from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { IconType } from 'react-icons';
import { modalSections, ProductItem } from '@site/secondaryNavbar';
import styles from './styles.module.scss';

interface ProductModalProps {
  isOpen: boolean;
  onClose: () => void;
  currentProduct: string;
}

export default function ProductModal({
  isOpen,
  onClose,
  currentProduct,
}: ProductModalProps): React.JSX.Element {
  const [isApple, setIsApple] = React.useState(false);

  // Detect platform for keyboard shortcuts
  useEffect(() => {
    setIsApple(navigator.platform.includes('Mac'));
  }, []);

  // Close on Escape key
  useEffect(() => {
    if (!isOpen) return;

    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        onClose();
      }
    };

    document.addEventListener('keydown', handleEscape);
    return () => document.removeEventListener('keydown', handleEscape);
  }, [isOpen, onClose]);

  // Helper to determine if a product is active
  const isProductActive = (productKey: string): boolean => {
    return productKey === currentProduct;
  };

  // Render icon (supports React component or string class)
  const renderIcon = (icon: IconType | string, className: string): React.JSX.Element | null => {
    if (typeof icon === 'string') {
      return <i className={clsx(icon, className)} aria-hidden="true" />;
    } else if (typeof icon === 'function') {
      const IconComponent = icon;
      return <IconComponent className={className} aria-hidden="true" />;
    }
    return null;
  };

  // Extract modal header title from first main section
  const mainSections = modalSections.filter((section) => section.type === 'main');
  const modalTitle = mainSections[0]?.title || 'Go to documentation:';

  // Merge all main sections into single products object
  const mainProducts = mainSections.reduce<Record<string, ProductItem>>((acc, section) => {
    return { ...acc, ...section.items };
  }, {});

  // Get all section-type sections
  const customSections = modalSections.filter((section) => section.type === 'section');

  return (
    <div
      className={clsx(styles.modalOverlay, isOpen && styles.active)}
      onClick={onClose}
      role="dialog"
      aria-modal="true"
      aria-hidden={!isOpen}
    >
      <div
        className={styles.modalContent}
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className={styles.modalHeader}>
          <div className={styles.modalHeaderLeft}>
            <strong>{modalTitle}</strong>
          </div>
          <div className={styles.modalHeaderRight}>
            <button
              className={styles.closeButton}
              onClick={onClose}
              aria-label="Close modal"
            >
              <span className={styles.shortcut}>
                {isApple ? '⌘U' : 'Ctrl+U'}
              </span>
              <span className={styles.divider} />
              <span className={styles.closeIcon}>✕</span>
            </button>
          </div>
        </div>

        {/* Body */}
        <div className={styles.modalBody}>
          {/* Main Products */}
          <div className={styles.productsGrid}>
            {Object.entries(mainProducts).map(([key, value]) => {
              const active = isProductActive(key);
              return (
                <Link
                  key={key}
                  to={value.link}
                  className={clsx(
                    styles.productCard,
                    active && styles.activeCard
                  )}
                  onClick={onClose}
                >
                  {renderIcon(value.icon, styles.productIcon)}
                  <div className={styles.productText}>
                    <strong>{value.title}</strong>
                    <p>{value.description}</p>
                  </div>
                  {active && <div className={styles.activeIndicator} />}
                </Link>
              );
            })}
          </div>

          {/* Custom Sections */}
          {customSections.map((section, sectionIndex) => (
            <div key={sectionIndex} className={styles.resourcesSection}>
              <h4 className={styles.sectionTitle}>{section.title}</h4>
              <div className={styles.resourcesGrid}>
                {Object.entries(section.items).map(([key, value]) => {
                  const active = isProductActive(key);

                  return (
                    <Link
                      key={key}
                      to={value.link}
                      className={clsx(
                        styles.resourceCard,
                        active && styles.activeResource
                      )}
                      onClick={onClose}
                    >
                      {renderIcon(value.icon, styles.resourceIcon)}
                      <span className={styles.resourceTitle}>
                        {value.title}
                      </span>
                      {active && <div className={styles.activeResourceDot} />}
                    </Link>
                  );
                })}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
