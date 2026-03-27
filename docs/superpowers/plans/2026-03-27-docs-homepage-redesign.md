# Docs Homepage Redesign + Brand Alignment Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Align the Fern docs site theme with the SignalWire Design System v2.0 and redesign the homepage with a branded hero, use-case pathways, and reorganized card sections.

**Architecture:** Site-wide theme changes (fonts, CSS overrides) land first via `docs.yml` and `styles.css`. Then the homepage MDX is rewritten using custom HTML for the hero/pathway sections and Fern `<Card>`/`<CardGroup>` components for SDK and Tools sections. All custom colors reference the token file `temp/signalwire-tokens.dtcg.json`.

**Tech Stack:** Fern docs framework, MDX, CSS custom properties, Font Awesome icons

**Spec:** `docs/superpowers/specs/2026-03-27-docs-homepage-redesign-design.md`

---

## File Structure

| File | Responsibility |
|------|---------------|
| `fern/assets/fonts/instrument-sans-700.woff2` | NEW: Brand heading font (bold) |
| `fern/assets/fonts/instrument-sans-500.woff2` | NEW: Brand heading font (medium) |
| `fern/assets/fonts/outfit-400.woff2` | NEW: Brand body font |
| `fern/assets/fonts/jetbrains-mono-400.woff2` | NEW: Brand code font |
| `fern/docs.yml` | MODIFY: Typography section only (lines 153-167) |
| `fern/styles.css` | MODIFY: Replace landing page CSS (lines 83-297), add `.fern-page-heading` overrides |
| `fern/products/home/pages/welcome.mdx` | REWRITE: Entire homepage content and layout |

---

### Task 1: Download and add brand font files

**Files:**
- Create: `fern/assets/fonts/instrument-sans-700.woff2`
- Create: `fern/assets/fonts/instrument-sans-500.woff2`
- Create: `fern/assets/fonts/outfit-400.woff2`
- Create: `fern/assets/fonts/jetbrains-mono-400.woff2`

- [ ] **Step 1: Download Instrument Sans from Google Fonts**

```bash
cd fern/assets/fonts

# Instrument Sans 700 (bold) - for headings
curl -L "https://fonts.gstatic.com/s/instrumentsans/v1/pximypc9vsFDm051Uf6KVwgkfoSxQ0GsQv8ToedPibnr-yp2JGEJOH9npSTF-Qf1mS1v7Sg.woff2" -o instrument-sans-700.woff2

# Instrument Sans 500 (medium) - for heading secondary weight
curl -L "https://fonts.gstatic.com/s/instrumentsans/v1/pximypc9vsFDm051Uf6KVwgkfoSxQ0GsQv8ToedPibnr-yp2JGEJOH9npST3-Qf1mS1v7Sg.woff2" -o instrument-sans-500.woff2
```

If the direct URLs don't work, use Google Fonts web UI:
1. Go to https://fonts.google.com/specimen/Instrument+Sans
2. Select weights 500 and 700
3. Download, extract woff2 files, rename to `instrument-sans-500.woff2` and `instrument-sans-700.woff2`

- [ ] **Step 2: Download Outfit from Google Fonts**

```bash
# Outfit 400 (regular) - for body text
curl -L "https://fonts.gstatic.com/s/outfit/v11/QGYyz_MVcBeNP4NjuGObqx1XmO1I4TC1C4G-EiAou6Y.woff2" -o outfit-400.woff2
```

Fallback: https://fonts.google.com/specimen/Outfit - select weight 400, download woff2.

- [ ] **Step 3: Download JetBrains Mono**

```bash
# JetBrains Mono 400 (regular) - for code
curl -L "https://fonts.gstatic.com/s/jetbrainsmono/v18/tDbY2o-flEEny0FZhsfKu5WU4zr3E_BX0PnT8RD8yKxTOlOTk6OThhvA.woff2" -o jetbrains-mono-400.woff2
```

Fallback: https://fonts.google.com/specimen/JetBrains+Mono - select weight 400, download woff2.

- [ ] **Step 4: Verify all 4 font files exist**

```bash
ls -la fern/assets/fonts/*.woff2
```

Expected: 6 files total (4 new + 2 existing neueeinstellung files).

- [ ] **Step 5: Commit font files**

```bash
git add fern/assets/fonts/instrument-sans-700.woff2 fern/assets/fonts/instrument-sans-500.woff2 fern/assets/fonts/outfit-400.woff2 fern/assets/fonts/jetbrains-mono-400.woff2
git commit -m "feat: add SignalWire brand fonts (Instrument Sans, Outfit, JetBrains Mono)"
```

---

### Task 2: Update docs.yml typography config

**Files:**
- Modify: `fern/docs.yml:153-167`

- [ ] **Step 1: Update the typography section**

Replace lines 153-167 in `fern/docs.yml`. Change from Neue Einstellung/Inter to Instrument Sans/Outfit/JetBrains Mono:

```yaml
typography:
  headingsFont:
    name: Instrument Sans
    paths:
      - path: assets/fonts/instrument-sans-700.woff2
        weight: 700
        style: normal
      - path: assets/fonts/instrument-sans-500.woff2
        weight: 500
        style: normal
  bodyFont:
    name: Outfit
    path: assets/fonts/outfit-400.woff2
    weight: 400
    style: normal
  codeFont:
    name: JetBrains Mono
    path: assets/fonts/jetbrains-mono-400.woff2
    weight: 400
    style: normal
```

- [ ] **Step 2: Verify YAML is valid**

```bash
cd fern && fern check 2>&1 | head -20
```

Expected: no YAML parse errors. Link/reference warnings are fine at this stage.

- [ ] **Step 3: Commit typography change**

```bash
git add fern/docs.yml
git commit -m "feat: switch docs typography to brand fonts (Instrument Sans, Outfit, JetBrains Mono)"
```

---

### Task 3: Add site-wide CSS color overrides

**Files:**
- Modify: `fern/styles.css` (add new section before the landing page section)

- [ ] **Step 1: Add brand color overrides after the existing utility classes**

Insert the following block at line 82 in `fern/styles.css` (just before the `LANDING PAGE STYLING` comment):

```css
/* =============================================================================
   SIGNALWIRE BRAND OVERRIDES
   ============================================================================= */

/* Page headings: brand foreground.headings */
.fern-page-heading {
  color: #044EF4; /* light: blue */
}
.dark .fern-page-heading {
  color: #F72A72; /* dark: fuchsia */
}
```

- [ ] **Step 2: Verify the CSS is syntactically valid**

```bash
cd fern && fern check 2>&1 | head -20
```

Expected: no CSS parse errors.

- [ ] **Step 3: Commit brand overrides**

```bash
git add fern/styles.css
git commit -m "feat: add site-wide brand color overrides for page headings"
```

---

### Task 4: Replace landing page CSS with new homepage styles

**Files:**
- Modify: `fern/styles.css:85-297` (the entire `LANDING PAGE STYLING` section through `@media (prefers-reduced-motion)`)

- [ ] **Step 1: Replace the landing page CSS section**

Replace everything from `/* ============= LANDING PAGE STYLING */` through the `@media (prefers-reduced-motion)` block (lines ~85-297, adjusting for the insertion in Task 3) with:

```css
/* =============================================================================
   LANDING PAGE STYLING
   ============================================================================= */

@keyframes lp-fade-up {
  from {
    opacity: 0;
    transform: translateY(1.5rem);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.lp-page-container {
  min-height: 100vh;
  position: relative;
}

.lp-page-container .main-content {
  max-width: 60rem;
  margin: 0 auto;
  position: relative;
}

/* --- Hero Section --- */

.lp-page-container .hero-section {
  position: relative;
  overflow: clip;
  background: var(--background);
  padding: 5rem 2rem 3.5rem;
  animation: lp-fade-up 0.7s ease-out both;
}

.dark .lp-page-container .hero-section {
  background: linear-gradient(165deg, #060a18 0%, #0e1028 25%, #0c2060 50%, #0a1628 100%);
}

.lp-page-container .hero-glow {
  position: absolute;
  top: -20%;
  right: -10%;
  width: 50%;
  height: 140%;
  background: radial-gradient(ellipse, rgba(4,78,244,0.03), transparent 70%);
  pointer-events: none;
}

.dark .lp-page-container .hero-glow {
  background: radial-gradient(ellipse, rgba(4,78,244,0.15) 0%, rgba(64,224,208,0.03) 50%, transparent 70%);
}

.lp-page-container .hero-content {
  position: relative;
  z-index: 1;
  max-width: 36rem;
}

.lp-page-container .hero-eyebrow {
  font-size: 0.8rem;
  text-transform: uppercase;
  letter-spacing: 0.14em;
  font-weight: 600;
  margin-bottom: 1rem;
  color: #AB0A42; /* light: deep fuchsia */
}

.dark .lp-page-container .hero-eyebrow {
  color: #40E0D0; /* dark: turquoise */
}

.lp-page-container .hero-title {
  font-size: clamp(2rem, 4.5vw, 3.25rem);
  font-weight: 700;
  letter-spacing: -0.02em;
  line-height: 1.2;
  margin: 0 0 0.75rem;
  color: #044EF4; /* light: blue */
}

.dark .lp-page-container .hero-title {
  color: #F72A72; /* dark: fuchsia */
}

.lp-page-container .hero-subtitle {
  font-size: 1.125rem;
  line-height: 1.6;
  margin: 0;
  color: #3A3A38; /* light: secondary */
}

.dark .lp-page-container .hero-subtitle {
  color: #e8e8ec; /* dark: secondary */
}

.lp-page-container .hero-cta {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  margin-top: 1.5rem;
  background: #F72A72;
  color: #ffffff;
  padding: 0.75rem 1.5rem;
  border-radius: 8px;
  font-size: 0.9375rem;
  font-weight: 600;
  text-decoration: none !important;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.lp-page-container .hero-cta:hover {
  transform: translateY(-1px);
  box-shadow: 0 0 20px rgba(247, 42, 114, 0.25);
  color: #ffffff;
}

/* --- Pathways Section --- */

.lp-page-container .pathways-section {
  border-top: 2px solid #F72A72;
  background: var(--grayscale-a2);
  padding: 3rem 2rem;
  animation: lp-fade-up 0.7s ease-out 0.15s both;
}

.lp-page-container .section-eyebrow {
  font-size: 0.8rem;
  text-transform: uppercase;
  letter-spacing: 0.14em;
  font-weight: 600;
  margin-bottom: 1.25rem;
  color: #AB0A42; /* light: deep fuchsia */
}

.dark .lp-page-container .section-eyebrow {
  color: #40E0D0; /* dark: turquoise */
}

.lp-page-container .pathways-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 0.75rem;
}

@media (min-width: 768px) {
  .lp-page-container .pathways-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .lp-page-container .pathways-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}

.lp-page-container .pathway-card {
  display: block;
  background: var(--card-background);
  border: 1px solid var(--border-default);
  border-radius: 12px;
  padding: 1.25rem;
  text-decoration: none !important;
  transition: transform 0.25s ease, box-shadow 0.25s ease, border-color 0.2s ease;
  min-height: 3rem;
}

.lp-page-container .pathway-card:hover {
  transform: translateY(-1px);
  border-color: var(--accent-a9);
  box-shadow: 0 4px 12px var(--accent-a4);
}

.lp-page-container .pathway-icon {
  width: 2rem;
  height: 2rem;
  border-radius: 6px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 0.875rem;
  margin-bottom: 0.75rem;
}

.lp-page-container .pathway-card-title {
  font-size: 0.9375rem;
  font-weight: 600;
  margin-bottom: 0.25rem;
  color: #AB0A42; /* light: deep fuchsia */
}

.dark .lp-page-container .pathway-card-title {
  color: #40E0D0; /* dark: turquoise */
}

.lp-page-container .pathway-card-desc {
  font-size: 0.875rem;
  line-height: 1.5;
  color: #3A3A38; /* light: secondary */
}

.dark .lp-page-container .pathway-card-desc {
  color: #e8e8ec; /* dark: secondary */
}

/* --- Products Section (uses Fern Cards) --- */

.lp-page-container .products-section {
  padding: 3rem 2rem;
  animation: lp-fade-up 0.7s ease-out 0.25s both;
}

.lp-page-container .products-section .section-desc {
  font-size: 0.9375rem;
  margin: -0.5rem 0 1.5rem;
  color: #3A3A38; /* light */
}

.dark .lp-page-container .products-section .section-desc {
  color: #e8e8ec; /* dark */
}

/* --- Tools Section (uses Fern Cards) --- */

.lp-page-container .tools-section {
  background: var(--grayscale-a2);
  border-top: 1px solid var(--border-default);
  padding: 3rem 2rem;
  animation: lp-fade-up 0.7s ease-out 0.35s both;
}

/* --- Twilio Footer --- */

.lp-page-container .footer-callout {
  border-top: 1px solid var(--border-default);
  padding: 1.25rem 2rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 0.5rem;
  animation: lp-fade-up 0.7s ease-out 0.45s both;
}

.lp-page-container .footer-callout-text {
  font-size: 0.875rem;
  color: #737371; /* light: muted */
}

.dark .lp-page-container .footer-callout-text {
  color: #a0a0aa; /* dark: muted */
}

.lp-page-container .footer-callout-link {
  font-size: 0.875rem;
  font-weight: 500;
  text-decoration: none !important;
  color: #AB0A42; /* light: deep fuchsia */
}

.dark .lp-page-container .footer-callout-link {
  color: #40E0D0; /* dark: turquoise */
}

.lp-page-container .footer-callout-link:hover {
  text-decoration: underline !important;
}

.lp-page-container .footer-callout-disclaimer {
  font-size: 0.75rem;
  font-style: italic;
  color: #A8A8A6; /* light: subtle */
}

.dark .lp-page-container .footer-callout-disclaimer {
  color: #73737e; /* dark: subtle */
}

/* --- Responsive --- */

@media (max-width: 640px) {
  .lp-page-container .hero-section {
    padding: 2.5rem 1.25rem 2rem;
  }

  .lp-page-container .pathways-section,
  .lp-page-container .products-section,
  .lp-page-container .tools-section {
    padding: 2rem 1.25rem;
  }

  .lp-page-container .footer-callout {
    padding: 1rem 1.25rem;
    flex-direction: column;
    align-items: flex-start;
  }
}

/* --- Accessibility --- */

@media (prefers-reduced-motion: reduce) {
  .lp-page-container .hero-section,
  .lp-page-container .pathways-section,
  .lp-page-container .products-section,
  .lp-page-container .tools-section,
  .lp-page-container .footer-callout {
    animation: none;
  }
}
```

- [ ] **Step 2: Verify CSS is valid**

```bash
cd fern && fern check 2>&1 | head -20
```

- [ ] **Step 3: Commit new landing page CSS**

```bash
git add fern/styles.css
git commit -m "feat: replace landing page CSS with brand-aligned homepage styles"
```

---

### Task 5: Rewrite the homepage MDX

**Files:**
- Rewrite: `fern/products/home/pages/welcome.mdx`

- [ ] **Step 1: Replace the entire contents of welcome.mdx**

```mdx
---
id: 0f7a51b9-708a-48fa-bccf-d9a449c4489c
title: SignalWire Documentation
slug: /
description: Build powerful communication applications with SignalWire. Explore our REST APIs, Realtime SDKs, and comprehensive guides.
hide-toc: true
layout: custom
---

<div class="lp-page-container">
  <div class="main-content">

    {/* ---- Hero ---- */}
    <div class="hero-section">
      <div class="hero-glow"></div>
      <div class="hero-content">
        <div class="hero-eyebrow">Documentation</div>
        <h1 class="hero-title">Build on SignalWire</h1>
        <p class="hero-subtitle">
          Voice, video, messaging, and AI — one programmable platform, every interface you need.
        </p>
        <a class="hero-cta" href="/docs/platform/getting-started">
          Get started <Icon icon="arrow-right" />
        </a>
      </div>
    </div>

    {/* ---- What are you building? ---- */}
    <div class="pathways-section">
      <div class="section-eyebrow">What are you building?</div>
      <div class="pathways-grid">

        <a class="pathway-card" href="/docs/platform/getting-started#ai-application">
          <div class="pathway-icon" style={{background: 'rgba(247,42,114,0.12)'}}>
            <Icon icon="fa-regular fa-robot" color="#F72A72" />
          </div>
          <div class="pathway-card-title">AI voice agent</div>
          <div class="pathway-card-desc">LLM-powered phone agents and virtual assistants</div>
        </a>

        <a class="pathway-card" href="/docs/platform/getting-started#browser-or-mobile-app">
          <div class="pathway-icon" style={{background: 'rgba(4,78,244,0.15)'}}>
            <Icon icon="fa-regular fa-browser" color="#4d8aff" />
          </div>
          <div class="pathway-card-title">Browser or mobile</div>
          <div class="pathway-card-desc">WebRTC voice, video, and chat in your app</div>
        </a>

        <a class="pathway-card" href="/docs/platform/getting-started#server-application">
          <div class="pathway-icon" style={{background: 'rgba(64,224,208,0.1)'}}>
            <Icon icon="fa-regular fa-server" color="#40E0D0" />
          </div>
          <div class="pathway-card-title">Server application</div>
          <div class="pathway-card-desc">Backend call routing, SMS, and IVR systems</div>
        </a>

        <a class="pathway-card" href="/docs/platform/getting-started#no-code--low-code">
          <div class="pathway-icon" style={{background: 'rgba(255,215,0,0.1)'}}>
            <Icon icon="fa-regular fa-diagram-project" color="#FFD700" />
          </div>
          <div class="pathway-card-title">No-code</div>
          <div class="pathway-card-desc">Drag-and-drop call flows and Dashboard AI agents</div>
        </a>

      </div>
    </div>

    {/* ---- Interfaces & SDKs ---- */}
    <div class="products-section">
      <div class="section-eyebrow">Interfaces & SDKs</div>
      <p class="section-desc">
        APIs, markup languages, and client libraries for building on SignalWire.
      </p>

      <CardGroup cols={3}>
        <Card title="REST APIs" icon="fa-regular fa-code" href="/docs/apis">
          Complete API reference for voice, video, messaging, and AI.
        </Card>
        <Card title="SWML" icon="fa-regular fa-file-code" href="/docs/swml">
          Markup language that unifies LLMs, TTS, and STT with PSTN, SIP, and WebRTC.
        </Card>
        <Card title="Agents SDK" icon="fa-regular fa-robot" href="/docs/agents-sdk">
          Create AI agents for voice, video, and text interactions.
        </Card>
        <Card title="Server SDK" icon="fa-regular fa-bolt" href="/docs/server-sdk/v4/node">
          Server-side SDK for managing real-time voice, video, messaging, and chat.
        </Card>
        <Card title="Browser SDK" icon="fa-regular fa-browser" href="/docs/browser-sdk">
          Add video calling, audio calling, and chat directly to your website.
        </Card>
      </CardGroup>
    </div>

    {/* ---- Tools ---- */}
    <div class="tools-section">
      <div class="section-eyebrow">Tools</div>

      <CardGroup cols={4}>
        <Card title="Call Flow Builder" icon="fa-regular fa-diagram-project" href="/docs/call-flow-builder">
          Build drag-and-drop calling applications without writing code.
        </Card>
        <Card title="Platform" icon="fa-regular fa-gear" href="/docs/platform">
          Manage your SignalWire space, phone numbers, and resources.
        </Card>
        <Card title="Wirestarter" icon="fa-regular fa-plug" href="/docs/platform/wirestarter">
          Scaffold a new SignalWire project in seconds.
        </Card>
        <Card title="SWSH" icon="fa-regular fa-terminal" href="/docs/platform/swsh">
          Interactive shell for testing SWML scripts and API calls.
        </Card>
      </CardGroup>
    </div>

    {/* ---- Migration Footer ---- */}
    <div class="footer-callout">
      <div>
        <span class="footer-callout-text">Migrating from Twilio*? </span>
        <a class="footer-callout-link" href="/docs/compatibility-api">See Compatibility API &rarr;</a>
      </div>
      <span class="footer-callout-disclaimer">*Twilio is a trademark of Twilio, Inc.</span>
    </div>

  </div>
</div>
```

- [ ] **Step 2: Verify MDX parses correctly**

```bash
cd fern && fern check 2>&1 | head -30
```

Expected: no MDX parse errors for the homepage. Some pre-existing warnings elsewhere are fine.

- [ ] **Step 3: Commit homepage rewrite**

```bash
git add fern/products/home/pages/welcome.mdx
git commit -m "feat: redesign docs homepage with branded hero and use-case pathways"
```

---

### Task 6: Visual verification with fern docs dev

**Files:** None (verification only)

- [ ] **Step 1: Start the local dev server**

```bash
cd fern && fern docs dev
```

- [ ] **Step 2: Check dark mode homepage**

Open the local URL in a browser. Switch to dark mode. Verify:
- Hero has navy-to-blue gradient background fading into page navy
- "Documentation" eyebrow is turquoise (`#40E0D0`)
- "Build on SignalWire" H1 is fuchsia (`#F72A72`)
- Subtitle is light gray (`#e8e8ec`)
- "Get started" button is fuchsia with white text
- "What are you building?" section has fuchsia top border
- Pathway card titles are turquoise
- Pathway card icon badges show colored FA icons
- Interfaces & SDKs cards render with Fern Card component styling and FA icons
- Tools cards render in 4-column grid with FA icons
- Twilio footer is a quiet text strip at the bottom
- Page headings on OTHER pages are fuchsia (navigate to any docs page)

- [ ] **Step 3: Check light mode homepage**

Switch to light mode. Verify:
- Hero is clean white background, no gradient
- "Documentation" eyebrow is deep fuchsia (`#AB0A42`)
- "Build on SignalWire" H1 is blue (`#044EF4`)
- Subtitle is dark gray (`#3A3A38`)
- "Get started" button is still fuchsia with white text
- Pathway card titles are deep fuchsia
- Surface sections (pathways, tools) have subtle warm-gray background
- Page headings on OTHER pages are blue

- [ ] **Step 4: Check responsive behavior**

Resize browser to mobile width (< 640px):
- Hero padding reduces
- Pathway grid stacks to single column
- Cards stack to single column
- Twilio footer stacks vertically
- All text remains readable, no overflow

- [ ] **Step 5: Check font rendering**

On any page, inspect the computed font-family:
- Headings should show "Instrument Sans" (not "Neue Einstellung")
- Body text should show "Outfit" (not "Inter")
- Code blocks should show "JetBrains Mono"

If fonts don't render, check the Network tab for 404s on font files and verify paths in `docs.yml` match actual filenames in `fern/assets/fonts/`.

---

### Task 7: Fix issues and final commit

**Files:** Any files from Tasks 1-5 that need adjustment

- [ ] **Step 1: Fix any issues found in Task 6**

Common issues to check:
- If `<Icon>` component doesn't accept `color` prop, remove the prop and let the icon inherit color from the parent `.pathway-icon` div — add color to the CSS class instead
- If pathway card anchor links (e.g., `#ai-application`) don't match the getting-started page anchors, check `fern/products/platform/pages/getting-started.mdx` for the actual accordion `title` values and adjust the `href` fragments
- If the `hero-cta` arrow icon doesn't render, try `<Icon icon="arrow-right" />` or use a raw arrow entity `&rarr;`
- If Fern's `<Card>` components don't render inside custom `<div>` wrappers, remove the wrapper divs and use Fern's section structure differently

- [ ] **Step 2: Run fern check one final time**

```bash
cd fern && fern check 2>&1
```

Expected: no errors related to our changed files.

- [ ] **Step 3: Commit any fixes**

```bash
git add -A
git commit -m "fix: address visual verification issues from homepage redesign"
```

Skip this step if no fixes were needed.

---

### Task 8: Clean up old font files (optional)

**Files:**
- Delete: `fern/assets/fonts/neueeinstellung-bold.woff2`
- Delete: `fern/assets/fonts/neueeinstellung-medium.woff2`
- Delete: `fern/assets/fonts/Inter-Regular.ttf`

- [ ] **Step 1: Verify old fonts are no longer referenced**

```bash
grep -r "neueeinstellung\|Inter-Regular" fern/docs.yml fern/styles.css
```

Expected: no matches (the typography section was updated in Task 2).

- [ ] **Step 2: Remove old font files**

```bash
git rm fern/assets/fonts/neueeinstellung-bold.woff2 fern/assets/fonts/neueeinstellung-medium.woff2 fern/assets/fonts/Inter-Regular.ttf
git commit -m "chore: remove old font files replaced by brand fonts"
```
