const {
  parseMarkdownFile,
  DEFAULT_PARSE_FRONT_MATTER
} = require("@docusaurus/utils");

const fs = require("fs-extra");
const fg = require("fast-glob");
const path = require("path");

const { sortArticles } = require("./data/articles");

const DEFAULT_OPTIONS = {
  title: "Guide Showcase",
  description: "A showcase of guides and tutorials.",
  logging: true,
  include: "**/*.{md,mdx}", // Extensions to include.
  ignore: [
    "**/node_modules/**",
    "**/_common/**",
    "**/_shared/**",
    "**/_mermaid/**",
    "**/_usecases/**",
    "**/_sharedtables/**"
  ],
  path: "docs", // Path to data on filesystem, relative to site dir.
  routeBasePath: "docs", // URL Route.
  onlyLogFailedAttempts: false,
  page: "/showcase",
  prioritizeTags: [],
  tags: [],
  header: false,
  displayFavorites: true,
  displayTableOfContents: true,
  displaySearchBar: true,
  subSites: [] // Array of objects with path and routeBasePath for subSites.
};

let tags = [];
let articles = [];

module.exports = function(context, options) {
  const pluginOptions = { ...DEFAULT_OPTIONS, ...options };
  const loggingEnabled = pluginOptions.logging !== false;

  addDescriptionContent(pluginOptions.description);

  tags = processTags(pluginOptions.tags);

  return {
    name: "docusaurus-plugin-showcase",

    async loadContent() {
      const siteDir = context.siteDir;
      if (loggingEnabled) console.log("START: docusaurus-plugin-showcase");

      // Process main site docs
      await this.processDocs(siteDir, pluginOptions.path, pluginOptions.routeBasePath, false);

      // Process subsites docs
      for (const subSite of pluginOptions.subSites) {
        await this.processDocs(siteDir, subSite.path, subSite.routeBasePath, true);
      }

      const dataDir = path.join(siteDir, "/src/data").replace(/\\/g, '/');
      if (!fs.existsSync(dataDir)) {
        fs.mkdirSync(dataDir, { recursive: true });
      }
      const groupedArticles = sortArticles(articles, tags, pluginOptions.prioritizeTags);

      const uniqueCategories = [];
      tags.forEach(tag => {
        if (tag.category && !uniqueCategories.includes(tag.category)) {
          uniqueCategories.push(tag.category);
        }
      });

      const dataFilePath = path.join(dataDir, "articles.json").replace(/\\/g, '/');
      const outputData = {
        articles: groupedArticles,
        pluginOptions: pluginOptions,
        uniqueCategories: uniqueCategories,
      };

      try {
        await fs.writeFile(dataFilePath, JSON.stringify(outputData, null, 2));
      } catch (err) {
        console.log(`We got JSON error -\n  ${err}`);
      }

      if (loggingEnabled) console.log("Articles Successfully Saved");
    },

    async processDocs(siteDir, docsPath, routeBasePath, isSubsite) {
      const docsGlobPath = path.join(
        siteDir.replace(/\\/g, '/'), // Replace backslashes with forward slashes
        docsPath,
        pluginOptions.include
      ).replace(/\\/g, '/'); // Ensure the glob pattern uses forward slashes

      const docsFiles = await fg(docsGlobPath, { ignore: pluginOptions.ignore });

      for (const filePath of docsFiles) {
        await this.processMetadata(filePath, siteDir, docsPath, routeBasePath, isSubsite);
      }
    },

    async contentLoaded({ actions }) {
      const { addRoute } = actions;
      if (loggingEnabled) console.log("FINISHED: Content Loaded for docusaurus-plugin-showcase");

      addRoute({
        path: pluginOptions.page,
        component: "@site/src/plugins/docusaurus-plugin-showcase/dist/pages/showcase",
        exact: true,
      });
    },

    async processMetadata(filePath, siteDir, docsPath, routeBasePath, isSubsite) {
      const contents = await fs.readFile(filePath, "utf-8");
      const { frontMatter, content, contentTitle } = await parseMarkdownFile({
        fileContent: contents,
        filePath,
        parseFrontMatter: DEFAULT_PARSE_FRONT_MATTER,
      });

      let { missingTags, missingTitle, missingDescription } = false;
      let invalidTags = [];
      let article = {};

      // Check tags
      if (frontMatter["x-custom"]) {
        if (frontMatter["x-custom"]["hideInGuideShowcase"] === true) {
          return;
        } else if (frontMatter["x-custom"]["tags"]) {
          article.tags = frontMatter["x-custom"]["tags"];

          if (frontMatter["x-custom"]["prioritizeHeader"]) {
            article.prioritizeHeader = frontMatter["x-custom"]["prioritizeHeader"];
          }

          // Check if all article.tags exist in pluginOptions.tags
          for (const tag of article.tags) {
            if (!pluginOptions.tags.find(t => t.name === tag)) {
              invalidTags.push(tag);
            }
          }

        } else {
          missingTags = true;
          article.tags = [];
        }
      } else {
        missingTags = true;
        article.tags = [];
      }

      // Check title
      if (frontMatter.title) {
        article.title = frontMatter.title;
      } else if (contentTitle) {
        article.title = contentTitle;
      } else {
        missingTitle = true;
      }

      let newExcerpt = this.createExcerptWithoutHeading(content);

      // Check description
      if (frontMatter.description) {
        article.description = frontMatter.description;
      } else if (newExcerpt) {
        article.description = newExcerpt;
      } else {
        missingDescription = true;
      }

      // Determine link
      article.website = frontMatter.slug 
        ? getSlugPath(frontMatter.slug, routeBasePath, isSubsite)
        : getNewPath(filePath, siteDir, docsPath, routeBasePath, isSubsite);

      function getSlugPath(slug, routeBasePath, isSubsite) {
        // Docusaurus automatically prepends routeBasePath to slugs
        // We need to simulate this behavior
        if (routeBasePath === "/") {
          // For main docs with root routeBasePath, return slug as-is
          return slug;
        } else {
          // For subsites, Docusaurus prepends routeBasePath to the slug
          return `${routeBasePath}${slug}`;
        }
      }

      function getNewPath(filePath, siteDir, docsPath, routeBasePath, isSubsite) {
        let relativePath = path.relative(path.join(siteDir, docsPath), filePath).replace(/\\/g, '/').replace(/\/index.mdx|\.mdx|\.md/g, "");
        // Docusaurus automatically prepends routeBasePath to file paths
        if (routeBasePath === "/") {
          // For main docs with root routeBasePath
          return `/${relativePath}`;
        } else {
          // For subsites, Docusaurus prepends routeBasePath to the path
          return `${routeBasePath}/${relativePath}`;
        }
      }

      // Tags warnings silenced (exclusion logic preserved)
      if (missingTags || missingTitle || missingDescription || invalidTags.length > 0) {
        if (missingTitle || missingDescription) {
          this.logWithColor("orange", "  ✘ " + filePath);
          missingTitle ? this.logWithColor("yellow", "    - Title: ✘") : "";
          missingDescription ? this.logWithColor("yellow", "    - Description: ✘") : "";
        }
      } else {
        if (!pluginOptions.onlyLogFailedAttempts) {
          this.logWithColor("green", "  ✔ " + filePath);
        }
        articles.push(article);
      }
    },

    logWithColor(color, text) {
      const reset = "\x1b[0m";
      let colorAscii = "\x1b[0m";

      if (color === 'green') {
        colorAscii = "\x1b[32m";
      } else if (color === 'red') {
        colorAscii = "\x1b[31m";
      } else if (color === 'yellow') {
        colorAscii = "\x1b[33m";
      } else if (color === 'orange') {
        colorAscii = "\x1b[38;5;208m";
      }

      if (loggingEnabled) console.log(colorAscii + text + reset);
    },

    createExcerptWithoutHeading(articleContent) {
      const paragraphs = articleContent.split(/\n\s*\n/);

      for (const paragraph of paragraphs) {
        if (!/^#+\s/.test(paragraph)) {
          return paragraph
            // Remove HTML tags.
            .replace(/<[^>]*>/g, "")
            // Remove Title headers
            .replace(/^#[^#]+#?/gm, "")
            // Remove Markdown + ATX-style headers
            .replace(/^#{1,6}\s*(?<text>[^#]*)\s*#{0,6}/gm, "$1")
            // Remove emphasis.
            .replace(/(?<opening>[*_]{1,3})(?<text>.*?)\1/g, "$2")
            // Remove strikethroughs.
            .replace(/~~(?<text>\S.*\S)~~/g, "$1")
            // Remove images.
            .replace(/!\[(?<alt>.*?)\][[(].*?[\])]/g, "$1")
            // Remove footnotes.
            .replace(/\[\^.+?\](?:: .*$)?/g, "")
            // Remove inline links.
            .replace(/\[(?<alt>.*?)\][[(].*?[\])]/g, "$1")
            // Remove inline and fenced code blocks.
            .replace(/(`{3,})(.*?)(\1)/gms, "")
            .replace(/`(.+?)`/g, "")
            // Remove blockquotes.
            .replace(/^\s{0,3}>\s?/g, "")
            // Remove admonition definition.
            .replace(/:::.*/, "")
            // Remove Emoji names within colons include preceding whitespace.
            .replace(/\s?:(?:::|[^:\n])+:/g, "")
            // Remove custom Markdown heading id.
            .replace(/\{#*[\w-]+\}/, "")
            .trim();
        }
      }

      return "";
    },

    getTags() {
      return tags;
    }
  };
};

function processTags(tags) {
  let newTags = [];
  for (const tag of tags) {
    newTags.push({
      name: tag.name,
      label: { message: tag.label },
      description: {
        message: tag.description,
        id: "showcase.tag." + tag.name + ".description",
      },
      color: tag.color,
      reference: tag.reference,
      link: tag.link,
      header: tag.header,
      category: tag.category,
      subHeaders: tag.subHeaders
    });
  }
  return newTags;
}

let newPath = path.join(__dirname, "./data/description.mdx");

function addDescriptionContent(content) {
  fs.writeFileSync(newPath, content);
}
