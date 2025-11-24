import React, {type ReactNode} from 'react';
import PrimaryMenu from '@theme-original/Navbar/MobileSidebar/PrimaryMenu';
import type PrimaryMenuType from '@theme/Navbar/MobileSidebar/PrimaryMenu';
import type {WrapperProps} from '@docusaurus/types';
import ProductSelector from '@theme/Navbar/MobileSidebar/ProductSelector';
import SecondaryNavItems from '@theme/Navbar/MobileSidebar/SecondaryNavItems';

type Props = WrapperProps<typeof PrimaryMenuType>;

export default function PrimaryMenuWrapper(props: Props): ReactNode {
  return (
    <>
      {/* Product Selector at the top */}
      <ProductSelector />

      {/* Secondary Navigation Items (if product has them) */}
      <SecondaryNavItems />

      {/* Original Primary Menu (navbar items) */}
      <PrimaryMenu {...props} />
    </>
  );
}
