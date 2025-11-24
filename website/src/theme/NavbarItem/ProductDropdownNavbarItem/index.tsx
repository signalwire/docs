import React from 'react';
import { useWindowSize } from '@docusaurus/theme-common';
import ProductDropdownDesktop from './Desktop';

interface Props {
  mobile?: boolean;
}

export default function ProductDropdownNavbarItem({ mobile = false }: Props): React.JSX.Element | null {
  const windowSize = useWindowSize();
  const isMobile = windowSize === 'mobile';

  // Don't render in mobile sidebar context
  if (mobile) {
    return null;
  }

  // Don't render in mobile viewport - product selector is in mobile sidebar instead
  if (isMobile) {
    return null;
  }

  // Render desktop dropdown
  return <ProductDropdownDesktop />;
}
