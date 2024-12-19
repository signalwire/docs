import React from "react";
import ProductButton from "./ProductButton";
import styles from "./styles.module.css";

export interface ProductDescription {
  icon: string;
  name: string;
  description?: string;
  link: string;
}

export type ProductList = ProductDescription[];

export default function ProductButtonContainer({ products }: { products: ProductList }) {
  return (
    <div style={{ display: "flex", flexWrap: "wrap", gap: 18 }}>
      {products.map((prod) => (
        <ProductButton
          icon={`/landing-assets/images/svg/${prod.icon}`}
          key={prod.name}
          name={prod.name}
          description={prod.description}
          link={prod.link}
          width={207}
          height={215}
        />
      ))}
    </div>
  );
}
