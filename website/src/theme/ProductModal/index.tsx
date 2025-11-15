import React, { useEffect } from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { modalSections, modalHeaderTitle } from '@site/secondaryNavbar';
import { renderIcon, sortByPosition } from '@theme/utils/productUtils';
import { useKeyboardShortcut } from '@theme/hooks/useKeyboardShortcut';
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
  useKeyboardShortcut('Escape', onClose, { enabled: isOpen });

  // Lock body scroll when modal is open
  useEffect(() => {
    if (isOpen) {
      document.body.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = '';
    }
    return () => {
      document.body.style.overflow = '';
    };
  }, [isOpen]);

  // Helper to determine if a product is active
  const isProductActive = (productKey: string): boolean => {
    return productKey === currentProduct;
  };

  // Get all main and custom sections, sorted by position
  const mainSections = sortByPosition(
    modalSections.filter((section) => section.type === 'main')
  );
  const customSections = sortByPosition(
    modalSections.filter((section) => section.type === 'section')
  );

  const modalContent = (
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
              <span className={clsx(styles.shortcut, styles.desktopOnly)}>
                {isApple ? '⌘U' : 'Ctrl+U'}
              </span>
              <span className={clsx(styles.divider, styles.desktopOnly)} />
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

  return modalContent;
}
