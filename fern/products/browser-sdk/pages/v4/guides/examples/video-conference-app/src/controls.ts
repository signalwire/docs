// Self-participant controls. Every button and slider here acts on the *self*
// participant — the one representing this client in the room. `self$` may emit
// null briefly before the room confirms the join, so the click handlers read a
// live `self` reference and no-op until it's set.

import type { SignalWire, Call, CallSelfParticipant } from '@signalwire/js';
import { $ } from './dom';

export function bindControls(
  client: InstanceType<typeof SignalWire>,
  call: Call
): void {
  const mic = $<HTMLButtonElement>('#toggle-mic');
  const cam = $<HTMLButtonElement>('#toggle-cam');
  const share = $<HTMLButtonElement>('#toggle-share');
  const hand = $<HTMLButtonElement>('#toggle-hand');
  const deaf = $<HTMLButtonElement>('#toggle-deaf');
  const echo = $<HTMLButtonElement>('#toggle-echo');
  const gain = $<HTMLButtonElement>('#toggle-gain');
  const noise = $<HTMLButtonElement>('#toggle-noise');
  const removeSelf = $<HTMLButtonElement>('#remove-self');
  const endCall = $<HTMLButtonElement>('#end-call');
  const leave = $<HTMLButtonElement>('#leave');

  const inputVolume = $<HTMLInputElement>('#input-volume');
  const outputVolume = $<HTMLInputElement>('#output-volume');
  const sensitivity = $<HTMLInputElement>('#input-sensitivity');

  let self: CallSelfParticipant | null = null;
  let wired = false;

  call.self$.subscribe((s) => {
    self = s;
    if (!s || wired) return;
    wired = true;

    // Reflect live state onto the controls. Each toggle relabels itself; the
    // sliders snap to the server's current value.
    s.audioMuted$.subscribe((m) => (mic.textContent = m ? 'Unmute' : 'Mic'));
    s.videoMuted$.subscribe((m) => (cam.textContent = m ? 'Camera on' : 'Camera'));
    s.handraised$.subscribe((h) => (hand.textContent = h ? 'Lower hand' : 'Raise hand'));
    s.deaf$.subscribe((d) => (deaf.textContent = d ? 'Undeafen' : 'Deafen'));
    s.echoCancellation$.subscribe((on) => (echo.textContent = `Echo cancel: ${on ? 'on' : 'off'}`));
    s.autoGain$.subscribe((on) => (gain.textContent = `Auto gain: ${on ? 'on' : 'off'}`));
    s.noiseSuppression$.subscribe((on) => (noise.textContent = `Noise suppression: ${on ? 'on' : 'off'}`));
    s.screenShareStatus$.subscribe((st) => (share.textContent = st === 'started' ? 'Stop sharing' : 'Share screen'));

    bindSlider(inputVolume, s.inputVolume$, (v) => s.setAudioInputVolume(v));
    bindSlider(outputVolume, s.outputVolume$, (v) => s.setAudioOutputVolume(v));
    bindSlider(sensitivity, s.inputSensitivity$, (v) => s.setAudioInputSensitivity(v));
  });

  mic.onclick = () => self?.toggleMute();
  cam.onclick = () => self?.toggleMuteVideo();
  hand.onclick = () => self?.toggleHandraise();
  deaf.onclick = () => self?.toggleDeaf();
  echo.onclick = () => self?.toggleEchoCancellation();
  gain.onclick = () => self?.toggleAudioInputAutoGain();
  noise.onclick = () => self?.toggleNoiseSuppression();

  share.onclick = () =>
    self?.screenShareStatus === 'started' ? self.stopScreenShare() : self?.startScreenShare();

  // remove() drops just this participant; end() tears the room down for
  // everyone (only allowed if the room grants the capability).
  removeSelf.onclick = () => self?.remove();
  endCall.onclick = () => self?.end();

  // Hang up the WebRTC leg, disconnect the client, and reset the page.
  leave.onclick = async () => {
    await call.hangup();
    await client.disconnect();
    location.reload();
  };
}

// Wire a range input to a server-side audio setting: echo the live value into
// the adjacent <output>, and push changes on release.
function bindSlider(
  slider: HTMLInputElement,
  value$: { subscribe: (fn: (v: number | undefined) => void) => unknown },
  set: (value: number) => Promise<void> | void
): void {
  const out = $<HTMLOutputElement>(`#${slider.id}-out`);
  value$.subscribe((v) => {
    if (v === undefined) return;
    slider.value = String(v);
    out.value = String(v);
  });
  slider.oninput = () => (out.value = slider.value);
  slider.onchange = () => set(parseInt(slider.value, 10));
}
