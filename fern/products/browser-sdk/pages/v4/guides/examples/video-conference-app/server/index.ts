// Reference backend: mints Subscriber Access Tokens for the conference app
// and proxies the refresh endpoint.
//
// Two endpoints:
//   POST /api/sat           → issue a fresh SAT for the signed-in user
//   POST /api/sat/refresh   → rotate the stored refresh_token, return new SAT
//
// Refresh tokens never reach the browser. They live in this process's memory
// keyed by a session cookie. In production, swap the Map for an encrypted
// database column scoped to your real user identity.

import express from 'express';
import cookieParser from 'cookie-parser';
import { randomUUID } from 'node:crypto';

const PORT = Number(process.env.PORT ?? 3001);
const {
  SW_SPACE,
  SW_PROJECT_ID,
  SW_API_TOKEN,
  // For the demo, the backend issues SATs for one hardcoded subscriber.
  // A real app would look these up from the signed-in user's record.
  SW_SUBSCRIBER_REFERENCE,
  SW_SUBSCRIBER_PASSWORD
} = process.env;

if (!SW_SPACE || !SW_PROJECT_ID || !SW_API_TOKEN) {
  console.error('Missing SW_SPACE / SW_PROJECT_ID / SW_API_TOKEN in env');
  process.exit(1);
}

const BASIC_AUTH = Buffer.from(`${SW_PROJECT_ID}:${SW_API_TOKEN}`).toString('base64');
const FABRIC_BASE = `https://${SW_SPACE}/api/fabric`;

// In-memory store keyed by session cookie. One refresh_token per session.
const refreshTokens = new Map<string, string>();

const app = express();
app.use(express.json());
app.use(cookieParser());

// Issue or fetch the per-browser session id. The session itself proves
// *nothing* — production apps gate this on their existing user auth.
app.use((req, res, next) => {
  let sid = req.cookies.sid;
  if (!sid) {
    sid = randomUUID();
    res.cookie('sid', sid, { httpOnly: true, sameSite: 'lax' });
  }
  (req as express.Request & { sid: string }).sid = sid;
  next();
});

// ── POST /api/sat ────────────────────────────────────────────────────────
// First call from a fresh browser: mint a SAT against the Fabric API, stash
// the returned refresh_token server-side, hand the SAT to the client.
app.post('/api/sat', async (req, res) => {
  try {
    const r = await fetch(`${FABRIC_BASE}/subscribers/tokens`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Basic ${BASIC_AUTH}`
      },
      body: JSON.stringify({
        reference: SW_SUBSCRIBER_REFERENCE,
        password: SW_SUBSCRIBER_PASSWORD
      })
    });
    if (!r.ok) return res.status(r.status).send(await r.text());

    const { token, refresh_token, expires_at } = (await r.json()) as {
      token: string;
      refresh_token: string;
      expires_at: number;
    };

    const sid = (req as express.Request & { sid: string }).sid;
    refreshTokens.set(sid, refresh_token);

    // Note: only `token` and `expires_at` go to the browser.
    res.json({ token, expires_at });
  } catch (err) {
    res.status(500).json({ error: (err as Error).message });
  }
});

// ── POST /api/sat/refresh ────────────────────────────────────────────────
// Called by the client's CredentialProvider shortly before the current SAT
// expires. We swap the stored refresh_token for a new SAT + new refresh_token
// pair and persist the rotation. The refresh_token rotates every call — that
// invalidates the previous one, so a leaked refresh_token only works once.
app.post('/api/sat/refresh', async (req, res) => {
  const sid = (req as express.Request & { sid: string }).sid;
  const stored = refreshTokens.get(sid);
  if (!stored) return res.status(401).json({ error: 'No session' });

  try {
    const r = await fetch(`${FABRIC_BASE}/subscribers/tokens/refresh`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Basic ${BASIC_AUTH}`
      },
      body: JSON.stringify({ refresh_token: stored })
    });
    if (!r.ok) {
      refreshTokens.delete(sid); // refresh_token is dead — force re-auth
      return res.status(r.status).send(await r.text());
    }

    const { token, refresh_token, expires_at } = (await r.json()) as {
      token: string;
      refresh_token: string;
      expires_at: number;
    };

    refreshTokens.set(sid, refresh_token);
    res.json({ token, expires_at });
  } catch (err) {
    res.status(500).json({ error: (err as Error).message });
  }
});

app.listen(PORT, () => {
  console.log(`SAT backend listening on http://localhost:${PORT}`);
});
