import { memo, useCallback, useDeferredValue, useEffect, useMemo, useRef, useState } from "react";
import type { CSSProperties, ReactNode } from "react";
import type { Catalog, Manifest, VoiceRow } from "./types";
import { Skeleton } from "../skeleton/index";

// Ported from @signalwire/tts-voice-widget for embedding as a Fern MDX component.
// Pure data consumer: fetches catalog.json + manifest.json produced by the TTS pipeline and plays
// the pre-synthesized sample clips. Styles live in this folder's styles.css, loaded via docs.yml
// `css:` (Fern's component bundler does not process CSS imports).

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
const ASSET_BASE = "https://mcdn.signalwire.com/voice_widget/dist"; // catalog.json + manifest.json
const AUDIO_BASE = "https://mcdn.signalwire.com";                   // /audio/<engine>/<voice_id>.mp3

// Exported (with the helpers/sub-components/types below) so the sibling rows preview
// (components/voice-widget-rows) reuses this module's data layer and display logic verbatim instead
// of forking it — keeping the two previews' behavior identical. See that file's header.
export const ALL = "__all__";
export const DEFAULT_PAGE_SIZE = 48;
export const MOBILE_PAGE_SIZE = 12;
const MOBILE_QUERY = "(max-width: 640px)";
// Multiples of the max column count (4) so every page fills complete rows; 4 = a single row.
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

type FilterKey = "search" | "provider" | "language" | "gender" | "group" | "pageSize";

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
      // using `_uid` as the React key lets a card survive filter/page changes (the memoized Card
      // skips re-rendering), and play state highlights exactly one card even for collisions.
      const seen = new Map<string, number>();
      return cat.voices.map((v) => {
        const base = modelKeyOf(v);
        const n = seen.get(base) ?? 0;
        seen.set(base, n + 1);
        return {
          ...v,
          clip: man.clips?.[v.key],
          _uid: n ? `${base}#${n}` : base,
          // Mirrors the fields the search filter below tests against (name, provider, description, tags).
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
  /** Initial grouping. "none" renders a flat grid with no section headers or group toggle. Default: "provider". */
  groupBy?: "provider" | "language" | "none";
  /** Cards rendered per page (page-size limit). Default: 48. Keeps the DOM small and the catalog fast. */
  pageSize?: number;
  /**
   * Fixed number of grid columns. Default: 0 (a responsive equal-width auto-fill grid — 2-up in the
   * docs prose column, 3-up only when the container is genuinely wide, every card a fixed ≥320px so
   * none is squished). Pass a positive N to force exactly N equal columns. Collapses to 1 column on
   * phones regardless.
   */
  columns?: number;
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
   * title + grid). An object toggles individual controls — `search`, `provider`, `language`,
   * `gender`, `group`, `pageSize` — each defaulting on unless set `false`. The search control
   * defaults to `false` (hidden) unless explicitly set to `true`. The provider control is
   * always hidden when the `provider` lock prop is set.
   */
  filters?: boolean | Partial<Record<FilterKey, boolean>>;
}

export function VoiceWidget({
  assetBaseUrl = ASSET_BASE,
  catalogUrl = `${assetBaseUrl}/catalog.json`,
  manifestUrl = `${assetBaseUrl}/manifest.json`,
  audioBaseUrl = AUDIO_BASE,
  groupBy: initialGroup = "provider",
  pageSize = DEFAULT_PAGE_SIZE,
  columns = 0,
  provider: lockedProvider,
  voiceIds,
  filters,
}: VoiceWidgetProps) {
  // Normalized single-provider lock (null when the widget shows all providers).
  const lock = lockedProvider?.trim().toLowerCase() || null;
  // Normalized voice-id allowlist (null when showing all voices). Sorted+joined into a stable key
  // so the memoized Set below — and the filter that depends on it — don't churn each render.
  const voiceIdsKey = voiceIds && voiceIds.length
    ? voiceIds.map((s) => s.trim().toLowerCase()).filter(Boolean).sort().join("|")
    : "";
  const idAllowlist = useMemo(
    () => (voiceIdsKey ? new Set(voiceIdsKey.split("|")) : null),
    [voiceIdsKey]
  );
  // Fixed column count overrides the responsive auto-fill grid when provided. Set as CSS custom
  // properties (consumed by .vw-grid in the stylesheet) rather than grid-template-columns directly,
  // so the mobile media query can still collapse the grid to one column regardless of this prop.
  const gridStyle = (columns && columns > 0
    ? { "--vw-cols": Math.floor(columns), "--vw-col-min": "0px" }
    : undefined) as CSSProperties | undefined;
  const [allRows, setAllRows] = useState<Row[] | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [q, setQ] = useState("");
  const [provider, setProvider] = useState(ALL);
  const [language, setLanguage] = useState(ALL);
  const [gender, setGender] = useState(ALL);
  const [group, setGroup] = useState<"provider" | "language" | "none">(initialGroup);
  const [page, setPage] = useState(0);
  const [pageSizeChoice, setPageSizeChoice] = useState(pageSize);
  const audioRef = useRef<HTMLAudioElement | null>(null);
  const [playingKey, setPlayingKey] = useState<string | null>(null);

  // Defer the search term so typing stays responsive while the (cheap) filter recomputes.
  const deferredQ = useDeferredValue(q);

  // On small screens the grid collapses to one column (CSS), so cap the page size too — a 60-card
  // single column is an excessive scroll on a phone.
  const isMobile = useIsMobile();
  const effectivePageSize = isMobile ? Math.min(pageSizeChoice, MOBILE_PAGE_SIZE) : pageSizeChoice;
  const pageSizeOpts = [...new Set([...PAGE_SIZE_OPTIONS, pageSize])].sort((a, b) => a - b)
    .filter((n) => !columns || columns <= 0 || n % columns === 0);

  // Resolve which filter/search controls are visible. `filters` is a boolean (all on/off) or a
  // per-control object; each control defaults on unless explicitly false. The `search` control
  // defaults to off (must be opted in) — all others default on.
  const showFilter = (key: FilterKey) =>
    filters === false ? false
    : filters && typeof filters === "object"
      ? key === "search" ? filters[key] === true : filters[key] !== false
    : key === "search" ? false : true;
  const showProvider = !lock && showFilter("provider");
  const showGroup = group !== "none" && showFilter("group") && !lock;

  useEffect(() => {
    let alive = true;
    loadBundle(catalogUrl, manifestUrl)
      .then((loaded) => { if (alive) setAllRows(loaded); })
      .catch((e) => { if (alive) setError(String(e)); });
    return () => { alive = false; };
  }, [catalogUrl, manifestUrl]);

  // Static narrowing: the allowlist (voiceIds) and provider lock can't change at runtime, so apply
  // them once here instead of re-checking the full catalog inside the per-keystroke filter below.
  // Everything downstream — dropdown options, search, grouping, pagination — then works over only
  // the voices this embed can ever show (12 on the index, one provider's voices on a provider page).
  // Also drops no-preview voices (missing/errored clip) here so every visible card is auditionable —
  // no dimmed "no sample" cards. Defensive: the current bundle has 0 such voices (the catalog/
  // manifest delta is duplicate-key Rime rows sharing a clip). Caveat: if a provider's synthesis
  // ever fails wholesale its voices silently drop from the widget — the pipeline's --diff flag
  // catches that, and it beats showing broken cards.
  const baseRows = useMemo(() => {
    if (!allRows) return null;
    return allRows.filter((r) =>
      r.clip?.status === "ok" &&
      (!idAllowlist ||
        idAllowlist.has(r.voice_id.toLowerCase()) ||
        idAllowlist.has(r.key.toLowerCase()) ||
        idAllowlist.has(modelKeyOf(r).toLowerCase()) ||
        idAllowlist.has(r.display_name.toLowerCase())) &&
      (!lock || r.provider.toLowerCase() === lock || r.engine.toLowerCase() === lock));
  }, [allRows, idAllowlist, lock]);

  // Dropdown options derive from the narrowed set, so a provider-locked page lists only that
  // provider's languages, not all ~180 in the catalog.
  const providers = useMemo(() => uniq(baseRows?.map((r) => r.provider)), [baseRows]);
  const languages = useMemo(() => uniq(baseRows?.flatMap((r) => r.languages)), [baseRows]);

  const filtered = useMemo(() => {
    if (!baseRows) return [];
    const needle = deferredQ.trim().toLowerCase();
    return baseRows.filter((r) =>
      (provider === ALL || r.provider === provider) &&
      (language === ALL || r.languages.includes(language)) &&
      (gender === ALL || r.gender === gender) &&
      (!needle || r._search.includes(needle)));
  }, [baseRows, deferredQ, provider, language, gender]);

  // Flatten into grouped order once, and remember each group's full size for the section headers.
  // group === "none" keeps the filtered order as-is, with no sections.
  const { ordered, groupTotals } = useMemo(() => {
    if (group === "none") return { ordered: filtered, groupTotals: new Map<string, number>() };
    const m = new Map<string, Row[]>();
    for (const r of filtered) {
      const k = group === "provider" ? r.provider : r.primary_language;
      (m.get(k) ?? m.set(k, []).get(k)!).push(r);
    }
    const entries = [...m.entries()].sort((a, b) => a[0].localeCompare(b[0]));
    const ordered: Row[] = [];
    const groupTotals = new Map<string, number>();
    for (const [name, items] of entries) {
      groupTotals.set(name, items.length);
      for (const it of items) ordered.push(it);
    }
    return { ordered, groupTotals };
  }, [filtered, group]);

  // Reset to the first page whenever the result set changes — done during render (not in an
  // effect) so there's no one-frame flash of the old page number. Canonical "adjust state on
  // change" pattern: the setState below re-renders synchronously before commit.
  const filterSig = `${voiceIdsKey}|${lock}|${deferredQ}|${provider}|${language}|${gender}|${group}|${pageSizeChoice}`;
  const [lastSig, setLastSig] = useState(filterSig);
  if (filterSig !== lastSig) {
    setLastSig(filterSig);
    if (page !== 0) setPage(0);
  }

  // Pagination math. Clamp the page so it stays valid even mid-transition.
  const pageCount = Math.max(1, Math.ceil(ordered.length / effectivePageSize));
  const safePage = Math.min(page, pageCount - 1);
  const start = safePage * effectivePageSize;
  const end = Math.min(start + effectivePageSize, ordered.length);

  // Split the current page's slice into contiguous group sections (reuses the section/grid DOM).
  // group === "none" → a single unlabeled section (flat grid).
  const pageSections = useMemo(() => {
    const slice = ordered.slice(start, end);
    if (group === "none") return slice.length ? [{ name: "", items: slice }] : [];
    const secs: { name: string; items: Row[] }[] = [];
    for (const r of slice) {
      const k = group === "provider" ? r.provider : r.primary_language;
      const last = secs[secs.length - 1];
      if (last && last.name === k) last.items.push(r);
      else secs.push({ name: k, items: [r] });
    }
    return secs;
  }, [ordered, start, end, group]);

  // Keep the latest playing key in a ref so play() can stay referentially stable (memoized cards).
  const playingKeyRef = useRef<string | null>(null);
  useEffect(() => { playingKeyRef.current = playingKey; }, [playingKey]);

  const play = useCallback((r: Row) => {
    if (!r.clip || r.clip.status !== "ok") return;
    const a = audioRef.current!;
    if (playingKeyRef.current === r._uid && !a.paused) {
      a.pause();
      playingKeyRef.current = null;
      setPlayingKey(null);
      return;
    }
    a.src = audioBaseUrl ? `${audioBaseUrl.replace(/\/$/, "")}/${r.clip.audio}` : r.clip.audio;
    // Mark playing immediately (and synchronously in the ref), not when play() resolves: with
    // preload="none" the clip has to download first, and during that window a second click must
    // read this card as already playing so it pauses — otherwise it falls through to `a.src = url`,
    // which re-runs the load algorithm and restarts the download instead of stopping it. The eager
    // icon flip also gives the click immediate feedback while the clip loads.
    playingKeyRef.current = r._uid;
    setPlayingKey(r._uid);
    a.play().catch(() => {
      // Rejected (autoplay policy) or aborted by a newer click — only unwind if still current.
      if (playingKeyRef.current !== r._uid) return;
      playingKeyRef.current = null;
      setPlayingKey(null);
    });
  }, [audioBaseUrl]);

  const copyConfig = useCallback(async (r: VoiceRow) => {
    const cfg: Record<string, unknown> = { engine: r.engine, voice: r.display_name };
    if (r.model) cfg.params = { model: r.model };
    try {
      await navigator.clipboard.writeText(JSON.stringify(cfg));
      return true;
    } catch {
      return false;
    }
  }, []);

  if (error) return <div className="vw vw-error">Failed to load voices: {error}</div>;
  if (!baseRows) return <VoiceWidgetSkeleton gridStyle={gridStyle} pills={[showProvider, showFilter("language"), showFilter("gender")].filter(Boolean).length} />;

  // Step from safePage, not the raw page state: `page` can be stale-high after effectivePageSize
  // grows (a mobile→desktop resize isn't in filterSig), and stepping from it makes Prev appear
  // dead until the raw value catches back up with the clamped one.
  const pager = pageCount > 1 ? (
    <nav className="vw-pager" aria-label="Voice pages">
      <button className="vw-page vw-page-nav" onClick={() => setPage(Math.max(0, safePage - 1))} disabled={safePage <= 0}>
        ‹ Prev
      </button>
      {pageNumbers(safePage, pageCount).map((p, i) =>
        p === null ? (
          <span key={`gap-${i}`} className="vw-page-gap" aria-hidden="true">…</span>
        ) : (
          <button key={p} className={`vw-page${p === safePage ? " vw-page-on" : ""}`}
                  aria-current={p === safePage ? "page" : undefined}
                  onClick={() => setPage(p)}>
            {p + 1}
          </button>
        ))}
      <button className="vw-page vw-page-nav" onClick={() => setPage(Math.min(pageCount - 1, safePage + 1))} disabled={safePage >= pageCount - 1}>
        Next ›
      </button>
      {showFilter("pageSize") && (
        <label className="vw-perpage">
          <select aria-label="Voices per page" value={pageSizeChoice} onChange={(e) => setPageSizeChoice(Number(e.target.value))}>
            {pageSizeOpts.map((n) => <option key={n} value={n}>{n} / page</option>)}
          </select>
        </label>
      )}
    </nav>
  ) : null;

  return (
    <div className="vw">
      <audio ref={audioRef} onEnded={() => setPlayingKey(null)} preload="none" />
      <header className="vw-head">
        <div className="vw-title">
          {lock && baseRows[0] ? `${baseRows[0].provider} voices` : "TTS Voices"}
          <span className="vw-count">
            {baseRows.length.toLocaleString()} {baseRows.length === 1 ? "voice" : "voices"}
            {filtered.length !== baseRows.length && <> · {filtered.length.toLocaleString()} matching</>}
          </span>
        </div>
      </header>

      {(showFilter("search") || showProvider || showFilter("language") || showFilter("gender") || showGroup) && (
        <div className="vw-filters">
          {showProvider && <Select label="Provider" value={provider} onChange={setProvider} opts={providers} />}
          {showFilter("language") && <Select label="Language" value={language} onChange={setLanguage} opts={languages} />}
          {showFilter("gender") && (
            <Select label="Gender" value={gender} onChange={setGender}
                    opts={["male", "female", "neutral", "unknown"]} />
          )}
          {showFilter("search") && (
            <input className="vw-search" placeholder="Search voices…" value={q}
                   onChange={(e) => setQ(e.target.value)} />
          )}
          {showGroup && (
            <div className="vw-group" role="group" aria-label="Group voices">
              <button className={group === "provider" ? "on" : ""} aria-pressed={group === "provider"}
                      onClick={() => setGroup("provider")}>By provider</button>
              <button className={group === "language" ? "on" : ""} aria-pressed={group === "language"}
                      onClick={() => setGroup("language")}>By language</button>
            </div>
          )}
        </div>
      )}

      {pageSections.length === 0 ? (
        <p className="vw-empty">No voices match your filters.</p>
      ) : (
        pageSections.map((sec, i) => (
          <section key={`${sec.name}-${i}`} className="vw-section">
            {sec.name && <h3 className="vw-section-title">{sec.name} <span>{groupTotals.get(sec.name)}</span></h3>}
            <FadeGrid style={gridStyle}>
              {sec.items.map((r) => (
                <Card key={r._uid} r={r} playing={playingKey === r._uid} onPlay={play} onCopy={copyConfig} />
              ))}
            </FadeGrid>
          </section>
        ))
      )}

      {pager}
    </div>
  );
}

// The loaded grid, fading/rising into the slots the skeleton held (no hard swap; reduced-motion-
// gated in CSS). The `vw-fadein` animation (opacity + translateY) makes the grid a stacking context
// for its duration AND — because of animation-fill-mode — permanently afterward. That would trap a
// first-row card's sample-text popover *below* the sticky toolbar (z-index:2): the card's hover/
// focus z-index can't escape the grid's stacking context. So drop the class once the animation ends,
// returning the grid to a plain (z-index:auto) element whose hovered card can rise above the toolbar.
function FadeGrid({ style, children }: { style?: CSSProperties; children: ReactNode }) {
  const [animating, setAnimating] = useState(true);
  return (
    <div className={`vw-grid${animating ? " vw-fadein" : ""}`} style={style}
         onAnimationEnd={() => setAnimating(false)}>
      {children}
    </div>
  );
}

// Inline SVG icons with a shared `vw-` styling hook. Fern's <Icon>/<Tooltip> are global MDX-only
// components — there is no @fern-* package to import them from (the components bundler only resolves
// React + this folder), and FontAwesome ships only as Fern component props (icon="fa-…"), not a
// global stylesheet that would style raw <i class="fa-…"> we emit here — so neither is usable from
// this custom TSX. Self-contained SVGs (matching the design mockups) are the only path that's
// guaranteed to render. Decorative ones are marked aria-hidden where rendered.
const IconGlobe = () => (
  <span className="vw-ic" aria-hidden="true">
    <svg viewBox="0 0 16 16" fill="none"><circle cx="8" cy="8" r="6.2" stroke="currentColor" strokeWidth="1.3" /><ellipse cx="8" cy="8" rx="2.6" ry="6.2" stroke="currentColor" strokeWidth="1.3" /><path d="M2 8h12" stroke="currentColor" strokeWidth="1.3" /></svg>
  </span>
);
const IconPerson = () => (
  <span className="vw-ic" aria-hidden="true">
    <svg viewBox="0 0 16 16" fill="none"><circle cx="8" cy="5" r="2.6" stroke="currentColor" strokeWidth="1.3" /><path d="M3.5 13c0-2.4 2-4 4.5-4s4.5 1.6 4.5 4" stroke="currentColor" strokeWidth="1.3" /></svg>
  </span>
);
const IconInfo = () => (
  <svg viewBox="0 0 16 16" fill="none" aria-hidden="true"><circle cx="8" cy="8" r="7" stroke="currentColor" strokeWidth="1.4" /><path d="M8 7v4" stroke="currentColor" strokeWidth="1.4" strokeLinecap="round" /><circle cx="8" cy="5" r="0.8" fill="currentColor" /></svg>
);
const IconCopy = () => (
  <svg viewBox="0 0 16 16" fill="none" aria-hidden="true"><rect x="5" y="5" width="8" height="9" rx="1.5" stroke="currentColor" strokeWidth="1.4" /><path d="M11 5V3.5A1.5 1.5 0 0 0 9.5 2H4a1.5 1.5 0 0 0-1.5 1.5V11A1.5 1.5 0 0 0 4 12.5" stroke="currentColor" strokeWidth="1.4" /></svg>
);
// Play/stop as inline SVG (not the "▶"/"■" chars, which are emoji-capable and render as an OS color
// emoji on some platforms). Filled with currentColor so they follow the button's rest/hover/playing
// color. The triangle is nudged right of viewBox-center so it reads optically centered in the circle.
const IconPlay = () => (
  <svg viewBox="0 0 16 16" aria-hidden="true"><path d="M5 3.5v9l7-4.5z" fill="currentColor" /></svg>
);
const IconStop = () => (
  <svg viewBox="0 0 16 16" aria-hidden="true"><rect x="4.5" y="4.5" width="7" height="7" rx="1" fill="currentColor" /></svg>
);

// Memoized so that playing/pausing a voice (which re-renders the widget) only re-renders the two
// cards whose `playing` flag actually changed — not all ~60 cards on the page.
const Card = memo(function Card({ r, playing, onPlay, onCopy }: {
  r: Row; playing: boolean; onPlay: (r: Row) => void; onCopy: (r: VoiceRow) => Promise<boolean> | void;
}) {
  const [copied, setCopied] = useState(false);
  const copyTimer = useRef<ReturnType<typeof setTimeout>>();
  useEffect(() => () => clearTimeout(copyTimer.current), []);

  const handleCopy = () => {
    Promise.resolve(onCopy(r)).then((ok) => {
      if (ok === false) return; // clipboard unavailable — leave the button unchanged
      setCopied(true);
      clearTimeout(copyTimer.current);
      copyTimer.current = setTimeout(() => setCopied(false), 1500);
    });
  };

  // Display-time cleanup (originals stay in the catalog, the copy payload, and the title/tooltip).
  const name = cleanName(r.display_name);
  const language = friendlyLanguage(r.primary_language);
  const gender = normalizeGender(r.gender);
  const model = r.model || null;
  const tipId = `vw-tip-${r._uid}`;

  return (
    // Per-card accessible name so screen-reader users navigate the grid as a list of named voices.
    <article className="vw-card" aria-label={name}>
      <div className="vw-card-top">
        <button className={`vw-play${playing ? " vw-playing" : ""}`} onClick={() => onPlay(r)}
                aria-label={playing ? `Stop ${name}` : `Play ${name}`}>
          {playing ? (
            <>
              {/* Two glyphs for the playing state: animated bars normally, a static stop square when
                  the user prefers reduced motion (CSS swaps their display). */}
              <span className="vw-eq" aria-hidden="true"><i /><i /><i /></span>
              <span className="vw-stop" aria-hidden="true"><IconStop /></span>
            </>
          ) : <IconPlay />}
        </button>
        {/* Cleaned name; the full original stays in title= (and the tooltip below). lang tags the
            native script for screen-reader pronunciation and language-appropriate glyph forms. */}
        <div className="vw-name" lang={r.primary_language || undefined} title={r.display_name}>{name}</div>
        {r.clip?.sample_text && (
          // Icon-anchored sample-text popover. Focusable trigger + aria-describedby so the sample is
          // announced (not just shown on hover); reveal is hover/focus-within (see CSS).
          <span className="vw-tooltip-wrap" tabIndex={0} aria-describedby={tipId}>
            <span className="vw-tooltip-icon"><IconInfo /></span>
            <span className="vw-tooltip" id={tipId} role="tooltip" lang={r.primary_language || undefined}>“{r.clip.sample_text}”</span>
          </span>
        )}
      </div>
      {/* Meta — language · gender, each with a decorative type icon. "unknown" gender is hidden. */}
      <div className="vw-meta">
        <span className="vw-it"><IconGlobe />{language}</span>
        {gender && <span className="vw-it"><IconPerson /><span className="vw-gender">{gender}</span></span>}
      </div>
      {/* Footer — PROVIDER · model (neutral inline-code) left, copy right. The left group is shrink-
          safe (min-width:0 + model ellipsis) so it never forces the grid column wider. */}
      <div className="vw-foot">
        <span className="vw-foot-l">
          <span className="vw-prov" title={r.provider}>{r.provider}</span>
          {model && <>
            <span className="vw-foot-mid" aria-hidden="true">·</span>
            <code className="vw-model">{model}</code>
          </>}
        </span>
        {/* Both copy variants stay in the DOM; the container query (CSS) shows the labeled button at
            ≤2 columns and the icon-only one at 3+. Payload is identical (display_name) for both. */}
        <button className={`vw-copy-t${copied ? " vw-copied" : ""}`} onClick={handleCopy} aria-live="polite">
          <IconCopy />{copied ? "✓ Copied" : "Copy config"}
        </button>
        <button className={`vw-copy-i${copied ? " vw-copied" : ""}`} onClick={handleCopy} aria-live="polite"
                aria-label={copied ? "Copied" : "Copy config"} title="Copy config">
          {copied ? "✓" : <IconCopy />}
        </button>
      </div>
    </article>
  );
});

// Loading state: skeleton placeholders that mirror the NEW card on the same grid at MATCHING height,
// so the layout doesn't jump when the data arrives (the core requirement). Built from the shared
// <Skeleton> shimmer primitive. The footer is the height trap — the real footer is ~34px (copy
// button + icon) — so the meta/footer placeholders carry the same min-heights as the real card
// (.vw-sk-meta / .vw-sk-foot). `pills` is the number of toolbar pill placeholders — pass the count
// of controls that will actually render so filters-off embeds get no phantom toolbar.
function VoiceWidgetSkeleton({ gridStyle, pills = 3 }: { gridStyle?: CSSProperties; pills?: number }) {
  return (
    <div className="vw" aria-busy="true" aria-label="Loading voices">
      <header className="vw-head">
        <Skeleton width={120} height={22} />
        <Skeleton width={90} height={13} />
      </header>
      {pills > 0 && (
        <div className="vw-filters">
          {Array.from({ length: pills }).map((_, i) => (
            <Skeleton key={i} width={112} height={33} radius={9} />
          ))}
        </div>
      )}
      <div className="vw-grid" style={gridStyle}>
        {Array.from({ length: 8 }).map((_, i) => (
          <article key={i} className="vw-card">
            <div className="vw-card-top">
              <Skeleton width={42} height={42} radius="50%" />
              <Skeleton width="55%" height={15} />
            </div>
            {/* Meta: two (icon-dot + text-bar) pairs — language, gender. */}
            <div className="vw-meta vw-sk-meta">
              <Skeleton width={13} height={13} radius="50%" />
              <Skeleton width={54} height={11} />
              <Skeleton width={13} height={13} radius="50%" />
              <Skeleton width={42} height={11} />
            </div>
            {/* Footer: provider bar + copy bar, pinned at the real footer height. */}
            <div className="vw-foot vw-sk-foot">
              <Skeleton width={74} height={11} />
              <Skeleton width={86} height={13} />
            </div>
          </article>
        ))}
      </div>
    </div>
  );
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
