import React, { useState, useRef, useEffect, type ReactNode } from 'react';
import { useThemeConfig } from '@docusaurus/theme-common';
import { useNavbarMobileSidebar } from '@docusaurus/theme-common/internal';
import { Collapsible, useCollapsible } from '@docusaurus/theme-common';
import { useLocation } from '@docusaurus/router';
import Link from '@docusaurus/Link';
import NavbarItem, { type Props as NavbarItemConfig } from '@theme/NavbarItem';
import { useSecondaryNavState } from '@theme/Navbar/hooks/useSecondaryNavState';
import { ProductLink } from '@site/secondaryNavbar';
import styles from './styles.module.scss';

function useNavbarItems() {
  // TODO temporary casting until ThemeConfig type is improved
  return useThemeConfig().navbar.items as NavbarItemConfig[];
}

// Helper component for collapsible dropdowns
function MobileDropdown({ item, onClose }: { item: ProductLink; onClose: () => void }) {
  const { collapsed, toggleCollapsed, setCollapsed } = useCollapsible({
    initialState: true,
  });

  if (!item.dropdown || item.dropdown.length === 0) {
    return null;
  }

  return (
    <li className="menu__list-item">
      <span
        className={`menu__link menu__link--sublist ${!collapsed ? 'menu__link--active' : ''}`}
        onClick={(e) => {
          e.preventDefault();
          toggleCollapsed();
        }}
        role="button"
        tabIndex={0}
        onKeyDown={(e) => {
          if (e.key === 'Enter' || e.key === ' ') {
            e.preventDefault();
            toggleCollapsed();
          }
        }}
      >
        {item.label}
        <span
          className={`${styles.dropdownArrow} ${
            !collapsed ? styles.dropdownArrowOpen : ''
          }`}
        >
          ▼
        </span>
      </span>
      <Collapsible lazy as="ul" className="menu__list" collapsed={collapsed}>
        {item.dropdown.map((subItem, subIndex) => (
          <li key={subIndex} className="menu__list-item">
            <Link
              className="menu__link"
              to={subItem.link}
              onClick={() => {
                setCollapsed(true);
                onClose();
              }}
            >
              {subItem.label}
            </Link>
          </li>
        ))}
      </Collapsible>
    </li>
  );
}

// The primary menu displays the navbar items
export default function NavbarMobilePrimaryMenu(): ReactNode {
  const mobileSidebar = useNavbarMobileSidebar();
  const location = useLocation();
  const items = useNavbarItems();

  // Get secondary navbar state
  const { product, productLinks } = useSecondaryNavState();

  // Track if user manually navigated to main menu
  const userNavigatedToMainRef = useRef(false);

  // Internal state: toggle between main menu and secondary navbar
  const [showMainNav, setShowMainNav] = useState(!product);

  // Reset to secondary nav when product appears (unless user manually chose main menu)
  useEffect(() => {
    if (product && productLinks.length > 1 && !userNavigatedToMainRef.current) {
      setShowMainNav(false);
    }
  }, [product, productLinks]);

  // Wrapper functions to track manual navigation
  const navigateToMain = () => {
    userNavigatedToMainRef.current = true;
    setShowMainNav(true);
  };

  const navigateToSecondary = () => {
    userNavigatedToMainRef.current = false;
    setShowMainNav(false);
  };

  // If no product or only 1 link, show main menu only (no dual-panel needed)
  if (!product || !productLinks || productLinks.length <= 1) {
    return (
      <ul className="menu__list">
        {items.map((item, i) => (
          <NavbarItem
            mobile
            {...item}
            onClick={() => mobileSidebar.toggle()}
            key={i}
          />
        ))}
      </ul>
    );
  }

  // Dual-panel mode: render both main menu and secondary navbar with transitions
  return (
    <div className={`${styles.menuContainer} ${!showMainNav ? styles.showSecondary : ''}`}>
      {/* Main Menu Panel */}
      <ul className={`menu__list ${styles.menuPanel}`}>
        {items.map((item, i) => (
          <NavbarItem
            mobile
            {...item}
            onClick={() => mobileSidebar.toggle()}
            key={i}
          />
        ))}

        {/* Button to navigate to product navigation */}
        <li
          className="menu__list-item"
          style={{
            marginTop: '1rem',
            paddingTop: '1rem',
            borderTop: '1px solid var(--ifm-toc-border-color)',
          }}
        >
          <button
            type="button"
            className="clean-btn navbar-sidebar__back"
            onClick={navigateToSecondary}
            style={{ width: '100%', textAlign: 'left' }}
          >
            → {product.title} Navigation
          </button>
        </li>
      </ul>

      {/* Secondary Navbar Panel */}
      <ul className={`menu__list ${styles.menuPanel}`}>
        {/* Back to main menu button */}
        <li className="menu__list-item">
          <button
            type="button"
            className="clean-btn navbar-sidebar__back"
            onClick={navigateToMain}
          >
            ← Back to main menu
          </button>
        </li>

        {/* Product section title */}
        <li className="menu__list-item">
          <span className={`menu__link menu__link--sublist ${styles.sectionTitle}`}>
            {product.title}
          </span>
        </li>

        {/* Secondary navbar links */}
        {productLinks.map((navItem, index) => {
          if (navItem.dropdown && navItem.dropdown.length > 0) {
            return (
              <MobileDropdown
                key={index}
                item={navItem}
                onClose={() => mobileSidebar.toggle()}
              />
            );
          }

          const isActive = location.pathname.startsWith(navItem.link);
          return (
            <li key={index} className="menu__list-item">
              <Link
                className={`menu__link ${isActive ? 'menu__link--active' : ''}`}
                to={navItem.link}
                onClick={() => mobileSidebar.toggle()}
              >
                {navItem.label}
              </Link>
            </li>
          );
        })}
      </ul>
    </div>
  );
}
