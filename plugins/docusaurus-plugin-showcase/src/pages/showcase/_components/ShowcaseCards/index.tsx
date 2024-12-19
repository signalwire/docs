import React from "react";
import type {
  AllHeaders,
  ArticleConfig,
  ArticleHeader,
  GroupedArticles,
} from "types/articles";
import SearchBar from "../../_components/ShowcaseSearchBar";
import RenderHeaderArticles
  from "../../_components/ShowcaseArticleHeaders";
import clsx from "clsx";
import styles from "../../styles.module.css";
import ShowcaseCard from "../../_components/ShowcaseCard";
import Translate from "@docusaurus/Translate";
import articleConfig from "@site/src/data/articles.json";
import FavoriteShowcaseCards from "../../_components/ShowcaseFavoriteCards";

const typedArticleConfig = articleConfig as unknown as ArticleConfig;



interface ShowcaseCardsProps {
  filteredArticles: GroupedArticles;
  headersMap: AllHeaders;
  displayFavorites: boolean;
}

function ShowcaseCards({ filteredArticles, headersMap, displayFavorites }: ShowcaseCardsProps): React.JSX.Element {
  // Recursive function to determine if there's any content in the headers or subheaders
  function hasContentInHeaders(headers: ArticleHeader[]): boolean {
    return headers.some(header =>
      header.articles.length > 0
    );
  }

  // Use the recursive function to determine if the article list is completely empty
  if (!hasContentInHeaders(filteredArticles.headers) && filteredArticles.no_headers.length === 0) {
    return (
      <section className={clsx(styles.guidesMarginTopLarge, styles.guidesMarginBottomExtraLarge)}>
        <div key="container" className={clsx(styles.container, "padding-vert--md", "text--center")}>
          <h2><Translate key="no-result" id="showcase.articlesList.noResult">No result</Translate></h2>
          <SearchBar />
        </div>
      </section>
    );
  }

  return (
    <div>
      {/* Display the search bar only if plugin Option is set to true */
        typedArticleConfig.pluginOptions.displaySearchBar &&
      <section className={clsx(styles.guidesMarginTopLarge, styles.guidesMarginBottomExtraLarge)}>
        <div>
          <SearchBar />
        </div>
      </section>
      }

      {displayFavorites && <FavoriteShowcaseCards {...filteredArticles} />}


      {filteredArticles.headers.filter(header => header.topHeader).map((header, index) => (
        <RenderHeaderArticles
          key={header.id}
          headersMap={headersMap}
          header={header}
          isMainHeader={true}
          isFirstHeader={index === 0} // Pass true only for the first header
        />
      ))}



      {filteredArticles.no_headers.length > 0 && (
        <section className={clsx(styles.guidesContainer, styles.guidesMarginTopLarge, styles.guidesMarginBottomExtraLarge)}>
          <h2 key="other-guides">Other Guides</h2>
          <ul className={clsx("clean-list", styles.showcaseList)}>
            {filteredArticles.no_headers.map((article, idx) => (
              <ShowcaseCard key={`${article.slug}-${idx}`} article={article} />
            ))}
          </ul>
        </section>
      )}
    </div>
  );
}

export default React.memo(ShowcaseCards);