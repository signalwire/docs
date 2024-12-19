import Link from "@docusaurus/Link";
import style from "./guidecard.module.scss";
import clsx from "clsx";
import GhSvg from "./gh.svg";
import ExternalLinkIcon from "./ExternalLinkIcon";

import { useDocById } from "@docusaurus/plugin-content-docs/client";

const logos = {
  python: require("./logos/python.png").default,
  react: require("./logos/react.png").default,
  vuejs: require("./logos/vue.png").default,
  javascript: require("./logos/javascript.png").default,
  ruby: require("./logos/ruby.png").default,
};

function numberToText(itemCount) {
  return `${itemCount} items`;
}

export default function GuideCard({
  docId,
  title = "untitled",
  description = "",
  link = "#",
  github,
  platform,
  externalLink = false,
  childItemCount = 0,
}) {
  const doc = useDocById(docId ?? undefined);

  return (
    <div className={clsx(style.box, "linkcard_item")}>
      <div className={style.title}>
        <div>
          <Link href={link}>{title}</Link>
          {externalLink && (
            <>
              <span> </span> <ExternalLinkIcon />
            </>
          )}
        </div>

        <div className={style.platformicon}>
          {/* TODO: clicking on JS icon should take to guides showcase with JS selected*/}
          {/* <a href="/guides?tags=language%3Ajavascript"> */}
          {logos?.[platform] && <img src={logos?.[platform]} className="nolightbox" />}
          {/* </a> */}
        </div>
      </div>
      <div className={style.guidedesc}>
        {doc?.description ? (
          <p>{doc.description}</p>
        ) : (
          description && <p>{description}</p>
        )}
      </div>
      {childItemCount > 0 && (
        <p style={{ color: "gray" }}>{numberToText(childItemCount)}</p>
      )}

      {github && (
        <div style={{ width: 30, height: 30, textAlign: "center" }}>
          <a href={github}>
            <GhSvg style={{ width: "100%", height: "100%" }} />
          </a>
        </div>
      )}
    </div>
  );
}
