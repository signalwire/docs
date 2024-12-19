import style from "./linkcard.module.scss";

export default function LinkCardContainer({ children }) {
  return <div className={style.container}>{children}</div>;
}
