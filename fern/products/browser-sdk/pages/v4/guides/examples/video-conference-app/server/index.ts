// Reference backend: registers and signs in local users, creates a matching
// SignalWire Subscriber for each one, and mints/refreshes Subscriber Access
// Tokens for the conference app.
//
// Four endpoints:
//   POST /api/register     → create a local user + a SignalWire Subscriber
//   POST /api/login        → verify local credentials, start a session
//   POST /api/logout       → end the session
//   POST /api/sat          → issue a fresh SAT for the signed-in user
//   POST /api/sat/refresh  → rotate the stored refresh_token, return new SAT
//
// Users and refresh tokens live in this process's memory. In production, swap
// the Maps for a real database and hash storage you control.

import express from 'express';
import cookieParser from 'cookie-parser';
import { randomUUID, randomBytes, scryptSync, timingSafeEqual } from 'node:crypto';

const PORT = Number(process.env.PORT ?? 3001);
const { SW_SPACE, SW_PROJECT_ID, SW_API_TOKEN } = process.env;

if (!SW_SPACE || !SW_PROJECT_ID || !SW_API_TOKEN) {
  console.error('Missing SW_SPACE / SW_PROJECT_ID / SW_API_TOKEN in env');
  process.exit(1);
}

const BASIC_AUTH = Buffer.from(`${SW_PROJECT_ID}:${SW_API_TOKEN}`).toString('base64');
const FABRIC_BASE = `https://${SW_SPACE}/api/fabric`;

type User = { name: string; passwordHash: string };

// Local user store, keyed by email. Owns the password check — SignalWire's
// token endpoint below trusts whoever holds the Project API token, so this
// app is what actually verifies a login.
const users = new Map<string, User>();

// Which email (if any) is signed in on a given session.
const sessionUsers = new Map<string, string>();

// One refresh_token per session, for the signed-in user's current SAT.
const refreshTokens = new Map<string, string>();

function hashPassword(password: string): string {
  const salt = randomBytes(16).toString('hex');
  const hash = scryptSync(password, salt, 64).toString('hex');
  return `${salt}:${hash}`;
}

function verifyPassword(password: string, stored: string): boolean {
  const [salt, hash] = stored.split(':');
  const candidate = scryptSync(password, salt, 64);
  return timingSafeEqual(candidate, Buffer.from(hash, 'hex'));
}

const app = express();
app.use(express.json());
app.use(cookieParser());

// Issue or fetch the per-browser session id. Signing in associates an email
// with this id; /api/sat only mints tokens for sessions that have one.
app.use((req, res, next) => {
  let sid = req.cookies.sid;
  if (!sid) {
    sid = randomUUID();
    res.cookie('sid', sid, { httpOnly: true, sameSite: 'lax' });
  }
  (req as express.Request & { sid: string }).sid = sid;
  next();
});

// ── POST /api/register ───────────────────────────────────────────────────
// Create the local user record, then create a matching SignalWire Subscriber
// so /api/sat has someone to mint a token for.
app.post('/api/register', async (req, res) => {
  const { name, email, password } = req.body ?? {};
  if (!name || !email || !password) {
    return res.status(400).json({ error: 'name, email, and password are required' });
  }
  if (users.has(email)) {
    return res.status(409).json({ error: 'An account with that email already exists' });
  }

  try {
    const r = await fetch(`${FABRIC_BASE}/resources/subscribers`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Basic ${BASIC_AUTH}`
      },
      body: JSON.stringify({ email, password, display_name: name })
    });
    if (!r.ok) return res.status(r.status).send(await r.text());
    await r.json();

    users.set(email, { name, passwordHash: hashPassword(password) });

    const sid = (req as express.Request & { sid: string }).sid;
    sessionUsers.set(sid, email);
    res.json({ name, email });
  } catch (err) {
    res.status(500).json({ error: (err as Error).message });
  }
});

// ── POST /api/login ──────────────────────────────────────────────────────
app.post('/api/login', (req, res) => {
  const { email, password } = req.body ?? {};
  const user = users.get(email);
  if (!user || !verifyPassword(password, user.passwordHash)) {
    return res.status(401).json({ error: 'Invalid email or password' });
  }

  const sid = (req as express.Request & { sid: string }).sid;
  sessionUsers.set(sid, email);
  res.json({ name: user.name, email });
});

// ── POST /api/logout ─────────────────────────────────────────────────────
app.post('/api/logout', (req, res) => {
  const sid = (req as express.Request & { sid: string }).sid;
  sessionUsers.delete(sid);
  refreshTokens.delete(sid);
  res.json({ ok: true });
});

// ── POST /api/sat ────────────────────────────────────────────────────────
// First call after sign-in: mint a SAT for the signed-in user's Subscriber
// (matched by email as `reference`), stash the refresh_token server-side.
app.post('/api/sat', async (req, res) => {
  const sid = (req as express.Request & { sid: string }).sid;
  const email = sessionUsers.get(sid);
  if (!email) return res.status(401).json({ error: 'Not signed in' });

  try {
    const r = await fetch(`${FABRIC_BASE}/subscribers/tokens`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: `Basic ${BASIC_AUTH}`
      },
      body: JSON.stringify({ reference: email })
    });
    if (!r.ok) return res.status(r.status).send(await r.text());

    const { token, refresh_token, expires_at } = (await r.json()) as {
      token: string;
      refresh_token: string;
      expires_at: number;
    };

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
