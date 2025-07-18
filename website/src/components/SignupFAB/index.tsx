import React from 'react';
import { useEffect, useState } from 'react';
import { useWindowSize } from '@site/src/utils/hooks/useWindowSize';


// Import Material Web components
import '@material/web/fab/fab.js';
import '@material/web/icon/icon.js';

// TypeScript declarations for web components
declare global {
  namespace JSX {
    interface IntrinsicElements {
      'md-fab': any;
      'md-branded-fab': any;
      'md-icon': any;
    }
  }
}

const SignupFABModern: React.FC = () => {
  const windowSize = useWindowSize();
  const isMobile = windowSize === 'mobile';

  useEffect(() => {
    console.log('Modern SignupFAB component mounted');
  }, []);

  const handleClick = () => {
    window.open('https://signalwire.com/signup', '_blank');
  };

  return (
    <md-fab
      variant="surface"
      size={isMobile ? "medium" : "large"}
      label={isMobile ? "" : "Sign Up"}
      aria-label="Get started with a free trial of the SignalWire platform"
      title="Get started with a free trial of the SignalWire platform"
      onClick={handleClick}
    >
      <md-icon slot="icon"><span className="material-icons">home</span></md-icon>
    </md-fab>
  );
};

export default SignupFABModern;