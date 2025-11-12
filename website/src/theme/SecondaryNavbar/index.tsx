import React, { useEffect, useRef, useState } from 'react';
import Link from '@docusaurus/Link';
import clsx from 'clsx';
import { FaChevronDown } from 'react-icons/fa';
import { useSecondaryNavState } from '@theme/Navbar/hooks/useSecondaryNavState';
import { ProductLink, DropdownItem } from '@site/secondaryNavbar';
import styles from './styles.module.scss';

export default function SecondaryNavbar(): React.JSX.Element | null {
  const navbarRef = useRef<HTMLDivElement>(null);
  const placeholderRef = useRef<HTMLDivElement>(null);
  const [isFixed, setIsFixed] = useState(false);

  // Get secondary navbar state from shared hook
  const { product, productLinks, activeSidebar } = useSecondaryNavState();

  // Handle fixed positioning when scrolling past main navbar
  useEffect(() => {
    const handleScroll = () => {
      const mainNavbar = document.querySelector('.navbar') as HTMLElement | null;
      if (mainNavbar && navbarRef.current) {
        // Check if we've scrolled past the main navbar
        if (window.scrollY > mainNavbar.offsetHeight) {
          setIsFixed(true);
        } else {
          setIsFixed(false);
        }
      }
    };

    // Check initial position (handles anchor links on page load)
    handleScroll();

    window.addEventListener('scroll', handleScroll);
    window.addEventListener('load', handleScroll);

    return () => {
      window.removeEventListener('scroll', handleScroll);
      window.removeEventListener('load', handleScroll);
    };
  }, []);

  // Signal to main navbar that secondary navbar exists
  // COMMENTED OUT FOR TESTING - showing both navbar borders
  // useEffect(() => {
  //   // Only add class if we're actually going to show the secondary navbar
  //   if (!product || !productLinks || productLinks.length <= 1) {
  //     return; // Don't add class if not rendering
  //   }

  //   const mainNavbar = document.querySelector('.navbar:not(.secondaryNavbar)');
  //   if (mainNavbar) {
  //     mainNavbar.classList.add('has-secondary-navbar');
  //   }

  //   return () => {
  //     const mainNavbar = document.querySelector('.navbar:not(.secondaryNavbar)');
  //     if (mainNavbar) {
  //       mainNavbar.classList.remove('has-secondary-navbar');
  //     }
  //   };
  // }, [product, productLinks]);

  // Don't show if no product or only 1 link
  if (!product || !productLinks || productLinks.length <= 1) {
    return null;
  }

  return (
    <>
      <nav
        ref={navbarRef}
        className={clsx('navbar', styles.secondaryNavbar, isFixed && styles.fixedTop)}
      >
        <div className="navbar__inner">
          <div className="navbar__items">
            {productLinks.map((item: ProductLink, index: number) => {
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
          <div className="navbar__items navbar__items--right">
            {/* Empty - provides proper flex layout for full width */}
          </div>
        </div>
      </nav>
      {/* Placeholder to prevent content jump when navbar becomes fixed */}
      {isFixed && (
        <div ref={placeholderRef} className={styles.placeholder} />
      )}
    </>
  );
}
