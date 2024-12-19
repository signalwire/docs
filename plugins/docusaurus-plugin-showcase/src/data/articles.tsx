// Import statements if necessary, e.g., utility functions from other parts of your application
import createHeaderID from "../utils/createHeaderID"; // Assuming this is the correct path
import { Article, ArticleHeader, GroupedArticles, Tag, AllHeaders } from "types/articles"; // Assuming this is the correct path

const headersMap: AllHeaders = new Map<string, ArticleHeader>(); // Store all headers
const tagMap = new Map<string, Tag>(); // To be filled by initializeHeaders

// Utility functions
function findTagByName(tagName: string): Tag | null {
  return tagMap.get(tagName) || null;
}

function initializeHeaders(tagList: Tag[]): void {
  tagList.forEach(tag => {
    tagMap.set(tag.name, tag); // Populate the tagMap
  });

  tagList.forEach(tag => {
    if (tag.header) {
      addHeadersAndSubheaders(tag);
    }
  });
}

function addHeadersAndSubheaders(tag: Tag, parentId?: string, level = 2): void {
  const safeLevel = Math.min(Math.max(level, 2), 6); // Constrain header level to HTML standards h2-h6
  const headerID = createHeaderID({label: tag.label, parentHeaderID: parentId});
  const newHeader: ArticleHeader = {
    id: headerID,
    label: tag.label,
    articles: [],
    subHeaderIds: [],
    tagName: tag.name,
    headerLevel: safeLevel,
    parentId: parentId,
    topHeader: tag.header,
  };

  headersMap.set(headerID, newHeader);

  // If this new header has a parent, add this header's ID to the parent's subHeaderIds
  if (parentId) {
    const parentHeader = headersMap.get(parentId);
    if (parentHeader) {
      parentHeader.subHeaderIds.push(headerID);
    } else {
      console.error(`Parent header not found: ${parentId}`);
      throw new Error(`Parent header not found: ${parentId}`);
    }
  }

  if (tag.subHeaders) {
    tag.subHeaders.forEach(subHeaderName => {
      const subHeaderTag = findTagByName(subHeaderName);
      if (!subHeaderTag) {
        console.error(`Subheader tag not found: ${subHeaderName}`, "Available tags:", Array.from(tagMap.keys())); // More informative error
        throw new Error(`Subheader tag not found: ${subHeaderName}`);
      }
      addHeadersAndSubheaders(subHeaderTag, headerID, safeLevel + 1);
    });
  }
}



export function sortArticles(articles: Article[], tags: Tag[], priorityTags: string[]): GroupedArticles {
  let groupedArticles: GroupedArticles = { headers: [], no_headers: [], favorites: [] } as GroupedArticles;

  initializeHeaders(tags);  // Initialize headers based on tag list

  const prioritizeTags = new Set(priorityTags); // Use a set for quick lookup

  // Main article sorting loop: Assign articles to the first matching header based on tag order
  articles.forEach(article => {
    let placed = false;

    // Check each tag in the order they appear in the article
    for (const tag of article.tags) {
      if (placed) break;  // Stop once the article is placed

      // Attempt to place the article in a header matching the tag
      headersMap.forEach(header => {
        if (placed) return; // Skip if article is already placed

        if (tag === header.tagName && header.headerLevel === 2) { // Ensure it's a main header (level 2)
          header.articles.push(article);
          placed = true; // Mark as placed
        }
      });
    }

    if (!placed) {
      groupedArticles.no_headers.push(article); // Articles that don't fit any header
    }

    if (article.tags.includes('favorite')) {
      groupedArticles.favorites.push(article); // Handle favorites
    }
  });

  // Recursive distribution of articles into subheaders
  headersMap.forEach(header => {
    header.articles.sort(sortArticlesByPriorityAndTitle(prioritizeTags)); // Sort articles within the header
    distributeArticlesToSubheaders(header.id); // Distribute to subheaders
  });

  groupedArticles.headers = Array.from(headersMap.values()); // Collect all headers after sorting
  groupedArticles.no_headers.sort(sortArticlesByPriorityAndTitle(prioritizeTags)); // Sort no_headers list
  groupedArticles.favorites.sort(sortArticlesByPriorityAndTitle(prioritizeTags)); // Sort favorites list

  return groupedArticles;
}

function distributeArticlesToSubheaders(headerId: string): void {
  const header = headersMap.get(headerId);
  if (!header || !header.subHeaderIds.length) return;

  const remainingArticles: Article[] = [];
  header.articles.forEach(article => {
    const placed = header.subHeaderIds.some(subHeaderId => {
      const subHeader = headersMap.get(subHeaderId);
      if (subHeader && article.tags.includes(subHeader.tagName)) {
        subHeader.articles.push(article);
        return true;
      }
      return false;
    });

    if (!placed) remainingArticles.push(article);
  });

  header.articles = remainingArticles; // Update the main header's article list
  header.subHeaderIds.forEach(subId => distributeArticlesToSubheaders(subId)); // Recursively distribute to lower subheaders
}


const sortArticlesByPriorityAndTitle = (prioritizeTags: Set<string>) => {
  return (a: Article, b: Article): number => {
    if (prioritizeTags.size === 0) return a.title.localeCompare(b.title);
    const priorityA = calculateTagPriority(a, prioritizeTags);
    const priorityB = calculateTagPriority(b, prioritizeTags);
    return priorityA !== priorityB ? priorityA - priorityB : a.title.localeCompare(b.title);
  };
};

function calculateTagPriority(article: Article, prioritizeTags: Set<string>): number {
  return article.tags.reduce((min, tag) => Math.min(min, prioritizeTags.has(tag) ? Array.from(prioritizeTags).indexOf(tag) : Infinity), Infinity);
}

