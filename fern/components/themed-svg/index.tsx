import { useEffect, useState } from "react";

// Inlines an .svg asset into the page DOM so the page's CSS custom properties reach it — the
// reusable way to ship ONE theme-aware SVG instead of a .light-only / .dark-only pair.
//
// Why it's needed: a browser loads `img src="x.svg"` as a separate document, and CSS variables do
// not cross document boundaries, so var(--accent) inside that file resolves to its own fallback and
// never follows the theme toggle. Same markup inlined into the page inherits --accent,
// --grayscale-*, --background (Fern generates them from docs.yml `colors`) and our brand-tokens.css
// tokens, so one file covers both modes.
//
// Authoring an SVG for this:
//   - put the colors in an internal `style` element, reading Fern variables with a brand-hex
//     fallback: `fill: var(--accent, #044EF4)` — the fallback is what standalone/img renders show;
//   - var() is invalid in SVG presentation attributes, so use classes, not fill="var(…)";
//   - prefix every class, id and keyframe name per file (the stylesheet applies page-wide once
//     inlined, and ids become page ids);
//   - use `.dark .your-prefix-root { … }` for anything the variables can't express, since the
//     inlined SVG sits under Fern's `.dark` on the html element.
//
// Usage:
//   import { ThemedSvg } from "@/components/index";
//   <ThemedSvg src="/assets/images/img/ai-agent-flow-themed.svg" alt="How a call flows: …" />

/** In-flight and completed fetches, so repeated instances of the same asset fetch once. */
const cache = new Map<string, Promise<string>>();

function load(src: string): Promise<string> {
  const cached = cache.get(src);
  if (cached) return cached;
  const pending = fetch(src).then((res) => {
    if (!res.ok) throw new Error(`ThemedSvg: ${res.status} fetching ${src}`);
    return res.text();
  });
  cache.set(src, pending);
  return pending;
}

export interface ThemedSvgProps {
  /** Site-root-relative path to the SVG asset, e.g. "/assets/images/img/diagram.svg". */
  src: string;
  /** Description of the graphic, applied as the wrapper's accessible label. */
  alt: string;
  /** Extra class names on the wrapper. */
  className?: string;
}

export function ThemedSvg({ src, alt, className }: ThemedSvgProps) {
  const [markup, setMarkup] = useState<string | null>(null);
  const [failed, setFailed] = useState(false);

  useEffect(() => {
    let active = true;
    setMarkup(null);
    setFailed(false);
    load(src).then(
      (text) => {
        if (active) setMarkup(text);
      },
      () => {
        if (active) setFailed(true);
      }
    );
    return () => {
      active = false;
    };
  }, [src]);

  // Server render and the moment before the fetch resolves use the plain image to reserve the right
  // amount of space, kept invisible so dark mode never flashes the light fallback colors. If the
  // fetch fails, show that image instead of nothing.
  if (markup == null) {
    return (
      <img
        src={src}
        alt={alt}
        className={className}
        style={failed ? undefined : { visibility: "hidden" }}
      />
    );
  }

  return (
    <span
      role="img"
      aria-label={alt}
      className={className}
      // The markup is a first-party asset from this repo, served from our own docs site.
      dangerouslySetInnerHTML={{ __html: markup }}
    />
  );
}
