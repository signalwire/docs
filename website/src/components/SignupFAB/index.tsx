import React from 'react';
import { useEffect, useState } from 'react';
import { MdOutlineLogin } from "react-icons/md";


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
  const [isMobile, setIsMobile] = useState(false);

  useEffect(() => {
    console.log('Modern SignupFAB component mounted');
    
    // Check if mobile on mount and window resize
    const checkMobile = () => {
      setIsMobile(window.innerWidth <= 768);
    };
    
    checkMobile();
    window.addEventListener('resize', checkMobile);
    
    return () => {
      window.removeEventListener('resize', checkMobile);
    };
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
      <md-icon slot="icon">
        {(MdOutlineLogin as any)()}
      </md-icon>
    </md-fab>
  );
};

export default SignupFABModern;