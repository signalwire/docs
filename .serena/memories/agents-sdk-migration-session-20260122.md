# Agents SDK Migration Session - 2026-01-22

## Overview

Successfully migrated the complete Agents SDK documentation (70 MDX files) from Docusaurus to Fern.

## Source and Destination

- **Source:** `temp-docs/docs/website/docs/agents-sdk/`
- **Destination:** `fern/products/agents-sdk/`

## Files Migrated

70 MDX files across 12 sections:

| Section | Files | Content |
|---------|-------|---------|
| getting-started/ | 5 | introduction, installation, quickstart, dev-environment, exposing-agents |
| core-concepts/ | 5 | architecture, lifecycle, swml, swaig, security |
| building-agents/ | 7 | agent-base, prompts-pom, voice-language, ai-parameters, hints, call-flow, static-vs-dynamic |
| swaig-functions/ | 5 | defining-functions, parameters, results-actions, datamap, native-functions |
| skills/ | 5 | understanding-skills, adding-skills, builtin-skills, custom-skills, skill-config |
| prefabs/ | 5 | info-gatherer, faq-bot, survey, receptionist, concierge |
| deployment/ | 5 | local-development, production, serverless, docker-kubernetes, cgi-mode |
| advanced/ | 7 | state-management, contexts-workflows, call-transfer, call-recording, search-knowledge, multi-agent, mcp-gateway |
| signalwire-integration/ | 5 | account-setup, phone-numbers, mapping-numbers, testing, troubleshooting |
| reference/ | 13 | agent-base, swml-service, swaig-function, function-result, data-map, skill-base, contexts, cli-swaig-test, cli-sw-search, cli-sw-agent-init, environment-variables, config-files, swml-schema |
| examples/ | 2 | by-feature, by-complexity |
| appendix/ | 6 | ai-parameters, best-practices, patterns, troubleshooting, changelog, migration |

## Migration Process

### Step 1: Directory Structure Creation
```bash
mkdir -p fern/products/agents-sdk/pages/{getting-started,core-concepts,building-agents,swaig-functions,skills,prefabs,deployment,advanced,signalwire-integration,reference,examples,appendix}
```

### Step 2: File Copy
Copied all MDX files from each source subdirectory to corresponding destination subdirectory.

### Step 3: Navigation File Creation
Created `fern/products/agents-sdk/agents-sdk.yml` with:
- Two tabs: "Guides" and "Reference"
- Guides tab: Getting Started through Examples sections
- Reference tab: API Reference, CLI Tools, Configuration, Appendix sections

### Step 4: Product Registration
Added to `fern/docs.yml`:
```yaml
- display-name: Agents SDK
  slug: agents-sdk
  path: products/agents-sdk/agents-sdk.yml
```

### Step 5: Syntax Conversions Applied

#### Batch sed replacements:
```bash
# Image paths
find . -name "*.mdx" -exec sed -i 's/@image\//\/images\//g' {} \;

# className to class
find . -name "*.mdx" -exec sed -i 's/className=/class=/g' {} \;

# Remove sidebar_position
find . -name "*.mdx" -exec sed -i '/^sidebar_position:/d' {} \;

# Remove Docusaurus imports
find . -name "*.mdx" -exec sed -i '/^import.*from.*react-icons/d' {} \;
find . -name "*.mdx" -exec sed -i '/^import.*from.*@site/d' {} \;
find . -name "*.mdx" -exec sed -i '/^import.*from.*@theme/d' {} \;

# Fix internal links
find . -name "*.mdx" -exec sed -i 's|/sdks/agents-sdk/|/agents-sdk/|g' {} \;
```

#### Manual fixes:

1. **introduction.mdx** - Replaced `<InstallHero>` component:
   - Removed React icon import
   - Converted to static content with CardGroup showing PyPI and GitHub links
   - Added subtitle to frontmatter

2. **ai-parameters.mdx** - Removed 4 HTML comment blocks containing hidden parameters

3. **cli-sw-search.mdx** - Fixed 2 relative links to absolute paths

## Patterns Identified (Not Present in This Migration)

The following Docusaurus patterns were checked but NOT found in the Agents SDK docs:
- `:::type` admonition syntax (none found)
- `<TabItem>` components (none found)
- `{#anchor}` heading syntax (none found)
- `<Admonition>` components (none found)
- `<Tooltips>` (none found)
- `<DocCardList>`, `<GuidesList>`, `<UseCaseLinks>`, etc. (none found)

## Validation Results

```bash
fern check
# Found 0 errors and 1 warning (color contrast, unrelated to migration)

fern docs dev
# Server starts successfully
# All 317 files uploaded
# No MDX parse errors
```

## Known Issues

Other products in the Fern repo (call-flow-builder, platform) have broken links pointing to `/sdks/agents-sdk/...` paths. These external references need to be updated separately to use `/agents-sdk/...`.

## Images

All images referenced in the Agents SDK docs use the path `/images/agents-sdk-manual/...` and were already present in `fern/images/agents-sdk-manual/` from a previous bulk migration.

## Lessons Learned

1. The Agents SDK docs were relatively clean - no complex Docusaurus components like admonitions or TabItems
2. The main conversion work was:
   - Image path updates (`@image/` → `/images/`)
   - Removing frontmatter (`sidebar_position`)
   - Fixing internal links
   - Replacing custom components (`<InstallHero>`)
3. HTML comments can cause MDX parse errors - always remove them
4. Check for relative links (`../`) and convert to absolute paths

## Files Created/Modified

### New files:
- `fern/products/agents-sdk/agents-sdk.yml`
- `fern/products/agents-sdk/pages/**/*.mdx` (70 files)

### Modified files:
- `fern/docs.yml` (added agents-sdk product)
