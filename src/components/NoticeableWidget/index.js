import React, { useEffect } from 'react';
import {useColorMode} from '@docusaurus/theme-common';
import style from './noticeable.module.scss'

const NoticeableWidget = () => {
  useEffect(() => {
    // call noticeable.render() when the component mounts
    if (window.noticeable) {
      window.noticeable.render('widget', 'ehpRA4n1ktFuJWfs5exE');
    }

    // Apply dark/light mode styles after the widget renders
    const applyThemeStyles = () => {
      const widgetContainer = document.getElementById('noticeable-newspage-embed');
      if (widgetContainer) {
        // Example: Add a class to the widget container based on the theme
        widgetContainer.classList.toggle('dark-mode', theme === 'dark');
        widgetContainer.classList.toggle('light-mode', theme === 'light');

        // Alternatively, directly inject styles
        // widgetContainer.style.backgroundColor = theme === 'dark' ? '#1e1e1e' : '#ffffff';
        // widgetContainer.style.color = theme === 'dark' ? '#ffffff' : '#000000';
      }
    };

    // Apply styles initially
    applyThemeStyles();

    // Re-apply styles when the theme changes
    const observer = new MutationObserver(applyThemeStyles);
    observer.observe(document.documentElement, {
      attributes: true,
      attributeFilter: ['data-theme'],
    });

    // Cleanup observer on unmount
    return () => observer.disconnect();
  }, [theme]); // Re-run effect when theme changes

  // render widget
  return (
    <div id="noticeable-newspage-embed">
    </div>
  );
};

export default NoticeableWidget;