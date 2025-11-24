import React, { type ReactNode } from 'react';
import NavbarLayout from '@theme/Navbar/Layout';
import NavbarContent from '@theme/Navbar/Content';
import SecondaryNavbar from '@theme/SecondaryNavbar';

export default function Navbar(): ReactNode {
  return (
    <div
      style={{
        position: 'sticky',
        top: 0,
        zIndex: 'var(--ifm-z-index-fixed)',
      }}
    >
      <NavbarLayout>
        <NavbarContent />
      </NavbarLayout>
      <SecondaryNavbar />
    </div>
  );
}
