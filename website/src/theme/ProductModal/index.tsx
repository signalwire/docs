import React, { useEffect } from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { IconType } from 'react-icons';
import { modalSections, modalHeaderTitle, ProductItem } from '@site/secondaryNavbar';
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

  // Helper function to sort by position
  const sortByPosition = <T extends { position?: number }>(items: T[]): T[] => {
    return [...items].sort((a, b) => {
      const posA = a.position ?? Infinity;
      const posB = b.position ?? Infinity;
      return posA - posB;
    });
  };

  // Get all main and custom sections, sorted by position
  const mainSections = sortByPosition(
    modalSections.filter((section) => section.type === 'main')
  );
  const customSections = sortByPosition(
    modalSections.filter((section) => section.type === 'section')
  );

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
            <strong>{modalHeaderTitle}</strong>
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
          {/* Main Products with Section Headers */}
          <div className={styles.productsGrid}>
            {mainSections.map((section, sectionIndex) => (
              <React.Fragment key={`section-${sectionIndex}`}>
                {/* Section Header - only render if title is not empty */}
                {section.title && (
                  <h3 className={clsx(styles.sectionTitle, styles.gridSectionTitle)}>
                    {section.title}
                  </h3>
                )}
                {/* Section Items */}
                {sortByPosition(
                  Object.entries(section.items).map(([key, value]) => ({
                    key,
                    ...value,
                  }))
                ).map(({ key, ...value }) => {
                  const active = isProductActive(key);
                  const isFullWidth = sectionIndex === 0; // First section (Home)
                  return (
                    <Link
                      key={key}
                      to={value.link}
                      className={clsx(
                        styles.productCard,
                        active && styles.activeCard,
                        isFullWidth && styles.fullWidthCard
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
              </React.Fragment>
            ))}
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
