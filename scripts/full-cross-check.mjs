#!/usr/bin/env node

import { readFileSync, globSync } from "node:fs";
import { resolve } from "node:path";

// Parse redirects
const lines = readFileSync("/airlock/docs/website/provisioning/nginx/redirects.map", "utf8").split("\n");
const redirects = new Map();
for (const line of lines) {
  if (line.startsWith("#") || line.trim() === "") continue;
  const parts = line.trim().replace(/;$/, "").split(/\s+/);
  if (parts.length !== 2) continue;
  const oldPath = parts[0].replace(/\/$/, "") || "/";
  const m = parts[1].match(/signalwire\.com\/docs(\/.*)?$/);
  const newPath = m ? (m[1] || "/") : null;
  if (newPath && !redirects.has(oldPath)) redirects.set(oldPath, newPath);
}
console.log("Redirects loaded:", redirects.size);

// Scan ALL internal links in current MDX files
const ROOT = "/airlock/fix-links";
const files = [
  ...globSync("fern/products/**/*.mdx", { cwd: ROOT }),
  ...globSync("fern/snippets/**/*.mdx", { cwd: ROOT }),
];

const allLinks = new Map(); // link -> first file
for (const f of files) {
  const src = readFileSync(resolve(ROOT, f), "utf8");
  for (const m of src.matchAll(/\]\((\/[^\s"')}>]+)/g)) {
    const link = m[1].replace(/#.*/, "");
    if (!allLinks.has(link)) allLinks.set(link, f);
  }
  for (const m of src.matchAll(/href=["'](\/[^"']+)["']/g)) {
    const link = m[1].replace(/#.*/, "");
    if (!allLinks.has(link)) allLinks.set(link, f);
  }
}
console.log("Unique internal links in MDX files:", allLinks.size);

// Check for old paths that redirect elsewhere
const issues = [];
for (const [link, file] of allLinks) {
  if (redirects.has(link)) {
    const target = redirects.get(link);
    if (target !== link) {
      issues.push({ link, file, shouldBe: target });
    }
  }
}

if (issues.length > 0) {
  console.log("\nWARNING: " + issues.length + " links use old paths that redirect elsewhere:");
  for (const { link, file, shouldBe } of issues) {
    console.log("  " + link + " (in " + file + ") -> should be " + shouldBe);
  }
} else {
  console.log("\nAll links are clean — no old redirect source paths found in MDX files.");
}
