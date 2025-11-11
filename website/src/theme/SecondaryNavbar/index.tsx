import React from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { FaChevronDown } from 'react-icons/fa';
import { useSecondaryNavState } from '@theme/Navbar/hooks/useSecondaryNavState';
import { ProductLink, DropdownItem } from '@site/secondaryNavbar';
import styles from './styles.module.scss';

export default function SecondaryNavbar(): React.JSX.Element | null {
  // Get secondary navbar state from shared hook
  const { product, productLinks, activeSidebar } = useSecondaryNavState();

  // Don't show if no product or only 1 link
  if (!product || !productLinks || productLinks.length <= 1) {
    return null;
  }

  return (
    <div className={styles.secondaryNavbar}>
      <nav className={clsx(styles.navLinks, 'navbar__items')}>
        {productLinks.map((item: ProductLink, index: number) => {
          if (item.dropdown) {
            // Dropdown support (optional)
            return (
              <div key={index} className={styles.dropdown}>
                <span className={styles.dropdownToggle}>
                  {item.label}
                  <FaChevronDown aria-hidden="true" />
                </span>
                <div className={styles.dropdownMenu}>
                  {item.dropdown.map((subItem: DropdownItem, subIndex: number) => (
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

          // Regular link - determine if active based on sidebar name
          const isActive = activeSidebar && item.sidebar === activeSidebar;

          return (
            <Link
              key={index}
              to={item.link}
              className={clsx(
                'navbar__item navbar__link',
                isActive && 'navbar__link--active'
              )}
            >
              {item.label}
            </Link>
          );
        })}
      </nav>
    </div>
  );
}
