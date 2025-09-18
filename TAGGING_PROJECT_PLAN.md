# SignalWire Docs Tagging Project Plan

## Project Overview

Convert the guides showcase plugin from using custom `x-custom.tags` to standard Docusaurus `tags`, implement a category-based tag system using `tags.yml`, and systematically tag all 1,127 documentation files.

## Current Status

- **Total files**: 1,127 documentation files (.mdx/.md)
- **Already tagged**: 137 files (12%) with `x-custom.tags`
- **Need tagging**: 963 files (88%)
- **Tags system**: Expanded `tags.yml` with 40+ tags including new tags: `swaig`, `pom`, `contexts`

## Phase 1: Implement Category-Based Tag System

### 1.1: Update `tags.yml` with Categories (30 minutes)

Add `category` field to all existing tags:

```yaml
# Example structure
voice:
  label: Voice
  description: Voice functionality and APIs
  category: Channels

python:
  label: Python
  description: Python-based functionality
  category: Languages
```

**Proposed Categories:**
- **Channels**: voice, messaging, fax, video, chat
- **Products**: ai, swml, compatibility-api, rest-api, cxml, agents-sdk
- **SDKs**: browser-sdk, realtime-sdk, agents-sdk
- **Technologies**: sip, webhooks, pstn, http
- **Features**: conference, recording, swaig, pom, contexts
- **Platform**: platform, dashboard, integrations, security, billing, phone-numbers, tools
- **Guide Topics**: get-started, auth, debug, security, guide
- **Languages**: python, javascript, typescript, ruby, node

### 1.2: Update Plugin to Read from `tags.yml` (1-2 hours)

**Files to modify:**
- `website/src/plugins/docusaurus-plugin-showcase/src/index.js`
- `website/config/pluginsConfig/guide-showcase.ts`

**Changes needed:**
1. Add YAML parsing to plugin
2. Load `tags.yml` at build time
3. Generate tag configuration dynamically
4. Update tag processing logic to use categories from YAML
5. Maintain backward compatibility during transition

**Key code changes:**
- Lines 126-148 in `index.js`: Change from `frontMatter["x-custom"]["tags"]` to `frontMatter.tags`
- Add support for reading both formats during transition
- Update tag validation logic

### 1.3: Test Category System (30 minutes)
- Run `yarn start` to verify plugin builds
- Test showcase page functionality
- Verify category filtering works correctly

## Phase 2: Migrate Existing Tagged Files

### 2.1: Convert x-custom Tags to Standard Tags (1 hour)

**Files affected**: ~137 files currently using `x-custom.tags`

**Conversion mapping:**
- `product:voice` → `voice`
- `sdk:relaybrowser` → `browser-sdk`
- `language:python` → `python`
- etc.

**Process:**
1. Find all files with `x-custom.tags`
2. Convert to standard `tags` frontmatter
3. Remove `x-custom` sections where no longer needed
4. Verify showcase page displays correctly

## Phase 3: Systematic Documentation Tagging

### 3.1: SWML Documentation (~200 files)
**Directory**: `website/docs/main/swml/`

**Tagging strategy:**
- **Method files**: `swml` + feature tags (`ai`, `swaig`, `voice`, `fax`, `messaging`)
- **Agents SDK**: `agents-sdk`, `python`, `ai`, `pom`, `contexts`
- **Guides**: `swml`, `guide`, relevant feature tags

**Specific areas:**
- `swml/methods/ai/` → `swml`, `ai`, `swaig`
- `swml/methods/live_translate/` → `swml`, `ai`
- `swml/agents-sdk/` → `agents-sdk`, `python`, `ai`
- `swml/guides/AI/swaig/` → `swml`, `ai`, `swaig`

### 3.2: Voice & Calling (~150 files)
**Directories**:
- `website/docs/main/home/calling/voice/`
- `website/docs/main/compatibility-api/guides/voice/`

**Tags**: `voice`, `conference`, `recording`, `sip`, language tags

### 3.3: Messaging & SMS (~100 files)
**Directories**:
- `website/docs/main/home/messaging/`
- `website/docs/main/compatibility-api/guides/messaging/`

**Tags**: `messaging`, `chat`, `compatibility-api`, language tags

### 3.4: SDK Documentation (~150 files)
**Directories**:
- `website/docs/main/sdks/`
- `website/docs/browser-sdk/`
- `website/docs/realtime-sdk/`

**Tags**:
- Browser SDK: `browser-sdk`, `javascript`, `video`, `chat`
- Realtime SDK: `realtime-sdk`, language tags, feature tags
- Compatibility API: `compatibility-api`, language tags

### 3.5: Platform & Tools (~180 files)
**Directory**: `website/docs/main/home/platform/`, `website/docs/main/home/tools/`

**Tags**: `platform`, `dashboard`, `integrations`, `tools`, `phone-numbers`, `billing`

### 3.6: Remaining Documentation (~200+ files)
- **REST API**: `rest-api`, `webhooks`, `auth`, `http`
- **Video/Fax**: `video`, `fax`, feature-specific tags
- **Events/Demos**: `guide`, relevant technology tags

## Phase 4: Quality Assurance

### 4.1: Validation (1 hour)
- Run validation script for tag existence in `tags.yml`
- Verify showcase page functionality
- Check filtering and categorization
- Test full site build (`yarn build`)

### 4.2: Cleanup
- Remove backward compatibility code
- Update documentation standards
- Test link checking

## Implementation Notes

### Tag Selection Criteria
- **Primary tags**: Based on main topic (voice, messaging, ai, etc.)
- **Technology tags**: SDKs, protocols (sip, http, webhooks)
- **Language tags**: When code examples are present
- **Feature tags**: Specific capabilities (conference, recording, auth)
- **Guide tags**: get-started, debug, security for instructional content

### Batch Processing Strategy
- Process 20-30 files per directory at a time
- Use file paths and content to determine appropriate tags
- Ensure similar content gets similar tags
- Validate tags exist in `tags.yml` before applying

## Tools and Commands

### Development Commands
- `yarn start` - Start development server
- `yarn build` - Build full site
- `yarn check-links` - Validate internal links

### Useful File Searches
```bash
# Find files with x-custom tags
find website/docs/main -name "*.mdx" -exec grep -l "x-custom:" {} \;

# Count files needing tags
find website/docs/main -name "*.mdx" -exec grep -L "^tags:" {} \; | wc -l

# Find SWML files
find website/docs/main/swml -name "*.mdx"
```

## Success Criteria
- All 1,127 files have appropriate standard Docusaurus tags
- Guides showcase page functions identically to before
- Single source of truth for tags via `tags.yml` with categories
- Standard Docusaurus tagging conventions throughout
- No broken functionality or missing content

## Risk Mitigation
- Maintain backward compatibility during transition
- Test changes incrementally
- Keep backup of original configurations
- Validate showcase functionality after major changes

## Estimated Timeline
- **Phase 1**: 2-3 hours (Plugin modification and category system)
- **Phase 2**: 1 hour (Migrate existing tagged files)
- **Phase 3**: 4-5 hours (Systematic tagging of all documentation)
- **Phase 4**: 1 hour (QA and cleanup)
- **Total**: 8-10 hours of focused work

## Current Branch
Working on: `august-091725-tag-everything`

## Next Steps
1. Start with Phase 1.1: Add categories to `tags.yml`
2. Update plugin to read categories from YAML
3. Test category system with existing tagged files
4. Begin systematic tagging starting with SWML documentation