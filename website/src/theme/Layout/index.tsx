import React, {type ReactNode, useState} from 'react';
import clsx from 'clsx';
import ErrorBoundary from '@docusaurus/ErrorBoundary';
import {
  PageMetadata,
  SkipToContentFallbackId,
  ThemeClassNames,
} from '@docusaurus/theme-common';
import {useKeyboardNavigation} from '@docusaurus/theme-common/internal';
import SkipToContent from '@theme/SkipToContent';
import AnnouncementBar from '@theme/AnnouncementBar';
import Navbar from '@theme/Navbar';
import SecondaryNavbar from '@theme/SecondaryNavbar';
import ProductModal from '@theme/ProductModal';
import Footer from '@theme/Footer';
import LayoutProvider from '@theme/Layout/Provider';
import ErrorPageContent from '@theme/ErrorPageContent';
import type {Props} from '@theme/Layout';
import { ModalContext } from './ModalContext';
import styles from './styles.module.css';

// Re-export for convenience
export { useModalContext } from './ModalContext';

export default function Layout(props: Props): React.JSX.Element {
  const {
    children,
    noFooter,
    wrapperClassName,
    // Not really layout-related, but kept for convenience/retro-compatibility
    title,
    description,
  } = props;

  const [isModalOpen, setModalOpen] = useState(false);
  const [currentProduct, setCurrentProduct] = useState('platform');

  useKeyboardNavigation();

  return (
    <LayoutProvider>
      <ModalContext.Provider value={{ isModalOpen, setModalOpen, currentProduct, setCurrentProduct }}>
        <PageMetadata title={title} description={description} />

        <SkipToContent />

        <AnnouncementBar />

        <Navbar />

        <SecondaryNavbar />

        <ProductModal
          isOpen={isModalOpen}
          onClose={() => setModalOpen(false)}
          currentProduct={currentProduct}
        />

        <div
          id={SkipToContentFallbackId}
          className={clsx(
            ThemeClassNames.layout.main.container,
            ThemeClassNames.wrapper.main,
            styles.mainWrapper,
            wrapperClassName,
          )}>
          <ErrorBoundary fallback={(params) => <ErrorPageContent {...params} />}>
            {children}
          </ErrorBoundary>
        </div>

        {!noFooter && <Footer />}
      </ModalContext.Provider>
    </LayoutProvider>
  );
}
