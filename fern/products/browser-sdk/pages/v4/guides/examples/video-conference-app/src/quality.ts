// Connection-quality and resilience telemetry. The SDK continuously measures
// the call and exposes it as observables — a MOS score, a coarse quality level,
// raw WebRTC stats, detected issues, and the state of the automatic recovery
// pipeline. Two buttons let you nudge recovery by hand.

import type {
  Call,
  CallNetworkMetrics,
  CallNetworkIssue,
  RecoveryEvent
} from '@signalwire/js';
import { $ } from './dom';

export function bindQuality(call: Call): void {
  // Mean Opinion Score (1–5) and the bucketed level derived from it.
  call.qualityScore$.subscribe((score) => ($('#q-mos').textContent = score.toFixed(1)));
  call.qualityLevel$.subscribe((level) => ($('#q-level').textContent = level));

  call.isNetworkHealthy$.subscribe((healthy) => {
    $('#q-health').textContent = healthy ? 'healthy' : 'degraded';
  });

  // networkMetrics$ emits a rolling history once per sampling interval; the
  // last entry is the latest snapshot.
  call.networkMetrics$.subscribe((history: CallNetworkMetrics[]) => {
    const m = history.at(-1);
    if (!m) return;
    $('#q-rtt').textContent = `${m.roundTripTime.toFixed(0)} ms`;
    $('#q-jitter').textContent = `${m.audio.jitter.toFixed(1)} ms`;
    $('#q-audio-packets').textContent = `${m.audio.packetsReceived} recv / ${m.audio.packetsLost} lost`;
    $('#q-video-packets').textContent = `${m.video.packetsReceived} recv / ${m.video.packetsLost} lost`;

    const recv = m.audio.packetsReceived + m.video.packetsReceived;
    const lost = m.audio.packetsLost + m.video.packetsLost;
    const loss = recv + lost > 0 ? (lost / (recv + lost)) * 100 : 0;
    $('#q-loss').textContent = `${loss.toFixed(2)}%`;

    $('#q-bitrate').textContent =
      m.availableOutgoingBitrate !== undefined
        ? `${(m.availableOutgoingBitrate / 1000).toFixed(0)} kbps`
        : 'n/a';
  });

  call.networkIssues$.subscribe((issues: CallNetworkIssue[]) => {
    $('#q-issues').textContent = issues.length
      ? issues.map((i) => `${i.type} (${i.severity})`).join(', ')
      : 'none';
  });

  // When bandwidth is constrained the SDK may pause outbound video to protect
  // audio — surface it so the user knows why their camera went dark.
  call.bandwidthConstrained$.subscribe((constrained) => {
    $('#q-bandwidth').hidden = !constrained;
  });

  // The recovery pipeline reconnects the media transport after a network blip.
  call.recoveryState$.subscribe((state) => ($('#q-recovery').textContent = state));
  call.recoveryEvent$.subscribe((event: RecoveryEvent) => {
    const row = document.createElement('li');
    row.textContent = `${event.action}: ${event.reason} (attempt ${event.attempt}/${event.maxAttempts})`;
    $('#q-recovery-log').appendChild(row);
  });

  // Manual recovery nudges. requestKeyframe() asks for a fresh video frame;
  // requestIceRestart() renegotiates the ICE transport.
  $<HTMLButtonElement>('#q-keyframe').onclick = () => call.requestKeyframe();
  $<HTMLButtonElement>('#q-ice-restart').onclick = () => call.requestIceRestart();
}
