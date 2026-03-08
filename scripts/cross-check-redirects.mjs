#!/usr/bin/env node

import { readFileSync } from "node:fs";
import { execSync } from "node:child_process";

// Parse redirects.map: old_path -> new_path
const lines = readFileSync("/airlock/docs/website/provisioning/nginx/redirects.map", "utf8").split("\n");
const redirects = new Map();
for (const line of lines) {
  if (line.startsWith("#") || !line.trim()) continue;
  const parts = line.trim().replace(/;$/, "").split(/\s+/);
  if (parts.length !== 2) continue;
  const oldPath = parts[0].replace(/\/$/, "") || "/";
  const newUrl = parts[1];
  const m = newUrl.match(/signalwire\.com\/docs(\/.*)?$/);
  const newPath = m ? (m[1] || "/") : null;
  if (newPath && !redirects.has(oldPath)) {
    redirects.set(oldPath, newPath);
  }
}

console.log(`Loaded ${redirects.size} redirects`);

// Get all internal links from modified MDX files via git diff
const diff = execSync("git diff --no-color HEAD", { encoding: "utf8", maxBuffer: 50 * 1024 * 1024 });

const newLinks = new Set();
for (const line of diff.split("\n")) {
  if (!line.startsWith("+") || line.startsWith("+++")) continue;
  // Markdown links
  for (const m of line.matchAll(/\]\(\/([^\s"')}>]+)/g)) {
    newLinks.add("/" + m[1].replace(/#.*/, ""));
  }
  // JSX hrefs
  for (const m of line.matchAll(/href=["'](\/[^"']+)["']/g)) {
    newLinks.add(m[1].replace(/#.*/, ""));
  }
}

console.log(`Found ${newLinks.size} unique internal links in diff\n`);

// Check: is any link we inserted actually an OLD path that redirects somewhere else?
const oldPathIssues = [];
for (const link of [...newLinks].sort()) {
  if (redirects.has(link)) {
    const target = redirects.get(link);
    if (target !== link) {
      oldPathIssues.push({ link, redirectsTo: target });
    }
  }
}

if (oldPathIssues.length > 0) {
  console.log(`WARNING: ${oldPathIssues.length} links point to OLD paths that redirect elsewhere:`);
  for (const { link, redirectsTo } of oldPathIssues) {
    console.log(`  ${link} -> should be ${redirectsTo}`);
  }
} else {
  console.log("All links are clean — none point to old redirect source paths.");
}

// Also check: are there links that DON'T appear as redirect targets?
// This would mean the link isn't a known valid path
const allTargets = new Set(redirects.values());
const unknownLinks = [];
for (const link of [...newLinks].sort()) {
  if (!allTargets.has(link) && !redirects.has(link)) {
    unknownLinks.add
    unknownLinks.push(link);
  }
}

if (unknownLinks.length > 0) {
  console.log(`\n${unknownLinks.length} links not found in redirect map (may be fine — new pages, API refs, etc.):`);
  for (const l of unknownLinks.slice(0, 30)) {
    console.log(`  ${l}`);
  }
  if (unknownLinks.length > 30) {
    console.log(`  ... and ${unknownLinks.length - 30} more`);
  }
}
