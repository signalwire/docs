import React from "react";
import ProductButton from "./ProductButton";
import styles from "./styles.module.css";
import { useColorMode } from "@docusaurus/theme-common";

type ProductIcon = {
  themeAware: boolean;
  path: string;
}

export interface ProductDescription {
  icon?: ProductIcon | string;
  name: string;
  description?: string;
  link: string;
}

export type ProductList = ProductDescription[];

export default function ProductButtonContainer({ products }: { products: ProductList }) {
  const { colorMode } = useColorMode();
  const isDarkMode = colorMode === "dark";

  return (
    <div style={{ display: "flex", flexWrap: "wrap", gap: 18 }}>
      {products.map((prod) => {
        const iconPath = typeof prod.icon === 'string' 
          ? prod.icon 
          : prod.icon?.themeAware
            ? `/landing-assets/images/svg/${isDarkMode ? 'dark' : 'light'}/${prod.icon.path}`
            : prod.icon?.path;
          
        return (
          <ProductButton
            icon={iconPath}
            key={prod.name}
            name={prod.name}
            description={prod.description}
            link={prod.link}
            width={207}
            height={215}
          />
        );
      })}
    </div>
  );
}
