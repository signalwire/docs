import { usePluralForm } from "@docusaurus/theme-common";
import Translate, { translate } from "@docusaurus/Translate";
import clsx from "clsx";
import React from "react";
import Heading from "@theme/Heading";
import ShowcaseFilterToggle from "../../_components/ShowcaseFilterToggle";
import ClearAllButton from "../../_components/ShowcaseClearButton";
import CategoryList from "../../_components/ShowcaseCategoryList";
import generalStyles from "../../styles.module.css";
import styles from "./styles.module.css";

import { type ArticleHeader, type GroupedArticles } from "types/articles";

interface ShowcaseFiltersProps {
  title: string;
  categories: string[];
}

function useSiteCountPlural() {
  const { selectMessage } = usePluralForm();
  return (sitesCount: number) =>
    selectMessage(
      sitesCount,
      translate(
        {
          id: 'showcase.filters.resultCount',
          description:
            'Pluralized label for the number of sites found on the showcase. Use as much plural forms (separated by "|") as your language support (see https://www.unicode.org/cldr/cldr-aux/charts/34/supplemental/language_plural_rules.html)',
          message: '1 guide|{sitesCount} guides',
        },
        { sitesCount },
      ),
    );
}

function HeadingText({ filteredArticles }: { filteredArticles: GroupedArticles }) {
  const countArticlesInHeader = (header: ArticleHeader): number => header.articles.length;

  const totalArticleCount = filteredArticles.headers.reduce((acc, header) => acc + countArticlesInHeader(header), 0)
    + filteredArticles.no_headers.length;

  const siteCountPlural = useSiteCountPlural();
  return (
    <div className={styles.headingText}>
      <Heading as="h4">
        <Translate id="showcase.filters.title">Filters</Translate>
      </Heading>
      <span>{siteCountPlural(totalArticleCount)}</span>
    </div>
  );
}

function HeadingButtons() {
  return (
    <div className={styles.headingButtons} style={{ alignItems: 'center' }}>
      <ShowcaseFilterToggle />
      <ClearAllButton />
    </div>
  );
}

function HeadingRow({ filteredArticles }: { filteredArticles: GroupedArticles }) {
  return (
    <div className={clsx('margin-bottom--sm', styles.headingRow)}>
      <HeadingText filteredArticles={filteredArticles} />
      <HeadingButtons />
    </div>
  );
}

function ShowcaseFilters({ filterProps, filteredArticles }: { filterProps: ShowcaseFiltersProps, filteredArticles: GroupedArticles }) {
  return (
    <section className={clsx(generalStyles.guidesContainer, generalStyles.guidesMarginTopLarge, generalStyles.guidesMarginBottomLarge)}>
      <HeadingRow filteredArticles={filteredArticles} />
      <CategoryList categories={filterProps.categories} />
    </section>
  );
}

export default React.memo(ShowcaseFilters);
