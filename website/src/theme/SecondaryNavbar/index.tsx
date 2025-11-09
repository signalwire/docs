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

  // Handle fixed positioning when scrolling past main navbar (Weaviate approach)
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

  // Don't show if no product or only 1 link
  if (!product || !productLinks || productLinks.length <= 1) {
    return null;
  }

  return (
    <>
      <div
        ref={navbarRef}
        className={clsx(styles.secondaryNavbar, isFixed && styles.fixedTop)}
      >
        <nav className={styles.navLinks}>
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
                  styles.navLink,
                  isActive && styles.activeLink
                )}
              >
                {item.label}
              </Link>
            );
          })}
        </nav>
      </div>
      {/* Placeholder to prevent content jump when navbar becomes fixed */}
      {isFixed && (
        <div ref={placeholderRef} className={styles.placeholder} />
      )}
    </>
  );
}
