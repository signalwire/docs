import { visit } from "unist-util-visit";
import checkAltText from "@double-great/alt-text";
import { position } from "unist-util-position";

class URLExtractor {
  url: URL;
  constructor(input: string) {
    // Fallback to using a base URL to handle relative paths
    try {
      this.url = new URL(input, "http://example.com");
    } catch (e) {}
  }

  get path() {
    return this.url.pathname;
  }

  get filename() {
    return this.path.split("/").pop();
  }

  get extension() {
    const match = this.filename.match(/\.(\w+)$/);
    return match ? match[1] : null;
  }

  get query() {
    return this.url.search;
  }

  get fragment() {
    return this.url.hash;
  }
}

function isSmallImageFormat(str) {
  str = str.toLowerCase().trim();
  const matchesPattern = /require\s*\(['"].+\.webp['"]\)\s*\.default/i.test(str);
  const URLPattern = new URLExtractor(str);

  return (
    str.endsWith(".svg") ||
    str.endsWith(".webp") ||
    matchesPattern ||
    URLPattern.extension === "webp" ||
    URLPattern.extension === "svg"
  );
}

export default function a11yValidator() {
  return (tree, vfile) => {
    function a11yCheck({ parent, altText, srcText }) {
      // get the accessibility related message
      const altTextMessage = checkAltText(altText);

      let positionOfNode = position(parent);

      if (altTextMessage) {
        vfile.fail(`${altTextMessage} (${altText ?? ""})`, {
          place: positionOfNode,
          source: "remark-plugin-a11y-checker",
        });
      }

      if (typeof srcText === "string" && !isSmallImageFormat(srcText)) {
        vfile.fail(`Your image at ${srcText} is not a webp or an SVG.`, {
          place: positionOfNode,
          source: "remark-plugin-a11y-checker",
        });
      }
    }

    visit(tree, ["mdxJsxTextElement"], (node, index, parent) => {
      if (node.type === "mdxJsxTextElement" && node["name"] === "img") {
        const srcIndex = node["attributes"].findIndex((attr) => attr.name === "src");
        const srcText = node["attributes"][srcIndex]?.value?.value;
        const altIndex = node["attributes"].findIndex((attr) => attr.name === "alt");
        const altText = node["attributes"][altIndex]?.value?.value;
        const titleIndex = node["attributes"].findIndex((attr) => attr.name === "title");
        const titleText = node["attributes"][titleIndex]?.value?.value;

        a11yCheck({ srcText, parent, altText });
      }
    });

    visit(tree, ["image"], (node, index, parent) => {
      const srcText = node.url;
      const altText = node.alt;
      const titleText = node.title;

      a11yCheck({ parent, srcText, altText });
    });
  };
}
