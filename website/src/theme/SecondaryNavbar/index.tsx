import React from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import DropdownNavbarItem from '@theme/NavbarItem/DropdownNavbarItem';
import { useSecondaryNavState } from '@theme/Navbar/hooks/useSecondaryNavState';
import { ProductLink, DropdownItem } from '@site/secondaryNavbar';
import styles from './styles.module.scss';

export default function SecondaryNavbar(): React.JSX.Element | null {
  // Get secondary navbar state from shared hook
  const { product, productLinks, activeSidebar } = useSecondaryNavState();

  // Don't render if no product links or only 1 item
  if (!productLinks || productLinks.length <= 1) {
    return null;
  }

  return (
    <div className={clsx('navbar', 'navbar--secondary', styles.secondaryNavbar)}>
      <div className="navbar__inner">
        {/* LEFT CONTAINER - Product navigation links */}
        <div className="theme-layout-navbar-left navbar__items">
          {productLinks.map((item: ProductLink, index: number) => {
            if (item.dropdown) {
              // Use Docusaurus's built-in dropdown component for accessibility & consistency
              return (
                <DropdownNavbarItem
                  key={index}
                  label={item.label}
                  to={item.link}
                  activeClassName='navbar__link--active'
                  items={item.dropdown.map((subItem: DropdownItem) => ({
                    type: 'default' as const,
                    label: subItem.label,
                    to: subItem.link,
                  }))}
                />
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
                  isActive && 'navbar__link--active' // Infima active class (color, no underline)
                )}
              >
                {item.label}
              </Link>
            );
          })}
        </div>
        {/* RIGHT CONTAINER - Empty for now, ready for future right-aligned items */}
        <div className="theme-layout-navbar-right navbar__items navbar__items--right">
        </div>
      </div>
    </div>
  );
}
