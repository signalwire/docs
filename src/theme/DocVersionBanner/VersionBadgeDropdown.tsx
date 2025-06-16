import React, { useState, useRef, useEffect } from 'react';
import clsx from 'clsx';
import {
  useVersions,
  useActiveDocContext,
} from '@docusaurus/plugin-content-docs/client';
import { useDocsPreferredVersion } from '@docusaurus/plugin-content-docs/client';
import { translate } from '@docusaurus/Translate';
import { useLocation } from '@docusaurus/router';
import Link from '@docusaurus/Link';
import type { GlobalVersion } from '@docusaurus/plugin-content-docs/client';
import styles from './VersionBadgeDropdown.module.css';

type Props = {
  currentVersion: GlobalVersion;
  pluginId: string;
};

export default function VersionBadgeDropdown({ currentVersion, pluginId }: Props): JSX.Element {
  const [isOpen, setIsOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);
  const versions = useVersions(pluginId);
  const { savePreferredVersionName } = useDocsPreferredVersion(pluginId);
  const location = useLocation();
  const activeDocContext = useActiveDocContext(pluginId);

  // Close dropdown when clicking outside
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
        setIsOpen(false);
      }
    };

    if (isOpen) {
      document.addEventListener('mousedown', handleClickOutside);
    }

    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, [isOpen]);

  // Close dropdown on ESC key
  useEffect(() => {
    const handleEscKey = (event: KeyboardEvent) => {
      if (event.key === 'Escape' && isOpen) {
        setIsOpen(false);
      }
    };

    if (isOpen) {
      document.addEventListener('keydown', handleEscKey);
    }

    return () => {
      document.removeEventListener('keydown', handleEscKey);
    };
  }, [isOpen]);

  const getVersionMainDoc = (version: GlobalVersion) =>
    version.docs.find((doc) => doc.id === version.mainDocId)!;

  const getDocInVersion = (version: GlobalVersion) => {
    const activeDoc = activeDocContext?.activeDoc;
    if (!activeDoc) {
      return getVersionMainDoc(version);
    }
    
    // Try to find the same doc in the target version
    const doc = version.docs.find((d) => d.id === activeDoc.id);
    return doc ?? getVersionMainDoc(version);
  };

  return (
    <div className={styles.versionBadgeDropdown} ref={dropdownRef}>
      <button
        className={clsx(
          'badge badge--secondary',
          styles.versionBadgeButton,
          isOpen && styles.versionBadgeButtonActive
        )}
        onClick={() => setIsOpen(!isOpen)}
        aria-expanded={isOpen}
        aria-haspopup="true"
        aria-label={translate({
          id: 'theme.docs.versionBadge.label',
          message: 'Version: {version}',
          description: 'The label for the version badge dropdown button',
        }, { version: currentVersion.label })}
      >
        <span className={styles.versionLabel}>Version: {currentVersion.label}</span>
        <svg
          className={clsx(styles.dropdownIcon, isOpen && styles.dropdownIconOpen)}
          width="12"
          height="12"
          viewBox="0 0 12 12"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            d="M3 4.5L6 7.5L9 4.5"
            stroke="currentColor"
            strokeWidth="1.5"
            strokeLinecap="round"
            strokeLinejoin="round"
          />
        </svg>
      </button>

      {isOpen && (
        <div className={styles.dropdown}>
          <div className={styles.dropdownMenu}>
            {versions.map((version) => {
              const versionDoc = getDocInVersion(version);
              const isActive = version.name === currentVersion.name;
              
              return (
                <Link
                  key={version.name}
                  to={versionDoc.path}
                  className={clsx(
                    styles.dropdownItem,
                    isActive && styles.dropdownItemActive
                  )}
                  onClick={() => {
                    savePreferredVersionName(version.name);
                    setIsOpen(false);
                  }}
                >
                  <span className={styles.dropdownItemLabel}>
                    {version.label}
                  </span>
                  {version.isLast && (
                    <span className={styles.dropdownItemBadge}>
                      {translate({
                        id: 'theme.docs.versionBadge.latestVersion',
                        message: 'Latest',
                        description: 'The label for the latest version in dropdown',
                      })}
                    </span>
                  )}
                </Link>
              );
            })}
          </div>
        </div>
      )}
    </div>
  );
}