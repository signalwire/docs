import React, {type ComponentProps, type ReactNode, useLayoutEffect} from 'react';
import clsx from 'clsx';
import {ThemeClassNames, useThemeConfig} from '@docusaurus/theme-common';
import {useHideableNavbar, useNavbarMobileSidebar} from '@docusaurus/theme-common/internal';
import {translate} from '@docusaurus/Translate';
import NavbarMobileSidebar from '@theme/Navbar/MobileSidebar';
import { useSecondaryNavState } from '@theme/Navbar/hooks/useSecondaryNavState';
import type {Props} from '@theme/Navbar/Layout';
import styles from './styles.module.css';

function NavbarBackdrop(props: ComponentProps<'div'>) {
  return (
    <div
      role="presentation"
      {...props}
      className={clsx('navbar-sidebar__backdrop', props.className)}
    />
  );
}

export default function NavbarLayout({children}: Props): ReactNode {
  const {navbar: {hideOnScroll, style}} = useThemeConfig();
  const mobileSidebar = useNavbarMobileSidebar();
  const {navbarRef, isNavbarVisible} = useHideableNavbar(hideOnScroll);
  const { productLinks } = useSecondaryNavState();

  // Dynamically set navbar height synchronously before paint
  // useLayoutEffect runs before browser paint, eliminating visual flicker during SPA navigation
  useLayoutEffect(() => {
    const hasSecondaryNavbar = productLinks && productLinks.length > 1;

    // Update total navbar height using calc() strings for flexibility
    // This allows theme users to customize navbar heights via CSS variables
    const totalHeight = hasSecondaryNavbar
      ? 'calc(var(--ifm-primary-navbar-height) + var(--secondary-navbar-height))'
      : 'var(--ifm-primary-navbar-height)';

    document.documentElement.style.setProperty('--ifm-navbar-height', totalHeight);
  }, [productLinks]);

  // Calculate if secondary navbar is present for conditional border styling
  const hasSecondaryNavbar = productLinks && productLinks.length > 1;

  return (
    <nav
      ref={navbarRef}
      aria-label={translate({
        id: 'theme.NavBar.navAriaLabel',
        message: 'Main',
        description: 'The ARIA label for the main navigation',
      })}
      className={clsx(
        ThemeClassNames.layout.navbar.container,
        'navbar',
        // Conditional border styling via CSS classes
        hasSecondaryNavbar ? 'navbar--with-secondary' : 'navbar--standalone',
        hideOnScroll && [
          styles.navbarHideable,
          !isNavbarVisible && styles.navbarHidden,
        ],
        {
          'navbar--dark': style === 'dark',
          'navbar--primary': style === 'primary',
          'navbar-sidebar--show': mobileSidebar.shown,
        },
      )}>
      {/* Render children directly - no wrapper needed */}
      {children}
      <NavbarBackdrop onClick={mobileSidebar.toggle} />
      <NavbarMobileSidebar />
    </nav>
  );
}
