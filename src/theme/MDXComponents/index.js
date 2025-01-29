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

// Custom components
import { Accordion, AccordionGroup } from "../../components/Extras/Accordion";
import { Card, CardGroup } from "../../components/Extras/Card";
import CodeGroup from "../../components/Extras/Code";
import { ExpandableItemCoverIcon } from "../../components/Extras/Expandable/ExpandableItemCoverIcon";
import Frame from "../../components/Extras/Frame/Frame";
import Slideshow from "../../components/Extras/Slideshow/Slideshow";

export default {
  ...MDXComponents,

  Language,
  LangItem,
  LangSwitch,

  Accordion,
  AccordionGroup,
  AlphaBadge,
  APITable,
  APITableRow,
  BetaBadge,
  Card,
  CardGroup,
  CardImage,
  CodeGroup,
  DocCard,
  DocCardList,
  ExpandableItemCoverIcon,
  Frame,
  HomepageHeader,
  LinkBadge,
  LinkCard,
  LinkCardContainer,
  ProductButton,
  ProductButtons,
  Slideshow,
  Steps,
  Subtitle,
  Tabs,
  TabItem,
  UseCaseLinks,
  UseCaseView,
};