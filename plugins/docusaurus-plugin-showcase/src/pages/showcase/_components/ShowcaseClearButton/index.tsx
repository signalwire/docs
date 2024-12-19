import React from 'react';
import {useClearQueryString} from '@docusaurus/theme-common';
import Translate from '@docusaurus/Translate';

export default function ClearAllButton(): JSX.Element {
  const clearQueryString = useClearQueryString();
  return (
    <button
      className="button button--outline button--primary"
      type="button"
      onClick={() => clearQueryString()}>
      <Translate>Clear Filters</Translate>
    </button>
  );
}