import { useCurrentSidebarCategory } from "@docusaurus/theme-common";
import { GuideCardContainer, GuideCard } from "./GuideCards";
import { useEffect, useState } from "react";

export default function GuidesList({ items = null }) {
  const sidebarItems = useCurrentSidebarCategory();
  const [itemsToUse, setItemsToUse] = useState(null);

  useEffect(() => {
    if (items === null) {
      setItemsToUse(sidebarItems.items);
    } else {
      setItemsToUse(items);
    }
  }, [items, sidebarItems]);

  return (
    <GuideCardContainer>
      {itemsToUse &&
        itemsToUse
          ?.filter((i) => !(i?.customProps?.hideFromIndex === true))
          ?.map((item, idx) => (
            <GuideCard
              key={idx}
              docId={item.docId ?? undefined}
              title={item.label + (item.type == "category" ? " 📚" : "")}
              description={item.description ?? item?.customProps?.description}
              github={item?.customProps?.github}
              link={item.href}
              platform={item?.customProps?.platform}
              externalLink={item.className?.includes("external-link")}
              childItemCount={item.type === "category" ? item.items.length : 0}
            />
          ))}
    </GuideCardContainer>
  );
}
