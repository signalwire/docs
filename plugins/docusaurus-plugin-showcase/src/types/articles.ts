import {type pluginOptions} from "types/pluginOptions";

// Type definitions
export type Article = {
  title: string;
  description: string;
  preview: string | null;
  website: string;
  source: string | null;
  tags: string[];
  slug: string;
  prioritizeHeader?: string;
};

export type ArticleHeader = {
  id: string;
  label: {
    message: string
  }
  articles: Article[];
  headerLevel?: number;
  subHeaderIds: string[];
  tagName: string;
  parentId?: string;
  topHeader: boolean;
};

export type GroupedArticles = {
    headers: ArticleHeader[];
    no_headers: Article[];
    favorites: Article[];
};

export type ArticleState = {
  scrollTopPosition: number;
  focusedElementId: string | undefined;
};

export type Tag = {
  name: string;
  label: {
    message: string
  }
  header: boolean;
  subHeaders?: string[];
};

export interface ArticleConfig {
  articles: GroupedArticles;
  pluginOptions: pluginOptions;
  uniqueCategories: string[];
}


export type AllHeaders = Map<string, ArticleHeader>