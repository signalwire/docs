import React from "react";
import styles from "./styles.module.css";
import { useHistory } from "@docusaurus/router";
import { useColorMode } from "@docusaurus/theme-common";


type ProductIcon = {
  themeAware: boolean;
  path: string;
};

interface ProductButtonProps {
  name: string;
  icon?: string | ProductIcon;
  link: string;
  description?: string;
  width?: number;
  height?: number;
}

const isExternalLink = (url: string): boolean => {
  return url.startsWith('http://') || url.startsWith('https://');
};

export default function ProductButton({
  name,
  icon,
  link,
  description,
  width = 200,
  height = undefined,
}: ProductButtonProps) {
  const history = useHistory();
  const { colorMode } = useColorMode();
  const isDarkMode = colorMode === "dark";

  const iconPath = typeof icon === 'string' 
    ? icon 
    : icon?.themeAware
      ? `/landing-assets/images/svg/${isDarkMode ? 'dark' : 'light'}/${icon.path}`
      : icon?.path;

  const handleClick = (e: React.MouseEvent) => {
    if (isExternalLink(link)) {
      window.open(link, '_blank', 'noopener,noreferrer');
    } else {
      history.push(link);
    }
  };

  return (
    <div
      key={name}
      className={styles.prodbutton}
      onClick={handleClick}
      style={{ width, height }}
      role="link"
      tabIndex={0}
    >
      {iconPath && (
        <div className="icon">
          <img src={iconPath} style={{ width: 35, height: 35 }} alt={name} />
        </div>
      )}
      <div style={{ fontSize: 20, fontWeight: "bold" }}>{name}</div>
      <div>{description}</div>
    </div>
  );
}
