import React, {type ReactNode, useState} from 'react';
import NavbarLayout from '@theme/Navbar/Layout';
import NavbarContent from '@theme/Navbar/Content';
import SecondaryNavbar from '@theme/SecondaryNavbar';
import ProductModal from '@theme/ProductModal';
import { ModalContext } from '@theme/Navbar/ModalContext';

export default function Navbar(): ReactNode {
  const [isModalOpen, setModalOpen] = useState(false);
  const [currentProduct, setCurrentProduct] = useState('platform');

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
