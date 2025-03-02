// Import the original mapper
import MDXComponents from "../MDXComponentsOriginal/index";
import Tabs from "@theme/Tabs";
import TabItem from "@theme/TabItem";

import { Language, LangItem } from "../../components/Language/Language";
import LangSwitch from "../../components/Language/LangSwitch";
import { AlphaBadge, BetaBadge } from "../../components/AlphaBetaBadges";
import DocCardList from "@theme/DocCardList";
import { APITable, APITableRow } from "../../components/APITable";
import DocCard from "@theme/DocCard";
import { UseCaseView, UseCaseLinks } from "../../components/HomepageFeatures";
import Steps from "../../components/Steps";
import Subtitle from "../../components/typography/Subtitle";

// Custom components
import { Accordion, AccordionGroup } from "../../components/Extras/Accordion";
import { Card, CardGroup } from "../../components/Extras/Card";
import CodeGroup from "../../components/Extras/Code";
import Frame from "../../components/Extras/Frame/Frame";
import Slideshow from "../../components/Extras/Slideshow/Slideshow";

export default {
  ...MDXComponents,

  Language,
  LangItem,
  LangSwitch,

  Frame,

  Tabs,
  TabItem,

  Accordion,
  AccordionGroup,

  AlphaBadge,
  BetaBadge,

  APITable,
  APITableRow,

  Card,
  CardGroup,

  DocCard,
  DocCardList,

  Steps,
  Subtitle,
  UseCaseLinks,
  UseCaseView,
};
