// DTMF dialpad. Each button sends a single tone through the call with
// call.sendDigits(); the server forwards it as an RFC 2833 / SIP INFO digit —
// useful for IVRs and conference PINs.

import type { Call } from '@signalwire/js';
import { $ } from './dom';

export function bindDialpad(call: Call): void {
  const pad = $<HTMLElement>('#dialpad');
  const sent = $<HTMLElement>('#dialpad-sent');

  pad.querySelectorAll<HTMLButtonElement>('button[data-digit]').forEach((button) => {
    button.onclick = async () => {
      const digit = button.dataset.digit!;
      try {
        await call.sendDigits(digit);
        sent.textContent = `Sent: ${sent.textContent?.replace('Sent: ', '') ?? ''}${digit}`;
      } catch (err) {
        sent.textContent = `Failed to send ${digit}: ${(err as Error).message}`;
      }
    };
  });
}
