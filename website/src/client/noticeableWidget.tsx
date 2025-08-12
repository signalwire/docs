import ExecutionEnvironment from '@docusaurus/ExecutionEnvironment';

// Only run in browser environment
if (ExecutionEnvironment.canUseDOM) {
  // Initialize Noticeable widget after page is fully loaded
  function initializeNoticeableWidget() {
    if (window.noticeable && typeof window.noticeable.render === 'function') {
      try {
        // Use the ready callback to ensure SDK is fully loaded
        window.noticeable.ready(() => {
          window.noticeable.render('widget', '1IubajOfb1DXYPoGBlUs');
          console.log('Noticeable widget initialized');
        });
      } catch (error) {
        console.error('Failed to initialize Noticeable widget:', error);
      }
    } else {
      console.warn('Noticeable SDK not available yet, retrying...');
      // Retry after a short delay if SDK isn't ready
      setTimeout(initializeNoticeableWidget, 100);
    }
  }

  // Initialize when the module loads
  if (document.readyState === 'complete') {
    initializeNoticeableWidget();
  } else {
    window.addEventListener('load', initializeNoticeableWidget);
  }
}

export default function NoticeableWidget() {
  return null; // This component doesn't render anything
}
