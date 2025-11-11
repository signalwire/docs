import React, {type ReactNode, useState, useEffect} from 'react';
import NavbarLayout from '@theme/Navbar/Layout';
import NavbarContent from '@theme/Navbar/Content';
import SecondaryNavbar from '@theme/SecondaryNavbar';
import ProductModal from '@theme/ProductModal';
import { ModalContext } from '@theme/Navbar/ModalContext';
import { useSecondaryNavState } from '@theme/Navbar/hooks/useSecondaryNavState';

export default function Navbar(): ReactNode {
  const [isModalOpen, setModalOpen] = useState(false);
  const [currentProduct, setCurrentProduct] = useState('platform');

  // Get secondary navbar state to determine if it should be shown
  const { product, productLinks } = useSecondaryNavState();
  const hasSecondaryNavbar = product && productLinks && productLinks.length > 1;

  // Update HTML data attribute when secondary navbar state changes
  useEffect(() => {
    if (hasSecondaryNavbar) {
      document.documentElement.setAttribute('data-has-secondary-navbar', 'true');
    } else {
      document.documentElement.removeAttribute('data-has-secondary-navbar');
    }

    // Cleanup on unmount
    return () => {
      document.documentElement.removeAttribute('data-has-secondary-navbar');
    };
  }, [hasSecondaryNavbar]);

  return (
    <ModalContext.Provider value={{ isModalOpen, setModalOpen, currentProduct, setCurrentProduct }}>
      <NavbarLayout secondaryNavbar={hasSecondaryNavbar ? <SecondaryNavbar /> : undefined}>
        <NavbarContent />
      </NavbarLayout>
      <ProductModal
        isOpen={isModalOpen}
        onClose={() => setModalOpen(false)}
        currentProduct={currentProduct}
      />
    </ModalContext.Provider>
  );
}
