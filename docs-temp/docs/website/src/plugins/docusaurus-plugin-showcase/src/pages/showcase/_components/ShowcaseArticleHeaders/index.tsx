import React, { useMemo } from 'react';
import clsx from 'clsx';
import styles from '../../styles.module.css';
import ShowcaseCard from '../ShowcaseCard';
import { AllHeaders, ArticleHeader } from 'types/articles';
import Translate from "@docusaurus/Translate";
import Heading from "@theme/Heading";



type RenderHeaderArticlesProps = {
  header: ArticleHeader;
  headersMap: AllHeaders;
  headerLevel?: number;
  isMainHeader?: boolean;
  isFirstHeader?: boolean; // New prop to indicate if it's the first header
};

const hasContent = (header: ArticleHeader, headersMap: AllHeaders): boolean => {
  if (header.articles.length > 0) return true;
  return header.subHeaderIds.some(subHeaderId => {
    const subHeader = headersMap.get(subHeaderId);
    return subHeader ? hasContent(subHeader, headersMap) : false;
  });
};

function RenderHeaderArticles({ header, headersMap, headerLevel = 2, isMainHeader = false, isFirstHeader = false }: RenderHeaderArticlesProps): React.JSX.Element | null {
  const contentAvailable = useMemo(() => hasContent(header, headersMap), [header]);

  if (!contentAvailable) return null;

  const safeLevel = Math.min(Math.max(headerLevel, 2), 6);
  const HeaderLevel = `h${safeLevel}`.toString() as 'h2' | 'h3' | 'h4' | 'h5' | 'h6';

  return (
    <div className={styles.headerSection }>
      {isMainHeader && !isFirstHeader && <hr />} {/* Render <hr /> only if it's a main header and not the first header */}
      <Heading as={HeaderLevel} id={header.id} className={`${styles.showcaseHeader} anchor`}>
        <Translate id={header.id}>{header.label.message}</Translate>
      </Heading>
      <br />
      {header.articles.length > 0 && (
        <ul className={clsx('clean-list', styles.showcaseList)}>
          {header.articles.map((article, idx) => (
            <ShowcaseCard key={`${article.slug}-${idx}`} article={article} />
          ))}
        </ul>
      )}
      {header.subHeaderIds.map(subHeaderId => {
        const subHeader = headersMap.get(subHeaderId);
        return subHeader && (
          <RenderHeaderArticles
            key={subHeaderId}
            header={subHeader}
            headersMap={headersMap}
            headerLevel={safeLevel + 1}
          />
        );
      })}
    </div>
  );
}

export default React.memo(RenderHeaderArticles);
