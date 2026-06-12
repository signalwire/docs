import { memo, useCallback, useDeferredValue, useEffect, useMemo, useRef, useState } from "react";
import type { CSSProperties } from "react";
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

const ALL = "__all__";
const DEFAULT_PAGE_SIZE = 48;
const MOBILE_PAGE_SIZE = 12;
const MOBILE_QUERY = "(max-width: 640px)";
// Multiples of the max column count (4) so every page fills complete rows; 4 = a single row.
const PAGE_SIZE_OPTIONS = [4, 8, 12, 24, 48, 96];

type FilterKey = "search" | "provider" | "language" | "gender" | "group" | "pageSize";

// Client-side row: a catalog voice joined with its clip, plus two precomputed fields — `_search`,
// a lowercased blob so the per-keystroke filter runs one substring test per row instead of
// re-lowercasing 4–5 fields, and `_uid`, a collision-free identity for React keys and play state
// (assigned in loadBundle; the catalog's key+model is not unique on its own).
type Row = VoiceRow & { _search: string; _uid: string };

// The asset bundle (catalog.json + manifest.json) is one large artifact (~5 MB, ~4.9k voices)
// shared by every TTS page that embeds the widget. Cache the parsed+joined rows per URL pair so
// navigating across the index and the provider pages fetches and parses it once per session, not
// once per mount. Each embed then narrows this shared set down to the voices it shows (see baseRows).
const bundleCache = new Map<string, Promise<Row[]>>();

function loadBundle(catalogUrl: string, manifestUrl: string): Promise<Row[]> {
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
function useIsMobile() {
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
   * Fixed number of grid columns. Default: 3. Collapses to 1 column on phones regardless. Pass 0
   * for a responsive auto-fill grid (≈240px min per card) instead of a fixed count.
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
  /**
   * When `true`, the widget shows a placeholder prompting the user to select a provider before
   * rendering any voice cards. The provider dropdown is always shown when this is set. Once the
   * user selects a provider, cards appear. Default: `false`.
   */
  requireProvider?: boolean;
}

export function VoiceWidget({
  assetBaseUrl = ASSET_BASE,
  catalogUrl = `${assetBaseUrl}/catalog.json`,
  manifestUrl = `${assetBaseUrl}/manifest.json`,
  audioBaseUrl = AUDIO_BASE,
  groupBy: initialGroup = "provider",
  pageSize = DEFAULT_PAGE_SIZE,
  columns = 3,
  provider: lockedProvider,
  voiceIds,
  filters,
  requireProvider = false,
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
  const showProvider = (!lock || requireProvider) && showFilter("provider");
  // Hide group-by toggle when a provider is locked or requireProvider is active.
  const showGroup = group !== "none" && showFilter("group") && !lock && !requireProvider;

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
  const baseRows = useMemo(() => {
    if (!allRows) return null;
    if (!idAllowlist && !lock) return allRows;
    return allRows.filter((r) =>
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
  if (!baseRows) return <VoiceWidgetSkeleton gridStyle={gridStyle} />;

  // Step from safePage, not the raw page state: `page` can be stale-high after effectivePageSize
  // grows (a mobile→desktop resize isn't in filterSig), and stepping from it makes Prev appear
  // dead until the raw value catches back up with the clamped one.
  const awaitingProvider = requireProvider && provider === ALL;
  const pager = pageCount > 1 && !awaitingProvider ? (
    <nav className="vw-pager" aria-label="Voice pages">
      <button className="vw-pager-btn" onClick={() => setPage(Math.max(0, safePage - 1))} disabled={safePage <= 0}>
        ‹ Prev
      </button>
      <span className="vw-pager-info">
        {ordered.length ? `${start + 1}–${end} of ${ordered.length}` : "0 of 0"}
        <span className="vw-pager-page"> · page {safePage + 1}/{pageCount}</span>
      </span>
      <button className="vw-pager-btn" onClick={() => setPage(Math.min(pageCount - 1, safePage + 1))} disabled={safePage >= pageCount - 1}>
        Next ›
      </button>
    </nav>
  ) : null;

  return (
    <div className="vw">
      <audio ref={audioRef} onEnded={() => setPlayingKey(null)} preload="none" />
      <header className="vw-head">
        <div className="vw-title">TTS Voices {!awaitingProvider && <span className="vw-count">{filtered.length}</span>}</div>
        {showFilter("search") && (
          <input className="vw-search" placeholder="Search voices…" value={q}
                 onChange={(e) => setQ(e.target.value)} />
        )}
      </header>

      {(showProvider || (!awaitingProvider && (showFilter("language") || showFilter("gender") || showFilter("pageSize"))) || showGroup) && (
        <div className="vw-filters">
          {showProvider && <Select label="Provider" value={provider} onChange={setProvider} opts={providers} noAll={requireProvider} />}
          {!awaitingProvider && showFilter("language") && <Select label="Language" value={language} onChange={setLanguage} opts={languages} />}
          {!awaitingProvider && showFilter("gender") && (
            <Select label="Gender" value={gender} onChange={setGender}
                    opts={["male", "female", "neutral", "unknown"]} />
          )}
          {!awaitingProvider && showFilter("pageSize") && (
            <label className="vw-select">
              <span>Per page</span>
              <select value={pageSizeChoice} onChange={(e) => setPageSizeChoice(Number(e.target.value))}>
                {pageSizeOpts.map((n) => <option key={n} value={n}>{n}</option>)}
              </select>
            </label>
          )}
          {showGroup && (
            <div className="vw-group">
              <button className={group === "provider" ? "on" : ""} onClick={() => setGroup("provider")}>by provider</button>
              <button className={group === "language" ? "on" : ""} onClick={() => setGroup("language")}>by language</button>
            </div>
          )}
        </div>
      )}

      {pager}

      {awaitingProvider ? (
        <div className="vw-require-provider">
          <p>Select a provider above to browse available voices.</p>
        </div>
      ) : pageSections.length === 0 ? (
        <p className="vw-empty">No voices match your filters.</p>
      ) : (
        pageSections.map((sec, i) => (
          <section key={`${sec.name}-${i}`} className="vw-section">
            {sec.name && <h3 className="vw-section-title">{sec.name} <span>{groupTotals.get(sec.name)}</span></h3>}
            <div className="vw-grid" style={gridStyle}>
              {sec.items.map((r) => (
                <Card key={r._uid} r={r} playing={playingKey === r._uid} onPlay={play} onCopy={copyConfig} />
              ))}
            </div>
          </section>
        ))
      )}

      {pager}
    </div>
  );
}

// Memoized so that playing/pausing a voice (which re-renders the widget) only re-renders the two
// cards whose `playing` flag actually changed — not all ~60 cards on the page.
const Card = memo(function Card({ r, playing, onPlay, onCopy }: {
  r: Row; playing: boolean; onPlay: (r: Row) => void; onCopy: (r: VoiceRow) => Promise<boolean> | void;
}) {
  const disabled = !r.clip || r.clip.status !== "ok";
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

  return (
    <article className={`vw-card${r.clip?.status === "error" || !r.clip ? " vw-disabled" : ""}`}>
      <span className="vw-badge">{r.provider}</span>
      <div className="vw-card-top">
        <button className="vw-play" disabled={disabled} onClick={() => onPlay(r)}
                aria-label={`Play ${r.display_name}`}>{playing ? "■" : "▶"}</button>
        <div className="vw-name" title={r.display_name}>{r.display_name}</div>
      </div>
      <div className="vw-meta">
        <span className="vw-lang">{r.primary_language}</span>
        <span className={`vw-gender vw-${r.gender}`}>{r.gender}</span>
        {r.model && <span className="vw-model">{r.model}</span>}
      </div>
      {r.clip?.sample_text && <p className="vw-sample">“{r.clip.sample_text}”</p>}
      {(!r.clip || r.clip.status === "error") &&
        <p className="vw-note">{r.clip?.error ?? "no sample (provider key missing)"}</p>}
      {/* Both labels are always in the DOM and grid-stacked (see CSS) so the button keeps the width
          of the wider one — no layout shift when it swaps to the copied state. */}
      <button className={`vw-copy${copied ? " vw-copied" : ""}`} onClick={handleCopy} aria-live="polite">
        <span className="vw-copy-default">copy config</span>
        <span className="vw-copy-done">✓ copied</span>
      </button>
    </article>
  );
});

// Loading state: skeleton placeholders that mirror the real header + card grid, so the layout
// doesn't jump when the data arrives. Built from the shared <Skeleton> primitive.
function VoiceWidgetSkeleton({ gridStyle }: { gridStyle?: CSSProperties }) {
  return (
    <div className="vw" aria-busy="true" aria-label="Loading voices">
      <header className="vw-head">
        <Skeleton width={150} height={22} />
        <Skeleton width={220} height={36} radius={10} style={{ marginLeft: "auto" }} />
      </header>
      <div className="vw-grid" style={gridStyle}>
        {Array.from({ length: 8 }).map((_, i) => (
          <article key={i} className="vw-card">
            <div className="vw-card-top">
              <Skeleton width={32} height={32} radius="50%" />
              <Skeleton width="55%" height={14} />
            </div>
            <div className="vw-meta">
              <Skeleton width={48} height={16} radius={6} />
              <Skeleton width={42} height={16} radius={6} />
            </div>
            <Skeleton width="90%" height={11} />
            <Skeleton width="70%" height={11} />
            <Skeleton width={84} height={26} radius={6} />
          </article>
        ))}
      </div>
    </div>
  );
}

function Select({ label, value, onChange, opts, noAll }:
  { label: string; value: string; onChange: (v: string) => void; opts: string[]; noAll?: boolean }) {
  return (
    <label className="vw-select">
      <span>{label}</span>
      <select value={value} onChange={(e) => onChange(e.target.value)}>
        {noAll
          ? <option value={ALL} disabled>Choose a provider…</option>
          : <option value={ALL}>all</option>}
        {opts.map((o) => <option key={o} value={o}>{o}</option>)}
      </select>
    </label>
  );
}

function uniq(xs?: string[]): string[] {
  return [...new Set((xs ?? []).filter(Boolean))].sort();
}

// Model-qualified catalog key (<engine>/<voice_id>[:<model>]) — the documented matching form for
// the voiceIds allowlist. NOT unique in the wild: a few rime voices repeat key+model (once per
// language, plus literal duplicate rows), so row identity uses Row._uid — this plus a collision
// counter, assigned in loadBundle.
function modelKeyOf(v: { key: string; model: string | null }): string {
  return v.model ? `${v.key}:${v.model}` : v.key;
}
