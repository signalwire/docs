import React from 'react';
import Link from "@docusaurus/Link";

interface BaseProps {
  img: string;
  altText: string;
  text: string;
  link: string;
}

const styles = {
  link: {
    display: 'flex',
    margin: '30px 0 30px 30px',
  },
  img: {
    width: 24,
    height: 24,
    marginRight: 10,
  },
};

function Base({ img, altText, text, link }: BaseProps) {
  return (
    <Link to={link} style={styles.link} aria-label={altText}>
      <img src={img} alt={altText} style={styles.img} />
      {text}
    </Link>
  );
}

export function LinkBadge({ img, altText, text, link }: BaseProps) {
  return <Base text={text} altText={altText} img={img} link={link} />;
}

export default LinkBadge