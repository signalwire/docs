# Realtime SDK Migration Session - 2026-01-22

## Overview

Successfully migrated the complete Realtime SDK documentation (373 MDX/MD files across 3 versions) from Docusaurus to Fern.

## Source and Destination

- **Source (v4/latest):** `temp-docs/docs/website/docs/realtime-sdk/`
- **Source (v3):** `temp-docs/docs/website/realtime-sdk_versioned_docs/version-v3/`
- **Source (v2):** `temp-docs/docs/website/realtime-sdk_versioned_docs/version-v2/`
- **Destination:** `fern/products/realtime-sdk/`

## Files Migrated

373 files across 3 versions:

| Version | Files | Content |
|---------|-------|---------|
| v4 (latest) | 47 | Node.js SDK with voice, video, messaging, chat, pubsub, task namespaces |
| v3 | 47 | Similar to v4 with event-based API (.on() pattern) |
| v2 | 279 | Multi-language SDK (Node.js, Python, Ruby, PHP, Go, .NET) with calling, messaging, task features |

### v4 Structure
- Overview/Introduction
- Voice Guides (first-steps, voicemail, weather-phone, robocalls)
- Messaging Guides (first-steps, send-sms, forward-texts)
- Technical Reference (voice, video, messaging, pubsub, chat, task, realtime-client)

### v3 Structure
- Similar to v4 with migration guide (v4-vs-v3)
- Same technical reference structure

### v2 Structure
- Multi-language with 6 tabs (Node.js, Python, Ruby, PHP, Go, .NET)
- Each language has calling, messaging, task documentation
- Calling includes actions and results subdirectories

## Migration Process

### Step 1: Directory Structure Creation
```bash
mkdir -p fern/products/realtime-sdk/{versions,pages/v4/...,pages/v3/...,pages/v2/...}
```

### Step 2: File Copy
Copied all MDX/MD files from source to corresponding destination directories.

### Step 3: Version Navigation Files Creation
Created three version-specific yml files:
- `fern/products/realtime-sdk/versions/v4.yml`
- `fern/products/realtime-sdk/versions/v3.yml`
- `fern/products/realtime-sdk/versions/v2.yml`

Each with tabs and navigation sections.

### Step 4: Product Registration with Versioning
Added to `fern/docs.yml`:
```yaml
- display-name: Realtime SDK
  slug: realtime-sdk
  path: products/realtime-sdk/versions/v4.yml
  versions:
    - display-name: v4
      path: products/realtime-sdk/versions/v4.yml
      availability: stable
    - display-name: v3
      path: products/realtime-sdk/versions/v3.yml
      availability: deprecated
    - display-name: v2
      path: products/realtime-sdk/versions/v2.yml
      availability: deprecated
```

Note: Product versioning requires BOTH `path` (for default version) AND `versions` list.

### Step 5: Syntax Conversions Applied

#### Batch sed replacements:
```bash
# Image paths
find . -name "*.mdx" -exec sed -i 's/@image\//\/images\//g' {} \;

# className to class
find . -name "*.mdx" -exec sed -i 's/className=/class=/g' {} \;

# Remove sidebar_position, slug, sidebar_label
find . -name "*.mdx" -exec sed -i '/^sidebar_position:/d' {} \;
find . -name "*.mdx" -exec sed -i '/^slug:/d' {} \;
find . -name "*.mdx" -exec sed -i '/^sidebar_label:/d' {} \;

# Remove Docusaurus imports
find . -name "*.mdx" -exec sed -i '/^import.*from.*react-icons/d' {} \;
find . -name "*.mdx" -exec sed -i '/^import.*from.*@site/d' {} \;
find . -name "*.mdx" -exec sed -i '/^import.*from.*@theme/d' {} \;

# Fix internal links
find . -name "*.mdx" -exec sed -i 's|/sdks/realtime-sdk/|/realtime-sdk/|g' {} \;

# Component conversions
find . -name "*.mdx" -exec sed -i 's/<APIField/<ParamField/g' {} \;
find . -name "*.mdx" -exec sed -i 's/<\/APIField>/<\/ParamField>/g' {} \;

# JSX boolean syntax
find . -name "*.mdx" -exec sed -i 's/required={true}/required/g' {} \;

# Heading anchors
find . -name "*.mdx" -exec sed -i 's/ {#\([^}]*\)}$/ [#\1]/g' {} \;
```

#### Python script for admonition conversion:
Used Python to intelligently convert `:::type` / `:::` admonitions to proper Fern callout components (`<Info>`, `<Warning>`, `<Tip>`, etc.).

#### Manual fixes:

1. **v4/index.mdx and v3/index.mdx** - Replaced `<InstallHero>` component:
   - Removed React icon imports
   - Converted to static CardGroup with npm and GitHub links
   - Added subtitle to frontmatter
   - Converted `<TabItem>` to `<Tab title="...">`
   - Fixed Card icons from JSX to Font Awesome strings

2. **v2/index.mdx** - Converted language Cards with JSX icons to Font Awesome icons

3. **v2/guides/v2-vs-v3.mdx** - Fixed unclosed `<Info>` tag and `<TabItem>` conversions

4. **All files with admonitions** - Converted `:::type Title` / `:::` patterns to `<Type title="Title">` / `</Type>`

5. **HTML comments** - Removed `<!-- ... -->` comments

## Key Differences from Previous Migrations

1. **Versioning**: This SDK had 3 versions requiring Fern's product versioning feature
2. **Multi-language v2**: v2 had 6 language-specific documentation sets requiring 7 tabs (overview + 6 languages)
3. **APIField component**: Required conversion to `<ParamField>`
4. **JSX expressions**: `required={true}` needed conversion to `required`

## Patterns Identified and Fixed

| Docusaurus | Fern |
|------------|------|
| `<InstallHero>` | Static CardGroup + code block |
| `<TabItem value="x" label="y">` | `<Tab title="y">` |
| `:::info Title` | `<Info title="Title">` |
| `:::` (closing) | `</Info>` (or matching closing tag) |
| `<APIField ... required={true}>` | `<ParamField ... required>` |
| `{#anchor}` heading | `[#anchor]` heading |
| `icon={<SiNodedotjs />}` | `icon="brands node-js"` |

## Validation Results

```bash
fern check
# Found 0 errors and 1 warning (color contrast, unrelated to migration)

fern docs dev
# Uploaded 321 files
# Server starts successfully
# No MDX parse errors
```

## Product Configuration Note

Fern product versioning requires:
1. A `path` property pointing to the default version's yml file
2. A `versions` list with each version having `display-name`, `path`, and optionally `availability`

Example:
```yaml
- display-name: Realtime SDK
  slug: realtime-sdk
  path: products/realtime-sdk/versions/v4.yml  # Required: default version
  versions:
    - display-name: v4
      path: products/realtime-sdk/versions/v4.yml
      availability: stable
```

## Files Created/Modified

### New files:
- `fern/products/realtime-sdk/versions/v4.yml`
- `fern/products/realtime-sdk/versions/v3.yml`
- `fern/products/realtime-sdk/versions/v2.yml`
- `fern/products/realtime-sdk/pages/**/*.mdx` (373 files)

### Modified files:
- `fern/docs.yml` (added realtime-sdk product with versioning)

## Post-Migration Fixes (Session 2)

After initial migration, a spot check revealed several issues that were fixed:

### 1. Missing v3 Partials → Fern Snippets

The v3 tech-ref files used shared method partials (`_common/_method_*.mdx`) that weren't copied.

**Solution:** Created Fern snippets using the `<Markdown src="..." />` pattern:

```bash
# Created snippet files
fern/snippets/realtime-sdk/
├── method_on.mdx
├── method_off.mdx
├── method_once.mdx
└── method_removealllisteners.mdx
```

**Files updated (9 total):**
- `v3/tech-ref/pubsub/pubsub-client.mdx`
- `v3/tech-ref/messaging/messaging-client.mdx`
- `v3/tech-ref/realtime-client/index.mdx`
- `v3/tech-ref/video/video-roomsession.mdx`
- `v3/tech-ref/video/video-client.mdx`
- `v3/tech-ref/voice/voice-client.mdx`
- `v3/tech-ref/voice/voice-call.mdx`
- `v3/tech-ref/chat/chat-client.mdx`
- `v3/tech-ref/task/task-client.mdx`

**Conversion pattern:**
```mdx
// BEFORE (Docusaurus)
import MethodOn from "../../_common/_method_on.mdx";
<MethodOn />

// AFTER (Fern)
<Markdown src="/snippets/realtime-sdk/method_on.mdx" />
```

### 2. Missing Dashboard UI Accordion Partial

Files in v3 and v4 guides imported `/docs/main/_common/dashboard/_ui-accordion.mdx`.

**Solution:** Created Fern snippet with syntax conversions:

```bash
fern/snippets/dashboard/ui-accordion.mdx
```

**Conversions applied:**
- `TabItem` → `Tab title="..."`
- `className` → `class`
- `@image/` → `/images/`
- Removed unsupported Accordion props (`onChange`, `description`)

**Files updated:**
- `v3/guides/messaging/forwarding-texts-to-email-nodejs.mdx`
- `v4/guides/messaging/forwarding-texts-to-email-nodejs.mdx`

### 3. Missing Pages in v4 Navigation

Added 11 pages to `versions/v4.yml`:

**Voice section:**
- Device Builder (`voice-devicebuilder.md`)
- Playlist (`voice-playlist.md`)

**Video section:**
- Room Session Full State (`video-roomsessionfullstate.md`)
- Room Session Member (`video-roomsessionmember.md`)
- Room Session Playback (`video-roomsessionplayback.md`)
- Room Session Recording (`video-roomsessionrecording.md`)

**Messaging section:**
- Message Contract (`messaging-messagecontract.md`)
- Messaging Send Result (`messaging-messagingsendresult.md`)

**PubSub section:**
- PubSub Message (`pubsub-pubsubmessage.md`)

### 4. Orphan Index Pages (No Fix Needed)

The following files use Docusaurus auto-index components and were intentionally left out of navigation:
- `v4/guides/index.mdx` - uses `<GuidesList />`
- `v3/guides/index.mdx` - uses `<GuidesList />`
- `v3/guides/voice/index.mdx` - uses `<DocCardList />`
- `v3/guides/messaging/index.mdx` - uses `<DocCardList />`
- `v2/guides/index.mdx` - uses `<GuidesList />`

These are auto-generated category pages that Fern doesn't need since navigation is handled via YAML.

## Fern Snippets Pattern

Fern uses `<Markdown src="..." />` for reusable content (equivalent to MDX imports):

```mdx
<Markdown src="/snippets/realtime-sdk/method_on.mdx" />
```

Key points:
- Snippets live in `/fern/snippets/` directory
- Path is absolute from `fern/` root
- Can include parameters: `<Markdown src="..." param="value" />`
- Parameters use `{{paramName}}` syntax in snippet files

## Final Validation

```bash
fern check
# Found 0 errors and 1 warning

fern docs dev
# Uploaded 327 files
# No MDX parse errors
# Server running on http://localhost:3002
```

## Content Verification (Session 3)

A comprehensive content comparison was performed between Docusaurus source and Fern migrated docs.

### Verification Scope

- **Docusaurus source:** `temp-docs/docs/website/docs/realtime-sdk/`
- **Fern v4:** `fern/products/realtime-sdk/pages/v4/`
- **Fern v3:** `fern/products/realtime-sdk/pages/v3/`

### Findings

#### All Expected Conversions Verified ✅
- `@image/` → `/images/` (all converted)
- `:::info`/`:::tip` → `<Info>`/`<Tip>` (all converted)
- `<APIField>` → `<ParamField>` (all converted)
- `required={true}` → `required` (all converted)
- `{#anchor}` → `[#anchor]` (all converted)
- `className=` → `class=` (none found needing conversion)
- Docusaurus imports removed (none remaining)
- `sidebar_position:` frontmatter removed (all removed)

#### Issue Found and Fixed
**Unconverted `<details>` tags** in voicemail guides:
- `pages/v4/guides/voice/setting-up-voicemail.mdx`
- `pages/v3/guides/voice/setting-up-voicemail.mdx`

```jsx
// BEFORE (incorrect)
<details>
<summary>index.js</summary>

// AFTER (fixed)
<Accordion title="index.js">
```

#### Version Differences (Intentional - Not Bugs)
The v3 and v4 documentation differ because they document different API versions:

| Aspect | v3 (Older API) | v4 (New API) |
|--------|---------------|--------------|
| Client init | `new Chat.Client({...})` | `SignalWire({...})` then `client.chat` |
| Events | `.on()`, `.off()`, `.once()` | `.listen({ onEventName: callback })` |
| Event names | `member.joined`, `message` | `onMemberJoined`, `onMessageReceived` |
| Channels | `.subscribe()` / `.unsubscribe()` | Passed in `.listen()` options |

### File Count Verification

Both Docusaurus and Fern v4 have 47 matching files:
- 11 guides (including index pages)
- 36 tech-ref pages

### Content Integrity

Spot-checked multiple files for content parity:
- `guides/messaging/first-steps-with-messaging.mdx` ✅
- `guides/voice/first-steps-with-voice.mdx` ✅
- `guides/voice/setting-up-voicemail.mdx` ✅ (after fix)
- `tech-ref/voice/voice-client.mdx` ✅
- `tech-ref/chat/chat-client.mdx` ✅
- `tech-ref/video/video-roomsession.mdx` ✅

All content matches with only expected syntax conversions applied.

## Sources Used

- [Fern Versioning Documentation](https://buildwithfern.com/learn/docs/configuration/versions)
- [Fern Products Documentation](https://buildwithfern.com/learn/docs/configuration/products)
- [Fern Snippets Documentation](https://buildwithfern.com/learn/docs/writing-content/reusable-snippets)
