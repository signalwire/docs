import React, { useEffect } from 'react';
import Layout from '@theme/Layout';
import styles from './changelog.module.css';

export default function Changelog(): JSX.Element {
  useEffect(() => {
    const renderWidget = () => {
      if (window.noticeable) {
        window.noticeable.render('widget', 'ehpRA4n1ktFuJWfs5exE');
        return true;
      }
      return false;
    };

    // Try immediately, then poll every 100ms for up to 2 seconds
    if (!renderWidget()) {
      const interval = setInterval(() => {
        if (renderWidget()) clearInterval(interval);
      }, 100);
      setTimeout(() => clearInterval(interval), 2000);
    }
  }, []);

  return (
    <Layout
      title="Changelog"
      description="Stay updated with the latest changes and improvements to SignalWire"
    >
      <div className="container margin-vert--lg">
        <div className="row">
          <div className="col col--10 col--offset-1">
            <header className={styles.header}>
              <h1>Changelog</h1>
              <p className={styles.subtitle}>
                Stay updated with the latest changes, improvements, and new features across the SignalWire platform.
              </p>
            </header>
            <div id="noticeable-newspage-embed" className={styles.newspage}></div>
          </div>
        </div>
      </div>
    </Layout>
  );
}   