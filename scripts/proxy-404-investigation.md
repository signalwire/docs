# Proxy 404 Investigation Report

**Date:** 2026-03-03
**Issue:** Documentation pages return 404 through the `signalwire.com/docs` proxy while the same pages load fine on the Fern origin (`signalwire.docs.buildwithfern.com`).

**Current impact:** 37 of 1,248 sitemap pages are 404 through the proxy. The number is growing — pages that were working convert to 404 as their ISR caches go stale.

## Architecture

```
User Browser
    │
    ▼
signalwire.com/docs/*        (nginx reverse proxy, 34.172.68.73 GCP)
    │
    ▼
Vercel SFO edge (sfo1)       ← always SFO, never varies
    │
    ▼
Fern Next.js app (ISR)       ← renders 404 on SFO, renders 200 on IAD
```

```
User Browser (direct)
    │
    ▼
signalwire.docs.buildwithfern.com   (Vercel anycast)
    │
    ▼
Vercel IAD edge (iad1)       ← always IAD from our test location
    │
    ▼
Fern Next.js app (ISR)       ← renders 200 for everything (even fake URLs)
```

## What we know

### 1. The proxy is pinned to the SFO Vercel edge

Every request through `signalwire.com` routes to `sfo1`. Every direct request to `signalwire.docs.buildwithfern.com` routes to `iad1`. This is deterministic — tested across multiple URLs, multiple times:

```bash
# All 5 requests go to sfo1
for i in 1 2 3 4 5; do
  curl -sI "https://signalwire.com/docs/swml" | grep -i x-vercel-id
done
```

```
X-Vercel-Id: sfo1::sfo1::7jm9t-...-50cc8c355507
X-Vercel-Id: sfo1::sfo1::tf74p-...-c0883cea871d
X-Vercel-Id: sfo1::sfo1::rsc9x-...-82635a88597c
X-Vercel-Id: sfo1::sfo1::rsc9x-...-ebf0eda59557
X-Vercel-Id: sfo1::sfo1::9vbts-...-c012b980c539
```

```bash
# All 5 requests go to iad1
for i in 1 2 3 4 5; do
  curl -sI "https://signalwire.docs.buildwithfern.com/docs/swml" | grep -i x-vercel-id
done
```

```
X-Vercel-Id: iad1::iad1::ps4g9-...-85d3274fc458
X-Vercel-Id: iad1::iad1::5k8nh-...-a37a651df1f6
X-Vercel-Id: iad1::iad1::rzprs-...-31e3a14246ba
X-Vercel-Id: iad1::iad1::7svn4-...-9ed16627f7d1
X-Vercel-Id: iad1::iad1::hqq67-...-9ed16627f7d1
```

### 2. The SFO edge freshly renders 404 — this is not just stale caching

When a page has no cache entry on SFO, Vercel renders it fresh. **The fresh render itself returns 404:**

```bash
curl -sI "https://signalwire.com/docs/sdks/reference/browser-sdk/relay-v3/video/video-room-session" \
  | grep -iE "^HTTP|x-vercel-cache|^age:"
```

```
HTTP/1.1 404 Not Found
Age: 0                    ← freshly rendered, not cached
X-Vercel-Cache: MISS      ← cache miss, page was rendered on-demand
```

The same page on the origin:

```bash
curl -sI "https://signalwire.docs.buildwithfern.com/docs/sdks/reference/browser-sdk/relay-v3/video/video-room-session" \
  | grep -iE "^HTTP|x-vercel-cache|^age:"
```

```
HTTP/1.1 200 OK
Age: 1226
X-Vercel-Cache: STALE
```

**The SFO Vercel edge cannot correctly render pages for this deployment.** The ISR revalidation process on SFO produces 404, so stale 404 caches never heal — they just get replaced by fresh 404s.

### 3. The Fern origin never returns HTTP 404

The origin returns HTTP 200 for **every URL**, including completely fake paths:

```bash
curl -s -o /dev/null -w "%{http_code}" \
  "https://signalwire.docs.buildwithfern.com/docs/this-page-definitely-does-not-exist-xyz"
```

```
200
```

This is standard Next.js behavior — the catch-all route renders a client-side "not found" UI with HTTP 200. The HTTP 404 status codes are only produced by the SFO edge's rendering pipeline.

### 4. Requesting pages through the proxy degrades them

During testing, we observed pages that were cached as 200 on SFO convert to 404 after their ISR cache went stale and SFO attempted to revalidate. For example, `/docs/swml/methods/ai` was initially 200 through the proxy. After we requested it when its cache was stale:

```bash
# Before: page was cached as 200
curl -sI "https://signalwire.com/docs/swml/methods/ai" | grep -iE "^HTTP|x-vercel-cache|^age:"
```

```
HTTP/1.1 404 Not Found
Age: 0
X-Vercel-Cache: MISS      ← SFO tried to re-render, got 404, cached it
```

After this, the page remains 404:

```
HTTP/1.1 404 Not Found
Age: 1295
X-Vercel-Cache: STALE
```

**The number of affected pages grows over time** as more ISR caches expire and SFO re-renders them as 404.

### 5. Self-healing does not work

The original investigation reported that 30/95 pages self-healed after a 3-second delay. We could not reproduce this. Tested with delays of 5s, 10s, 20s, and burst of 20 parallel requests — the 404 persists:

```bash
path="/docs/server-sdk/v2/go/reference/calling/actions/record"

# Request 1 — STALE, triggers background revalidation
curl -sI "https://signalwire.com${path}" | grep -iE "^HTTP|x-vercel-cache|^age:"
# HTTP/1.1 404 Not Found / Age: 74914 / X-Vercel-Cache: STALE

sleep 10

# Request 2 — still 404, age still increasing (revalidation did not produce 200)
curl -sI "https://signalwire.com${path}" | grep -iE "^HTTP|x-vercel-cache|^age:"
# HTTP/1.1 404 Not Found / Age: 74924 / X-Vercel-Cache: STALE

sleep 10

# Request 3 — still 404
curl -sI "https://signalwire.com${path}" | grep -iE "^HTTP|x-vercel-cache|^age:"
# HTTP/1.1 404 Not Found / Age: 74934 / X-Vercel-Cache: STALE
```

Burst of 20 parallel requests also has no effect:

```bash
for i in $(seq 1 20); do
  curl -s -o /dev/null -w "%{http_code} " "https://signalwire.com/docs/swml/methods/ai" &
done; wait
# 404 404 404 404 404 404 404 404 404 404 404 404 404 404 404 404 404 404 404 404
```

### 6. Standard cache bypass headers have no effect

Tested `Cache-Control: no-cache`, `Pragma: no-cache`, `Cache-Control: no-cache, no-store, must-revalidate`, and `If-None-Match` with a fake etag. All return 404:

```bash
path="/docs/server-sdk/v2/ruby/reference/calling/results/fax"

curl -s -o /dev/null -w "%{http_code}\n" "https://signalwire.com${path}"
# 404

curl -s -o /dev/null -w "%{http_code}\n" -H "Cache-Control: no-cache" "https://signalwire.com${path}"
# 404

curl -s -o /dev/null -w "%{http_code}\n" -H "Pragma: no-cache" \
  -H "Cache-Control: no-cache, no-store, must-revalidate" "https://signalwire.com${path}"
# 404

curl -s -o /dev/null -w "%{http_code}\n" \
  -H 'If-None-Match: "fake-etag"' "https://signalwire.com${path}"
# 404
```

Vercel's ISR cache is internal to their platform and does not honor standard HTTP cache-control request headers.

### 7. User-Agent does not affect the response

Tested curl default UA, Chrome UA, Googlebot UA, and empty UA on the same stuck-404 URL. All return 404 with the same cache age:

```bash
path="/docs/server-sdk/v2/php/reference/calling/results/dial"

curl -sI "https://signalwire.com${path}" | grep -iE "^HTTP|^age:"
# HTTP/1.1 404 Not Found / Age: 74816

curl -sI -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" \
  "https://signalwire.com${path}" | grep -iE "^HTTP|^age:"
# HTTP/1.1 404 Not Found / Age: 74817

curl -sI -H "User-Agent: Googlebot/2.1 (+http://www.google.com/bot.html)" \
  "https://signalwire.com${path}" | grep -iE "^HTTP|^age:"
# HTTP/1.1 404 Not Found / Age: 74817

curl -sI -H "User-Agent: " "https://signalwire.com${path}" | grep -iE "^HTTP|^age:"
# HTTP/1.1 404 Not Found / Age: 74817
```

### 8. sitemap.xml is blocked by nginx (not Vercel)

The proxy returns 404 for `sitemap.xml` with `Server: nginx` — nginx itself is returning the 404 without forwarding to Vercel:

```bash
curl -sI "https://signalwire.com/docs/sitemap.xml" | grep -iE "^HTTP|server|content-type"
```

```
HTTP/1.1 404 Not Found
Server: nginx
Content-Type: text/html; charset=UTF-8
```

```bash
curl -sI "https://signalwire.docs.buildwithfern.com/docs/sitemap.xml" | grep -iE "^HTTP|server|content-type"
```

```
HTTP/1.1 200 OK
Server: Vercel
Content-Type: application/xml
```

This is a separate nginx configuration issue — the proxy `location` block likely doesn't match `.xml` files.

## How to reproduce

### Show proxy 404 vs origin 200

Pick any path from the current failures list and compare:

```bash
# Through proxy — 404 on SFO edge
curl -sI "https://signalwire.com/docs/server-sdk/v2/dotnet/reference/calling/call-device" \
  | grep -iE "^HTTP|x-vercel-cache|x-vercel-id|^age:|cache-control"

# Direct to origin — 200 on IAD edge
curl -sI "https://signalwire.docs.buildwithfern.com/docs/server-sdk/v2/dotnet/reference/calling/call-device" \
  | grep -iE "^HTTP|x-vercel-cache|x-vercel-id|^age:|cache-control"
```

Expected output:

```
HTTP/1.1 404 Not Found
Age: <high number>
Cache-Control: public, max-age=0, must-revalidate
X-Vercel-Cache: STALE
X-Vercel-Id: sfo1::sfo1::...

HTTP/1.1 200 OK
Age: <varies>
Cache-Control: public, max-age=0, must-revalidate
X-Vercel-Cache: HIT or STALE
X-Vercel-Id: iad1::iad1::...
```

### Show that the origin returns 200 for any URL

```bash
# Completely fake URL — origin still returns 200
curl -s -o /dev/null -w "%{http_code}\n" \
  "https://signalwire.docs.buildwithfern.com/docs/this-does-not-exist"
# 200

# Same fake URL through proxy — 404
curl -s -o /dev/null -w "%{http_code}\n" \
  "https://signalwire.com/docs/this-does-not-exist"
# 404
```

### Scan all sitemap URLs for current failures

```bash
# Fetch sitemap from origin (proxy blocks .xml) and test each URL through the proxy
curl -s "https://signalwire.docs.buildwithfern.com/docs/sitemap.xml" \
  | grep -oP '(?<=<loc>)[^<]+' \
  | while read url; do
      path="${url#https://signalwire.docs.buildwithfern.com}"
      code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "https://signalwire.com${path}")
      [ "$code" != "200" ] && echo "$code $path"
    done
```

### Show that pages degrade from 200 to 404

Find a page that's currently 200 through the proxy but with a stale cache (Age > 300). Requesting it triggers ISR revalidation on SFO, which may produce a 404 and replace the cached 200:

```bash
# Step 1: Find a page that's 200 but stale
path="/docs/swml/methods/ai"  # substitute any currently-200 path
curl -sI "https://signalwire.com${path}" | grep -iE "^HTTP|x-vercel-cache|^age:|x-nextjs-stale"

# If HTTP 200, X-Vercel-Cache: STALE, and Age > 300, the next revalidation may flip it.
# Check again after a few minutes — it may now be 404.
```

**Warning:** This test may break the page. The 404 does not self-heal.

## Currently affected URLs (37 of 1,248)

All failures are under the `server-sdk/v2/` tree:

```
/docs/server-sdk/v2/node/reference/consumer
/docs/server-sdk/v2/node/reference/calling/results/detect
/docs/server-sdk/v2/node/reference/calling/results/refer
/docs/server-sdk/v2/python/reference/task
/docs/server-sdk/v2/ruby/reference/calling
/docs/server-sdk/v2/ruby/reference/calling/actions/play
/docs/server-sdk/v2/ruby/reference/calling/results/answer
/docs/server-sdk/v2/ruby/reference/calling/results/fax
/docs/server-sdk/v2/ruby/reference/calling/results/play-pause
/docs/server-sdk/v2/ruby/reference/calling/results/tap
/docs/server-sdk/v2/ruby/reference/messaging/message
/docs/server-sdk/v2/php/reference/calling/actions/fax
/docs/server-sdk/v2/php/reference/calling/actions/prompt
/docs/server-sdk/v2/php/reference/calling/results/prompt-volume
/docs/server-sdk/v2/php/reference/calling/results/detect
/docs/server-sdk/v2/php/reference/calling/results/dial
/docs/server-sdk/v2/go/reference/calling/actions/record
/docs/server-sdk/v2/go/reference/calling/actions/send-digits
/docs/server-sdk/v2/go/reference/calling/call
/docs/server-sdk/v2/go/reference/messaging/send-result
/docs/server-sdk/v2/dotnet/reference/calling/actions/connect
/docs/server-sdk/v2/dotnet/reference/calling/actions/fax
/docs/server-sdk/v2/dotnet/reference/calling/actions/tap
/docs/server-sdk/v2/dotnet/reference/calling/call-collect-digits-params
/docs/server-sdk/v2/dotnet/reference/calling/call-collect-type
/docs/server-sdk/v2/dotnet/reference/calling/call-device
/docs/server-sdk/v2/dotnet/reference/calling/call-media-ringtone-params
/docs/server-sdk/v2/dotnet/reference/calling/call-record-state
/docs/server-sdk/v2/dotnet/reference/calling/call-ringback-audio-params
/docs/server-sdk/v2/dotnet/reference/calling/call-ringback-type
/docs/server-sdk/v2/dotnet/reference/calling/call-tap-audio-direction
/docs/server-sdk/v2/dotnet/reference/calling/call-tap-device
/docs/server-sdk/v2/dotnet/reference/calling/detect-result-type
/docs/server-sdk/v2/dotnet/reference/calling/results/detect
/docs/server-sdk/v2/dotnet/reference/calling/results/dial
/docs/server-sdk/v2/dotnet/reference/calling/call
/docs/server-sdk/v2/dotnet/reference/calling/disconnect-reason
```

Additional pages broken during this investigation (ISR revalidation converted cached 200 to 404):

```
/docs/swml/methods/ai
/docs/home
/docs/rest-apis
```

## Summary

The SFO Vercel edge is unable to correctly render pages for this Fern deployment. When a page's ISR cache expires and SFO attempts to re-render it, the render process returns 404 — even though the same app on the IAD edge renders 200 for all URLs. The nginx proxy is pinned to SFO, so all proxy traffic hits this broken edge. The problem worsens over time as more cached 200s expire and get replaced with 404s.

This is a Vercel platform issue, not a caching TTL issue. No combination of HTTP headers can fix it from the client side.
