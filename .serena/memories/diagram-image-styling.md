# Diagram Image Styling in Fern

## Problem
Diagram images needed solid backgrounds for light/dark modes, including when zoomed. The default zoom had a semitransparent background.

## Solution

### Frame Component
Use `className` (not `class`) on Frame components:
```jsx
<Frame caption="Title" className="diagram">
  ![Alt](/assets/images/path/to/image.webp)
</Frame>
```

### CSS (in `fern/styles.css`)

**Non-zoomed state:**
```css
.diagram {
  background-color: #ffffff;
}
.dark .diagram {
  background-color: #0a1628;
}
```

**Zoomed state** - Fern uses react-medium-image-zoom (rmiz):
```css
[data-rmiz-modal-content] {
  background-color: #ffffff !important;
}
.dark [data-rmiz-modal-content] {
  background-color: #0a1628 !important;
}

/* Invert specific images in dark mode when zoomed */
.dark [data-rmiz-modal] img[src*="agents-sdk-manual"] {
  filter: invert(1) hue-rotate(180deg);
}
```

## What Didn't Work
- `var(--background)` CSS variable (not exposed by Fern)
- `class` attribute on Frame (use `className`)
- medium-zoom selectors (Fern uses rmiz, not medium-zoom)
- Background on `.diagram img` (doesn't persist to zoom clone)
