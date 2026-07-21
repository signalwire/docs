import { useEffect, useRef } from "react";

// Sigmond call driver 
// renders a hidden widget host, lazy-loads the address-widget UMD, mounts <signalwire-address>, and
// opens the call when the MDX launcher ([data-sigmond-launcher]) is clicked.

const WIDGET_UMD_URL =
  "https://cdn.signalwire.com/npm/@signalwire/address-widget@dev/dist/address-widget.umd.js";

const DEFAULT_TOKEN =
  "eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIiwidHlwIjoiU0FUIiwiY2giOiJwdWMuc2lnbmFsd2lyZS5jb20ifQ..IKPXZDR3ZYlpnUuw.yU8NBgPFQN1LH0Ws-Rs2ca-vAbUEP7Gvr0upOf-hDaTUfp-Aa5TALLMkJdUli8UX0ina34hng0G2XPLh7NZ2VZ5cphdd8AUCDKWkJ5HCI8538aNxPWcUWG25B-eELha7yEIrHZlO5BIxuyGVPskf0BIPGgiFSlctotyGB-VyYwSp_Uf6kdcwTCiEgra9LcyUMpNZyz5xH3p93xDU9bvzunFj50qIbfmQ2S0tDgEdduQWlTIfqUjRT6ePuwLGDBZYCCz9JtCQM0S2Fs7ZwvdSOzLFLqThkWnH3mSnkgKtkSTTXpnKUplPBJQaNRn0P4rJiwkk61BGyCJQ8Y8XYNeUHa-m1pRERQNweohQNBA0Ph3ie3vZLFJFjOeWuuztK8JSnfu4m9fxlkiA6icaHYuUm7KTSQ6n7oV5a2dkbLs7s51GRi7di0mm6Xw3jr2Zw1EGS8NgIrAU2HTv7stMAjpvDneYDfPaysCrmhCwu_TJgpG7PARiA4glKv9IuPeF5xpnymM5p0V2KL4HSEz-MJwziOwPpQRED_Brd2DiE0cz.CEYQUqZhcs5wKCtJQqUAMQ";

const DEFAULT_POSTER = "https://mcdn.signalwire.com/images/sigmond_still.png";

type WidgetInstance = { open: () => Promise<void>; close: () => Promise<void> };
type WidgetGlobal = {
  mount: (target: Element | string, options: Record<string, unknown>) => WidgetInstance;
  unmount?: (widget: WidgetInstance) => Promise<void>;
};

declare global {
  interface Window {
    SignalWireAddressWidget?: WidgetGlobal;
  }
}

// Inject the UMD once per page (cached; a failed load clears the cache so a later mount can retry).
let loaderPromise: Promise<WidgetGlobal> | null = null;
function loadWidgetGlobal(): Promise<WidgetGlobal> {
  if (typeof window === "undefined") return Promise.reject(new Error("no window"));
  if (window.SignalWireAddressWidget) return Promise.resolve(window.SignalWireAddressWidget);
  if (!loaderPromise) {
    loaderPromise = new Promise<WidgetGlobal>((resolve, reject) => {
      const s = document.createElement("script");
      s.src = WIDGET_UMD_URL;
      s.async = true;
      s.onload = () =>
        window.SignalWireAddressWidget
          ? resolve(window.SignalWireAddressWidget)
          : reject(new Error("address-widget UMD loaded but global missing"));
      s.onerror = () => {
        loaderPromise = null;
        reject(new Error("failed to load address-widget UMD"));
      };
      document.head.appendChild(s);
    });
  }
  return loaderPromise;
}

export interface SigmondWidgetProps {
  /** SignalWire SAT for the destination. Defaults to the public /public/sigmond demo token. */
  token?: string;
  /** Address to dial. Default `/public/sigmond`. */
  destination?: string;
  /** Launcher label (used inside the widget's own hidden launcher). */
  label?: string;
  /** Pre-call poster shown in the call overlay. Default: the Sigmond still (CDN). */
  poster?: string;
  /** CSS selector of the MDX element that opens the call when clicked. */
  launcher?: string;
}

export function SigmondWidget({
  token = DEFAULT_TOKEN,
  destination = "/public/sigmond",
  label = "Talk with Sigmond",
  poster = DEFAULT_POSTER,
  launcher = "[data-sigmond-launcher]",
}: SigmondWidgetProps) {
  const hostRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    let alive = true;
    let widget: WidgetInstance | null = null;
    const trigger = document.querySelector<HTMLElement>(launcher);

    const open = () => {
      void widget?.open();
    };
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Enter" || e.key === " ") {
        e.preventDefault();
        open();
      }
    };

    loadWidgetGlobal()
      .then((global) => {
        if (!alive || !hostRef.current) return;
        widget = global.mount(hostRef.current, {
          token,
          destination,
          label,
          layout: "stacked",
          video: true,
          audio: true,
          poster,
          autoGainControl: false,
          inputVolume: 125,
        });
        if (trigger) {
          trigger.addEventListener("click", open);
          trigger.addEventListener("keydown", onKey);
        }
      })
      .catch((e) => console.error("SigmondWidget:", e));

    return () => {
      alive = false;
      if (trigger) {
        trigger.removeEventListener("click", open);
        trigger.removeEventListener("keydown", onKey);
      }
      if (widget && window.SignalWireAddressWidget?.unmount) {
        void window.SignalWireAddressWidget.unmount(widget);
      }
    };
  }, [token, destination, label, poster, launcher]);

  // Hidden host for <signalwire-address>; its full-viewport overlay isn't clipped by the zero-size box.
  return <div ref={hostRef} className="sigmond-widget-host" aria-hidden="true" />;
}
