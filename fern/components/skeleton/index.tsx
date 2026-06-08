import type { CSSProperties } from "react";

// Reusable loading-skeleton primitive for custom MDX components that fetch data at runtime.
// Compose a few of these to mimic the shape of the content that's loading. Pairs with this folder's
// styles.css (loaded via docs.yml `css:` — Fern's component bundler doesn't process CSS imports).
// Theme-aware (light/dark) through Fern's grayscale vars.
//
//   import { Skeleton, SkeletonText } from "@/components/index";
//   if (!data) return <Skeleton width="60%" height={20} />;

export interface SkeletonProps {
  /** CSS width — number (px) or any CSS length (e.g. "60%"). */
  width?: string | number;
  /** CSS height — number (px) or any CSS length. Default: 14. */
  height?: string | number;
  /** Border radius override — number (px) or any CSS length (e.g. "50%" for a circle). */
  radius?: string | number;
  className?: string;
  style?: CSSProperties;
}

export function Skeleton({ width, height = 14, radius, className, style }: SkeletonProps) {
  return (
    <div
      className={`sw-skeleton${className ? ` ${className}` : ""}`}
      aria-hidden="true"
      style={{ width, height, ...(radius != null ? { borderRadius: radius } : null), ...style }}
    />
  );
}

export interface SkeletonTextProps {
  /** Number of lines. Default: 3. */
  lines?: number;
  /** Gap between lines in px. Default: 8. */
  gap?: number;
  /** Per-line widths; defaults to full width with a shorter last line. */
  widths?: (string | number)[];
}

/** A stack of text-line skeletons — for paragraph/description placeholders. */
export function SkeletonText({ lines = 3, gap = 8, widths }: SkeletonTextProps) {
  return (
    <div style={{ display: "flex", flexDirection: "column", gap }} aria-hidden="true">
      {Array.from({ length: lines }).map((_, i) => (
        <Skeleton key={i} height={12} width={widths?.[i] ?? (i === lines - 1 ? "60%" : "100%")} />
      ))}
    </div>
  );
}
