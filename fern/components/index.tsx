// Barrel for docs MDX components. Each component lives in its own subdirectory as an index.tsx
// for organization. MDX pages import this barrel as a file path —
// `import { VoiceWidget } from "@/components/index"` — because Fern's resolver only resolves file
// paths, not directories (and not directory→index). For the same reason the re-exports below use
// explicit `/index` file paths rather than bare directory paths. `export *` pulls in each
// component's public surface (components + types) without enumerating them.
export * from "./voice-widget/index";
export * from "./voice-widget-rows/index";
export * from "./skeleton/index";
