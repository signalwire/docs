/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React, {
  useCallback,
  useState,
  useEffect,
  type ComponentProps,
  type ReactNode,
  type ReactElement,
} from "react";
import { type Tag } from "../../../../data/Tags"
import { useHistory, useLocation } from "@docusaurus/router";
import { toggleListItem } from "../../../../utils/jsUtils";
import { prepareArticleState } from "../../index";
import styles from "./styles.module.css";

interface Props extends ComponentProps<"input"> {
  icon: ReactElement<ComponentProps<"svg">>;
  label: ReactNode;
  tag: Tag;
  reference?: string;
  link?: string;
}

const TagQueryStringKey = "tags";

export function readSearchTags(search: string): string[] {
  return new URLSearchParams(search).getAll(TagQueryStringKey) as string[];
}

function replaceSearchTags(search: string, newTags: string[]) {
  const searchParams = new URLSearchParams(search);
  searchParams.delete(TagQueryStringKey);
  newTags.forEach((tag) => searchParams.append(TagQueryStringKey, tag));
  return searchParams.toString();
}

function ShowcaseTagSelect(
  { id, icon, label, tag, reference, link, ...rest }: Props,
  ref: React.ForwardedRef<HTMLLabelElement>
) {
  const location = useLocation();
  const history = useHistory();
  const [selected, setSelected] = useState(false);
  useEffect(() => {
    const tags = readSearchTags(location.search);
    setSelected(tags.includes(tag.name));
  }, [tag, location]);
  const toggleTag = useCallback(() => {
    const tags = readSearchTags(location.search);
    const newTags = toggleListItem(tags, tag.name);
    const newSearch = replaceSearchTags(location.search, newTags);
    history.push({
      ...location,
      search: newSearch,
      state: prepareArticleState(),
    });
  }, [tag, location, history]);

  return (
    <>
      <input
        type="checkbox"
        id={id}
        className="screen-reader-only"
        onKeyDown={(e) => {
          if (e.key === "Enter") {
            toggleTag();
          }
        }}
        onFocus={(e) => {
          if (e.relatedTarget) {
            e.target.nextElementSibling?.dispatchEvent(
              new KeyboardEvent("focus")
            );
          }
        }}
        onBlur={(e) => {
          e.target.nextElementSibling?.dispatchEvent(new KeyboardEvent("blur"));
        }}
        onChange={toggleTag}
        checked={selected}
        {...rest}
      />
      <label ref={ref} htmlFor={id} className={styles.checkboxLabel}>
        {label}
        {icon}
      </label>
      {reference && (
        <div className={styles.centeredLink}>
          <a href={link} className={styles.tagLink}>
            {reference}
          </a>
        </div>
      )}
    </>
  );
}

export default React.forwardRef(ShowcaseTagSelect);
