# Diagram Image Styling in Fern

## Usage
```jsx
<Frame caption="Title">
  <img class="diagram" src="/assets/images/path/diagram.webp" alt="Alt" />
</Frame>
```

## How It Works
- **Unzoomed light**: white background
- **Unzoomed dark**: transparent background + `invert(1) hue-rotate(180deg)`
- **Zoomed light**: white background on img
- **Zoomed dark**: `#0c1624` background on modal container + transparent img + inversion

## Key Constraints
- **rmiz strips classes** when cloning images, so zoomed diagrams use `img[src*="diagram"]` path selector
- **CSS filters apply to backgrounds too** - can't put bg on same element as filter without it being inverted
- **No wrapper element** between `[data-rmiz-modal-content]` and img, so dark bg must go on full-screen container
- **Diagram images must have "diagram" in filename** for zoom styling to work
