import React, { useEffect } from 'react';

const NoticeableWidget = () => {
  useEffect(() => {
    // call noticeable.render() when the component mounts
    if (window.noticeable) {
      window.noticeable.render('widget', 'ehpRA4n1ktFuJWfs5exE');
    }
  }, []);

  // render widget
  return (
    <div id="noticeable-newspage-embed">
    </div>
  );
};

export default NoticeableWidget;