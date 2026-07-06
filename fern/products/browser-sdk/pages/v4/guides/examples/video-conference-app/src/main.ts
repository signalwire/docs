// Entry point: handles register/login, builds the SignalWire client with our
// BackendCredentialProvider, wires the dashboard (device pickers + directory)
// and the inbound-call dialog, then hands off to room.ts once a call is
// connected.

import { SignalWire, type Call, type Address } from '@signalwire/js';
import { BackendCredentialProvider } from './credentials';
import { joinRoom } from './room';
import { $ } from './dom';

const authSection = $<HTMLElement>('#lobby-auth');
const prejoinSection = $<HTMLElement>('#lobby-prejoin');
const conference = $<HTMLElement>('#conference');

const loginForm = $<HTMLFormElement>('#login-form');
const loginEmail = $<HTMLInputElement>('#login-email');
const loginPassword = $<HTMLInputElement>('#login-password');
const loginError = $<HTMLParagraphElement>('#login-error');

const registerForm = $<HTMLFormElement>('#register-form');
const registerName = $<HTMLInputElement>('#register-name');
const registerEmail = $<HTMLInputElement>('#register-email');
const registerPassword = $<HTMLInputElement>('#register-password');
const registerError = $<HTMLParagraphElement>('#register-error');

const showRegisterBtn = $<HTMLButtonElement>('#show-register');
const showLoginBtn = $<HTMLButtonElement>('#show-login');

const dashboardName = $<HTMLElement>('#dashboard-name');
const signOutBtn = $<HTMLButtonElement>('#sign-out');

const destInput = $<HTMLInputElement>('#destination');
const audioOpt = $<HTMLInputElement>('#opt-audio');
const videoOpt = $<HTMLInputElement>('#opt-video');
const joinBtn = $<HTMLButtonElement>('#join');
const joinError = $<HTMLParagraphElement>('#join-error');

const audioInSelect = $<HTMLSelectElement>('#device-audio-in');
const audioOutSelect = $<HTMLSelectElement>('#device-audio-out');
const videoInSelect = $<HTMLSelectElement>('#device-video-in');

const incoming = $<HTMLDialogElement>('#incoming');
const incomingFrom = $<HTMLElement>('#incoming-from');

let client: InstanceType<typeof SignalWire> | null = null;

// ── Step 1: register or sign in, then connect. The backend creates a
// Subscriber (register) or checks the password (login); either way it then
// mints the SAT and the SDK schedules its refresh.
showRegisterBtn.onclick = () => {
  loginForm.hidden = true;
  registerForm.hidden = false;
  showRegisterBtn.hidden = true;
  showLoginBtn.hidden = false;
};

showLoginBtn.onclick = () => {
  registerForm.hidden = true;
  loginForm.hidden = false;
  showLoginBtn.hidden = true;
  showRegisterBtn.hidden = false;
};

loginForm.onsubmit = (e) => {
  e.preventDefault();
  authenticate('/api/login', { email: loginEmail.value.trim(), password: loginPassword.value }, loginError);
};

registerForm.onsubmit = (e) => {
  e.preventDefault();
  authenticate(
    '/api/register',
    {
      name: registerName.value.trim(),
      email: registerEmail.value.trim(),
      password: registerPassword.value
    },
    registerError
  );
};

async function authenticate(
  path: string,
  body: Record<string, string>,
  errorEl: HTMLParagraphElement
): Promise<void> {
  errorEl.hidden = true;

  try {
    const r = await fetch(path, {
      method: 'POST',
      credentials: 'include',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    const data = await r.json();
    if (!r.ok) throw new Error(data.error || 'Request failed');

    await connect(data.name);
  } catch (err) {
    errorEl.textContent = (err as Error).message || 'Something went wrong';
    errorEl.hidden = false;
  }
}

async function connect(name: string): Promise<void> {
  client = new SignalWire(new BackendCredentialProvider());

  // register() opens the inbound channel: without it, incomingCalls$ never
  // fires, even if someone dials this user.
  await client.register();

  bindDevicePickers(client);
  bindIncomingCalls(client);
  bindDirectory(client);

  dashboardName.textContent = name;
  authSection.hidden = true;
  prejoinSection.hidden = false;
}

signOutBtn.onclick = async () => {
  await fetch('/api/logout', { method: 'POST', credentials: 'include' });

  await client?.disconnect();
  client = null;

  prejoinSection.hidden = true;
  conference.hidden = true;
  loginForm.reset();
  registerForm.reset();
  authSection.hidden = false;
};

// ── Step 2: place an outbound call.
joinBtn.onclick = () => placeCall(destInput.value.trim());

async function placeCall(destination: string): Promise<void> {
  if (!client || !destination) return;
  joinError.hidden = true;
  joinBtn.disabled = true;
  joinBtn.textContent = 'Joining…';

  try {
    const call: Call = await client.dial(destination, {
      audio: audioOpt.checked,
      video: videoOpt.checked,
      receiveAudio: true,
      receiveVideo: true
    });
    enterConference(call);
  } catch (err) {
    joinError.textContent = (err as Error).message || 'Failed to join';
    joinError.hidden = false;
    joinBtn.disabled = false;
    joinBtn.textContent = 'Join';
  }
}

// ── Device pickers. The client owns the *currently selected* device for the
// whole session — changing it mid-call hot-swaps the track without
// renegotiating the call.
function bindDevicePickers(c: InstanceType<typeof SignalWire>): void {
  c.audioInputDevices$.subscribe((devs) => populate(audioInSelect, devs));
  c.audioOutputDevices$.subscribe((devs) => populate(audioOutSelect, devs));
  c.videoInputDevices$.subscribe((devs) => populate(videoInSelect, devs));

  audioInSelect.onchange = () => {
    const d = c.audioInputDevices.find((x) => x.deviceId === audioInSelect.value);
    if (d) c.selectAudioInputDevice(d);
  };
  audioOutSelect.onchange = () => {
    const d = c.audioOutputDevices.find((x) => x.deviceId === audioOutSelect.value);
    if (d) c.selectAudioOutputDevice(d);
  };
  videoInSelect.onchange = () => {
    const d = c.videoInputDevices.find((x) => x.deviceId === videoInSelect.value);
    if (d) c.selectVideoInputDevice(d);
  };
}

function populate(select: HTMLSelectElement, devices: MediaDeviceInfo[]): void {
  const current = select.value;
  select.innerHTML = '';
  for (const d of devices) {
    const opt = document.createElement('option');
    opt.value = d.deviceId;
    opt.textContent = d.label || `Device ${d.deviceId.slice(0, 6)}`;
    select.appendChild(opt);
  }
  if (devices.find((d) => d.deviceId === current)) select.value = current;
}

// ── Directory. client.directory is a paginated collection of addresses the
// signed-in user can reach. Click one to dial its default channel.
function bindDirectory(c: InstanceType<typeof SignalWire>): void {
  const directory = c.directory;
  if (!directory) return;

  const list = $<HTMLUListElement>('#directory');
  const more = $<HTMLButtonElement>('#directory-more');

  directory.addresses$.subscribe((addresses: Address[]) => {
    list.innerHTML = '';
    for (const address of addresses) {
      const li = document.createElement('li');
      const btn = document.createElement('button');
      btn.type = 'button';
      btn.textContent = address.displayName;
      btn.onclick = () => address.defaultChannel && placeCall(address.defaultChannel);
      li.appendChild(btn);
      list.appendChild(li);
    }
  });

  directory.hasMore$.subscribe((hasMore) => (more.hidden = !hasMore));
  directory.loading$.subscribe((loading) => (more.disabled = loading));
  more.onclick = () => directory.loadMore();
  directory.loadMore(); // initial page
}

// ── Inbound calls. The stream emits the *current list* of ringing calls every
// time it changes — not one event per call — so handle the first ringing one
// you haven't shown yet. A native <dialog> provides the modal + backdrop.
function bindIncomingCalls(c: InstanceType<typeof SignalWire>): void {
  let shown: Call | null = null;

  c.session.incomingCalls$.subscribe((calls) => {
    const ringing = calls.find((call) => call.status === 'ringing');
    if (!ringing || ringing === shown) return;
    shown = ringing;
    showIncomingCall(ringing);
  });
}

function showIncomingCall(ringing: Call): void {
  incomingFrom.textContent = ringing.from || 'Unknown caller';
  incoming.returnValue = '';
  incoming.showModal();

  incoming.onclose = () => {
    if (incoming.returnValue === 'accept') {
      ringing.answer({ audio: true, video: true });
      enterConference(ringing);
    } else {
      ringing.reject();
    }
  };

  // Once the call leaves 'ringing' (we answered, or the caller gave up), drop
  // the dialog. Clear onclose first so an unanswered teardown doesn't reject a
  // call that's already gone.
  ringing.status$.subscribe((s) => {
    if (s !== 'ringing') {
      incoming.onclose = null;
      incoming.close();
    }
  });
}

function enterConference(call: Call): void {
  authSection.hidden = true;
  prejoinSection.hidden = true;
  incoming.close();
  conference.hidden = false;
  if (client) joinRoom(client, call);
}
