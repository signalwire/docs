# Docs Homepage Redesign + Site-Wide Brand Alignment

## Overview

Redesign the SignalWire documentation homepage (`/docs/`) and align the entire Fern docs site theme with the official SignalWire Design System v2.0 (defined in `temp/signalwire-tokens.dtcg.json` and `temp/styling.md`).

The homepage currently looks generic and static. The redesign makes it feel distinctly SignalWire — modern, professional, and visually engaging — while guiding visitors to the right entry point for their use case.

## Scope

Two workstreams that must ship together:

1. **Site-wide Fern theme alignment** — CSS variable overrides and `docs.yml` config changes that bring every page in line with SignalWire branding
2. **Homepage redesign** — new layout for `fern/products/home/pages/welcome.mdx` with a branded hero and use-case pathways

The site-wide theme must land first; the homepage depends on it.

## Brand Reference

- Token source of truth: `temp/signalwire-tokens.dtcg.json`
- Style guide: `temp/styling.md`
- Style guide (web): `https://tatooine.cantina.cloud/devuser/design/signalwire-styleguide.html`
- Fern CSS selectors reference: `temp/fern-docs/docs/fern/products/docs/pages/component-library/custom-components/css-selectors.mdx`
- Fern site-level settings: `temp/fern-docs/docs/fern/products/docs/pages/customization/site-level-settings.mdx`

## Design Principles (from brand style guide)

- **60-30-10 rule**: 60% neutral (backgrounds, body text), 30% secondary (cards, surfaces), 10% accent (CTAs, emphasis, status)
- **Dark-mode-first**: design for dark, then adapt for light
- **Callout scarcity**: max 2 per screen
- **No emoji**: always use Font Awesome icons via Fern
- **No colored text below 14px**: brand fills (buttons, bars, glows) carry color, not small text
- **Heading proximity**: space above > space below

---

## Part 1: Site-Wide Fern Theme Alignment

### 1.1 Typography (`docs.yml`)

Change fonts from current (Neue Einstellung / Inter) to brand fonts (Instrument Sans / Outfit / JetBrains Mono).

**Current:**
```yaml
typography:
  headingsFont:
    name: Neue Einstellung
    paths:
      - path: assets/fonts/neueeinstellung-bold.woff2
        weight: 700
        style: normal
      - path: assets/fonts/neueeinstellung-medium.woff2
        weight: 500
        style: normal
  bodyFont:
    name: Inter
    path: assets/fonts/Inter-Regular.ttf
    weight: 400
    style: normal
```

**Target:**
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

Font files must be added to `fern/assets/fonts/`. Source from Google Fonts (Instrument Sans, Outfit) and JetBrains (JetBrains Mono).

### 1.2 Color Overrides (`styles.css`)

Fern generates Radix color scales from `docs.yml` `accent-primary` and `background`. For brand colors that fall outside Fern's single-accent model, override via CSS variables using `.dark` selector for dark mode.

**Page heading color** (`.fern-page-heading`):
```css
/* Brand: foreground.headings */
.fern-page-heading {
  color: #044EF4; /* blue in light */
}
.dark .fern-page-heading {
  color: #F72A72; /* fuchsia in dark */
}
```

**Card title color** — Fern cards use `.fern-selection-item-title` (product selector) and card content inherits from `var(--text-body)`. Override for brand `emphasis-small`:
```css
/* Brand: roles.card-title = foreground.emphasis-small */
/* Only apply to homepage and product cards where brand styling is desired */
```

Note: Card title overrides are scoped to the homepage custom HTML. Fern `<Card>` components on other pages use Fern's default styling via `var(--text-body)` and `var(--grayscale-12)`, which are acceptable for documentation content pages.

**Link color** (`.fern-mdx-link`):

Fern's default link color uses `var(--accent-a11)` which maps to turquoise in dark mode (matches brand) and a blue derived from `#044ef4` in light mode. The brand specifies `foreground.emphasis-small` for links — turquoise dark, deep fuchsia (`#AB0A42`) light. The dark mode matches; light mode is blue vs deep fuchsia. Leave as-is initially since blue links are conventional for docs. Revisit if full brand alignment is needed for links.

### 1.3 `docs.yml` Colors (keep existing)

The current `docs.yml` color config is already well-aligned:

```yaml
colors:
  accent-primary:
    light: "#044ef4"  # SW Blue — correct
    dark: "#40e0d0"   # SW Turquoise — correct
  background:
    light: "#ffffff"   # acceptable (brand is #FBFBFA)
    dark: "#0a1628"    # SW Navy — keep for docs site identity
```

No changes needed. These generate the Radix scales that Fern components use for `--accent-*` and `--grayscale-*` variables.

---

## Part 2: Homepage Redesign

### 2.1 Page structure

File: `fern/products/home/pages/welcome.mdx`
Layout: `layout: custom` (same as current)
Styles: `fern/styles.css` (landing page section)

**Sections in order:**

1. **Hero** — custom HTML
2. **"What are you building?"** — custom HTML pathway cards
3. **Interfaces & SDKs** — Fern `<CardGroup>` / `<Card>`
4. **Tools** — Fern `<CardGroup>` / `<Card>`
5. **Twilio migration footer** — custom HTML

### 2.2 Hero Section

Custom HTML with brand gradient (dark mode) or clean white (light mode).

**Dark mode:**
- Background: brand gradient `linear-gradient(165deg, #060a18 0%, #0e1028 25%, #0c2060 50%, #0a1628 100%)` — fades into Fern's `var(--background)`
- Subtle radial glow: `radial-gradient(ellipse, rgba(4,78,244,0.15), transparent)` positioned top-right
- Padding: `5rem` top (spacing.20 = 80px) per brand spacing scale

**Light mode:**
- Background: `var(--background)` (white) — no gradient
- No radial glow (or barely perceptible `rgba(4,78,244,0.03)`)
- Same padding

**Content:**
- Eyebrow label: "Documentation" — `foreground.emphasis-small` (turquoise dark `#40E0D0` / deep fuchsia light `#AB0A42`)
- H1: "Build on SignalWire" — `foreground.headings` (fuchsia dark `#F72A72` / blue light `#044EF4`)
- Subtitle: "Voice, video, messaging, and AI — one programmable platform, every interface you need." — `foreground.secondary` (dark `#e8e8ec` / light `#3A3A38`)
- CTA button: "Get started" with right arrow — `roles.button-primary-bg` = `brand.fuchsia` (`#F72A72`), white text, `border-radius: 8px` (radius.md). Links to `/docs/platform/getting-started`

No secondary button. Single CTA.

### 2.3 "What are you building?" Section

Custom HTML. Sits directly below the hero.

**Visual treatment:**
- Top border: `2px solid #F72A72` (brand fuchsia) — visual divider from hero
- Background: `var(--grayscale-a2)` (subtle surface difference from page bg)
- Section label: "What are you building?" — styled as eyebrow (`foreground.emphasis-small`, uppercase, letter-spacing 0.14em, font-weight 600)

**4 pathway cards in a row** (grid: `repeat(4, 1fr)`, responsive to 2x2 on tablet, 1-column on mobile):

| Card | Icon | Badge bg | Badge color | Links to |
|------|------|----------|-------------|----------|
| AI voice agent | `fa-regular fa-robot` | `rgba(247,42,114,0.12)` | `#F72A72` (dark) / `#BE1758` (light) | `/docs/platform/getting-started#ai-application` |
| Browser or mobile | `fa-regular fa-browser` | `rgba(4,78,244,0.15)` | `#4d8aff` (dark) / `#0340C0` (light) | `/docs/platform/getting-started#browser-or-mobile-app` |
| Server application | `fa-regular fa-server` | `rgba(64,224,208,0.1)` | `#40E0D0` (dark) / `#0A6E64` (light) | `/docs/platform/getting-started#server-application` |
| No-code | `fa-regular fa-diagram-project` | `rgba(255,215,0,0.1)` | `#FFD700` (dark) / `#6B5600` (light) | `/docs/platform/getting-started#no-code--low-code` |

**Card styling:**
- Background: `var(--card-background)`
- Border: `1px solid var(--border-default)`
- Border radius: `12px` (radius.xl)
- Icon badge: 22x22px, `border-radius: 6px`, colored background with Font Awesome icon
- Card title: `foreground.emphasis-small` — turquoise dark `#40E0D0`, deep fuchsia light `#AB0A42`
- Card body: `foreground.secondary` — `#e8e8ec` dark, `#3A3A38` light

### 2.4 Interfaces & SDKs Section

Uses Fern `<CardGroup cols={3}>` and `<Card>` components with Font Awesome icons from `docs.yml` product config.

**Section header** (custom HTML wrapper):
- Label: "Interfaces & SDKs" — `foreground.emphasis-small` (eyebrow style)
- Description: "APIs, markup languages, and client libraries for building on SignalWire." — `foreground.secondary`
- Background: `var(--background)` (page bg, no surface shift)

**Cards** (Fern components — inherit theme styling automatically):

| Card | Icon | Description | href |
|------|------|-------------|------|
| REST APIs | `fa-regular fa-code` | Complete API reference for voice, video, messaging, and AI. | `/docs/apis` |
| SWML | `fa-regular fa-file-code` | Markup language that unifies LLMs, TTS, and STT with PSTN, SIP, and WebRTC. | `/docs/swml` |
| Agents SDK | `fa-regular fa-robot` | Create AI agents for voice, video, and text interactions. | `/docs/agents-sdk` |
| Server SDK | `fa-regular fa-bolt` | Server-side SDK for managing real-time voice, video, messaging, and chat. | `/docs/server-sdk/v4/node` |
| Browser SDK | `fa-regular fa-browser` | Add video calling, audio calling, and chat directly to your website. | `/docs/browser-sdk` |

### 2.5 Tools Section

Uses Fern `<CardGroup cols={4}>` and `<Card>` components.

**Section header:**
- Label: "Tools" — `foreground.emphasis-small` (eyebrow style)
- Background: `var(--grayscale-a2)` (subtle surface shift)
- Top border: `1px solid var(--border-default)`

**Cards:**

| Card | Icon | Description | href |
|------|------|-------------|------|
| Call Flow Builder | `fa-regular fa-diagram-project` | Build drag-and-drop calling applications without writing code. | `/docs/call-flow-builder` |
| Platform | `fa-regular fa-gear` | Manage your SignalWire space, phone numbers, and resources. | `/docs/platform` |
| Wirestarter | `fa-regular fa-plug` | Scaffold a new SignalWire project in seconds. | `/docs/platform/wirestarter` |
| SWSH | `fa-regular fa-terminal` | Interactive shell for testing SWML scripts and API calls. | `/docs/platform/swsh` |

### 2.6 Twilio Migration Footer

Custom HTML. Quiet text-only strip for a specific audience.

- Top border: `1px solid var(--border-default)`
- Layout: flexbox, space-between
- Left side: "Migrating from Twilio*?" in `foreground.muted` (`#a0a0aa` dark / `#737371` light) + "See Compatibility API" link in `foreground.emphasis-small` (`#40E0D0` dark / `#AB0A42` light)
- Right side: trademark disclaimer in `foreground.subtle` (`#73737e` dark / `#A8A8A6` light), italic, small text

---

## Token-to-Color Reference

Complete mapping of every color used in the design to its source token.

### Dark Mode

| Element | Role | Token path | Hex value |
|---------|------|-----------|-----------|
| Hero eyebrow | eyebrow-label | `dark.foreground.emphasis-small` | `#40E0D0` |
| Hero H1 | heading-h1 | `dark.foreground.headings` | `#F72A72` |
| Hero subtitle | body-text | `dark.foreground.secondary` | `#e8e8ec` |
| CTA button bg | button-primary-bg | `shared.brand.fuchsia` | `#F72A72` |
| CTA button text | button-primary-text | (always white) | `#ffffff` |
| Section labels | eyebrow-label | `dark.foreground.emphasis-small` | `#40E0D0` |
| Pathway card titles | card-title | `dark.foreground.emphasis-small` | `#40E0D0` |
| Pathway card body | card-body | `dark.foreground.secondary` | `#e8e8ec` |
| Card background | — | `dark.background.subtle` | `rgba(255,255,255,0.03)` |
| Card border | — | `dark.border.default` | `rgba(255,255,255,0.07)` |
| Section dividers | section-divider | `dark.border.default` | `rgba(255,255,255,0.07)` |
| Footer text | footer-text | `dark.foreground.muted` | `#a0a0aa` |
| Footer link | link-default | `dark.foreground.emphasis-small` | `#40E0D0` |
| Trademark text | — | `dark.foreground.subtle` | `#73737e` |
| Hero gradient | — | `dark.background.gradient` (adapted) | `linear-gradient(165deg, #060a18, #0e1028, #0c2060, #0a1628)` |
| Page background | — | Fern `var(--background)` | `#0a1628` |

### Light Mode

| Element | Role | Token path | Hex value |
|---------|------|-----------|-----------|
| Hero eyebrow | eyebrow-label | `light.foreground.emphasis-small` | `#AB0A42` |
| Hero H1 | heading-h1 | `light.foreground.headings` | `#044EF4` |
| Hero subtitle | body-text | `light.foreground.secondary` | `#3A3A38` |
| CTA button bg | button-primary-bg | `shared.brand.fuchsia` | `#F72A72` |
| CTA button text | button-primary-text | (always white) | `#ffffff` |
| Section labels | eyebrow-label | `light.foreground.emphasis-small` | `#AB0A42` |
| Pathway card titles | card-title | `light.foreground.emphasis-small` | `#AB0A42` |
| Pathway card body | card-body | `light.foreground.secondary` | `#3A3A38` |
| Card background | — | `light.background.surface` | `#F6F6F4` |
| Card border | — | `light.border.default` | `rgba(0,0,0,0.1)` |
| Section dividers | section-divider | `light.border.default` | `rgba(0,0,0,0.1)` |
| Surface sections bg | — | `light.background.surface` | `#F6F6F4` |
| Footer text | footer-text | `light.foreground.muted` | `#737371` |
| Footer link | link-default | `light.foreground.emphasis-small` | `#AB0A42` |
| Trademark text | — | `light.foreground.subtle` | `#A8A8A6` |
| Hero background | — | `var(--background)` | `#ffffff` |
| Page background | — | Fern `var(--background)` | `#ffffff` |

### Icon Badge Colors (Pathway Cards)

| Card | Badge bg (both modes) | Badge icon color (dark) | Badge icon color (light) |
|------|----------------------|------------------------|-------------------------|
| AI voice agent | `rgba(247,42,114,0.12)` | `#F72A72` | `#BE1758` |
| Browser or mobile | `rgba(4,78,244,0.15)` | `#4d8aff` | `#0340C0` |
| Server application | `rgba(64,224,208,0.1)` | `#40E0D0` | `#0A6E64` |
| No-code | `rgba(255,215,0,0.1)` | `#FFD700` | `#6B5600` |

Light mode badge icon colors use WCAG-safe darkened variants from `light.badge.text-*` tokens.

---

## Responsive Behavior

Per brand guidelines, mobile-first with `min-width` breakpoints:

| Breakpoint | Pathway grid | SDK grid | Tools grid |
|-----------|-------------|---------|-----------|
| Base (0+) | 1 column | 1 column | 1 column |
| md (768px) | 2x2 | 2 columns | 2x2 |
| lg (1024px) | 4 columns | 3 columns | 4 columns |

Touch targets: minimum 48px (spacing.12) on mobile.
Hero padding: `5rem` desktop, `2.5rem` mobile.

---

## Files Modified

| File | Change |
|------|--------|
| `fern/docs.yml` | Update `typography` section (headingsFont, bodyFont, codeFont) |
| `fern/assets/fonts/` | Add Instrument Sans, Outfit, JetBrains Mono woff2 files |
| `fern/styles.css` | Add/update landing page CSS, `.fern-page-heading` color overrides, hero gradient, pathway card styles |
| `fern/products/home/pages/welcome.mdx` | Complete rewrite of homepage content and layout |

---

## What This Does NOT Change

- Navigation structure (`docs.yml` products, sidebar configs)
- Any page other than the homepage (content-wise)
- OpenAPI specs or API reference pages
- Fern component behavior (only visual overrides via CSS variables)
- The existing dashed-pattern and community-strip CSS (replaced by new homepage styles)
