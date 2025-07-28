import React, { useEffect, useState, useCallback, useMemo } from "react";
import TOC from "@docusaurus/theme-classic/lib/theme/TOC";
import { TOCHighlightConfig } from "@docusaurus/theme-common/internal";
// @ts-ignore
import type {TOCItem} from '@docusaurus/mdx-loader';
import clsx from 'clsx';
import styles from '../../styles.module.css';
import { AllHeaders, ArticleHeader, GroupedArticles } from "types/articles";

import TOCCollapsible from "@theme/TOCCollapsible";

// Configuration
const tocConfig: TOCHighlightConfig = {
  linkClassName: 'table-of-contents__link',
  linkActiveClassName: 'table-of-contents__link--active',
  minHeadingLevel: 1,
  maxHeadingLevel: 6,
}

// Interfaces
interface TableOfContentsDisplayProps {
  groupedArticles: GroupedArticles;
  headersMap: Map<string, ArticleHeader>;
  title: string;
  showFavorites?: boolean;
  collapsible?: boolean;
}

// Helper Functions
const collectHeadings = (
  header: ArticleHeader,
  currentLevel: number,
  processedHeaders: Set<string>,
  headersMap: AllHeaders
): TOCItem[] => {
  if (processedHeaders.has(header.id)) return [];
  processedHeaders.add(header.id);

  const subHeaderItems = header.subHeaderIds.flatMap(subHeaderId => {
    const subHeader = headersMap.get(subHeaderId);
    return subHeader ? collectHeadings(subHeader, currentLevel + 1, processedHeaders, headersMap) : [];
  });

  if (header.articles.length > 0 || subHeaderItems.length > 0) {
    const value = header.topHeader
      ? `<strong>${header.label.message}</strong>`
      : header.label.message;

    const headerItem: TOCItem = {
      value: value,
      id: header.id,
      level: currentLevel,
    };
    return [headerItem, ...subHeaderItems];
  }
  return subHeaderItems;
};

const handleClick = (event: MouseEvent) => {
  const target = (event.target as HTMLElement).closest('.table-of-contents__link') as HTMLAnchorElement;
  if (target) {
    event.preventDefault();
    const href = target.getAttribute('href');
    if (!href) return;
    const element = document.getElementById(href.substring(1));
    element?.scrollIntoView({ behavior: 'auto' });
  }
};

// Main Component
const TableOfContentsDisplay: React.FC<TableOfContentsDisplayProps> = ({
                                                                         groupedArticles,
                                                                         headersMap,
                                                                         title,
                                                                         showFavorites = false,
                                                                         collapsible = false,
                                                                       }) => {
  const [headings, setHeadings] = useState<TOCItem[]>([]);

  // Effect to collect headings
  useEffect(() => {
    const processedHeaders = new Set<string>();
    const allHeadings = groupedArticles.headers.flatMap(header =>
      collectHeadings(header, 2, processedHeaders, headersMap)
    );

    if (showFavorites && groupedArticles.favorites.length > 0) {
      allHeadings.unshift({
        value: '<strong>Our Favorite Guides</strong>',
        id: 'favorite-cards',
        level: 2,
      });
    }

    allHeadings.unshift({
      value: `<strong>${title}</strong>`,
      id: title.toLowerCase().replace(/\s/g, '-'),
      level: 1,
    });

    setHeadings(allHeadings);
  }, [groupedArticles, headersMap, showFavorites, title]);

  // Memoized TOC Config
  const memoizedTOCConfig = useMemo(() => tocConfig, []);

  // Effect to handle clicks
  useEffect(() => {
    document.addEventListener('click', handleClick);
    return () => {
      document.removeEventListener('click', handleClick);
    };
  }, []);

  // Render logic
  return collapsible ? (
    <div className={clsx(styles.guidesTOCCollapsible, styles.guidesTOCCollapsibleExpanded, "theme-doc-toc-mobile")}>
      <TOCCollapsible toc={headings} {...memoizedTOCConfig} />
    </div>
  ) : (
    <div className={clsx(styles.guidesCol, styles.guidesCol2)}>
      <div className={clsx(styles.tocNavRight, "thin-scrollbar", "theme-doc-toc-desktop" )}>
        <TOC toc={headings} {...memoizedTOCConfig} />
      </div>
    </div>
  );
};

export default React.memo(TableOfContentsDisplay);
