import React, { useEffect, useState } from "react";
import { useHistory, useLocation } from "@docusaurus/router";
import styles from "../../styles.module.css";
import { translate } from "@docusaurus/Translate";
import type { ArticleState } from "types/articles";
import ExecutionEnvironment from "@docusaurus/ExecutionEnvironment";

const SearchNameQueryKey = 'name';


function readSearchName(search: string) {
  return new URLSearchParams(search).get(SearchNameQueryKey);
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


function SearchBar() {
  const history = useHistory();
  const location = useLocation();
  const [value, setValue] = useState<string>("");
  useEffect(() => {
    setValue(readSearchName(location.search) ?? "");

    if (location.search.includes(SearchNameQueryKey)) {
      document.getElementById('searchbar')?.focus();
    }
  }, [location]);
  return (
    <div key={styles.searchContainer} className={styles.searchContainer}>
      <input
        id="searchbar"
        placeholder={translate({
          message: 'Search for a guide by name...',
          id: 'showcase.searchBar.placeholder',
        })}
        value={value ?? undefined}
        onInput={(e) => {
          setValue(e.currentTarget.value);
          const newSearch = new URLSearchParams(location.search);
          newSearch.delete(SearchNameQueryKey);
          if (e.currentTarget.value) {
            newSearch.set(SearchNameQueryKey, e.currentTarget.value);
          }
          history.push({
            ...location,
            search: newSearch.toString(),
            state: prepareArticleState(),
          });
          setTimeout(() => {
            document.getElementById('searchbar')?.focus();
          }, 0);
        }}
      />
    </div>
  );
}

export default React.memo(SearchBar);