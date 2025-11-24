import React from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { modalSections, ModalSection, ProductItem } from '@site/secondaryNavbar';
import { renderIcon, sortByPosition } from '@theme/utils/productUtils';
import styles from './styles.module.scss';

interface DropdownContentProps {
  currentProduct: string | null;
  onItemClick: () => void;
}

export default function DropdownContent({
  currentProduct,
  onItemClick,
}: DropdownContentProps): React.JSX.Element {
  // Helper to determine if a product is active
  const isProductActive = (productKey: string): boolean => {
    return currentProduct !== null && productKey === currentProduct;
  };

  // Sort all sections by position
  const allSections = sortByPosition(modalSections);

  return (
    <div className={styles.dropdownContent}>
      {allSections.map((section, sectionIndex) => {
        // Sort items within this section
        const items = sortByPosition(
          Object.entries(section.items).map(([key, value]) => ({
            key,
            ...value,
          }))
        );

        return (
          <div key={`section-${sectionIndex}`} className={styles.section}>
            {section.title && (
              <h3 className={styles.sectionTitle}>{section.title}</h3>
            )}
            <div className={styles.sectionGrid}>
              {items.map(({ key, ...value }: { key: string } & ProductItem) => {
                const active = isProductActive(key);
                return (
                  <Link
                    key={key}
                    to={value.link}
                    className={clsx(
                      styles.productItem,
                      active && styles.activeItem
                    )}
                    onClick={onItemClick}
                  >
                    {renderIcon(value.icon, styles.productIcon)}
                    <div className={styles.productText}>
                      <strong>{value.title}</strong>
                      {value.description && <p>{value.description}</p>}
                    </div>
                  </Link>
                );
              })}
            </div>
          </div>
        );
      })}
    </div>
  );
}
