import React, { ReactNode, useState } from 'react';
import { useWindowSize } from '@docusaurus/theme-common';
import clsx from 'clsx';
import styles from './styles.module.css';

interface TooltipProps {
  children: ReactNode;
  tip: ReactNode;
  delay?: number;
}

export default function Tooltips({ 
  children, 
  tip,
  delay = 200 
}: TooltipProps) {
  const windowSize = useWindowSize();
  const isMobile = windowSize === 'mobile';
  const [isVisible, setIsVisible] = useState(false);

  if (!tip) {
    throw new Error('Tooltip requires a non-empty tip prop');
  }

  if (!children) {
    throw new Error('Tooltip requires children to be provided');
  }

  const handleMouseEnter = () => {
    setIsVisible(true);
  };

  const handleMouseLeave = () => {
    setIsVisible(false);
  };

  return (
    <span 
      className={styles.tooltipContainer}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
      onFocus={handleMouseEnter}
      onBlur={handleMouseLeave}
      role="tooltip"
      tabIndex={0}
    >
      {children}
      <span 
        className={clsx(
          styles.tooltip,
          isMobile && styles.tooltipMobile,
          isVisible && styles.visible
        )}
        role="tooltip"
        aria-hidden={!isVisible}
        style={{
          transitionDelay: `${isVisible ? 0 : delay}ms`
        }}
      >
        {tip}
      </span>
    </span>
  );
}
