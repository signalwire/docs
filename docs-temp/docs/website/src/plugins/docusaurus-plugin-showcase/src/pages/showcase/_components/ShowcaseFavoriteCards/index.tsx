import type { GroupedArticles } from "types/articles";
import clsx from "clsx";
import styles from "../../styles.module.css";
import Translate from "@docusaurus/Translate";
import FavoriteIcon from '../../../../components/svgIcons/FavoriteIcon'
import ShowcaseCard from '../ShowcaseCard';
import React from "react";

function FavoriteShowcaseCards(groupedArticles: GroupedArticles) {
  if (groupedArticles.favorites.length === 0) {
    return null;
  }
    return (
      <section className={clsx(styles.guidesMarginTopLarge, styles.guidesMarginBottomExtraLarge)}>
        <div
          className={clsx(
            styles.guidesMarginBottomMedium,
            styles.showcaseFavoriteHeader
          )}>
          <h2 id="favorite-cards" className="anchor">
            <Translate id="showcase.favoritesList.title">
              Our Favorites
            </Translate>
          </h2>
          <FavoriteIcon svgClass={styles.svgIconFavorite} />
        </div>
        <ul className={clsx("clean-list", styles.showcaseList)}>
          {groupedArticles.favorites.map((article, idx) => (
            <ShowcaseCard key={`favorite-${article.slug}-${idx}`} article={article} />
          ))}
        </ul>
        <hr />
      </section>
    );
  }

export default React.memo(FavoriteShowcaseCards);