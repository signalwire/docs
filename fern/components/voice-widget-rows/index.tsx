import { memo, useCallback, useDeferredValue, useEffect, useMemo, useRef, useState } from "react";
import type { ReactNode } from "react";
import type { VoiceRow } from "../voice-widget/types";
import { Skeleton } from "../skeleton/index";
import {
  // Data layer + display-time helpers reused VERBATIM from the cards widget so the two previews
  // stay behaviorally identical (no logic drift): same fetch/cache, name cleaning, friendly
  // language, gender/model normalization, no-preview filtering, toolbar/pager UI, breakpoint.
  ALL,
  DEFAULT_PAGE_SIZE,
  MOBILE_PAGE_SIZE,
  PAGE_SIZE_OPTIONS,
  Select,
  cleanName,
  friendlyLanguage,
  loadBundle,
  modelKeyOf,
  normalizeGender,
  normalizeModel,
  pageNumbers,
  uniq,
  useIsMobile,
} from "../voice-widget/index";
import type { Row, VoiceWidgetProps } from "../voice-widget/index";

// Compact-ROWS preview of the TTS voice browser — "Direction B", a sibling to the cards
// (components/voice-widget). Modeled on the ElevenLabs voice picker: a bordered, rounded list of
// hairline-divided two-line rows (cleaned name over muted plain-middot meta), play on the left and
// a labeled "Copy config" on the right. It is a SEPARATE implementation that REUSES the cards
// module's data/display logic (imported above) and the same `.vw-*` design tokens — it only adds the
// row rendering + the row skeleton here. Same props surface as VoiceWidget so a page can swap one for
// the other. Styles live in this folder's styles.css (loaded via docs.yml `css:`).

const ASSET_BASE = "https://mcdn.signalwire.com/voice_widget/dist"; // catalog.json + manifest.json
const AUDIO_BASE = "https://mcdn.signalwire.com";                   // /audio/<engine>/<voice_id>.mp3

type FilterKey = "search" | "provider" | "language" | "gender" | "group" | "pageSize";

// Same props as the cards (re-exported as an alias so pages can type either component identically).
export type VoiceWidgetRowsProps = VoiceWidgetProps;

export function VoiceWidgetRows({
  assetBaseUrl = ASSET_BASE,
  catalogUrl = `${assetBaseUrl}/catalog.json`,
  manifestUrl = `${assetBaseUrl}/manifest.json`,
  audioBaseUrl = AUDIO_BASE,
  groupBy: initialGroup = "provider",
  pageSize = DEFAULT_PAGE_SIZE,
  provider: lockedProvider,
  voiceIds,
  filters,
}: VoiceWidgetRowsProps) {
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

  // Rows are full-width single-column at every breakpoint, but the mobile page-size cap still
  // applies — a 48-row list is an excessive scroll on a phone.
  const isMobile = useIsMobile();
  const effectivePageSize = isMobile ? Math.min(pageSizeChoice, MOBILE_PAGE_SIZE) : pageSizeChoice;
  const pageSizeOpts = [...new Set([...PAGE_SIZE_OPTIONS, pageSize])].sort((a, b) => a - b);

  // Resolve which filter/search controls are visible. `filters` is a boolean (all on/off) or a
  // per-control object; each control defaults on unless explicitly false. The `search` control
  // defaults to off (must be opted in) — all others default on. (Same rules as the cards.)
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
  // them once here. Also drops no-preview voices (missing/errored clip) so every visible row is
  // auditionable. Identical to the cards' baseRows.
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
  // provider's languages.
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

  // Reset to the first page whenever the result set changes — done during render (not in an effect)
  // so there's no one-frame flash of the old page number.
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

  // Split the current page's slice into contiguous group sections. group === "none" → a single
  // unlabeled section (flat list).
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

  // Keep the latest playing key in a ref so play() can stay referentially stable (memoized rows).
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
    // preload="none" the clip downloads first, and during that window a second click must read this
    // row as already playing so it pauses instead of restarting the download. The eager icon flip
    // also gives the click immediate feedback while the clip loads.
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
  if (!baseRows) return <VoiceRowsSkeleton pills={[showProvider, showFilter("language"), showFilter("gender")].filter(Boolean).length} />;

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
    <div className="vw vw-rows">
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
          <section key={`${sec.name}-${i}`} className="vw-rsection">
            {sec.name && <h3 className="vw-section-title">{sec.name} <span>{groupTotals.get(sec.name)}</span></h3>}
            {/* The bordered, rounded list container. A real <ul> so screen readers announce it as a
                list of N voices; each row is a <li>/<article aria-label={name}>. Fades/rises in once
                loaded (reduced-motion-gated in CSS). */}
            <FadeList>
              {sec.items.map((r) => (
                <VoiceRowItem key={r._uid} r={r} playing={playingKey === r._uid} onPlay={play} onCopy={copyConfig} />
              ))}
            </FadeList>
          </section>
        ))
      )}

      {pager}
    </div>
  );
}

// The loaded list, fading/rising into the slot the skeleton list held (no hard swap; reduced-motion-
// gated in CSS). Mirrors the cards' FadeGrid: the `vw-fadein` animation makes the list a stacking
// context permanently (animation-fill-mode), which would trap a first row's sample-text popover
// below the sticky toolbar — so drop the class once the animation ends to restore z-index:auto.
function FadeList({ children }: { children: ReactNode }) {
  const [animating, setAnimating] = useState(true);
  return (
    <ul className={`vw-list${animating ? " vw-fadein" : ""}`} role="list"
        onAnimationEnd={() => setAnimating(false)}>
      {children}
    </ul>
  );
}

// Inline SVG icons with the shared `vw-` styling hooks (Fern's <Icon>/<Tooltip> aren't importable in
// custom TSX — see the cards module header). Same glyphs as the cards' info/copy icons.
const IconInfo = () => (
  <svg viewBox="0 0 16 16" fill="none" aria-hidden="true"><circle cx="8" cy="8" r="7" stroke="currentColor" strokeWidth="1.4" /><path d="M8 7v4" stroke="currentColor" strokeWidth="1.4" strokeLinecap="round" /><circle cx="8" cy="5" r="0.8" fill="currentColor" /></svg>
);
const IconCopy = () => (
  <svg viewBox="0 0 16 16" fill="none" aria-hidden="true"><rect x="5" y="5" width="8" height="9" rx="1.5" stroke="currentColor" strokeWidth="1.4" /><path d="M11 5V3.5A1.5 1.5 0 0 0 9.5 2H4a1.5 1.5 0 0 0-1.5 1.5V11A1.5 1.5 0 0 0 4 12.5" stroke="currentColor" strokeWidth="1.4" /></svg>
);

// Memoized so playing/pausing a voice (which re-renders the widget) only re-renders the two rows
// whose `playing` flag actually changed — not the whole page of rows.
const VoiceRowItem = memo(function VoiceRowItem({ r, playing, onPlay, onCopy }: {
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
  const model = r.model ? normalizeModel(r.engine, r.model) : null;
  const tipId = `vwr-tip-${r._uid}`;

  return (
    // Each row is a list item with an accessible name so SR users navigate the list as named voices.
    <li className="vw-row">
      <article className="vw-row-inner" aria-label={name}>
        <button className={`vw-play${playing ? " vw-playing" : ""}`} onClick={() => onPlay(r)}
                aria-label={playing ? `Stop ${name}` : `Play ${name}`}>
          {playing ? (
            <>
              {/* Animated bars normally; a static stop square under prefers-reduced-motion (CSS swap). */}
              <span className="vw-eq" aria-hidden="true"><i /><i /><i /></span>
              <span className="vw-stop" aria-hidden="true">■</span>
            </>
          ) : "▶"}
        </button>

        {/* Name + meta block — min-width:0 so the name/meta can ellipsize instead of widening the row. */}
        <div className="vw-row-mid">
          <div className="vw-row-nm">
            {/* Cleaned name; the full original stays in title= (and the tooltip below). */}
            <span className="vw-name" title={r.display_name}>{name}</span>
            {r.clip?.sample_text && (
              // Icon-anchored sample-text popover. Focusable trigger + aria-describedby so the sample
              // is announced (not just shown on hover); reveal is hover/focus-within (see CSS).
              <span className="vw-tooltip-wrap" tabIndex={0} aria-describedby={tipId}>
                <span className="vw-tooltip-icon"><IconInfo /></span>
                <span className="vw-tooltip" id={tipId} role="tooltip">“{r.clip.sample_text}”</span>
              </span>
            )}
          </div>
          {/* Meta — muted plain-middot: language · gender · provider · model. No type icons (density).
              "unknown" gender is hidden. Provider is ALWAYS shown. Model is the neutral inline-code.
              The whole line truncates with ellipsis; never wraps (keeps row height uniform). */}
          <div className="vw-row-meta">
            <span>{language}</span>
            {gender && <><span className="vw-dot" aria-hidden="true">·</span><span className="vw-gender">{gender}</span></>}
            <span className="vw-dot" aria-hidden="true">·</span>
            <span className="vw-prov" title={r.provider}>{r.provider}</span>
            {model && <>
              <span className="vw-dot" aria-hidden="true">·</span>
              <code className="vw-model" title={r.model!}>{model}</code>
            </>}
          </div>
        </div>

        {/* Copy — always labeled (rows have the horizontal room; no icon-only variant). Copied →
            "✓ Copied" in --status-success. Payload identical to the cards. */}
        <button className={`vw-copy-t${copied ? " vw-copied" : ""}`} onClick={handleCopy} aria-live="polite">
          <IconCopy />{copied ? "✓ Copied" : "Copy config"}
        </button>
      </article>
    </li>
  );
});

// Loading state: skeleton ROWS in the SAME list container at MATCHING row height (zero layout shift).
// A skeleton row mirrors the real one — play circle + a name bar + a shorter meta bar + a copy bar.
// The real row's two text lines (name + meta) carry a 2px gap, so the skeleton stacks its name/meta
// bars with the same rhythm; the row's vertical padding (CSS) is shared by both so heights match.
// `pills` is the number of toolbar pill placeholders — pass the count of controls that actually
// render so a filters-off embed gets no phantom toolbar.
function VoiceRowsSkeleton({ pills = 3 }: { pills?: number }) {
  return (
    <div className="vw vw-rows" aria-busy="true" aria-label="Loading voices">
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
      <ul className="vw-list" role="list">
        {Array.from({ length: 8 }).map((_, i) => (
          <li key={i} className="vw-row">
            <div className="vw-row-inner">
              <Skeleton width={38} height={38} radius="50%" />
              <div className="vw-row-mid">
                <Skeleton width="34%" height={14} />
                <Skeleton width="62%" height={11} style={{ marginTop: 6 }} />
              </div>
              <Skeleton width={86} height={13} />
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
}
