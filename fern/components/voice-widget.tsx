import { memo, useCallback, useDeferredValue, useEffect, useMemo, useRef, useState } from "react";
import type { CSSProperties } from "react";
import type { Catalog, Manifest, VoiceRow } from "./types";
import { Skeleton } from "./skeleton";

// Ported from @signalwire/tts-voice-widget for embedding as a Fern MDX component.
// Pure data consumer: fetches catalog.json + manifest.json produced by the TTS pipeline and plays
// the pre-synthesized sample clips. Styles live in voice-widget.css + voice-widget-overrides.css,
// loaded via docs.yml `css:` (Fern's component bundler does not process CSS imports).

// Single source of truth for where the asset bundle (catalog.json + manifest.json + audio/) is
// hosted. The bundle cannot live in fern/assets — Fern only serves assets it statically discovers
// in MDX/CSS and rewrites to content-hashed URLs, so a runtime fetch() has no resolvable path.
// It must be served from an external origin with CORS enabled on the JSON. Flip this one string
// to move between hosts; the three URLs (catalog/manifest/audio) all derive from it.
//
// Cloudflare quick tunnel to the local CDN (`http-server temp/voice_widget/dist -p 8080 --cors -g`),
// so a tunnelled docs preview can be shared and fetch assets over HTTPS from a host every viewer
// can resolve. Ephemeral: quick-tunnel URLs change on every cloudflared restart — update this and
// restart the docs dev server to re-bundle. For local-only dev set to "http://localhost:8080".
// Swap to the production CDN base URL when one is available.
const ASSET_BASE = "https://trainers-babies-ctrl-thrown.trycloudflare.com";

const ALL = "__all__";
const DEFAULT_PAGE_SIZE = 60;
const MOBILE_PAGE_SIZE = 12;
const MOBILE_QUERY = "(max-width: 640px)";

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
  /** Override the base the clip `audio` paths resolve against. Default: assetBaseUrl. */
  audioBaseUrl?: string;
  /** Initial grouping. Default: "provider". */
  groupBy?: "provider" | "language";
  /** Cards rendered per page (page-size limit). Default: 60. Keeps the DOM small and the catalog fast. */
  pageSize?: number;
  /**
   * Fixed number of grid columns. When unset, the grid auto-fills responsively (≈240px min per
   * card). When set, it renders exactly this many columns.
   */
  columns?: number;
  /**
   * Lock the widget to a single provider. Matches the provider label or engine id,
   * case-insensitive (e.g. "ElevenLabs" or "elevenlabs"). When set, only that provider's voices
   * are shown and the provider filter is hidden — for embedding on a provider-specific page.
   */
  provider?: string;
}

export function VoiceWidget({
  assetBaseUrl = ASSET_BASE,
  catalogUrl = `${assetBaseUrl}/catalog.json`,
  manifestUrl = `${assetBaseUrl}/manifest.json`,
  audioBaseUrl = assetBaseUrl,
  groupBy: initialGroup = "provider",
  pageSize = DEFAULT_PAGE_SIZE,
  columns,
  provider: lockedProvider,
}: VoiceWidgetProps) {
  // Normalized single-provider lock (null when the widget shows all providers).
  const lock = lockedProvider?.trim().toLowerCase() || null;
  // Fixed column count overrides the responsive auto-fill grid when provided. Set as CSS custom
  // properties (consumed by .vw-grid in the stylesheet) rather than grid-template-columns directly,
  // so the mobile media query can still collapse the grid to one column regardless of this prop.
  const gridStyle = (columns && columns > 0
    ? { "--vw-cols": Math.floor(columns), "--vw-col-min": "0px" }
    : undefined) as CSSProperties | undefined;
  const [rows, setRows] = useState<VoiceRow[] | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [q, setQ] = useState("");
  const [provider, setProvider] = useState(ALL);
  const [language, setLanguage] = useState(ALL);
  const [gender, setGender] = useState(ALL);
  const [group, setGroup] = useState<"provider" | "language">(initialGroup);
  const [page, setPage] = useState(0);
  const audioRef = useRef<HTMLAudioElement | null>(null);
  const [playingKey, setPlayingKey] = useState<string | null>(null);

  // Defer the search term so typing stays responsive while the (cheap) filter recomputes.
  const deferredQ = useDeferredValue(q);

  // On small screens the grid collapses to one column (CSS), so cap the page size too — a 60-card
  // single column is an excessive scroll on a phone.
  const isMobile = useIsMobile();
  const effectivePageSize = isMobile ? Math.min(pageSize, MOBILE_PAGE_SIZE) : pageSize;

  useEffect(() => {
    let alive = true;
    (async () => {
      try {
        const [cat, man] = await Promise.all([
          fetch(catalogUrl).then((r) => r.json() as Promise<Catalog>),
          fetch(manifestUrl).then((r) => r.json() as Promise<Manifest>).catch(() => ({ clips: {} } as Manifest)),
        ]);
        if (!alive) return;
        setRows(cat.voices.map((v) => ({ ...v, clip: man.clips?.[v.key] })));
      } catch (e) {
        if (alive) setError(String(e));
      }
    })();
    return () => { alive = false; };
  }, [catalogUrl, manifestUrl]);

  const providers = useMemo(() => uniq(rows?.map((r) => r.provider)), [rows]);
  const languages = useMemo(() => uniq(rows?.flatMap((r) => r.languages)), [rows]);

  const filtered = useMemo(() => {
    if (!rows) return [];
    const needle = deferredQ.trim().toLowerCase();
    return rows.filter((r) =>
      (!lock || r.provider.toLowerCase() === lock || r.engine.toLowerCase() === lock) &&
      (provider === ALL || r.provider === provider) &&
      (language === ALL || r.languages.includes(language)) &&
      (gender === ALL || r.gender === gender) &&
      (!needle ||
        r.display_name.toLowerCase().includes(needle) ||
        r.provider.toLowerCase().includes(needle) ||
        r.description.toLowerCase().includes(needle) ||
        r.tags.join(" ").toLowerCase().includes(needle)));
  }, [rows, lock, deferredQ, provider, language, gender]);

  // Flatten into grouped order once, and remember each group's full size for the section headers.
  const { ordered, groupTotals } = useMemo(() => {
    const m = new Map<string, VoiceRow[]>();
    for (const r of filtered) {
      const k = group === "provider" ? r.provider : r.primary_language;
      (m.get(k) ?? m.set(k, []).get(k)!).push(r);
    }
    const entries = [...m.entries()].sort((a, b) => a[0].localeCompare(b[0]));
    const ordered: VoiceRow[] = [];
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
  const filterSig = `${lock}|${deferredQ}|${provider}|${language}|${gender}|${group}`;
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
  const pageSections = useMemo(() => {
    const secs: { name: string; items: VoiceRow[] }[] = [];
    for (const r of ordered.slice(start, end)) {
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

  const play = useCallback((r: VoiceRow) => {
    if (!r.clip || r.clip.status !== "ok") return;
    const url = audioBaseUrl ? `${audioBaseUrl.replace(/\/$/, "")}/${r.clip.audio}` : r.clip.audio;
    const a = audioRef.current!;
    if (playingKeyRef.current === r.key && !a.paused) { a.pause(); setPlayingKey(null); return; }
    a.src = url;
    a.play().then(() => setPlayingKey(r.key)).catch(() => setPlayingKey(null));
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
  if (!rows) return <VoiceWidgetSkeleton gridStyle={gridStyle} />;

  const pager = pageCount > 1 ? (
    <nav className="vw-pager" aria-label="Voice pages">
      <button className="vw-pager-btn" onClick={() => setPage((p) => Math.max(0, p - 1))} disabled={safePage <= 0}>
        ‹ Prev
      </button>
      <span className="vw-pager-info">
        {ordered.length ? `${start + 1}–${end} of ${ordered.length}` : "0 of 0"}
        <span className="vw-pager-page"> · page {safePage + 1}/{pageCount}</span>
      </span>
      <button className="vw-pager-btn" onClick={() => setPage((p) => Math.min(pageCount - 1, p + 1))} disabled={safePage >= pageCount - 1}>
        Next ›
      </button>
    </nav>
  ) : null;

  return (
    <div className="vw">
      <audio ref={audioRef} onEnded={() => setPlayingKey(null)} preload="none" />
      <header className="vw-head">
        <div className="vw-title">TTS Voices <span className="vw-count">{filtered.length}</span></div>
        <input className="vw-search" placeholder="Search voices…" value={q}
               onChange={(e) => setQ(e.target.value)} />
      </header>

      <div className="vw-filters">
        {!lock && <Select label="Provider" value={provider} onChange={setProvider} opts={providers} />}
        <Select label="Language" value={language} onChange={setLanguage} opts={languages} />
        <Select label="Gender" value={gender} onChange={setGender}
                opts={["male", "female", "neutral", "unknown"]} />
        <div className="vw-group">
          <button className={group === "provider" ? "on" : ""} onClick={() => setGroup("provider")}>by provider</button>
          <button className={group === "language" ? "on" : ""} onClick={() => setGroup("language")}>by language</button>
        </div>
      </div>

      {pager}

      {pageSections.length === 0 ? (
        <p className="vw-empty">No voices match your filters.</p>
      ) : (
        pageSections.map((sec, i) => (
          <section key={`${sec.name}-${i}`} className="vw-section">
            <h3 className="vw-section-title">{sec.name} <span>{groupTotals.get(sec.name)}</span></h3>
            <div className="vw-grid" style={gridStyle}>
              {sec.items.map((r) => (
                <Card key={r.key} r={r} playing={playingKey === r.key} onPlay={play} onCopy={copyConfig} />
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
  r: VoiceRow; playing: boolean; onPlay: (r: VoiceRow) => void; onCopy: (r: VoiceRow) => Promise<boolean> | void;
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
      <div className="vw-card-top">
        <button className="vw-play" disabled={disabled} onClick={() => onPlay(r)}
                aria-label={`Play ${r.display_name}`}>{playing ? "❚❚" : "▶"}</button>
        <div className="vw-name">{r.display_name}</div>
        <span className="vw-badge">{r.provider}</span>
      </div>
      <div className="vw-meta">
        <span className="vw-lang">{r.primary_language}</span>
        <span className={`vw-gender vw-${r.gender}`}>{r.gender}</span>
        {r.model && <span className="vw-model">{r.model}</span>}
      </div>
      {r.clip?.sample_text && <p className="vw-sample">“{r.clip.sample_text}”</p>}
      {(!r.clip || r.clip.status === "error") &&
        <p className="vw-note">{r.clip?.error ?? "no sample (provider key missing)"}</p>}
      <button className={`vw-copy${copied ? " vw-copied" : ""}`} onClick={handleCopy} aria-live="polite">
        {copied ? "copied ✓" : "copy config"}
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

function Select({ label, value, onChange, opts }:
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

function uniq(xs?: string[]): string[] {
  return [...new Set((xs ?? []).filter(Boolean))].sort();
}
