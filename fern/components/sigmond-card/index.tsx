import { useEffect } from "react";


const WIDGET_UMD_URL =
  "https://cdn.signalwire.com/npm/@signalwire/address-widget@dev/dist/address-widget.umd.js";

const DEFAULT_TOKEN =
  "eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIiwidHlwIjoiU0FUIiwiY2giOiJwdWMuc2lnbmFsd2lyZS5jb20ifQ..IKPXZDR3ZYlpnUuw.yU8NBgPFQN1LH0Ws-Rs2ca-vAbUEP7Gvr0upOf-hDaTUfp-Aa5TALLMkJdUli8UX0ina34hng0G2XPLh7NZ2VZ5cphdd8AUCDKWkJ5HCI8538aNxPWcUWG25B-eELha7yEIrHZlO5BIxuyGVPskf0BIPGgiFSlctotyGB-VyYwSp_Uf6kdcwTCiEgra9LcyUMpNZyz5xH3p93xDU9bvzunFj50qIbfmQ2S0tDgEdduQWlTIfqUjRT6ePuwLGDBZYCCz9JtCQM0S2Fs7ZwvdSOzLFLqThkWnH3mSnkgKtkSTTXpnKUplPBJQaNRn0P4rJiwkk61BGyCJQ8Y8XYNeUHa-m1pRERQNweohQNBA0Ph3ie3vZLFJFjOeWuuztK8JSnfu4m9fxlkiA6icaHYuUm7KTSQ6n7oV5a2dkbLs7s51GRi7di0mm6Xw3jr2Zw1EGS8NgIrAU2HTv7stMAjpvDneYDfPaysCrmhCwu_TJgpG7PARiA4glKv9IuPeF5xpnymM5p0V2KL4HSEz-MJwziOwPpQRED_Brd2DiE0cz.CEYQUqZhcs5wKCtJQqUAMQ";

const DEFAULT_DESTINATION = "/public/sigmond";
const DEFAULT_LABEL = "Talk with Sigmond";
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
  token?: string;
}

const setLoading = (el: HTMLElement, on: boolean) => {
  el.classList.toggle("sigmond-card--loading", on);
  el.setAttribute("aria-busy", String(on));
};

export function SigmondWidget({ token = DEFAULT_TOKEN }: SigmondWidgetProps) {
  useEffect(() => {
    let alive = true;
    const teardown: Array<() => void> = [];

    // Claim launchers synchronously so a second driver / effect re-run can't double-wire them. Cards
    // render disabled (--loading is baked into their markup); we only remove it once wired.
    const launchers = Array.from(
      document.querySelectorAll<HTMLElement>("[data-sigmond-launcher]"),
    ).filter((el) => !el.dataset.sigmondWired);
    launchers.forEach((el) => {
      el.dataset.sigmondWired = "true";
    });

    loadWidgetGlobal()
      .then((global) => {
        if (!alive) return;
        for (const el of launchers) {
          const host = document.createElement("div");
          host.className = "sigmond-widget-host";
          host.setAttribute("aria-hidden", "true");
          document.body.appendChild(host);

          const widget = global.mount(host, {
            token,
            destination: el.dataset.destination || DEFAULT_DESTINATION,
            label: el.dataset.label || DEFAULT_LABEL,
            poster: el.dataset.poster || DEFAULT_POSTER,
            layout: "stacked",
            video: true,
            audio: true,
            autoGainControl: false,
            inputVolume: 125,
          });

          const open = () => void widget.open();
          const onKey = (e: KeyboardEvent) => {
            if (e.key === "Enter" || e.key === " ") {
              e.preventDefault();
              open();
            }
          };
          el.addEventListener("click", open);
          el.addEventListener("keydown", onKey);
          setLoading(el, false);

          teardown.push(() => {
            el.removeEventListener("click", open);
            el.removeEventListener("keydown", onKey);
            delete el.dataset.sigmondWired;
            setLoading(el, true);
            host.remove();
            if (window.SignalWireAddressWidget?.unmount) {
              void window.SignalWireAddressWidget.unmount(widget);
            }
          });
        }
      })
      .catch((e) => {
        // Leave cards in their baked-in disabled state; release the claim so a later mount can retry.
        console.error("SigmondWidget:", e);
        if (alive) launchers.forEach((el) => delete el.dataset.sigmondWired);
      });

    return () => {
      alive = false;
      teardown.forEach((fn) => fn());
    };
  }, [token]);

  return null;
}
