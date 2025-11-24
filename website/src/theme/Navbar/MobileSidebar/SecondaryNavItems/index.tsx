import React, { useState } from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { FaChevronDown } from 'react-icons/fa';
import { useNavbarMobileSidebar } from '@docusaurus/theme-common/internal';
import { useSecondaryNavState } from '@theme/Navbar/hooks/useSecondaryNavState';
import type { ProductLink, DropdownItem } from '@site/secondaryNavbar';
import styles from './styles.module.scss';

export default function SecondaryNavItems(): React.JSX.Element | null {
  const { productLinks, activeSidebar } = useSecondaryNavState();
  const mobileSidebar = useNavbarMobileSidebar();
  const [expandedDropdowns, setExpandedDropdowns] = useState<Record<string, boolean>>({});

  // Don't render if no secondary nav items or only 1 item (meaning just the main link)
  if (!productLinks || productLinks.length <= 1) {
    return null;
  }

  const toggleDropdown = (label: string) => {
    setExpandedDropdowns(prev => ({
      ...prev,
      [label]: !prev[label]
    }));
  };

  const handleLinkClick = () => {
    mobileSidebar.toggle(); // Close sidebar on navigation
  };

  const isLinkActive = (item: ProductLink | DropdownItem): boolean => {
    return activeSidebar ? item.sidebar === activeSidebar : false;
  };

  return (
    <div className={styles.secondaryNavContainer}>
      <div className={styles.secondaryNavTitle}>Navigation</div>
      <ul className={styles.secondaryNavList}>
        {productLinks.map((item: ProductLink, index: number) => {
          // Regular link (not dropdown)
          if ('link' in item && item.link) {
            const isActive = isLinkActive(item);
            return (
              <li key={index} className={styles.navItem}>
                <Link
                  to={item.link}
                  className={clsx(
                    styles.navLink,
                    'menu__link',
                    isActive && styles.active
                  )}
                  onClick={handleLinkClick}
                >
                  {item.label}
                </Link>
              </li>
            );
          }

          // Dropdown link
          if ('dropdown' in item && item.dropdown) {
            const isExpanded = expandedDropdowns[item.label] || false;
            const hasActiveChild = item.dropdown.some(child => isLinkActive(child));

            return (
              <li key={index} className={styles.navItem}>
                <button
                  className={clsx(
                    styles.dropdownButton,
                    'menu__link',
                    hasActiveChild && styles.active
                  )}
                  onClick={() => toggleDropdown(item.label)}
                  aria-expanded={isExpanded}
                >
                  <span>{item.label}</span>
                  <FaChevronDown
                    className={clsx(styles.chevron, isExpanded && styles.expanded)}
                    aria-hidden="true"
                  />
                </button>
                {isExpanded && (
                  <ul className={styles.dropdownList}>
                    {item.dropdown.map((child: DropdownItem, childIndex: number) => {
                      const isActive = isLinkActive(child);
                      return (
                        <li key={childIndex}>
                          <Link
                            to={child.link}
                            className={clsx(
                              styles.dropdownLink,
                              'menu__link',
                              isActive && styles.active
                            )}
                            onClick={handleLinkClick}
                          >
                            <div>
                              <div className={styles.dropdownLinkLabel}>{child.label}</div>
                              {child.description && (
                                <div className={styles.dropdownLinkDescription}>
                                  {child.description}
                                </div>
                              )}
                            </div>
                          </Link>
                        </li>
                      );
                    })}
                  </ul>
                )}
              </li>
            );
          }

          return null;
        })}
      </ul>
    </div>
  );
}
