// Import the original mapper
import MDXComponents from "../MDXComponentsOriginal/index";
import Tabs from "@theme/Tabs";
import TabItem from "@theme/TabItem";

import { Language, LangItem } from "../../components/Language/Language";
import LangSwitch from "../../components/Language/LangSwitch";
import { AlphaBadge, BetaBadge } from "../../components/AlphaBetaBadges";
import { LinkBadge } from "../../components/LinkBadge";
import DocCardList from "@theme/DocCardList";
import { APITable, APITableRow } from "../../components/APITable";
import DocCard from "@theme/DocCard";
import { LinkCard, LinkCardContainer, HomepageHeader, ProductButtons, ProductButton, UseCaseView, UseCaseLinks } from "../../components/HomepageFeatures";
import Steps from "../../components/Steps";
import Subtitle from "../../components/typography/Subtitle";
import Frame from '@site/src/components/Extras/Frame/Frame';

export default {
  ...MDXComponents,

  Language,
  LangItem,
  LangSwitch,

  Frame,
  Tabs,
  TabItem,
  AlphaBadge,
  BetaBadge,
  LinkBadge,
  DocCardList,
  APITable,
  APITableRow,
  DocCard,
  LinkCard,
  LinkCardContainer,
  HomepageHeader,
  ProductButtons,
  ProductButton,
  UseCaseView,
  UseCaseLinks,
  Steps,
  Subtitle
};