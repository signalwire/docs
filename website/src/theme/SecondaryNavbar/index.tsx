import React from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { FaChevronDown } from 'react-icons/fa';
import { useSecondaryNavState } from '@theme/Navbar/hooks/useSecondaryNavState';
import { ProductLink, DropdownItem } from '@site/secondaryNavbar';
import styles from './styles.module.scss';

export default function SecondaryNavbar(): React.JSX.Element {
  // Get secondary navbar state from shared hook
  const { product, productLinks, activeSidebar } = useSecondaryNavState();

  return (
    <div className={styles.secondaryNavbar}>
      <div className="navbar__inner">
        {/* LEFT CONTAINER - Product navigation links */}
        <div className="theme-layout-navbar-left navbar__items">
          {productLinks && productLinks.length > 1 && productLinks.map((item: ProductLink, index: number) => {
            if (item.dropdown) {
              // Dropdown support (optional)
              return (
                <div key={index} className="navbar__item dropdown dropdown--hoverable">
                  <a href="#" className="navbar__link" onClick={(e) => e.preventDefault()}>
                    {item.label}
                    <FaChevronDown aria-hidden="true" style={{ marginLeft: '0.3em', fontSize: '0.8em' }} />
                  </a>
                  <ul className="dropdown__menu">
                    {item.dropdown.map((subItem: DropdownItem, subIndex: number) => (
                      <li key={subIndex}>
                        <Link
                          to={subItem.link}
                          className="dropdown__link"
                        >
                          {subItem.label}
                        </Link>
                      </li>
                    ))}
                  </ul>
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
