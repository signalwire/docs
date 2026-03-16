#!/usr/bin/env python3
"""Fix broken internal links found by link checker.

Builds a slug index from all .mdx files, parses a broken-link report,
applies a cascade of correction rules, then rewrites source files.

Usage:
    python scripts/fix-broken-links.py                           # dry-run (default)
    python scripts/fix-broken-links.py --apply                   # rewrite files
    python scripts/fix-broken-links.py --apply --confidence auto  # only deterministic fixes
    python scripts/fix-broken-links.py --report fixes.csv        # export CSV
"""

import csv
import os
import re
import sys
from collections import defaultdict

# ---------------------------------------------------------------------------
# CLI flags
# ---------------------------------------------------------------------------
APPLY = '--apply' in sys.argv
CONFIDENCE_FILTER = None
REPORT_PATH = None
for i, arg in enumerate(sys.argv):
    if arg == '--confidence' and i + 1 < len(sys.argv):
        CONFIDENCE_FILTER = sys.argv[i + 1]
    if arg == '--report' and i + 1 < len(sys.argv):
        REPORT_PATH = sys.argv[i + 1]

# ---------------------------------------------------------------------------
# Product / version mapping (mirrors docs.yml)
# ---------------------------------------------------------------------------
PRODUCTS = [
    # (product_slug, directory, [(version_slug, version_dir), ...])
    ('server-sdk', 'realtime-sdk', [
        ('v4', 'latest'), ('', 'latest'),   # versionless = latest
        ('v3', 'v3'),
        ('v2', 'v2'),
    ]),
    ('browser-sdk', 'browser-sdk', [
        ('v3', 'latest'), ('', 'latest'),
        ('v2', 'v2'),
    ]),
    ('platform', 'platform', [('', '')]),
    ('swml', 'swml', [('', '')]),
    ('agents-sdk', 'agents-sdk', [('', '')]),
    ('compatibility-api', 'compatibility-api', [('', '')]),
    ('call-flow-builder', 'call-flow-builder', [('', '')]),
    ('apis', 'apis', [('', '')]),
    ('home', 'home', [('', '')]),
]


def get_slug(path):
    """Extract slug from frontmatter."""
    try:
        with open(path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read(1000)
    except OSError:
        return None
    m = re.search(r'^slug:\s*(.+)', content, re.MULTILINE)
    return m.group(1).strip() if m else None


# ---------------------------------------------------------------------------
# Step 1: Build slug index
# ---------------------------------------------------------------------------
def build_slug_index():
    """Returns slug_to_file: full_url_path -> source_file_path"""
    slug_to_file = {}

    for product_slug, product_dir, versions in PRODUCTS:
        base_dir = f'fern/products/{product_dir}'
        if not os.path.isdir(base_dir):
            continue

        for version_slug, version_dir in versions:
            if version_dir:
                pages_dir = os.path.join(base_dir, 'pages', version_dir)
            else:
                pages_dir = os.path.join(base_dir, 'pages')
            if not os.path.isdir(pages_dir):
                continue

            for root, _, files in os.walk(pages_dir):
                for f in files:
                    if not f.endswith('.mdx') and not f.endswith('.md'):
                        continue
                    filepath = os.path.join(root, f)
                    slug = get_slug(filepath)
                    if not slug:
                        continue

                    # Build full URL: /docs/{product}/{version}{slug}
                    slug = slug.rstrip('/')
                    if not slug.startswith('/'):
                        slug = '/' + slug

                    if version_slug:
                        full = f'/docs/{product_slug}/{version_slug}{slug}'
                    elif product_slug == '/':
                        full = f'/docs{slug}'
                    else:
                        full = f'/docs/{product_slug}{slug}'

                    slug_to_file[full] = filepath.replace(os.sep, '/')

    return slug_to_file


# ---------------------------------------------------------------------------
# Step 2: Parse report
# ---------------------------------------------------------------------------
def parse_report(report_path):
    """Parse markdown table -> list of (broken_url, found_on_url)."""
    entries = []
    with open(report_path, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line.startswith('|'):
                continue
            parts = [p.strip() for p in line.split('|')]
            if len(parts) < 4:
                continue
            url = parts[1]
            found_on = parts[3]
            if url.startswith('http'):
                url = re.sub(r'^https?://signalwire\.com', '', url)
                found_on = re.sub(r'^https?://signalwire\.com', '', found_on)
                entries.append((url, found_on))
    return entries


# ---------------------------------------------------------------------------
# Step 3: Correction cascade
# ---------------------------------------------------------------------------
def split_anchor(url):
    """Split URL into (path, anchor_or_None)."""
    if '#' in url:
        path, anchor = url.rsplit('#', 1)
        return path, anchor
    return url, None


# Default version for versioned products (latest stable)
LATEST_VERSIONS = {
    'server-sdk': 'v4',
    'browser-sdk': 'v3',
}


# URLs confirmed deleted — link text should be kept but href removed
DELETED_URLS = {
    '/docs/platform/basics/how-to-test-with-ngrok',
    '/docs/platform/call-fabric/ai-agents',
    '/platform/basics/how-to-test-with-ngrok',
    '/platform/call-fabric/ai-agents',
}


def normalize_version(url):
    """Add default version prefix for versioned products if missing.

    e.g. /docs/browser-sdk/js/... -> /docs/browser-sdk/v3/js/...
         /docs/server-sdk/node/... -> /docs/server-sdk/v4/node/...
    Already-versioned URLs are left unchanged.
    """
    for product, version in LATEST_VERSIONS.items():
        prefix = f'/docs/{product}/'
        if not url.startswith(prefix):
            continue
        rest = url[len(prefix):]
        # Already has a version prefix?
        if re.match(r'v\d+/', rest):
            return url
        # Insert the default version
        return f'{prefix}{version}/{rest}'
    return url


def try_fix(broken_url, slug_index):
    """Apply correction rules. Returns (fixed_url, confidence, rule) or None.

    For deleted pages, returns ('DELETED', 'auto', 'deleted') — caller
    should strip the link wrapper and keep only the link text.
    """
    path, anchor = split_anchor(broken_url)

    # Check if URL is confirmed deleted
    check = path if path.startswith('/docs/') else '/docs' + path if path.startswith('/') else path
    if path in DELETED_URLS or check in DELETED_URLS:
        return 'DELETED', 'auto', 'deleted'

    def exists(p):
        return p in slug_index or p + '/' in slug_index or p.rstrip('/') in slug_index

    def with_anchor(p, a):
        return f'{p}#{a}' if a else p

    # Ensure /docs/ prefix
    if not path.startswith('/docs/'):
        candidate = '/docs' + path if path.startswith('/') else '/docs/' + path
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'add-docs-prefix'
        # Try remaining rules with the /docs-prefixed version
        path_prefixed = candidate
    else:
        path_prefixed = path

    # Rule 1: Strip .mdx/.md extension
    stripped = re.sub(r'\.(mdx|md)$', '', path_prefixed)
    if stripped != path_prefixed and exists(stripped):
        return with_anchor(stripped, anchor), 'auto', 'strip-extension'

    # Rule 2: Strip -result suffix (v2 SDK results pages)
    # e.g. /docs/server-sdk/v2/python/reference/calling/results/play-result
    #   -> /docs/server-sdk/v2/python/reference/calling/results/play
    result_stripped = re.sub(r'-result$', '', path_prefixed)
    if result_stripped != path_prefixed and exists(result_stripped):
        return with_anchor(result_stripped, anchor), 'auto', 'strip-result-suffix'

    # Rule 2b: Strip .mdx AND -result
    stripped_then_result = re.sub(r'-result$', '', stripped)
    if stripped_then_result != stripped and exists(stripped_then_result):
        return with_anchor(stripped_then_result, anchor), 'auto', 'strip-ext-and-result'

    # Rule 3: Fix referencejs/ -> reference/
    refjs_fixed = path_prefixed.replace('/referencejs/', '/reference/')
    if refjs_fixed != path_prefixed:
        if exists(refjs_fixed):
            return with_anchor(refjs_fixed, anchor), 'auto', 'fix-referencejs'
        # Also try with -result strip (combined fix)
        refjs_result = re.sub(r'-result$', '', refjs_fixed)
        if refjs_result != refjs_fixed and exists(refjs_result):
            return with_anchor(refjs_result, anchor), 'auto', 'fix-referencejs+strip-result'

    # Rule 4: Fix node/node/ -> node/
    nodenode_fixed = path_prefixed.replace('/node/node/', '/node/')
    if nodenode_fixed != path_prefixed and exists(nodenode_fixed):
        return with_anchor(nodenode_fixed, anchor), 'auto', 'fix-node-node'

    # Rule 5: Fix reference/dotnet -> dotnet/reference (and other languages)
    for lang in ('dotnet', 'python', 'ruby', 'php', 'go', 'node', 'js'):
        bad = f'/reference/{lang}/'
        good = f'/{lang}/reference/'
        if bad in path_prefixed:
            lang_fixed = path_prefixed.replace(bad, good, 1)
            if exists(lang_fixed):
                return with_anchor(lang_fixed, anchor), 'auto', f'fix-ref-{lang}-order'
            # Also try with -result strip
            lang_result = re.sub(r'-result$', '', lang_fixed)
            if lang_result != lang_fixed and exists(lang_result):
                return with_anchor(lang_result, anchor), 'auto', f'fix-ref-{lang}-order+strip-result'

    # Rule 6: Strip .mdx + anchor -> look for page without anchor
    # (the anchor may refer to a method that became its own page)
    if anchor and exists(stripped):
        return stripped, 'auto', 'strip-ext-drop-anchor'

    # Rule 7: Various known redirects / renames
    KNOWN_MAPPINGS = {
        # Missing /docs/ prefix variants
        '/docs/browser-sdk/js/reference/call-fabric/client': '/docs/browser-sdk/v3/js/reference/signalwire/client',
        '/docs/realtime-sdk/v3/technical-reference': '/docs/server-sdk/v3/node',
        '/docs/rest/signalwire-rest/endpoints': '/docs/apis',
        '/docs/platform/dashboard': '/docs/platform/your-signalwire-api-space',
        '/docs/platform/call-fabric/addresses': '/docs/platform/call-fabric/resources/addresses',
        '/docs/platform/call-fabric/resources': '/docs/platform/resources',
        '/docs/platform/call-fabric#subscribers': '/docs/platform/resources',
        '/docs/rest/signalwire-rest': '/docs/apis',
        '/docs/rest': '/docs/apis',
        '/docs/apis/authorization': '/docs/platform/your-signalwire-api-space',
        '/docs/call-flow-builder/reference': '/docs/call-flow-builder',
        '/docs/call-flow-builder/reference/variables': '/docs/call-flow-builder/reference/set-variables',
        '/docs/platform/voice/sip/get-started': '/docs/platform/voice/sip',
        '/docs/platform/messaging/toll-free-number': '/docs/platform/messaging/hosted-messaging',
    }
    lookup = path_prefixed.split('#')[0]  # strip anchor for lookup
    if lookup in KNOWN_MAPPINGS:
        target = KNOWN_MAPPINGS[lookup]
        if exists(target):
            return with_anchor(target, anchor), 'auto', 'known-redirect'
    # Also try with extension stripped
    lookup_stripped = re.sub(r'\.(mdx|md)$', '', lookup)
    if lookup_stripped != lookup and lookup_stripped in KNOWN_MAPPINGS:
        target = KNOWN_MAPPINGS[lookup_stripped]
        if exists(target):
            return with_anchor(target, anchor), 'auto', 'known-redirect'

    # Rule 8: Fuzzy tail match — match last 2 segments
    tail_parts = path_prefixed.rstrip('/').split('/')
    if len(tail_parts) >= 2:
        tail2 = '/'.join(tail_parts[-2:])
        tail3 = '/'.join(tail_parts[-3:]) if len(tail_parts) >= 3 else None
        candidates = []
        for slug in slug_index:
            if slug.endswith('/' + tail2):
                candidates.append(slug)
        if len(candidates) == 1:
            return with_anchor(candidates[0], anchor), 'fuzzy', 'tail-match-2'
        # Try 3-segment match if ambiguous or no match
        if tail3:
            candidates3 = []
            for slug in slug_index:
                if slug.endswith('/' + tail3):
                    candidates3.append(slug)
            if len(candidates3) == 1:
                return with_anchor(candidates3[0], anchor), 'fuzzy', 'tail-match-3'

    # Rule 9: Browser SDK path mappings
    # /docs/browser-sdk/video/room-session -> /docs/browser-sdk/js/reference/video/room-session
    # /docs/browser-sdk/webrtc -> /docs/browser-sdk/js/reference/webrtc
    # /docs/browser-sdk/pubsub/... -> /docs/browser-sdk/js/reference/pubsub/...
    # /docs/browser-sdk/signalwire-client/... -> /docs/browser-sdk/js/reference/signalwire/...
    # /docs/browser-sdk/guides/... -> /docs/browser-sdk/js/guides/...
    m = re.match(r'^/docs/browser-sdk/(video|webrtc|pubsub|chat|signalwire-client|guides)(/.*)?$', path_prefixed)
    if m:
        section = m.group(1)
        rest = m.group(2) or ''
        if section == 'signalwire-client':
            candidate = f'/docs/browser-sdk/js/reference/signalwire{rest}'
        elif section == 'guides':
            candidate = f'/docs/browser-sdk/js/guides{rest}'
        else:
            candidate = f'/docs/browser-sdk/js/reference/{section}{rest}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'browser-sdk-path-remap'

    # Rule 10: Compatibility API noun pages
    # /docs/compatibility-api/room-noun -> /docs/compatibility-api/cxml/reference/voice/room
    m = re.match(r'^/docs/compatibility-api/(\w+)-noun$', path_prefixed)
    if m:
        noun = m.group(1)
        candidate = f'/docs/compatibility-api/cxml/reference/voice/{noun}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'compat-noun-remap'

    # Rule 11: Compatibility API section remaps
    for old_section in ('conferences', 'calls', 'media', 'voice', 'paging'):
        if f'/docs/compatibility-api/{old_section}' in path_prefixed:
            # Try under sdks/reference or cxml/reference
            rest = path_prefixed.split(f'/docs/compatibility-api/{old_section}')[-1]
            for prefix in ['/docs/compatibility-api/sdks/reference', '/docs/compatibility-api/cxml/reference/voice']:
                candidate = prefix + rest
                if exists(candidate):
                    return with_anchor(candidate, anchor), 'fuzzy', f'compat-{old_section}-remap'

    # Rule 12: Agents SDK path remaps
    # /docs/agents-sdk/building-agents/X -> /docs/agents-sdk/python/guides/X
    # /docs/agents-sdk/advanced/X -> /docs/agents-sdk/python/guides/X
    # /docs/agents-sdk/swaig-functions/X -> /docs/agents-sdk/python/guides/X
    # /docs/agents-sdk/core-concepts/X -> /docs/agents-sdk/python/guides/X
    m = re.match(r'^/docs/agents-sdk/(building-agents|advanced|swaig-functions|core-concepts|deployment|signalwire-integration|reference)/(.+)$', path_prefixed)
    if m:
        rest = m.group(2)
        candidate = f'/docs/agents-sdk/python/guides/{rest}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'fuzzy', 'agents-sdk-remap'

    # Rule 13: Server SDK - old methods/events path structures
    # /docs/server-sdk/node/reference/video/methods/X -> search for X in video subtree
    # /docs/server-sdk/node/reference/video/events.mdx -> /docs/server-sdk/node/reference/video/client/events
    m = re.match(r'^/docs/server-sdk(/v\d+)?/node/reference/(\w+)/methods/(\w+)(?:\.mdx)?$', path_prefixed)
    if m:
        ver = m.group(1) or ''
        namespace = m.group(2)
        method = m.group(3)
        # Convert camelCase to kebab-case
        kebab = re.sub(r'([a-z])([A-Z])', r'\1-\2', method).lower()
        for sub in ['client', 'room-session', '']:
            if sub:
                candidate = f'/docs/server-sdk{ver}/node/reference/{namespace}/{sub}/{kebab}'
            else:
                candidate = f'/docs/server-sdk{ver}/node/reference/{namespace}/{kebab}'
            if exists(candidate):
                return with_anchor(candidate, anchor), 'fuzzy', 'sdk-methods-remap'

    # Rule 14: v2 SDK consumer/task/relay-client top-level pages
    # These used to be at /docs/server-sdk/v2/{lang}/consumer etc
    # Now they may be at /docs/server-sdk/v2/{lang}/reference/consumer
    m = re.match(r'^/docs/server-sdk/v2/(\w+)/(consumer|task|relay-client)$', path_prefixed)
    if m:
        lang = m.group(1)
        page = m.group(2)
        candidate = f'/docs/server-sdk/v2/{lang}/reference/{page}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'v2-toplevel-to-reference'

    # Rule 15: Browser SDK v2 paths
    m = re.match(r'^/docs/browser-sdk/v2/(\w+)$', path_prefixed)
    if m:
        page = m.group(1)
        candidate = f'/docs/browser-sdk/v2/js/reference/{page}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'fuzzy', 'browser-v2-remap'

    # Rule 16: Old class-name .mdx files -> index pages (strip ext + remap)
    # Maps old Docusaurus class-based filenames to Fern kebab-case slug paths.
    # CLASS_REMAPS maps the last URL segment to a FULL path relative to the
    # namespace root (e.g. "reference/"). When the class file is already nested
    # inside the target directory (e.g. room-session/video-roomsession.mdx),
    # we try both appending AND replacing.
    CLASS_REMAPS = {
        'video-roomsession': 'video/room-session',
        'video-roomsessionfullstate': 'video/room-session-full-state',
        'video-roomsessionplayback': 'video/room-session-playback',
        'video-roomsessionrecording': 'video/room-session-recording',
        'video-roomsessionstream': 'video/room-session-stream',
        'video-roomsessionmember': 'video/room-session-member',
        'video-roomsessionscreenshare': 'video/room-session-screen-share',
        'callplayback': 'voice/call-playback',
        'calldetect': 'voice/call-detect',
        'callprompt': 'voice/call-prompt',
        'callrecording': 'voice/call-recording',
        'calltap': 'voice/call-tap',
        'callcollect': 'voice/call-collect',
        'callstate': 'voice/call-state',
        'voice-call': 'voice/call',
        'voice-client': 'voice/client',
        'voice-playlist': 'voice/playlist',
        'voice-devicebuilder': 'voice/device-builder',
        'chat-chatmessage': 'chat/chat-message',
        'chat-chatmember': 'chat/chat-member',
        'chat-client': 'chat/client',
        'pubsub-pubsubmessage': 'pubsub/pubsub-message',
        'pubsub-client': 'pubsub/client',
        'task-client': 'task/client',
    }

    def try_class_remap(base_url, class_seg):
        """Try to resolve a class-name segment via CLASS_REMAPS."""
        if class_seg not in CLASS_REMAPS:
            return None
        remap_path = CLASS_REMAPS[class_seg]
        parent = '/'.join(base_url.rstrip('/').split('/')[:-1])

        # Strategy 1: Replace last segment with full remap path
        # e.g. .../reference/video-roomsession -> .../reference/video/room-session
        candidate = f'{parent}/{remap_path}'
        if exists(candidate):
            return candidate

        # Strategy 2: The class is nested under its own directory (redundant)
        # e.g. .../video/room-session/video-roomsession -> .../video/room-session
        remap_parts = remap_path.split('/')
        parent_parts = parent.split('/')
        if len(remap_parts) > 0 and parent_parts[-1] == remap_parts[-1]:
            if exists(parent):
                return parent

        # Strategy 3: Go up 2 levels and append remap
        grandparent = '/'.join(parent.split('/')[:-1])
        candidate = f'{grandparent}/{remap_path}'
        if exists(candidate):
            return candidate

        # Strategy 4: Find 'reference' base and append remap
        # e.g. .../server-sdk/node/reference/voice/call/callplayback
        #   -> .../server-sdk/node/reference/voice/call-playback
        parts = base_url.split('/')
        for i, p in enumerate(parts):
            if p == 'reference':
                ref_base = '/'.join(parts[:i + 1])
                candidate = f'{ref_base}/{remap_path}'
                if exists(candidate):
                    return candidate
                break

        return None

    if stripped != path_prefixed:  # had .mdx extension
        last_seg = stripped.rstrip('/').split('/')[-1]
        result = try_class_remap(stripped, last_seg)
        if result:
            return with_anchor(result, anchor), 'auto', 'class-name-remap'

    # Rule 17: Old class-name in path (without .mdx extension)
    for class_name in CLASS_REMAPS:
        if path_prefixed.endswith('/' + class_name):
            result = try_class_remap(path_prefixed, class_name)
            if result:
                return with_anchor(result, anchor), 'auto', 'class-name-remap-noext'

    # Rule 18: Server SDK events.mdx -> client/events
    m = re.match(r'^(/docs/server-sdk(?:/v\d+)?/node/reference/\w+)/events(?:\.mdx)?$', path_prefixed)
    if m:
        base = m.group(1)
        candidate = f'{base}/client/events'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'events-to-client-events'

    # Rule 19: Browser SDK events pages
    # /docs/browser-sdk/js/reference/video/events -> /docs/browser-sdk/js/reference/video/room-session/events
    # /docs/browser-sdk/js/reference/chat/events -> /docs/browser-sdk/js/reference/chat/client/events
    # /docs/browser-sdk/js/reference/pubsub/events -> /docs/browser-sdk/js/reference/pubsub/client/events
    m = re.match(r'^(/docs/browser-sdk/js/reference/\w+)/events$', path_prefixed)
    if m:
        base = m.group(1)
        for sub in ['room-session', 'client']:
            candidate = f'{base}/{sub}/events'
            if exists(candidate):
                return with_anchor(candidate, anchor), 'auto', 'browser-events-remap'

    # Rule 20: Browser SDK methods paths
    # /docs/browser-sdk/js/reference/video/methods/addcamera -> room-session/add-camera
    # /docs/browser-sdk/js/reference/video/room-session/methods/X -> room-session/X
    m = re.match(r'^/docs/browser-sdk(/v\d+)?/js/reference/(\w+)/(?:room-session/)?methods/(\w+)$', path_prefixed)
    if m:
        ver = m.group(1) or ''
        namespace = m.group(2)
        method = m.group(3)
        kebab = re.sub(r'([a-z])([A-Z])', r'\1-\2', method).lower()
        for sub in ['room-session', 'client', '']:
            if sub:
                candidate = f'/docs/browser-sdk{ver}/js/reference/{namespace}/{sub}/{kebab}'
            else:
                candidate = f'/docs/browser-sdk{ver}/js/reference/{namespace}/{kebab}'
            if exists(candidate):
                return with_anchor(candidate, anchor), 'fuzzy', 'browser-methods-remap'

    # Rule 21: Browser SDK old guide names -> new guide names
    GUIDE_REMAPS = {
        '/docs/browser-sdk/guides/build-a-video-calling-application-with-the-browser-sdk': '/docs/browser-sdk/js/guides/build-a-video-app',
        '/docs/browser-sdk/guides/build-a-chat-application-with-the-browser-sdk': '/docs/browser-sdk/js/guides/build-a-chat-app',
        '/docs/browser-sdk/guides/making-a-zoom-like-application': '/docs/browser-sdk/js/guides/zoom-like-application',
        '/docs/browser-sdk/guides/displaying-call-thumbnails': '/docs/browser-sdk/js/guides/display-call-thumbnails',
        '/docs/browser-sdk/guides/video/streaming-to-youtube-and-other-platforms': '/docs/browser-sdk/js/guides/interactive-live-streaming',
        '/docs/browser-sdk/guides/video/video-overlays': '/docs/browser-sdk/js/guides/video-overlays',
    }
    if path_prefixed in GUIDE_REMAPS:
        candidate = GUIDE_REMAPS[path_prefixed]
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'browser-guide-rename'

    # Rule 22: Server SDK old top-level class refs
    # /docs/server-sdk/node/reference/video-roomsession.mdx -> /docs/server-sdk/node/reference/video/room-session
    # /docs/server-sdk/node/reference/chat-client.mdx -> /docs/server-sdk/node/reference/chat/client
    if stripped != path_prefixed:
        m = re.match(r'^(/docs/server-sdk(?:/v\d+)?/node/reference)/(.+)$', stripped)
        if m:
            base = m.group(1)
            rest = m.group(2)
            # Try converting e.g. "video-roomsession" to "video/room-session"
            # by looking for it in CLASS_REMAPS
            if rest in CLASS_REMAPS:
                candidate = f'{base}/{CLASS_REMAPS[rest]}'
                if exists(candidate):
                    return with_anchor(candidate, anchor), 'auto', 'toplevel-class-remap'

    # Rule 23: More known mappings
    MORE_KNOWN = {
        '/docs/compatibility-api/connect': '/docs/compatibility-api/cxml/reference/voice/connect',
        '/docs/compatibility-api/stream': '/docs/compatibility-api/cxml/reference/voice/stream',
        '/docs/compatibility-api/paging': '/docs/compatibility-api/sdks/reference/media/list',
        '/docs/compatibility-api/room-noun': '/docs/compatibility-api/cxml/reference/voice/connect',
        '/docs/compatibility-api/virtualagent-noun': '/docs/compatibility-api/cxml/reference/voice/connect',
        '/docs/browser-sdk/js/reference/call-fabric': '/docs/browser-sdk/js',
        '/docs/browser-sdk/js/reference/pub-sub': '/docs/browser-sdk/js/reference/pubsub',
        '/docs/browser-sdk/js/reference/room-session': '/docs/browser-sdk/js/reference/video/room-session',
        '/docs/browser-sdk/js/reference/web-rtc': '/docs/browser-sdk/js',
        '/docs/browser-sdk/js/reference/video/room-session-screenshare': '/docs/browser-sdk/js/reference/video/room-session/create-screen-share-object',
        '/docs/browser-sdk/video/room-session-screenshare': '/docs/browser-sdk/js/reference/video/room-session/create-screen-share-object',
        '/docs/browser-sdk/pubsub/message': '/docs/browser-sdk/js/reference/pubsub',
        '/docs/browser-sdk/v2/client': '/docs/browser-sdk/v2/js/reference/relay-client',
        '/docs/messaging/sms/messaging-mime-types': '/docs/platform/messaging',
        '/docs/messaging/sms/messaging-character-limits': '/docs/platform/messaging',
        '/docs/ai/get-started/prompt-engineering/advanced-techniques': '/docs/platform/ai/prompt-engineering',
        '/docs/platform/basics/general/how-to-set-caller-id-or-cnam': '/docs/platform/voice',
        '/docs/platform/phone-numbers/guides/number-groups': '/docs/platform/phone-numbers',
        '/docs/compatibility-api/guides/general/creating-and-using-cxml-scripts': '/docs/compatibility-api',
        '/docs/compatibility-api/calls/index': '/docs/compatibility-api/sdks/reference/recordings',
        '/docs/compatibility-api/conferences/index': '/docs/compatibility-api/sdks/reference/recordings',
        '/docs/compatibility-api/media/index': '/docs/compatibility-api/sdks/reference/media/list',
        '/docs/compatibility-api/voice/index': '/docs/compatibility-api/cxml/reference/messaging',
        '/docs/guides/chat': '/docs/platform/chat',
        '/docs/cxml/guides/sending-your-first-sms': '/docs/compatibility-api',
        '/docs/browser-sdk/guides/build-a-chat-application-with-the-browser-sdk': '/docs/browser-sdk/js/guides',
        '/docs/browser-sdk/guides/video/video-overlays': '/docs/platform/video',
        '/docs/platform/call-fabric/addresses': '/docs/platform/resources',
        '/docs/platform/call-fabric#subscribers': '/docs/platform/resources',
        '/docs/agents-sdk/skills/adding-skills': '/docs/agents-sdk/python/guides/understanding-skills',
        '/docs/agents-sdk/skills/custom': '/docs/agents-sdk/python/guides/understanding-skills',
        '/docs/agents-sdk/skills/skill-config': '/docs/agents-sdk/python/guides/understanding-skills',
        # SWML old AI sub-page paths
        '/docs/swml/reference/ai_params/index': '/docs/swml/reference/ai/params',
        '/docs/swml/reference/ai/hold_music': '/docs/swml/reference/ai/params',
        '/docs/swml/reference/ai/interrupt_prompt': '/docs/swml/reference/ai/params',
        '/docs/swml/reference/ai_swaig/functions/ai_swaig.data_map/data_map.output': '/docs/swml/reference/ai/swaig/functions/data-map',
        # Browser SDK video methods (with /js/reference/ prefix already)
        '/docs/browser-sdk/js/reference/video/methods/addcamera': '/docs/browser-sdk/js/reference/video/room-session/add-camera',
        '/docs/browser-sdk/js/reference/video/methods/adddevice': '/docs/browser-sdk/js/reference/video/room-session/add-device',
        '/docs/browser-sdk/js/reference/video/methods/addmicrophone': '/docs/browser-sdk/js/reference/video/room-session/add-microphone',
        '/docs/browser-sdk/js/reference/video/methods/startscreenshare': '/docs/browser-sdk/js/reference/video/room-session/start-screen-share',
        '/docs/browser-sdk/js/reference/video/methods/join': '/docs/browser-sdk/js/reference/video/room-session',
        '/docs/browser-sdk/js/reference/video/room-session-stream/stop': '/docs/browser-sdk/js/reference/video/room-session/stop-stream',
        '/docs/browser-sdk/video/room-session/methods/removealllisteners': '/docs/browser-sdk/js/reference/video/room-session/remove-all-listeners',
        # Missing /docs prefix + known targets
        '/docs/call-flow-builder/reference': '/docs/call-flow-builder',
        '/docs/rest': '/docs/apis',
        '/docs/rest/signalwire-rest': '/docs/apis',
        '/docs/platform/call-fabric#subscribers': '/docs/platform/resources',
        # Server SDK old paths
        '/docs/server-sdk/node/reference/client/index': '/docs/server-sdk/node/reference/realtime-client',
        '/docs/server-sdk/node/reference/index': '/docs/server-sdk/node',
        '/docs/server-sdk/node/reference/methods/connect': '/docs/server-sdk/node/reference/realtime-client/connect',
        '/docs/server-sdk/node/reference/methods/disconnect': '/docs/server-sdk/node/reference/realtime-client/disconnect',
        '/docs/server-sdk/node/reference/video/methods/getroomsessions': '/docs/server-sdk/node/reference/video/client/get-room-sessions',
        '/docs/server-sdk/node/reference/voice/methods/dialphone': '/docs/server-sdk/node/reference/voice/client/dial-phone',
        '/docs/server-sdk/node/reference/voice/methods/dialsip': '/docs/server-sdk/node/reference/voice/client/dial-sip',
        '/docs/server-sdk/v2/php/reference/results/send-result': '/docs/server-sdk/v2/php/reference/messaging/send-result',
        '/docs/server-sdk/v3/node/video/client/index': '/docs/server-sdk/v3/node/reference/video/client',
        # User-provided manual resolutions
        '/docs/browser-sdk/js/reference/call-fabric/client': '/docs/browser-sdk/v3/js/reference/signalwire/client',
        '/docs/server-sdk/v3/node/reference/realtime-client': '/docs/server-sdk/v3/node',
        # Remaining edge cases
        '/docs/platform/call-fabric': '/docs/platform/resources',
        '/docs/platform/phone-numbers/guides/signalwire-status-callbacks/recording-status-callbacks': '/docs/platform/webhooks',
        '/docs/platform/phone-numbers/guides/signalwire-status-callbacks/sms-status-callbacks': '/docs/platform/webhooks',
        '/docs/platform/phone-numbers/guides/signalwire-status-callbacks/voice-status-callbacks': '/docs/platform/webhooks',
        '/docs/browser-sdk/js/reference/video/room-session-stream/stop': '/docs/browser-sdk/js/reference/video/room-session/get-streams',
        '/docs/apis/space/campaign-registry-beta/webhooks/ten-dlc-status-callback': '/docs/platform/messaging/campaign-registry',
    }
    # Check MORE_KNOWN with both original and extension-stripped paths
    for check_path in [path_prefixed, stripped]:
        if check_path in MORE_KNOWN:
            candidate = MORE_KNOWN[check_path]
            if exists(candidate):
                return with_anchor(candidate, anchor), 'auto', 'known-redirect-2'

    # Rule 24: v2 SDK index.mdx references with anchors
    # /docs/server-sdk/v2/php/reference/index.mdx#send -> /docs/server-sdk/v2/php/reference
    # /docs/server-sdk/v2/ruby/reference/calling/index.mdx -> /docs/server-sdk/v2/ruby/reference/calling
    if stripped != path_prefixed:
        index_stripped = re.sub(r'/index$', '', stripped)
        if index_stripped != stripped and exists(index_stripped):
            return with_anchor(index_stripped, anchor), 'auto', 'strip-ext-index'

    # Rule 25: v2 reference/results -> reference/calling/results (missing 'calling')
    m = re.match(r'^(/docs/server-sdk/v2/\w+)/reference/(results|call)(/.*)?$', path_prefixed)
    if m:
        base = m.group(1)
        section = m.group(2)
        rest = m.group(3) or ''
        if section == 'results':
            candidate = f'{base}/reference/calling/results{rest}'
        else:
            candidate = f'{base}/reference/calling/call{rest}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'v2-missing-calling'
        # Also try stripping -result
        result_stripped2 = re.sub(r'-result$', '', candidate)
        if result_stripped2 != candidate and exists(result_stripped2):
            return with_anchor(result_stripped2, anchor), 'auto', 'v2-missing-calling+strip-result'

    # Rule 26: v3 SDK class-name .mdx remaps
    if stripped != path_prefixed:
        m = re.match(r'^(/docs/server-sdk/v3/node/reference/.+)/([^/]+)$', stripped)
        if m:
            base = m.group(1)
            last = m.group(2)
            if last in CLASS_REMAPS:
                candidate = f'{base}/{CLASS_REMAPS[last]}'
                if exists(candidate):
                    return with_anchor(candidate, anchor), 'auto', 'v3-class-remap'
            # Try parent + class remap (e.g. voice/call/voice-client -> voice/client)
            parent = '/'.join(base.split('/')[:-1]) if '/' in base else base
            if last in CLASS_REMAPS:
                candidate = f'{parent}/{CLASS_REMAPS[last]}'
                if exists(candidate):
                    return with_anchor(candidate, anchor), 'auto', 'v3-class-remap-parent'

    # Rule 27: Browser SDK chat/client/methods -> chat/client/method-name
    m = re.match(r'^/docs/browser-sdk/js/reference/(\w+)/client/methods/(\w+)$', path_prefixed)
    if m:
        namespace = m.group(1)
        method = m.group(2)
        kebab = re.sub(r'([a-z])([A-Z])', r'\1-\2', method).lower()
        candidate = f'/docs/browser-sdk/js/reference/{namespace}/client/{kebab}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'browser-client-methods'

    # Rule 28a: types.mdx pages - strip .mdx, find correct location
    # /docs/server-sdk/node/reference/voice/call/types.mdx#anchor
    #  -> /docs/server-sdk/node/reference/voice/types#anchor
    if stripped != path_prefixed and stripped.endswith('/types'):
        # Try progressively shorter paths for types
        parts = stripped.split('/')
        for cutoff in range(len(parts) - 1, 3, -1):
            candidate = '/'.join(parts[:cutoff]) + '/types'
            if exists(candidate):
                return with_anchor(candidate, anchor), 'auto', 'types-remap'

    # Rule 28b: Browser SDK video/methods/X -> video/room-session/kebab-X
    m = re.match(r'^/docs/browser-sdk(?:/v\d+)?/(?:js/)?(?:reference/)?video/methods/(\w+)$', path_prefixed)
    if m:
        method = m.group(1)
        kebab = re.sub(r'([a-z])([A-Z])', r'\1-\2', method).lower()
        candidate = f'/docs/browser-sdk/js/reference/video/room-session/{kebab}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'browser-video-methods'

    # Rule 28c: Browser SDK room-session/methods/X (old path without js/reference prefix)
    m = re.match(r'^/docs/browser-sdk/video/room-session/methods/(\w+)$', path_prefixed)
    if m:
        method = m.group(1)
        kebab = re.sub(r'([a-z])([A-Z])', r'\1-\2', method).lower()
        candidate = f'/docs/browser-sdk/js/reference/video/room-session/{kebab}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'browser-room-methods'

    # Rule 28d: Browser SDK signalwire/client/methods/X
    m = re.match(r'^/docs/browser-sdk/js/reference/signalwire/client/methods/(.+)$', path_prefixed)
    if m:
        method = m.group(1)
        candidate = f'/docs/browser-sdk/js/reference/signalwire/client/{method}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'browser-sw-client-methods'

    # Rule 28e: Server SDK voice/methods/X.mdx -> voice/client/kebab-X
    if stripped != path_prefixed:
        m = re.match(r'^/docs/server-sdk(?:/v\d+)?/node/reference/voice/methods/(\w+)$', stripped)
        if m:
            method = m.group(1)
            kebab = re.sub(r'([a-z])([A-Z])', r'\1-\2', method).lower()
            candidate_base = stripped.rsplit('/methods/', 1)[0]
            for sub in ['client', 'call', '']:
                if sub:
                    candidate = f'{candidate_base}/{sub}/{kebab}'
                else:
                    candidate = f'{candidate_base}/{kebab}'
                if exists(candidate):
                    return with_anchor(candidate, anchor), 'auto', 'sdk-voice-methods'

    # Rule 28f: Server SDK v2/go/consumer.mdx -> v2/go/reference/consumer
    if stripped != path_prefixed:
        m = re.match(r'^/docs/server-sdk/v2/(\w+)/(consumer|task|relay-client)$', stripped)
        if m:
            lang = m.group(1)
            page = m.group(2)
            candidate = f'/docs/server-sdk/v2/{lang}/reference/{page}'
            if exists(candidate):
                return with_anchor(candidate, anchor), 'auto', 'v2-toplevel-ext'

    # Rule 28g: Server SDK v2/dotnet/reference/send-result -> messaging/send-result etc
    m = re.match(r'^/docs/server-sdk/v2/(\w+)/reference/(send-result|send-source)$', path_prefixed)
    if m:
        lang = m.group(1)
        page = m.group(2)
        candidate = f'/docs/server-sdk/v2/{lang}/reference/messaging/{page}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'v2-messaging-shortcut'

    # Rule 28h: Old index.mdx and client/index.mdx refs
    if stripped != path_prefixed and stripped.endswith('/index'):
        base = stripped[:-6]  # strip '/index'
        if exists(base):
            return with_anchor(base, anchor), 'auto', 'strip-ext-index-deep'

    # Rule 28: v3 pubsub client methods
    m = re.match(r'^(/docs/server-sdk/v3/node/reference/\w+/client)/([^/]+)(?:\.mdx)?$', stripped if stripped != path_prefixed else path_prefixed)
    if m:
        base = m.group(1)
        rest = m.group(2)
        # Strip class prefix: pubsub-client.mdx -> client index
        candidate = f'{base}/{rest}'
        if exists(candidate):
            return with_anchor(candidate, anchor), 'auto', 'v3-client-method'

    return None


# ---------------------------------------------------------------------------
# Step 4: Locate and fix links in source files
# ---------------------------------------------------------------------------
def find_source_file(found_on_url, slug_index):
    """Map a found_on URL to a source .mdx file."""
    return slug_index.get(found_on_url)


def fix_links_in_file(filepath, replacements):
    """Apply URL replacements in a source file.

    replacements: list of (old_url, new_url)
    Returns list of (line_num, old_line, new_line).
    """
    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()
    except OSError:
        return []

    changes = []

    for old_url, new_url in replacements:
        # We need to find the old_url in the file. It might appear as:
        # 1. Full URL with domain
        # 2. /docs/... path
        # 3. Relative path (harder to handle)

        # Determine what to search for - strip /docs/ prefix for relative link search
        search_variants = [old_url]
        # Also search for the full URL with domain
        search_variants.append(f'https://signalwire.com{old_url}')
        # If old_url lacks /docs/ prefix, also search with /docs/ prepended.
        # This avoids partial replacement leaving a stale /docs/ prefix
        # (producing /docs/docs/...) and ensures we match source files that
        # use the full /docs/... path even when the report omits /docs/.
        if not old_url.startswith('/docs/'):
            search_variants.insert(0, f'/docs{old_url}')

        for i, line in enumerate(lines):
            for variant in search_variants:
                if variant not in line:
                    continue
                if new_url == 'DELETED':
                    # Strip link markup, keep text:
                    #   [text](URL)  -> text
                    #   [label]: URL -> (remove entire line)
                    #   href="URL"   -> (leave as-is, needs manual fix)
                    # NOTE: For reference-style links, only the definition
                    # line is removed. Usages like [text][label] don't
                    # contain the URL, so they survive and become dead
                    # references. These need manual cleanup.
                    new_line = re.sub(
                        r'\[([^\]]*)\]\([^)]*' + re.escape(variant) + r'[^)]*\)',
                        r'\1', line)
                    if new_line == line:
                        # Reference-style link def — remove the line
                        if re.match(r'\s*\[.*\]:\s*' + re.escape(variant), line):
                            new_line = ''
                    if new_line != line:
                        changes.append((i + 1, line, new_line))
                        lines[i] = new_line
                else:
                    new_line = line.replace(variant, new_url)
                    if new_line != line:
                        changes.append((i + 1, line, new_line))
                        lines[i] = new_line
                break

    if changes and APPLY:
        with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
            f.writelines(lines)

    return changes


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main():
    report_path = 'report.md'
    if not os.path.exists(report_path):
        print(f'Error: {report_path} not found', file=sys.stderr)
        sys.exit(1)

    print('Building slug index...')
    slug_index = build_slug_index()
    print(f'  {len(slug_index)} slugs indexed')

    print('Parsing report...')
    entries = parse_report(report_path)
    print(f'  {len(entries)} broken links found')

    # Deduplicate: group by broken_url -> set of found_on pages
    broken_to_pages = defaultdict(set)
    for broken_url, found_on in entries:
        broken_to_pages[broken_url].add(found_on)

    print(f'  {len(broken_to_pages)} unique broken URLs')

    # Apply correction cascade
    print('Applying correction rules...')
    fixes = []  # (broken_url, fixed_url, confidence, rule)
    manual = []  # (broken_url, found_on_pages)
    stats = defaultdict(int)

    for broken_url in sorted(broken_to_pages):
        result = try_fix(broken_url, slug_index)
        if result:
            fixed_url, confidence, rule = result
            fixed_url = normalize_version(fixed_url)
            fixes.append((broken_url, fixed_url, confidence, rule))
            stats[rule] += 1
        else:
            manual.append((broken_url, broken_to_pages[broken_url]))
            stats['manual'] += 1

    # Count total links (not unique URLs)
    total_fixable = sum(
        len(broken_to_pages[b]) for b, _, _, _ in fixes
    )
    total_manual = sum(len(pages) for _, pages in manual)

    print(f'\nCorrection summary:')
    print(f'  Total broken links: {len(entries)}')
    print(f'  Unique broken URLs: {len(broken_to_pages)}')
    print(f'  Fixable: {len(fixes)} URLs ({total_fixable} link occurrences)')
    print(f'  Manual:  {len(manual)} URLs ({total_manual} link occurrences)')
    print(f'\nBy rule:')
    for rule, count in sorted(stats.items(), key=lambda x: -x[1]):
        print(f'  {rule}: {count}')

    # Filter by confidence if requested
    active_fixes = fixes
    if CONFIDENCE_FILTER:
        active_fixes = [(b, f, c, r) for b, f, c, r in fixes if c == CONFIDENCE_FILTER]
        print(f'\nFiltered to {len(active_fixes)} fixes with confidence={CONFIDENCE_FILTER}')

    # Group fixes by source file
    file_replacements = defaultdict(list)  # filepath -> [(old_url, new_url)]
    unmapped_pages = set()

    for broken_url, fixed_url, confidence, rule in active_fixes:
        for found_on in broken_to_pages[broken_url]:
            source = find_source_file(found_on, slug_index)
            if source:
                file_replacements[source].append((broken_url, fixed_url))
            else:
                unmapped_pages.add(found_on)

    # Apply fixes
    mode = "Applying" if APPLY else "Dry run"
    print(f'\n{mode}: processing {len(file_replacements)} source files...')

    total_changes = 0
    total_files = 0
    all_changes = []  # for CSV report

    for filepath in sorted(file_replacements):
        replacements = file_replacements[filepath]
        changes = fix_links_in_file(filepath, replacements)
        if changes:
            total_files += 1
            total_changes += len(changes)
            if not APPLY:
                print(f'\n  {filepath}:')
                for line_num, old_line, new_line in changes:
                    print(f'    L{line_num}:')
                    print(f'      - {old_line.rstrip()}')
                    print(f'      + {new_line.rstrip()}')
            else:
                print(f'  Fixed {len(changes)} link(s) in {filepath}')

            # Collect for CSV
            for line_num, old_line, new_line in changes:
                # Find which replacement was applied
                for old_url, _new_url in replacements:
                    if old_url in old_line.rstrip() or f'https://signalwire.com{old_url}' in old_line.rstrip():
                        conf = next((c for b, _f, c, _r in active_fixes if b == old_url), '?')
                        rule = next((r for b, _f, _c, r in active_fixes if b == old_url), '?')
                        found_on = next((fo for fo in broken_to_pages[old_url] if find_source_file(fo, slug_index) == filepath), '?')
                        all_changes.append({
                            'broken_url': old_url,
                            'found_on': found_on,
                            'source_file': filepath,
                            'line': line_num,
                            'old': old_line.rstrip(),
                            'new': new_line.rstrip(),
                            'confidence': conf,
                            'rule': rule,
                        })
                        break

    action = "Fixed" if APPLY else "Would fix"
    print(f'\n{action} {total_changes} links across {total_files} files.')

    if unmapped_pages:
        print(f'\nWarning: {len(unmapped_pages)} found-on pages not in slug index:')
        for p in sorted(unmapped_pages)[:10]:
            print(f'  {p}')
        if len(unmapped_pages) > 10:
            print(f'  ... and {len(unmapped_pages) - 10} more')

    if manual:
        print(f'\nManual review needed ({len(manual)} URLs):')
        for broken_url, pages in sorted(manual)[:20]:
            print(f'  {broken_url}')
            for p in sorted(pages)[:3]:
                print(f'    <- {p}')
        if len(manual) > 20:
            print(f'  ... and {len(manual) - 20} more')

    # Write CSV report
    if REPORT_PATH:
        with open(REPORT_PATH, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=[
                'broken_url', 'found_on', 'source_file', 'line',
                'old', 'new', 'confidence', 'rule',
            ])
            writer.writeheader()
            writer.writerows(all_changes)

            # Append manual (unresolved) items so they're tracked
            for broken_url, pages in manual:
                for found_on in sorted(pages):
                    source = find_source_file(found_on, slug_index)
                    writer.writerow({
                        'broken_url': broken_url,
                        'found_on': found_on,
                        'source_file': source or '(auto-generated)',
                        'line': '',
                        'old': '',
                        'new': '',
                        'confidence': 'manual',
                        'rule': 'unresolved',
                    })

            # Append fixable items whose source page isn't in the slug index
            # (auto-generated pages like OpenAPI specs)
            for broken_url, fixed_url, confidence, rule in active_fixes:
                for found_on in broken_to_pages[broken_url]:
                    source = find_source_file(found_on, slug_index)
                    if not source:
                        writer.writerow({
                            'broken_url': broken_url,
                            'found_on': found_on,
                            'source_file': '(auto-generated)',
                            'line': '',
                            'old': broken_url,
                            'new': fixed_url,
                            'confidence': confidence,
                            'rule': rule + ' (source not editable)',
                        })

        print(f'\nCSV report written to {REPORT_PATH}')


if __name__ == '__main__':
    main()
