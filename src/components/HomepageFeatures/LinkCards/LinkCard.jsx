import Link from "@docusaurus/Link";
import style from "./linkcard.module.scss";
import clsx from "clsx";

export default function LinkCard({ title = "untitled", description = "", link = "#" }) {
  return (
    <div className={clsx(style.box, "linkcard_item")}>
      <div className={style.title}>
        <a href="#">{title}</a>
      </div>
      <p>{description}</p>
      <Link href={link}></Link>
    </div>
  );
}
