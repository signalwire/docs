import React from "react";
import styles from "./Frame.module.css";
import clsx from "clsx";

function extractImagesFromParagraph(children: React.ReactNode): {
  content: React.ReactNode;
  single: boolean;
} {
  if (React.isValidElement(children) && children.type === "p") {
    const pChildren = children.props.children;
    const single = !Array.isArray(pChildren);

    if (Array.isArray(pChildren)) {
      const processedChildren = pChildren.map((child) => {
        if (React.isValidElement(child) && child.type === "figure") {
          return React.isValidElement(child) ? child.props?.children : child;
        }
        return child;
      });
      return { content: processedChildren, single };
    }

    if (React.isValidElement(pChildren) && pChildren.type === "figure") {
      return { content: pChildren.props?.children, single };
    }

    return { content: pChildren, single };
  }
  return { content: children, single: false };
}

export default function Frame({
  caption,
  children,
}: {
  caption?: string;
  children: React.ReactNode;
}) {
  const { content: processedChildren, single } = extractImagesFromParagraph(children);

  return (
    <div className={clsx(styles.container, "lightbox")}>
      <div className={clsx(styles.frame)}>
        <div className={clsx(styles.gridOverlay)} />
        <div className={clsx(single ? styles.content : styles.contentMultiple)}>
          {processedChildren}
        </div>

        {caption && (
          <div className={clsx(styles.caption)}>
            <p>{caption}</p>
          </div>
        )}
        <div className={clsx(styles.border)} />
      </div>
    </div>
  );
}
