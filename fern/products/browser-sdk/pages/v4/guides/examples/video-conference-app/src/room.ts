// In-conference orchestration. Everything here is driven by RxJS observables on
// the Call — we never poll, we subscribe and let the SDK push state updates.
// The self-participant controls, DTMF dialpad, and quality telemetry live in
// their own modules; this file wires media, status, the roster, chat, layouts,
// and the read-only call-info panel.

import type { SignalWire, Call, CallParticipant, CallError, TextMessage } from '@signalwire/js';
import { $ } from './dom';
import { bindControls } from './controls';
import { bindDialpad } from './dialpad';
import { bindQuality } from './quality';

export function joinRoom(client: InstanceType<typeof SignalWire>, call: Call): void {
  bindMedia(call);
  bindStatus(call);
  bindRoster(call);
  bindLayouts(call);
  bindChat(call);
  bindCallInfo(call);
  bindControls(client, call);
  bindDialpad(call);
  bindQuality(call);
}

// ── Media ────────────────────────────────────────────────────────────────
// SignalWire composes every participant's video into a single server-side
// stream, so the page only needs one <video> for the room and one for the
// local preview.
function bindMedia(call: Call): void {
  const local = $<HTMLVideoElement>('#local-video');
  const remote = $<HTMLVideoElement>('#remote-video');
  call.localStream$.subscribe((stream) => stream && (local.srcObject = stream));
  call.remoteStream$.subscribe((stream) => stream && (remote.srcObject = stream));
}

// ── Status & errors ────────────────────────────────────────────────────────
function bindStatus(call: Call): void {
  const status = $<HTMLElement>('#call-status');
  call.status$.subscribe((s) => (status.textContent = s));
  $('#call-direction').textContent = call.direction;

  // Non-fatal errors stay informational; fatal ones also drive the call to
  // 'failed' via status$, so we only need to surface the message here.
  call.errors$.subscribe((err: CallError) => {
    console.error(`[${err.kind}] ${err.fatal ? 'fatal' : 'non-fatal'}:`, err.error);
  });
}

// ── Participant roster ───────────────────────────────────────────────────
// participants$ emits the full list whenever anyone joins or leaves. Each
// CallParticipant exposes its own observables, so we wire those up once per
// participant and the badges update reactively.
function bindRoster(call: Call): void {
  const list = $<HTMLUListElement>('#participants');
  const count = $<HTMLElement>('#participant-count');
  const template = $<HTMLTemplateElement>('#participant-row');
  const rows = new Map<string, HTMLElement>();

  call.participants$.subscribe((participants) => {
    count.textContent = String(participants.length);

    for (const [id, row] of rows) {
      if (!participants.find((p) => p.id === id)) {
        row.remove();
        rows.delete(id);
      }
    }

    for (const p of participants) {
      if (rows.has(p.id)) continue;
      const row = template.content.firstElementChild!.cloneNode(true) as HTMLElement;
      list.appendChild(row);
      rows.set(p.id, row);
      bindParticipantRow(p, row);
    }
  });
}

function bindParticipantRow(p: CallParticipant, row: HTMLElement): void {
  // Participant observables emit `undefined` until the server reports state.
  const set = (sel: string, text = '') => (row.querySelector<HTMLElement>(sel)!.textContent = text);
  const toggle = (sel: string, on?: boolean) => (row.querySelector<HTMLElement>(sel)!.hidden = !on);

  p.name$.subscribe((n) => set('.name', n || 'Unknown'));
  p.type$.subscribe((t) => set('.type', t));
  p.audioMuted$.subscribe((m) => toggle('.mic', !m));
  p.videoMuted$.subscribe((m) => toggle('.cam', !m));
  p.handraised$.subscribe((h) => toggle('.hand', h));
  p.isTalking$.subscribe((t) => toggle('.talking', t));
  p.deaf$.subscribe((d) => toggle('.deaf', d));
  p.visible$.subscribe((v) => toggle('.hidden-flag', !v));
}

// ── Layouts ──────────────────────────────────────────────────────────────
// Available layouts come from the server. Switching reshapes the composite
// remote stream for *everyone* in the room, not just the local viewer.
function bindLayouts(call: Call): void {
  const select = $<HTMLSelectElement>('#layout-select');

  call.layouts$.subscribe((layouts) => {
    const current = select.value;
    select.innerHTML = '<option value="">Layout…</option>';
    for (const name of layouts) {
      const opt = document.createElement('option');
      opt.value = opt.textContent = name;
      select.appendChild(opt);
    }
    if (layouts.includes(current)) select.value = current;
  });

  call.layout$.subscribe((current) => current && (select.value = current));
  select.onchange = () => select.value && call.setLayout(select.value, {});
}

// ── Chat ───────────────────────────────────────────────────────────────────
// Each Call has an .address exposing a textMessages$ collection. Sending goes
// through address.sendText(); receiving comes from the collection's values$
// observable, which always emits the full ordered list.
function bindChat(call: Call): void {
  const log = $<HTMLElement>('#chat-log');
  const form = $<HTMLFormElement>('#chat-form');
  const input = $<HTMLInputElement>('#chat-input');

  const address = call.address;
  if (!address) return;

  address.textMessages$.subscribe((collection) => {
    // The collection's values$ is typed loosely on the call's address, so we
    // narrow to TextMessage here. It always emits the full ordered list.
    collection?.values$.subscribe((messages) => {
      log.innerHTML = '';
      for (const m of messages as TextMessage[]) {
        const row = document.createElement('div');
        row.textContent = m.text;
        log.appendChild(row);
      }
      log.scrollTop = log.scrollHeight;
    });
  });

  form.onsubmit = async (e) => {
    e.preventDefault();
    const text = input.value.trim();
    if (!text) return;
    input.value = '';
    await address.sendText(text);
  };
}

// ── Call info ──────────────────────────────────────────────────────────────
// Read-only room state. These observables report what the server is doing —
// whether the room is recording, streaming, locked, and how media is flowing.
function bindCallInfo(call: Call): void {
  const yn = (b: boolean) => (b ? 'yes' : 'no');
  call.recording$.subscribe((on) => ($('#info-recording').textContent = yn(on)));
  call.streaming$.subscribe((on) => ($('#info-streaming').textContent = yn(on)));
  call.locked$.subscribe((on) => ($('#info-locked').textContent = yn(on)));
  call.raiseHandPriority$.subscribe((on) => ($('#info-handpriority').textContent = yn(on)));
  call.mediaDirections$.subscribe((d) => {
    $('#info-media-audio').textContent = d.audio;
    $('#info-media-video').textContent = d.video;
  });
  call.capabilities$.subscribe((caps) => ($('#info-capabilities').textContent = caps.join(', ') || 'none'));
  call.meta$.subscribe((meta) => ($('#info-meta').textContent = JSON.stringify(meta)));
}
