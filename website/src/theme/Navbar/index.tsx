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

  // Set data attribute and CSS variable for secondary navbar offset (not navbar height)
  useEffect(() => {
    if (hasSecondaryNavbar) {
      document.documentElement.setAttribute('data-has-secondary-navbar', 'true');
      document.documentElement.style.setProperty('--secondary-navbar-offset', '60px');
    } else {
      document.documentElement.removeAttribute('data-has-secondary-navbar');
      document.documentElement.style.setProperty('--secondary-navbar-offset', '0px');
    }
  }, [hasSecondaryNavbar]);

  return (
    <ModalContext.Provider value={{ isModalOpen, setModalOpen, currentProduct, setCurrentProduct }}>
      <NavbarLayout>
        <NavbarContent />
      </NavbarLayout>
      <SecondaryNavbar />
      <ProductModal
        isOpen={isModalOpen}
        onClose={() => setModalOpen(false)}
        currentProduct={currentProduct}
      />
    </ModalContext.Provider>
  );
}
