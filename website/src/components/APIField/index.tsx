import React, { ReactNode } from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import styles from './styles.module.css';

export interface APIFieldProps {
  /**
   * The name of the parameter/field
   */
  name: string;
  /**
   * The type of the parameter (e.g., 'string', 'number', 'boolean', 'Promise<void>')
   * Supports markdown-style links: [TypeName](/path/to/type#anchor)
   */
  type: string;
  /**
   * Whether the parameter is required
   */
  required?: boolean;
  /**
   * Default value for the parameter
   */
  default?: string;
  /**
   * Whether the parameter is deprecated
   */
  deprecated?: boolean;
  /**
   * Description of the parameter (can include markdown/JSX)
   */
  children?: ReactNode;
}

export const APIField: React.FC<APIFieldProps> = ({
  name,
  type,
  required = false,
  default: defaultValue,
  deprecated = false,
  children
}: APIFieldProps) => {
  // Create a URL-friendly ID from the field name
  const fieldId = `field-${name.toLowerCase().replace(/[^a-z0-9]+/g, '-')}`;

  const handleAnchorClick = (e: React.MouseEvent) => {
    e.preventDefault();

    // Update URL and jump to location (like header anchors)
    window.location.hash = fieldId;

    // Copy to clipboard
    navigator.clipboard.writeText(window.location.href).then(() => {
      // Optional: Show a toast/notification that link was copied
      console.log('Link copied to clipboard');
    }).catch(err => {
      console.error('Failed to copy link:', err);
    });
  };

  // Parse markdown-style links in type string: [text](url)
  const parseTypeLinks = (typeString: string) => {
    const parts: (string | React.ReactElement)[] = [];
    let lastIndex = 0;
    const linkRegex = /\[([^\]]+)\]\(([^)]+)\)/g;
    let match;

    while ((match = linkRegex.exec(typeString)) !== null) {
      // Add text before the link
      if (match.index > lastIndex) {
        parts.push(typeString.substring(lastIndex, match.index));
      }

      // Add the link
      parts.push(
        <Link key={match.index} to={match[2]}>
          {match[1]}
        </Link>
      );

      lastIndex = match.index + match[0].length;
    }

    // Add remaining text
    if (lastIndex < typeString.length) {
      parts.push(typeString.substring(lastIndex));
    }

    return parts.length > 0 ? parts : typeString;
  };

  return (
    <div className={clsx(styles.apiField, { [styles.deprecatedField]: deprecated })} id={fieldId}>
      <div className={styles.fieldHeader}>
        <div className={styles.fieldNameContainer} onClick={handleAnchorClick}>
          <a href={`#${fieldId}`} className={styles.fieldAnchor} aria-label={`Link to ${name}`} onClick={handleAnchorClick}>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 576 512" fill="currentColor">
              <path d="M0 256C0 167.6 71.6 96 160 96h72c13.3 0 24 10.7 24 24s-10.7 24-24 24H160C98.1 144 48 194.1 48 256s50.1 112 112 112h72c13.3 0 24 10.7 24 24s-10.7 24-24 24H160C71.6 416 0 344.4 0 256zm576 0c0 88.4-71.6 160-160 160H344c-13.3 0-24-10.7-24-24s10.7-24 24-24h72c61.9 0 112-50.1 112-112s-50.1-112-112-112H344c-13.3 0-24-10.7-24-24s10.7-24 24-24h72c88.4 0 160 71.6 160 160zM184 232H392c13.3 0 24 10.7 24 24s-10.7 24-24 24H184c-13.3 0-24-10.7-24-24s10.7-24 24-24z"/>
            </svg>
          </a>
          <span className={clsx(styles.fieldName, { [styles.deprecatedName]: deprecated })}>
            {name}
          </span>
        </div>
        <span className={styles.fieldType}>
          {parseTypeLinks(type)}
        </span>
        {required && <span className={styles.fieldBadge}>required</span>}
        {deprecated && <span className={clsx(styles.fieldBadge, styles.deprecatedBadge)}>deprecated</span>}
      </div>
      {defaultValue && (
        <div className={styles.fieldDefault}>
          <span className={styles.defaultLabel}>Default:</span> <code>{defaultValue}</code>
        </div>
      )}
      {children && (
        <div className={styles.fieldDescription}>
          {children}
        </div>
      )}
    </div>
  );
};

export default APIField;
