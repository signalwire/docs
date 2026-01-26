# Diagram Image Styling in Fern

## Usage
```jsx
<Frame caption="Title">
  <img class="diagram" src="/assets/images/path/diagram.webp" alt="Alt" />
</Frame>
```

## How It Works
- **Unzoomed**: `img.diagram` selector applies white background (light) or inversion (dark)
- **Zoomed**: rmiz strips classes, so uses `img[src*="diagram"]` path-based selector for inversion
- **Modal background**: Applies to all zoomed images (solid white/dark)

## Key Gotchas
- rmiz strips classes when cloning images to modal
- CSS variables like `var(--background)` don't work in modal (portal context)
- Diagram images must have "diagram" in filename for zoom inversion to work
