/**
 * Shared transport helpers for tools that read Fern's published Markdown.
 *
 * Content interpretation belongs to the calling script. This module only
 * handles retrying HTTP requests and bounded async concurrency.
 */

export const RETRY_CONFIG = {
  maxAttempts: 3,
  initialDelayMs: 2000,
  backoffMultiplier: 4,
  timeoutMs: 30000,
};

export const USER_AGENT = 'signalwire-docs-md-export-audit';

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

/**
 * Fetch a URL with retry on network errors, 429s, and 5xx responses.
 *
 * The default text response preserves the existing audit-script contract.
 * Callers that need byte-for-byte response bodies can request a Buffer with
 * responseType: 'buffer'.
 */
export async function fetchWithRetry(url, options = {}) {
  const {
    maxAttempts = RETRY_CONFIG.maxAttempts,
    initialDelayMs = RETRY_CONFIG.initialDelayMs,
    backoffMultiplier = RETRY_CONFIG.backoffMultiplier,
    timeoutMs = RETRY_CONFIG.timeoutMs,
    userAgent = USER_AGENT,
    headers = {},
    redirect = 'follow',
    responseType = 'text',
    fetchImpl = fetch,
    sleepImpl = sleep,
    onRetry = null,
  } = options;

  if (responseType !== 'text' && responseType !== 'buffer') {
    throw new TypeError(`Unsupported responseType: ${responseType}`);
  }

  let delay = initialDelayMs;
  let lastError = null;

  for (let attempt = 1; attempt <= maxAttempts; attempt++) {
    try {
      const response = await fetchImpl(url, {
        signal: AbortSignal.timeout(timeoutMs),
        redirect,
        headers: { 'User-Agent': userAgent, ...headers },
      });

      if (response.status === 429 || response.status >= 500) {
        lastError = new Error(`HTTP ${response.status}`);
        // Release the connection before backing off and retrying.
        await response.body?.cancel().catch(() => {});
      } else {
        const body = responseType === 'buffer'
          ? Buffer.from(await response.arrayBuffer())
          : await response.text();
        return {
          status: response.status,
          body,
          contentType: response.headers.get('content-type'),
          finalUrl: response.url,
        };
      }
    } catch (err) {
      lastError = err;
    }

    if (attempt < maxAttempts) {
      onRetry?.({ attempt, maxAttempts, url, error: lastError, delayMs: delay });
      await sleepImpl(delay);
      delay *= backoffMultiplier;
    }
  }

  throw lastError;
}

/** Run an async worker over items with bounded concurrency. */
export async function runPool(items, worker, concurrency) {
  let index = 0;
  const runners = Array.from({ length: Math.min(concurrency, items.length) }, async () => {
    while (index < items.length) {
      const current = index++;
      await worker(items[current], current);
    }
  });
  await Promise.all(runners);
}
