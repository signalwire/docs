/*
 * Signup attribution for signalwire.com/docs, loaded through `js` in fern/docs.yml.
 * The first statement is this site's configuration. Everything after it is the
 * unmodified attribution build, the same one the marketing site, /landing and
 * /developers/demos run. To update, replace the build below with a new copy; do not
 * edit it here. To turn the script off, set rollout to "off".
 *
 * consent "termly": ad click ids (gclid and the like) are kept only for visitors whose
 * Termly advertising consent is granted. The docs do not run Termly, so the script reads
 * the decision the visitor made on signalwire.com.
 */
window.SW_ATTR_CONFIG = {"consent":"termly","rollout":"on"};

/*!
 * SignalWire signup attribution v1.1.0 (payload schema v1)
 * Adds one first-party parameter, sw_attr, to SignalWire signup links.
 * Source of truth: attribution/src/signup-attribution.js. Built by attribution/build.py.
 * Spec: signalwire-framer-signup-attribution-plan.md.
 */
(function (root, factory) {
  'use strict';
  var api = factory();
  if (typeof module === 'object' && module && module.exports) {
    module.exports = api;
  } else if (root && root.document) {
    try { api.boot(root); } catch (e) { /* attribution must never break the page */ }
  }
})(typeof window !== 'undefined' ? window : this, function () {
  'use strict';

  var VERSION = '1.1.0';
  var PAYLOAD_VERSION = 1;

  var DEFAULTS = {
    firstPartyDomains: ['signalwire.com'],
    signupDestinations: [
      { host: 'signalwire.com', path: '/signup' },
      { host: 'www.signalwire.com', path: '/signup' },
      { host: 'id.signalwire.com', path: '/onboarding' }
    ],
    payloadParameter: 'sw_attr',
    ctaParameter: 'cta',
    // gad_source / gad_campaignid are Google Ads auto-tagging parameters. They name the ad source and
    // campaign, not the visitor, so unlike the click ids below they are kept in every consent mode.
    campaignKeys: ['utm_source', 'utm_medium', 'utm_campaign', 'utm_id', 'utm_content', 'utm_term',
      'gad_source', 'gad_campaignid',
      'gclid', 'gbraid', 'wbraid', 'msclkid', 'fbclid', 'li_fat_id', 'twclid'],
    clickIdKeys: ['gclid', 'gbraid', 'wbraid', 'msclkid', 'fbclid', 'li_fat_id', 'twclid'],
    firstTouchTtlDays: 30,
    sessionIdleMinutes: 30,
    storageKey: 'sw_attribution_v1',
    sessionKey: 'sw_attribution_session_v1',
    canaryKey: 'sw_attribution_canary_v1',
    maxSignupUrlLength: 4000,
    maxFieldLength: 300,
    maxCampaignValueLength: 150,   // utm_* values
    maxClickIdLength: 512,         // gclid, fbclid, ...; a truncated click id is useless (cloud-product #21839 cap)
    redactPathPatterns: [],
    rollout: 'canary',          // 'off' | 'canary' | 'on'
    canaryFlag: 'sw_attr_canary',
    // 'session' | 'persistent' | 'termly' | name of a window function returning true when persistent
    // storage is allowed. Persistent storage is also what lets ad click ids into the payload.
    consent: 'session',
    termlyCategory: 'advertising', // the Termly consent category that 'termly' mode reads
    debug: false
  };

  var CORE_CAMPAIGN = ['utm_source', 'utm_medium', 'utm_campaign'];
  var HAS = Object.prototype.hasOwnProperty;

  // ---------------------------------------------------------------- helpers

  function mergeConfig(defaults, overrides) {
    var out = {};
    var k;
    for (k in defaults) if (HAS.call(defaults, k)) out[k] = defaults[k];
    if (overrides && typeof overrides === 'object') {
      for (k in overrides) {
        if (HAS.call(overrides, k) && HAS.call(defaults, k) && overrides[k] !== undefined) out[k] = overrides[k];
      }
    }
    return out;
  }

  function hasKeys(o) {
    if (!o) return false;
    for (var k in o) if (HAS.call(o, k)) return true;
    return false;
  }

  function clip(s, n) {
    s = String(s);
    return s.length > n ? s.slice(0, n) : s;
  }

  function cleanValue(v, n) {
    return clip(String(v).replace(/[\u0000-\u001f\u007f]/g, '').trim(), n);
  }

  function parseHttpUrl(value, base) {
    if (value == null || value === '') return null;
    try {
      var u = base ? new URL(String(value), base) : new URL(String(value));
      if (u.protocol !== 'https:' && u.protocol !== 'http:') return null;
      return u;
    } catch (e) {
      return null;
    }
  }

  function normalizePath(p) {
    if (!p) return '/';
    var out = p.replace(/\/+$/, '');
    return out === '' ? '/' : out;
  }

  function redactPath(path, patterns) {
    var list = patterns || [];
    for (var i = 0; i < list.length; i++) {
      try { path = path.replace(new RegExp(list[i], 'g'), ':redacted'); } catch (e) { /* ignore a bad pattern */ }
    }
    return path;
  }

  // origin + pathname, no credentials, query or fragment
  function sanitizePage(href, cfg) {
    var u = parseHttpUrl(href);
    if (!u) return null;
    return clip(u.origin + redactPath(u.pathname, cfg.redactPathPatterns), cfg.maxFieldLength);
  }

  function sanitizeReferrer(ref, cfg) {
    return ref ? sanitizePage(ref, cfg) : null;
  }

  function originOnly(href) {
    var u = parseHttpUrl(href);
    return u ? u.origin + '/' : null;
  }

  function readCampaign(search, cfg, dropClickIds) {
    var out = {};
    var params;
    try { params = new URLSearchParams(search || ''); } catch (e) { return out; }
    for (var i = 0; i < cfg.campaignKeys.length; i++) {
      var k = cfg.campaignKeys[i];
      var isClickId = cfg.clickIdKeys.indexOf(k) !== -1;
      if (dropClickIds && isClickId) continue;
      var v = params.get(k);
      if (v == null) continue;
      v = cleanValue(v, isClickId ? cfg.maxClickIdLength : cfg.maxCampaignValueLength);
      if (v) out[k] = v;
    }
    return out;
  }

  function isFirstPartyHost(host, cfg, currentHost) {
    host = String(host || '').toLowerCase();
    if (!host) return false;
    if (currentHost && host === String(currentHost).toLowerCase()) return true;
    for (var i = 0; i < cfg.firstPartyDomains.length; i++) {
      var d = String(cfg.firstPartyDomains[i]).toLowerCase();
      if (host === d || host.slice(-(d.length + 1)) === '.' + d) return true;
    }
    return false;
  }

  // 'campaign' | 'referral' | 'direct'
  function classifyEntry(campaign, referrer, cfg, currentHost) {
    if (hasKeys(campaign)) return 'campaign';
    var u = referrer ? parseHttpUrl(referrer) : null;
    if (u && !isFirstPartyHost(u.hostname, cfg, currentHost)) return 'referral';
    return 'direct';
  }

  // Identity of a qualifying touch, used to avoid recording the same campaign
  // again on every internal page (Framer carries the landing UTMs onto every URL).
  function touchKey(kind, campaign, referrer) {
    if (kind === 'campaign') {
      var keys = [];
      for (var k in campaign) if (HAS.call(campaign, k)) keys.push(k);
      keys.sort();
      var parts = [];
      for (var i = 0; i < keys.length; i++) parts.push(keys[i] + '=' + campaign[keys[i]]);
      return 'c:' + parts.join('&');
    }
    if (kind === 'referral') return 'r:' + (originOnly(referrer) || '');
    return '';
  }

  function matchDestination(href, cfg, base) {
    var u = parseHttpUrl(href, base);
    if (!u || u.protocol !== 'https:' || u.username || u.password) return null;
    var host = u.hostname.toLowerCase();
    var path = normalizePath(u.pathname);
    for (var i = 0; i < cfg.signupDestinations.length; i++) {
      var d = cfg.signupDestinations[i];
      if (host === String(d.host).toLowerCase() && path === normalizePath(d.path)) return u;
    }
    return null;
  }

  // Parse a signup href: returns the clean destination URL (cta, payload and canary
  // parameters removed, everything else untouched) and the CTA id, or null.
  function prepareTarget(href, cfg, base) {
    var u = matchDestination(href, cfg, base);
    if (!u) return null;
    var cta = u.searchParams.get(cfg.ctaParameter);
    cta = cta && /^[a-z0-9][a-z0-9-]{0,39}$/.test(cta) ? cta : null;
    u.searchParams.delete(cfg.ctaParameter);
    u.searchParams.delete(cfg.payloadParameter);
    u.searchParams.delete(cfg.canaryFlag);
    return { url: u, cta: cta };
  }

  // -------------------------------------------------------------- encoding

  function utf8ToBinary(str) {
    if (typeof TextEncoder !== 'undefined') {
      var bytes = new TextEncoder().encode(str);
      var bin = '';
      for (var i = 0; i < bytes.length; i++) bin += String.fromCharCode(bytes[i]);
      return bin;
    }
    return unescape(encodeURIComponent(str));
  }

  function binaryToUtf8(bin) {
    if (typeof TextDecoder !== 'undefined') {
      var bytes = new Uint8Array(bin.length);
      for (var i = 0; i < bin.length; i++) bytes[i] = bin.charCodeAt(i);
      return new TextDecoder().decode(bytes);
    }
    return decodeURIComponent(escape(bin));
  }

  function encodePayload(obj) {
    return btoa(utf8ToBinary(JSON.stringify(obj)))
      .replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
  }

  function decodePayload(s) {
    var b64 = String(s).replace(/-/g, '+').replace(/_/g, '/');
    while (b64.length % 4) b64 += '=';
    return JSON.parse(binaryToUtf8(atob(b64)));
  }

  // ---------------------------------------------------------- payload size

  function clone(o) { return JSON.parse(JSON.stringify(o)); }

  function eachTouch(p, fn) {
    if (p.first) fn(p.first);
    if (p.last_non_direct) fn(p.last_non_direct);
  }

  // Lowest-priority fields go first (plan, Section 9).
  var REDUCERS = [
    function (p) { if (p.click) delete p.click.previous_internal_page; },
    function (p) { if (p.click) delete p.click.document_referrer; },
    function (p) { eachTouch(p, function (t) { if (t.referrer) t.referrer = originOnly(t.referrer); }); },
    function (p) {
      eachTouch(p, function (t) {
        if (!t.campaign) return;
        var c = {};
        for (var i = 0; i < CORE_CAMPAIGN.length; i++) if (t.campaign[CORE_CAMPAIGN[i]]) c[CORE_CAMPAIGN[i]] = t.campaign[CORE_CAMPAIGN[i]];
        if (hasKeys(c)) t.campaign = c; else delete t.campaign;
      });
    },
    function (p) {
      delete p.session;
      if (p.click) { delete p.click.id; delete p.click.at; }
      eachTouch(p, function (t) { delete t.at; });
    },
    function (p) { delete p.last_non_direct; },
    function (p) { if (p.first) delete p.first.referrer; },
    function (p) { if (p.first) delete p.first.campaign; },
    function (p) { delete p.first; },
    function (p) { p.click = p.click && p.click.page ? { page: p.click.page } : {}; }
  ];

  function withParam(url, name, value) {
    var u = new URL(url.href);
    u.searchParams.set(name, value);
    return u.href;
  }

  // Returns { href, payload, reduced } or null when even the minimal payload does not fit.
  function fitPayload(destUrl, payload, cfg) {
    var p = clone(payload);
    for (var step = -1; step < REDUCERS.length; step++) {
      if (step >= 0) REDUCERS[step](p);
      var href = withParam(destUrl, cfg.payloadParameter, encodePayload(p));
      if (href.length <= cfg.maxSignupUrlLength) return { href: href, payload: p, reduced: step + 1 };
    }
    return null;
  }

  function buildPayload(record, session, click) {
    var p = { v: PAYLOAD_VERSION };
    if (record && record.first) p.first = record.first;
    if (record && record.last_non_direct) p.last_non_direct = record.last_non_direct;
    if (session && session.id) p.session = { id: session.id, started_at: session.started_at };
    p.click = click;
    return p;
  }

  function makeTouch(page, referrer, at, campaign) {
    var t = { page: page };
    if (referrer) t.referrer = referrer;
    t.at = at;
    if (hasKeys(campaign)) t.campaign = campaign;
    return t;
  }

  function iso(ms) { return new Date(ms).toISOString(); }

  function uuid(win) {
    var c = win && win.crypto;
    try {
      if (c && typeof c.randomUUID === 'function') return c.randomUUID();
      if (c && typeof c.getRandomValues === 'function') {
        var b = new Uint8Array(16);
        c.getRandomValues(b);
        b[6] = (b[6] & 0x0f) | 0x40;
        b[8] = (b[8] & 0x3f) | 0x80;
        var h = '';
        for (var i = 0; i < 16; i++) h += (b[i] + 0x100).toString(16).slice(1);
        return h.slice(0, 8) + '-' + h.slice(8, 12) + '-' + h.slice(12, 16) + '-' + h.slice(16, 20) + '-' + h.slice(20);
      }
    } catch (e) { /* fall through */ }
    return null; // never a predictable id
  }

  // ---------------------------------------------------------------- browser

  function storageApi(win, name) {
    var s = null;
    try {
      s = win[name];
      s.setItem('__sw_attr_t', '1');
      s.removeItem('__sw_attr_t');
    } catch (e) {
      s = null;
    }
    return {
      ok: !!s,
      get: function (k) {
        if (!s) return null;
        try { var v = s.getItem(k); return v ? JSON.parse(v) : null; } catch (e) { return null; }
      },
      set: function (k, v) {
        if (!s) return false;
        try { s.setItem(k, JSON.stringify(v)); return true; } catch (e) { return false; }
      },
      del: function (k) {
        if (!s) return;
        try { s.removeItem(k); } catch (e) { /* ignore */ }
      }
    };
  }

  // The visitor's Termly decision for one category. Termly's own API wins when its banner script is
  // on the page. Pages without it (landing, demos, docs) share the origin's localStorage, so a decision
  // made on a page that runs Termly is still readable there; that cache is Termly's internal format,
  // so anything unexpected reads as "no". `state` is a consentState object from Termly's consent event.
  function termlyConsent(win, category, state) {
    try {
      if (state && typeof state[category] === 'boolean') return state[category];
      var T = win.Termly;
      if (T && typeof T.getConsentState === 'function') {
        var live = T.getConsentState();
        if (live && typeof live[category] === 'boolean') return live[category];
      }
    } catch (e) { /* fall through to the stored decision */ }
    try {
      var raw = win.localStorage.getItem('TERMLY_API_CACHE');
      var cache = raw ? JSON.parse(raw) : null;
      var entry = cache && cache.TERMLY_COOKIE_CONSENT;
      var value = entry && entry.value;
      if (typeof value === 'string') value = JSON.parse(value);
      return !!(value && value[category] === true);
    } catch (e) {
      return false;
    }
  }

  function persistenceAllowed(win, cfg, termlyState) {
    if (cfg.consent === 'persistent') return true;
    if (cfg.consent === 'termly') return termlyConsent(win, cfg.termlyCategory, termlyState);
    if (cfg.consent && cfg.consent !== 'session') {
      try { var f = win[cfg.consent]; return typeof f === 'function' && f() === true; } catch (e) { return false; }
    }
    return false;
  }

  function redactForLog(p, cfg) {
    var c = clone(p);
    eachTouch(c, function (t) {
      if (!t.campaign) return;
      for (var i = 0; i < cfg.clickIdKeys.length; i++) if (t.campaign[cfg.clickIdKeys[i]]) t.campaign[cfg.clickIdKeys[i]] = '[redacted]';
    });
    if (c.session && c.session.id) c.session.id = String(c.session.id).slice(0, 8) + '...';
    if (c.click && c.click.id) c.click.id = String(c.click.id).slice(0, 8) + '...';
    return c;
  }

  function boot(win) {
    if (win.__swAttrLoaded) return;
    win.__swAttrLoaded = true;

    var cfg = mergeConfig(DEFAULTS, win.SW_ATTR_CONFIG);
    var doc = win.document;
    var loc = win.location;
    var WRITTEN = '__swAttrHref';

    var api = { version: VERSION, decode: decodePayload };
    api.buildSignupUrl = function (target) { return target; };
    win.SignalWireAttribution = api;
    if (cfg.rollout !== 'on' && cfg.rollout !== 'canary') return; // 'off' or unknown

    var sess = storageApi(win, 'sessionStorage');
    var local = storageApi(win, 'localStorage');
    var memory = { record: null, session: null, canary: false };
    var persistent = persistenceAllowed(win, cfg) && local.ok;
    var recStore = persistent ? local : sess;
    if (!persistent && local.ok) local.del(cfg.storageKey); // consent withdrawn or never given

    var debugOn = !!cfg.debug;
    try { if (new URL(loc.href).searchParams.get('sw_attr_debug') === '1') { debugOn = true; sess.set('sw_attr_debug', 1); } } catch (e) { /* ignore */ }
    if (sess.get('sw_attr_debug') === 1) debugOn = true;

    function log(label, obj) {
      if (debugOn && win.console && win.console.info) win.console.info('[sw_attr] ' + label, obj === undefined ? '' : obj);
    }

    function canary() {
      if (memory.canary) return true;
      return sess.get(cfg.canaryKey) === 1;
    }

    function active() {
      return cfg.rollout === 'on' || (cfg.rollout === 'canary' && canary());
    }

    function loadRecord(now) {
      var r = recStore.ok ? recStore.get(cfg.storageKey) : memory.record;
      if (!r || r.v !== PAYLOAD_VERSION || !r.expires_at || Date.parse(r.expires_at) < now) r = { v: PAYLOAD_VERSION };
      return r;
    }

    function saveRecord(r) {
      memory.record = r;
      if (recStore.ok) recStore.set(cfg.storageKey, r);
    }

    function loadSession(now) {
      var s = sess.ok ? sess.get(cfg.sessionKey) : memory.session;
      if (!s || !s.id || typeof s.last !== 'number' || now - s.last > cfg.sessionIdleMinutes * 60000) {
        s = { id: uuid(win), started_at: iso(now), last: now, touch: '', page: null, prev: null };
      }
      return s;
    }

    function saveSession(s) {
      memory.session = s;
      if (sess.ok) sess.set(cfg.sessionKey, s);
    }

    var lastHref = null;

    function processLocation(initial) {
      var now = Date.now();
      var href = loc.href;
      lastHref = href;
      var u = parseHttpUrl(href);
      if (!u) return;
      if (u.searchParams.get(cfg.canaryFlag) === '1') {
        memory.canary = true;
        sess.set(cfg.canaryKey, 1);
      }
      var page = sanitizePage(href, cfg);
      var campaign = readCampaign(u.search, cfg, !persistent);
      var referrer = initial ? sanitizeReferrer(doc.referrer, cfg) : null;
      var kind = classifyEntry(campaign, referrer, cfg, loc.hostname);
      var external = referrer && classifyEntry({}, referrer, cfg, loc.hostname) === 'referral' ? referrer : null;
      var touch = makeTouch(page, external, iso(now), campaign);

      var rec = loadRecord(now);
      var s = loadSession(now);
      if (!rec.first) {
        rec.first = touch;
        rec.expires_at = iso(now + cfg.firstTouchTtlDays * 86400000);
      }
      if (kind !== 'direct') {
        var key = touchKey(kind, campaign, external);
        if (key && key !== s.touch) {
          rec.last_non_direct = touch;
          s.touch = key;
        }
      }
      if (page !== s.page) {
        s.prev = s.page;
        s.page = page;
      }
      s.last = now;
      saveRecord(rec);
      saveSession(s);
      log('touch ' + kind, redactForLog({ first: rec.first, last_non_direct: rec.last_non_direct }, cfg));
    }

    // Consent can arrive (or be withdrawn) after the page loaded: a click on the banner, implied
    // consent on scroll, or a decision made in another tab. On a grant, the click ids in the current
    // URL belong to this visit (Framer carries them onto internal URLs), so they are added to the
    // touches recorded in this session, and the record moves to localStorage. On a withdrawal, click
    // ids are stripped and the persistent copy is deleted.
    function eachTouchOf(rec, fn) {
      var seen = [];
      var list = [rec.first, rec.last_non_direct];
      for (var i = 0; i < list.length; i++) {
        if (list[i] && seen.indexOf(list[i]) === -1) { seen.push(list[i]); fn(list[i]); }
      }
    }

    function adoptClickIds(rec, now) {
      var u = parseHttpUrl(loc.href);
      var c = u ? readCampaign(u.search, cfg, false) : {};
      var ids = {};
      var any = false;
      for (var i = 0; i < cfg.clickIdKeys.length; i++) {
        var k = cfg.clickIdKeys[i];
        if (c[k]) { ids[k] = c[k]; any = true; }
      }
      if (!any) return;
      var started = loadSession(now).started_at;
      eachTouchOf(rec, function (t) {
        if (!t.at || (started && t.at < started)) return; // an earlier visit's touch: not this click
        t.campaign = t.campaign || {};
        for (var key in ids) if (HAS.call(ids, key) && !t.campaign[key]) t.campaign[key] = ids[key];
      });
    }

    function stripClickIds(rec) {
      eachTouchOf(rec, function (t) {
        if (!t.campaign) return;
        for (var i = 0; i < cfg.clickIdKeys.length; i++) delete t.campaign[cfg.clickIdKeys[i]];
        var empty = true;
        for (var key in t.campaign) if (HAS.call(t.campaign, key)) { empty = false; break; }
        if (empty) delete t.campaign;
      });
    }

    // Touches from earlier visits exist only because the visitor had consented; keep this visit's.
    function forgetEarlierVisits(rec, now) {
      var started = loadSession(now).started_at;
      var current = function (t) { return t && t.at && (!started || t.at >= started); };
      if (!current(rec.last_non_direct)) delete rec.last_non_direct;
      if (!current(rec.first)) {
        if (rec.last_non_direct) rec.first = rec.last_non_direct;
        else delete rec.first;
      }
    }

    function refreshConsent(reason, termlyState) {
      var allowed = persistenceAllowed(win, cfg, termlyState) && local.ok;
      if (allowed === persistent) return;
      var now = Date.now();
      var rec = loadRecord(now); // from the store in use until now
      persistent = allowed;
      recStore = persistent ? local : sess;
      if (persistent) {
        adoptClickIds(rec, now);
      } else {
        stripClickIds(rec);
        forgetEarlierVisits(rec, now);
        local.del(cfg.storageKey);
      }
      if (!rec.expires_at) rec.expires_at = iso(now + cfg.firstTouchTtlDays * 86400000);
      saveRecord(rec);
      if (persistent && sess.ok) sess.del(cfg.storageKey);
      log('consent ' + (persistent ? 'granted' : 'withdrawn') + ' (' + reason + ')',
        redactForLog({ first: rec.first, last_non_direct: rec.last_non_direct }, cfg));
      try { redecorateAll(); } catch (e) { /* links are also refreshed at click time */ }
    }

    function clickContext(cta) {
      var now = Date.now();
      var s = loadSession(now);
      var c = { id: uuid(win), at: iso(now), page: sanitizePage(loc.href, cfg) };
      if (!c.id) delete c.id;
      var dr = sanitizeReferrer(doc.referrer, cfg);
      if (dr) c.document_referrer = dr;
      if (s.prev && s.prev !== c.page) c.previous_internal_page = s.prev;
      if (cta) c.cta_id = cta;
      s.last = now;
      saveSession(s);
      return { click: c, session: s };
    }

    function signupHref(rawHref, ctaHint) {
      var prep = prepareTarget(rawHref, cfg, loc.href);
      if (!prep) return null;
      var cta = prep.cta || ctaHint || null;
      var now = Date.now();
      var ctx = clickContext(cta);
      var payload = buildPayload(loadRecord(now), ctx.session, ctx.click);
      var fit = fitPayload(prep.url, payload, cfg);
      return { href: fit ? fit.href : prep.url.href, cta: cta, payload: fit ? fit.payload : null };
    }

    function locationChanged() { return loc.href !== lastHref; }

    function decorateAnchor(a, fresh) {
      if (!active()) return null; // canary without the flag, or off: leave links exactly as they are
      var raw = a.getAttribute('href');
      if (!raw) return null;
      if (!fresh && a[WRITTEN] === raw) return null;
      var hint = a.getAttribute('data-sw-cta');
      var out = signupHref(raw, hint);
      if (!out) return null;
      if (out.cta && out.cta !== hint) a.setAttribute('data-sw-cta', out.cta);
      a[WRITTEN] = out.href;
      if (out.href !== raw) a.setAttribute('href', out.href);
      return out;
    }

    var selector = (function () {
      var parts = [];
      for (var i = 0; i < cfg.signupDestinations.length; i++) parts.push('a[href*="' + String(cfg.signupDestinations[i].path).replace(/"/g, '') + '"]');
      return parts.join(',');
    })();

    function decorateAll() {
      var list = doc.querySelectorAll(selector);
      for (var i = 0; i < list.length; i++) {
        try { decorateAnchor(list[i], false); } catch (e) { /* keep going */ }
      }
    }

    // After a consent change: rewrite links already decorated with the old payload.
    function redecorateAll() {
      var list = doc.querySelectorAll(selector);
      for (var i = 0; i < list.length; i++) {
        try { decorateAnchor(list[i], true); } catch (e) { /* keep going */ }
      }
    }

    var pending = false;
    function schedule() {
      if (pending) return;
      pending = true;
      win.setTimeout(function () {
        pending = false;
        try {
          if (locationChanged()) processLocation(false);
          decorateAll();
        } catch (e) { /* ignore */ }
      }, 50);
    }

    function anchorFromEvent(ev) {
      var path = typeof ev.composedPath === 'function' ? ev.composedPath() : [];
      for (var i = 0; i < path.length; i++) {
        var n = path[i];
        if (n && n.tagName === 'A' && n.getAttribute && n.getAttribute('href') != null) return n;
      }
      var t = ev.target;
      return t && t.closest ? t.closest('a[href]') : null;
    }

    function onActivate(ev) {
      try {
        var a = anchorFromEvent(ev);
        if (!a) return;
        if (locationChanged()) processLocation(false);
        var out = decorateAnchor(a, true);
        if (out && out.payload) log('signup ' + ev.type, redactForLog(out.payload, cfg));
      } catch (e) { /* signup must never be blocked */ }
    }

    api.buildSignupUrl = function (target, ctaId) {
      try {
        if (!active()) return target;
        if (locationChanged()) processLocation(false);
        var out = signupHref(target, ctaId);
        return out ? out.href : target;
      } catch (e) {
        return target;
      }
    };
    api.refresh = schedule;
    if (debugOn) {
      api.debug = {
        config: cfg,
        state: function () {
          var now = Date.now();
          return { active: active(), persistent: persistent, record: redactForLog(loadRecord(now), cfg), session: loadSession(now) };
        }
      };
    }

    processLocation(true);
    doc.addEventListener('click', onActivate, true);
    doc.addEventListener('auxclick', onActivate, true);
    doc.addEventListener('contextmenu', onActivate, true);
    win.addEventListener('popstate', schedule);
    win.addEventListener('pageshow', schedule);
    if (typeof win.MutationObserver === 'function') {
      new win.MutationObserver(function (records) {
        for (var i = 0; i < records.length; i++) {
          var r = records[i];
          if (r.type === 'attributes' && r.target && r.target[WRITTEN] === r.target.getAttribute('href')) continue;
          schedule();
          return;
        }
      }).observe(doc.documentElement, { subtree: true, childList: true, attributes: true, attributeFilter: ['href'] });
    }
    decorateAll();

    if (cfg.consent === 'termly') {
      // Termly may load after this script; give it up to ten seconds to appear. Pages without it
      // still hear about a decision made in another tab through the storage event.
      var hooked = false;
      var hookTermly = function () {
        var T = win.Termly;
        if (hooked || !T || typeof T.on !== 'function') return hooked;
        try {
          T.on('consent', function (d) { refreshConsent('termly', d && d.consentState); });
          hooked = true;
        } catch (e) { return false; }
        refreshConsent('termly ready');
        return true;
      };
      if (!hookTermly() && typeof win.setInterval === 'function') {
        var tries = 0;
        var timer = win.setInterval(function () {
          if (hookTermly() || ++tries >= 40) win.clearInterval(timer);
        }, 250);
      }
      win.addEventListener('storage', function (e) {
        if (!e || e.key === null || e.key === 'TERMLY_API_CACHE') refreshConsent('storage');
      });
    }

    log('ready', { rollout: cfg.rollout, active: active(), persistent: persistent, consent: cfg.consent });
  }

  return {
    VERSION: VERSION,
    PAYLOAD_VERSION: PAYLOAD_VERSION,
    DEFAULTS: DEFAULTS,
    mergeConfig: mergeConfig,
    parseHttpUrl: parseHttpUrl,
    normalizePath: normalizePath,
    sanitizePage: sanitizePage,
    sanitizeReferrer: sanitizeReferrer,
    readCampaign: readCampaign,
    isFirstPartyHost: isFirstPartyHost,
    classifyEntry: classifyEntry,
    touchKey: touchKey,
    matchDestination: matchDestination,
    prepareTarget: prepareTarget,
    encodePayload: encodePayload,
    decodePayload: decodePayload,
    fitPayload: fitPayload,
    buildPayload: buildPayload,
    makeTouch: makeTouch,
    termlyConsent: termlyConsent,
    persistenceAllowed: persistenceAllowed,
    boot: boot
  };
});
