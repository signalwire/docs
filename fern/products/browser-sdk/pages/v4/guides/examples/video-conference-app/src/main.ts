// Entry point: builds the SignalWire client with our BackendCredentialProvider,
// wires the pre-join lobby (device pickers + directory) and the inbound-call
// dialog, then hands off to room.ts once a call is connected.

import { SignalWire, type Call, type Address } from '@signalwire/js';
import { BackendCredentialProvider } from './credentials';
import { joinRoom } from './room';
import { $ } from './dom';

const signinSection = $<HTMLElement>('#lobby-signin');
const prejoinSection = $<HTMLElement>('#lobby-prejoin');
const conference = $<HTMLElement>('#conference');

const connectBtn = $<HTMLButtonElement>('#connect');
const signinError = $<HTMLParagraphElement>('#signin-error');

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

// ── Step 1: connect. The backend mints the SAT; the SDK schedules refresh.
connectBtn.onclick = async () => {
  signinError.hidden = true;
  connectBtn.disabled = true;
  connectBtn.textContent = 'Connecting…';

  try {
    client = new SignalWire(new BackendCredentialProvider());

    // register() opens the inbound channel: without it, incomingCalls$ never
    // fires, even if someone dials this user.
    await client.register();

    bindDevicePickers(client);
    bindIncomingCalls(client);
    bindDirectory(client);

    signinSection.hidden = true;
    prejoinSection.hidden = false;
  } catch (err) {
    signinError.textContent = (err as Error).message || 'Failed to connect';
    signinError.hidden = false;
    connectBtn.disabled = false;
    connectBtn.textContent = 'Sign in';
  }
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
  signinSection.hidden = true;
  prejoinSection.hidden = true;
  incoming.close();
  conference.hidden = false;
  if (client) joinRoom(client, call);
}
