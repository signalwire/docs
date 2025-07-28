import React from 'react';
import clsx from 'clsx';
import FavoriteIcon from '../../../../components/svgIcons/FavoriteIcon';
import ShowcaseTooltip from '../../_components/ShowcaseTooltip';
import ShowcaseTagSelect from '../../_components/ShowcaseTagSelect';
import { TagList } from '../../../../data/Tags';
import generalStyles from '../../styles.module.css';

interface CategoryListProps {
  categories: string[];
}

const CategoryList: React.FC<CategoryListProps> = ({ categories }) => {
  return (
    <>
      {categories.map((category, index) => (
        <React.Fragment key={index}>
          <h4 style={{ marginBottom: 'auto' }}>{category}</h4>
          <ul className={clsx('clean-list', generalStyles.checkboxList)}>
            {TagList.filter(tag => tag.category === category).map((tag, i) => {
              const { label, description, color, reference, link } = tag;
              const id = `showcase_checkbox_id_${tag.name}`;

              return (
                <li key={i} className={generalStyles.checkboxListItem}>
                  <ShowcaseTooltip
                    id={id}
                    text={description}
                    anchorEl="#__docusaurus">
                    <ShowcaseTagSelect
                      tag={tag}
                      id={id}
                      label={label}
                      reference={reference}
                      link={link}
                      icon={
                        tag.name === "favorite" ? (
                          <FavoriteIcon svgClass={generalStyles.svgIconFavoriteXs} />
                        ) : (
                          <span
                            style={{
                              backgroundColor: color,
                              width: 10,
                              height: 10,
                              borderRadius: '50%',
                              marginLeft: 8
                            }}
                          />
                        )
                      }
                    />
                  </ShowcaseTooltip>
                </li>
              );
            })}
          </ul>
        </React.Fragment>
      ))}
    </>
  );
};

export default CategoryList;
