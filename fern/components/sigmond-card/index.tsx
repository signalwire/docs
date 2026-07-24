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

export function SigmondWidget({ token = DEFAULT_TOKEN }: SigmondWidgetProps) {
  useEffect(() => {
    const teardown: Array<() => void> = [];

    if (!document.head.querySelector("link[data-signalwire-address-fonts]")) {
      const marker = document.createElement("link");
      marker.setAttribute("data-signalwire-address-fonts", "host");
      document.head.appendChild(marker);
    }

    void loadWidgetGlobal().catch(() => {});

    const launchers = Array.from(
      document.querySelectorAll<HTMLElement>("[data-sigmond-launcher]"),
    ).filter((el) => !el.dataset.sigmondWired);

    for (const el of launchers) {
      el.dataset.sigmondWired = "true";
      let widget: WidgetInstance | null = null;
      let busy = false;

      const open = async () => {
        if (busy) return;
        busy = true;
        el.classList.add("sigmond-card--opening");
        try {
          const global = await loadWidgetGlobal();
          if (!widget) {
            const host = document.createElement("div");
            host.className = "sigmond-widget-host";
            host.setAttribute("aria-hidden", "true");
            document.body.appendChild(host);
            widget = global.mount(host, {
              token,
              destination: el.dataset.destination || DEFAULT_DESTINATION,
              label: el.dataset.label || DEFAULT_LABEL,
              poster: el.dataset.poster || DEFAULT_POSTER,
              layout: "stacked",
              video: true,
              audio: true,
              autoGainControl: false,
              inputVolume: 125,
              disableAutoFonts: true,
            });
            const mounted = widget;
            teardown.push(() => {
              host.remove();
              if (window.SignalWireAddressWidget?.unmount) {
                void window.SignalWireAddressWidget.unmount(mounted);
              }
            });
          }
          void widget.open();
        } catch (e) {
          console.error("SigmondWidget:", e);
        } finally {
          busy = false;
          el.classList.remove("sigmond-card--opening");
        }
      };

      const onClick = () => void open();
      const onKey = (e: KeyboardEvent) => {
        if (e.key === "Enter" || e.key === " ") {
          e.preventDefault();
          void open();
        }
      };
      el.addEventListener("click", onClick);
      el.addEventListener("keydown", onKey);
      teardown.push(() => {
        el.removeEventListener("click", onClick);
        el.removeEventListener("keydown", onKey);
        delete el.dataset.sigmondWired;
      });
    }

    return () => teardown.forEach((fn) => fn());
  }, [token]);

  return null;
}
