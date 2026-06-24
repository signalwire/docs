import { useEffect, useState } from "react";
import type { Catalog, Manifest, VoiceRow } from "./types";

// Shared engine for the Voice Widget (components/voice-widget) — the data layer + display-time
// helpers + small shared UI (the filter <Select>) that the widget reuses. Kept in its own module so
// the widget file holds only rendering. Pure data consumer: fetches catalog.json + manifest.json
// produced by the TTS pipeline and exposes the joined rows; the widget plays the pre-synthesized
// sample clips. Styles live in this folder's styles.css, loaded via docs.yml `css:` (Fern's
// component bundler does not process CSS imports).

// Where the hosted asset bundle lives. The bundle cannot live in fern/assets — Fern only serves
// assets it statically discovers in MDX/CSS and rewrites to content-hashed URLs, so a runtime
// fetch() has no resolvable path. It must be served from an external origin with CORS enabled.
//
// On the production CDN the JSON and the audio/ tree sit under different prefixes: catalog.json +
// manifest.json are served from /voice_widget/dist/, while the audio is served from the domain root
// (/audio/<engine>/<voice_id>.mp3). The manifest stores each clip's `audio` as a path relative to
// AUDIO_BASE (e.g. "audio/rime/zion.mp3"), so the two bases are independent — keep each in sync with
// the CDN layout. For local dev against `http-server temp/voice_widget/dist -p 8080 --cors`, set
// both to "http://localhost:8080".
export const ASSET_BASE = "https://mcdn.signalwire.com/voice_widget/dist"; // catalog.json + manifest.json
export const AUDIO_BASE = "https://mcdn.signalwire.com";                   // /audio/<engine>/<voice_id>.mp3

export const ALL = "__all__";
export const DEFAULT_PAGE_SIZE = 48;
export const MOBILE_PAGE_SIZE = 12;
const MOBILE_QUERY = "(max-width: 640px)";
export const PAGE_SIZE_OPTIONS = [4, 8, 12, 24, 48, 96];

// ── Display-time data cleanup ────────────────────────────────────────────────────────────────
// These three helpers normalize the raw catalog values for display only — the underlying data,
// the copy payload, and the tooltips keep the originals. They are an INTERIM UI fix: the canonical
// home for this cleanup is the generation pipeline (temp/voice_widget/providers/{elevenlabs,
// cartesia}.py via make_voice()), so re-running the pipeline and re-uploading the CDN bundle is a
// clean lift-and-shift that retires these. The model string is shown verbatim (no remapping).

// Clean display name: ElevenLabs/Cartesia bake a marketing sentence into the name
// ("Austin Knox V3 - Good ol' Texas boy…"); split on the first SPACE-BOUNDED dash (" -"/" –"/" —")
// and keep the leading segment. Verified against the full catalog: fires only on ElevenLabs (70) +
// Cartesia (535), 0 false positives — Google/Polly/Azure names use spaceless hyphens
// ("ar-XA-Chirp3-HD-Achernar", "Joanna-Neural") and are never touched. The full original stays in
// title=/the icon tooltip. Pipeline home: providers/{elevenlabs,cartesia}.py make_voice().
export function cleanName(displayName: string): string {
  const m = displayName.match(/\s[-–—]\s/);
  if (!m || m.index === undefined) return displayName;
  const lead = displayName.slice(0, m.index).trim();
  // Guard against degenerate leads (too short/long to be a real name) — fall back to the original.
  return lead.length >= 2 && lead.length <= 28 ? lead : displayName;
}

// Friendly language: turn a BCP-47 code ("af-ZA", "el") into an English name via Intl.DisplayNames
// (resolves ~99% of real codes); fall back to the raw code on any miss/throw.
export function friendlyLanguage(code: string): string {
  if (!code) return code;
  try {
    return new Intl.DisplayNames(["en"], { type: "language" }).of(code) || code;
  } catch {
    return code;
  }
}

// Normalize gender: the catalog mixes "feminine"/"masculine" with "male"/"female"; map to the
// display forms and HIDE "unknown" (599 voices) rather than render "Unknown". Returns "" to hide.
export function normalizeGender(gender: string): string {
  switch (gender) {
    case "feminine": case "female": return "Female";
    case "masculine": case "male": return "Male";
    case "neutral": return "Neutral";
    case "non-binary": return "Non-binary";
    case "unknown": case "": return "";
    default: return gender.charAt(0).toUpperCase() + gender.slice(1);
  }
}

// ── TEMPORARY: hide voices whose CDN audio was renamed but whose manifest is stale ─────────────
// Six sample files were renamed on the CDN to strip non-ASCII chars from the path (e.g.
// inworld/_tienne.mp3 → inworld/Etienne.mp3), but the published manifest.json still points at the
// OLD filenames, so these clips 404. Hide them until the regenerated manifest is merged onto the
// CDN — then DELETE this block AND its filter() call in loadBundle. Keyed by the catalog `key`
// (the same value manifest clips are keyed by). Remove the whole thing once the CDN is updated.
const TEMP_HIDDEN_VOICE_KEYS = new Set<string>([
  "inworld/Étienne",
  "inworld/Maitê",
  "inworld/Hélène",
  "azure/hu-HU-Réka:MAI-Voice-2",
  "minimax/Cantonese_ProfessionalHost（F)",
  "minimax/Cantonese_ProfessionalHost（M)",
]);

export function isTemporarilyHiddenVoice(key: string): boolean {
  return TEMP_HIDDEN_VOICE_KEYS.has(key);
}

export type FilterKey = "search" | "provider" | "language" | "gender" | "group" | "pageSize";

// Client-side row: a catalog voice joined with its clip, plus two precomputed fields — `_search`,
// a lowercased blob so the per-keystroke filter runs one substring test per row instead of
// re-lowercasing 4–5 fields, and `_uid`, a collision-free identity for React keys and play state
// (assigned in loadBundle; the catalog's key+model is not unique on its own).
export type Row = VoiceRow & { _search: string; _uid: string };

// The asset bundle (catalog.json + manifest.json) is one large artifact (~5 MB, ~4.9k voices)
// shared by every TTS page that embeds the widget. Cache the parsed+joined rows per URL pair so
// navigating across the index and the provider pages fetches and parses it once per session, not
// once per mount. Each embed then narrows this shared set down to the voices it shows (see baseRows).
export const bundleCache = new Map<string, Promise<Row[]>>();

export function loadBundle(catalogUrl: string, manifestUrl: string): Promise<Row[]> {
  const cacheKey = `${catalogUrl}\n${manifestUrl}`;
  let cached = bundleCache.get(cacheKey);
  if (!cached) {
    cached = Promise.all([
      // Check r.ok before parsing: a 404/500 from the CDN is an HTML page, and r.json() on it
      // surfaces as `SyntaxError: Unexpected token '<'` in the error UI instead of the real cause.
      fetch(catalogUrl).then((r) => {
        if (!r.ok) throw new Error(`HTTP ${r.status} fetching catalog.json`);
        return r.json() as Promise<Catalog>;
      }),
      fetch(manifestUrl).then((r) => r.json() as Promise<Manifest>).catch(() => ({ clips: {} } as Manifest)),
    ]).then(([cat, man]) => {
      // Row identity: key+model is *almost* unique, but the production catalog repeats it for a
      // handful of rows (rime voices listed once per language, plus two literal duplicate rows),
      // so suffix a counter on collision. Assigned once here so it's stable for the session:
      // using `_uid` as the React key lets a row survive filter/page changes (the memoized row
      // skips re-rendering), and play state highlights exactly one row even for collisions.
      const seen = new Map<string, number>();
      // TEMP: drop the renamed-audio voices (see isTemporarilyHiddenVoice). Remove this filter()
      // once the regenerated manifest is on the CDN.
      return cat.voices.filter((v) => !isTemporarilyHiddenVoice(v.key)).map((v) => {
        const base = modelKeyOf(v);
        const n = seen.get(base) ?? 0;
        seen.set(base, n + 1);
        return {
          ...v,
          clip: man.clips?.[v.key],
          _uid: n ? `${base}#${n}` : base,
          // Mirrors the fields the search filter tests against (name, provider, description, tags).
          _search: `${v.display_name} ${v.provider} ${v.description} ${v.tags.join(" ")}`.toLowerCase(),
        };
      });
    });
    // Never cache a rejected fetch — evict so a later mount can retry instead of replaying the error.
    cached.catch(() => bundleCache.delete(cacheKey));
    bundleCache.set(cacheKey, cached);
  }
  return cached;
}

// Tracks whether the viewport is in the mobile breakpoint (matches the CSS media query below).
export function useIsMobile() {
  const [mobile, setMobile] = useState(false);
  useEffect(() => {
    if (typeof window === "undefined" || !window.matchMedia) return;
    const mq = window.matchMedia(MOBILE_QUERY);
    const update = () => setMobile(mq.matches);
    update();
    mq.addEventListener("change", update);
    return () => mq.removeEventListener("change", update);
  }, []);
  return mobile;
}

export interface VoiceWidgetProps {
  /** Base URL of the hosted bundle (serves catalog.json, manifest.json, audio/). Default: ASSET_BASE. */
  assetBaseUrl?: string;
  /** Override the catalog.json URL. Default: `${assetBaseUrl}/catalog.json`. */
  catalogUrl?: string;
  /** Override the manifest.json URL. Default: `${assetBaseUrl}/manifest.json`. */
  manifestUrl?: string;
  /** Override the base the clip `audio` paths resolve against. Default: AUDIO_BASE. */
  audioBaseUrl?: string;
  /** Initial grouping. "none" renders a flat list with no section headers or group toggle. Default: "provider". */
  groupBy?: "provider" | "language" | "none";
  /** Voices rendered per page (page-size limit). Default: 48. Keeps the DOM small and the catalog fast. */
  pageSize?: number;
  /**
   * Lock the widget to a single provider. Matches the provider label or engine id,
   * case-insensitive (e.g. "ElevenLabs" or "elevenlabs"). When set, only that provider's voices
   * are shown and the provider filter is hidden — for embedding on a provider-specific page.
   */
  provider?: string;
  /**
   * Show only these specific voices (an allowlist). Each entry matches a voice's `voice_id`, its
   * `<engine>/<voice_id>` key, its `<engine>/<voice_id>:<model>` key (to disambiguate a voice that
   * exists under multiple models), or its display name — case-insensitive. When unset, all voices
   * show. Use to curate a small demo set, e.g. one representative voice per provider.
   */
  voiceIds?: string[];
  /**
   * Toggle the filter/search controls. `true` or unset shows all; `false` hides all (just the
   * title + list). An object toggles individual controls — `search`, `provider`, `language`,
   * `gender`, `group`, `pageSize` — each defaulting on unless set `false`. The search control
   * defaults to `false` (hidden) unless explicitly set to `true`. The provider control is
   * always hidden when the `provider` lock prop is set.
   */
  filters?: boolean | Partial<Record<FilterKey, boolean>>;
}

export function Select({ label, value, onChange, opts }:
  { label: string; value: string; onChange: (v: string) => void; opts: string[] }) {
  return (
    <label className="vw-select">
      <span>{label}</span>
      <select value={value} onChange={(e) => onChange(e.target.value)}>
        <option value={ALL}>all</option>
        {opts.map((o) => <option key={o} value={o}>{o}</option>)}
      </select>
    </label>
  );
}

export function uniq(xs?: string[]): string[] {
  return [...new Set((xs ?? []).filter(Boolean))].sort();
}

// Windowed page list for the numbered pager: first page, last page, and current ±1, with `null`
// marking each collapsed gap (rendered as an ellipsis). A gap of exactly one page emits that page
// number instead — an ellipsis standing in for a single page reads worse than just showing it.
// Pages are 0-based here, 1-based in the UI.
export function pageNumbers(current: number, count: number): (number | null)[] {
  const wanted = [...new Set([0, count - 1, current - 1, current, current + 1])]
    .filter((p) => p >= 0 && p < count)
    .sort((a, b) => a - b);
  const out: (number | null)[] = [];
  for (let i = 0; i < wanted.length; i++) {
    if (i && wanted[i] - wanted[i - 1] > 1) {
      if (wanted[i] - wanted[i - 1] === 2) out.push(wanted[i] - 1);
      else out.push(null);
    }
    out.push(wanted[i]);
  }
  return out;
}

// Model-qualified catalog key (<engine>/<voice_id>[:<model>]) — the documented matching form for
// the voiceIds allowlist. NOT unique in the wild: a few rime voices repeat key+model (once per
// language, plus literal duplicate rows), so row identity uses Row._uid — this plus a collision
// counter, assigned in loadBundle.
export function modelKeyOf(v: { key: string; model: string | null }): string {
  return v.model ? `${v.key}:${v.model}` : v.key;
}

// Compose the SWML voice identifier string for a row: `engine.voice_id[:model]`. This is the form
// SWML expects today — the old split `{ engine, voice }` shape is deprecated (mod_openai reads the
// top-level `engine` property only in developer mode; otherwise the engine comes from this string's
// prefix). Grammar: the first `.` splits engine from voice id, an optional `:model` follows. Verified
// per-engine against the TTS reference pages (fern/products/platform/pages/calling/voice/TTS/*.mdx):
//   • azure / gcloud / deepgram bake the model into the voice id, so NEVER append `:model`
//     (deepgram's model field just mirrors the voice id — a suffix would duplicate it).
//   • cartesia / elevenlabs / openai / inworld / minimax / rime take an optional `:model` suffix; we
//     emit the exact model that synthesized the sample so the copied config reproduces that voice.
//   • polly: `amazon` is the canonical (non-deprecated) prefix and the model rides as a colon segment
//     (`amazon.Joanna:neural`), so the engine is remapped polly → amazon.
// Uses voice_id (the value the engine resolves), NOT display_name (a UI label).
const VOICE_ID_ENCODES_MODEL = new Set(["azure", "gcloud", "deepgram"]);

export function swmlVoiceString(r: { engine: string; voice_id: string; model: string | null }): string {
  const engine = r.engine === "polly" ? "amazon" : r.engine;
  const base = `${engine}.${r.voice_id}`;
  return r.model && !VOICE_ID_ENCODES_MODEL.has(r.engine) ? `${base}:${r.model}` : base;
}
