import React, {type ComponentProps, type ReactNode} from 'react';
import {useThemeConfig} from '@docusaurus/theme-common';
import {useNavbarSecondaryMenu} from '@docusaurus/theme-common/internal';
import Translate from '@docusaurus/Translate';
import {useSecondaryNavState} from '@theme/Navbar/hooks/useSecondaryNavState';

function SecondaryMenuBackButton(props: ComponentProps<'button'> & {productTitle?: string}) {
  const {productTitle, ...buttonProps} = props;

  return (
    <button {...buttonProps} type="button" className="clean-btn navbar-sidebar__back">
      {productTitle ? (
        `← Back to ${productTitle} Navigation`
      ) : (
        <Translate
          id="theme.navbar.mobileSidebarSecondaryMenu.backButtonLabel"
          description="The label of the back button to return to main menu, inside the mobile navbar sidebar secondary menu (notably used to display the docs sidebar)">
          ← Back to main menu
        </Translate>
      )}
    </button>
  );
}

// The secondary menu slides from the right and shows contextual information
// such as the docs sidebar
export default function NavbarMobileSidebarSecondaryMenu(): ReactNode {
  const isPrimaryMenuEmpty = useThemeConfig().navbar.items.length === 0;
  const secondaryMenu = useNavbarSecondaryMenu();
  const {product} = useSecondaryNavState();

  return (
    <>
      {/* edge-case: prevent returning to the primaryMenu when it's empty */}
      {!isPrimaryMenuEmpty && (
        <SecondaryMenuBackButton
          onClick={() => secondaryMenu.hide()}
          productTitle={product?.title}
        />
      )}
      {secondaryMenu.content}
    </>
  );
}
