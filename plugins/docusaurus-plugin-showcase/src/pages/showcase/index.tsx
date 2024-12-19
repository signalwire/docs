import React, { useEffect, useMemo, useState } from "react";

import ExecutionEnvironment from '@docusaurus/ExecutionEnvironment';
import { useLocation } from "@docusaurus/router";
import Layout from "@theme/Layout";
import {
  type AllHeaders,
  type Article,
  type ArticleHeader,
  type ArticleState,
  type ArticleConfig,
  type GroupedArticles,
} from "types/articles";
import articleConfig from "@site/src/data/articles.json";
import { readSearchTags } from "./_components/ShowcaseTagSelect";
import { type Operator, readOperator } from "./_components/ShowcaseFilterToggle";
import ShowcaseCards from "./_components/ShowcaseCards";
import TableOfContentsDisplay from "./_components/ShowcaseTableOfContentsDisplay";
import ShowcaseFilters from "./_components/ShowcaseFilters";
import DescriptionComponent from "./_components/ShowcaseDescription";
import Heading from "@theme/Heading";
import styles from "./styles.module.css";
import clsx from 'clsx';



// Cast the imported JSON data to the defined interface
const typedArticleConfig = articleConfig as unknown as ArticleConfig;

let articleHeaders = typedArticleConfig.articles.headers;
let allHeaders: AllHeaders = new Map(articleHeaders.map((header: ArticleHeader ) => [header.id, header]));

const showcaseFiltersProps = {
  categories: typedArticleConfig.uniqueCategories,
  title: typedArticleConfig.pluginOptions.title,
};

function restoreArticleState(articleState: ArticleState | null) {
  const { scrollTopPosition, focusedElementId } = articleState ?? {
    scrollTopPosition: 0,
    focusedElementId: undefined,
  };
  if (typeof focusedElementId === "string") {
    document.getElementById(focusedElementId)?.focus();
  }
  window.scrollTo({ top: scrollTopPosition });
}

export function prepareArticleState(): ArticleState | undefined {
  if (ExecutionEnvironment.canUseDOM) {
    return {
      scrollTopPosition: window.scrollY,
      focusedElementId: document.activeElement?.id,
    };
  }

  return undefined;
}

const SearchNameQueryKey = 'name';

function readSearchName(search: string) {
  return new URLSearchParams(search).get(SearchNameQueryKey);
}

function filterArticles(
  groupedArticles: GroupedArticles,
  selectedTags: string[],
  operator: Operator,
  searchName: string | null
): GroupedArticles {
  const filterByTagsAndSearch = (article: Article): boolean => {
    const matchesSearch = searchName ?
      article.title.toLowerCase().includes(searchName.toLowerCase()) ||
      article.description.toLowerCase().includes(searchName.toLowerCase())
      : true;
    const matchesTags = selectedTags.length > 0 ? (
      operator === 'AND' ?
        selectedTags.every(tag => article.tags.includes(tag)) :
        selectedTags.some(tag => article.tags.includes(tag))
    ) : true;

    return matchesSearch && matchesTags;
  };

  function filterHeaders(
    headers: ArticleHeader[],
    allHeaders: Map<string, ArticleHeader>,
    filterFunc: (article: Article) => boolean
  ): ArticleHeader[] {
    return headers.reduce<ArticleHeader[]>((acc, header) => {
      // Filter the articles in the current header
      const filteredArticles = header.articles.filter(filterFunc);

      // Recursively filter subheaders if they exist, ensuring all elements are defined
      const subHeaders = header.subHeaderIds
        .map(id => allHeaders.get(id))
        .filter((h): h is ArticleHeader => h !== undefined);  // Ensures that all elements are ArticleHeader and not undefined

      // Apply the filter function recursively to subheaders
      const filteredSubHeaders = filterHeaders(subHeaders, allHeaders, filterFunc);

      // Check if the current header or any of its subheaders have filtered articles
      const hasContent = filteredArticles.length > 0 || filteredSubHeaders.length > 0;

      if (hasContent) {
        acc.push({
          ...header,
          articles: filteredArticles,
          subHeaderIds: filteredSubHeaders.map(h => h.id)
        });
      }
      return acc;
    }, []);
  }

  const filteredHeaders = filterHeaders(groupedArticles.headers, allHeaders, filterByTagsAndSearch);
  const filteredNoHeader = groupedArticles.no_headers.filter(filterByTagsAndSearch);
  const filteredFavorites = (selectedTags.length > 0 || searchName) ? [] : groupedArticles.favorites.filter(filterByTagsAndSearch);

  return {
      headers: filteredHeaders,
      no_headers: filteredNoHeader,
      favorites: filteredFavorites
  };
}

function useFilteredArticles() {
  const location = useLocation<ArticleState>();
  const [operator, setOperator] = useState<Operator>('OR');
  const [selectedTags, setSelectedTags] = useState<string[]>([]);
  const [searchName, setSearchName] = useState<string | null>(null);

  useEffect(() => {
    setSelectedTags(readSearchTags(location.search));
    setOperator(readOperator(location.search));
    setSearchName(readSearchName(location.search));
    restoreArticleState(location.state);
  }, [location]);

  // Use useMemo to recalculate filtered articles only when necessary
  return useMemo(() => {
    const filteredResult = filterArticles(articleConfig.articles, selectedTags, operator, searchName);
    return { ...filteredResult, allHeaders };
  }, [selectedTags, operator, searchName]);
}

function ShowcaseHeader({ filteredArticles }: { filteredArticles: GroupedArticles }) {

  return (
    <section className={clsx(styles.guidesMarginTopLarge, styles.guidesMarginBottomLarge)}>
      <div className={styles.guidesContainer}>
        {typedArticleConfig.pluginOptions.displayTableOfContents &&
          <div className={clsx(styles.guidesTOCCollapsible, "theme-doc-toc-mobile")}>
            <TableOfContentsDisplay groupedArticles={filteredArticles} title={typedArticleConfig.pluginOptions.title} showFavorites={typedArticleConfig.pluginOptions.displayFavorites} headersMap={allHeaders} collapsible={true} />
          </div>}
          <Heading as="h2" id={typedArticleConfig.pluginOptions.title.toLowerCase().replace(/\s/g, '-')} className={clsx(styles.showcaseHeader, `anchor`)}>
          {typedArticleConfig.pluginOptions.title}</Heading>
        <br />
        <DescriptionComponent />
      </div>
    </section>
  );
}


export default function Showcase(): React.JSX.Element {
  const filteredArticles = useFilteredArticles();
  let newHeaders: AllHeaders = new Map(filteredArticles.headers.map((header: ArticleHeader) => [header.id, header]));

  return (
    <Layout title={typedArticleConfig.pluginOptions.title}>
      <main id="article-top" className={clsx( styles.guidesMarginLarge, styles.articleTop, "anchor")}>
        <div key="row" className={clsx(styles.guidesRow)}>
          <div key="col" className={clsx(styles.guidesCol)}>
            <ShowcaseHeader filteredArticles={filteredArticles} />
            <ShowcaseFilters filterProps={showcaseFiltersProps} filteredArticles={filteredArticles} />
            <div key="container" className={styles.guidesContainer}>
              <ShowcaseCards headersMap={newHeaders} filteredArticles={filteredArticles} displayFavorites={typedArticleConfig.pluginOptions.displayFavorites} />
            </div>
          </div>
          {typedArticleConfig.pluginOptions.displayTableOfContents && <TableOfContentsDisplay groupedArticles={filteredArticles} title={typedArticleConfig.pluginOptions.title} showFavorites={typedArticleConfig.pluginOptions.displayFavorites} headersMap={allHeaders} />}
        </div>
      </main>
    </Layout>
  );
}
