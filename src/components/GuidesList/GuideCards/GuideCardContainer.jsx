import style from "./guidecard.module.scss";

export default function GuideCardContainer({ children }) {
  return <div className={style.container}>{children}</div>;
}
