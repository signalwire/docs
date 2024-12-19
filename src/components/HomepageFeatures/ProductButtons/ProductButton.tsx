import React from "react";
import styles from "./styles.module.css";
import { useHistory } from "@docusaurus/router";

import type { ProductDescription } from "./ProductButtonContainer";

interface ProductButtonProps extends ProductDescription {
  width?: number;
  height?: number;
}

export default function ProductButton({
  name,
  icon,
  link,
  description,
  width = 200,
  height = undefined,
}: ProductButtonProps) {
  const history = useHistory();

  return (
    <div
      key={name}
      className={styles.prodbutton}
      onClick={(e) => {
        history.push(link);
      }}
      style={{ width, height }}
    >
      {icon && (
        <div className="icon">
          <img src={icon} style={{ width: 35, height: 35 }} />
        </div>
      )}
      <div style={{ fontSize: 20, fontWeight: "bold" }}>{name}</div>
      <div>{description}</div>
    </div>
  );
}
