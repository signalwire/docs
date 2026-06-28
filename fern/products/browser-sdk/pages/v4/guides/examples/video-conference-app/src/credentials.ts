// Custom CredentialProvider — fetches SATs from our backend on auth and
// rotates them via the refresh proxy. Implements the SDK's CredentialProvider
// interface, which is what `new SignalWire(provider)` expects.

import type { CredentialProvider, AuthenticateContext } from '@signalwire/js';

type SatResponse = { token: string; expires_at: number };

export class BackendCredentialProvider implements CredentialProvider {
  // `context.fingerprint` is the SDK's DPoP thumbprint. Forwarding it to the
  // backend would request a Client Bound SAT (sat:refresh scope) so the SDK
  // could refresh directly without going through our backend. We're showing
  // *server-side* refresh here, so we ignore the fingerprint.
  async authenticate(_context?: AuthenticateContext) {
    return fetchSat('/api/sat');
  }

  // Called by the SDK shortly before the current token's `expiry_at`.
  // Reject to stop the refresh schedule — the session continues on the
  // existing token until it expires.
  async refresh() {
    return fetchSat('/api/sat/refresh');
  }
}

async function fetchSat(path: string) {
  const r = await fetch(path, {
    method: 'POST',
    credentials: 'include' // send the session cookie
  });
  if (!r.ok) throw new Error(`SAT fetch failed: ${r.status} ${await r.text()}`);
  const { token, expires_at } = (await r.json()) as SatResponse;
  // The SDK wants `expiry_at` in ms-since-epoch; SignalWire returns seconds.
  return { token, expiry_at: expires_at * 1000 };
}
