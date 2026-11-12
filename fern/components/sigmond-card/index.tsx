import { useEffect } from "react";

// Pinned rather than @dev so a widget release reaches the docs only when this line changes.
const WIDGET_UMD_URL =
  "https://cdn.signalwire.com/npm/@signalwire/address-widget@0.4.1/dist/address-widget.umd.js";

const DEFAULT_TOKEN =
  "eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIiwidHlwIjoiU0FUIiwiY2giOiJwdWMuc2lnbmFsd2lyZS5jb20ifQ..FvYpQjZChZ2cFv9j.VW98tDNYs9UkHXC4U0Mm-73-TyGOGiZtdwb1mDzBUJGo3ZwVE9QFc7LHgpnFRNGJvsfluO3i_ol5-HPE4I8UtN_Edv-BJvBjos7DqlEoTGWVcpUEY4j6KQEwg2b3oFRoB9X77T5Vxaxf_bmjB3WOvv9Fmk70C5fPqhTyQi_9LyKUT2aktwaSHqphXv_zaf2fjR12CjfqhY6cV3jDYnF9eWqQF3YNZMd1ln8ZyQGm4AcnbrQUkr69AZO0DLOg2Mt-iFNsfZHvr7hlyOIMDqR2OQPr2oHhMi024Itg7mOsXT-L78b19ukGvqdSKdNtJrwat0pvIGXnj8Z71lEYZPsg8EWaH9PNgUaSMclJK7jkLcjLE4kNISgtmfmsgflATyIVHN63323ckIW1L_lxFFnMOe3Tqtux2E0tzj21mKtkoREWuO3meBXU9wxClX-mJy7n3_7DTFq0F6u972ICCQOpqgHgwjCTiFjW3fmG42-thxyVGjeVzdM8F6A11ZHKTEs40RqzwRaLK6JAQriKJOpbGom5htCt8FgbTTz2tnXZ.JDkVul9zeg9khq8neQICVg";

const DEFAULT_DESTINATION = "/public/sigmond-prod";
const DEFAULT_LABEL = "Talk with Sigmond";
const DEFAULT_POSTER = "https://mcdn.signalwire.com/images/sigmond_still.png";

// Text chat alongside the call: the widget opens on a Talk / Type picker. Switching
// between a call and a chat hands the conversation to the chat gateway's agent, so
// the call dials that same agent (DEFAULT_DESTINATION). The gateway accepts
// signalwire.com origins only; on other hosts (Fern previews) Type answers 403.
const CHAT = {
  gatewayUrl: "https://tatooine.cantina.cloud/sigmond/chat/",
  chatKey: "pk_sigmond_demo",
  avatarUrl: "https://tatooine.cantina.cloud/img/siggy.png",
  chatStorageKey: "sigmond_widget_handle",
};

function pageSlug(): string {
  if (typeof window === "undefined") return "";
  const segments = (window.location.pathname || "/").split("/").filter(Boolean);
  if (segments.length === 0) return "home";
  return segments
    .map((s) => s.toLowerCase().replace(/[^a-z0-9]+/g, "_").replace(/^_+|_+$/g, ""))
    .filter(Boolean)
    .join("__");
}

type WidgetInstance = { open: () => Promise<void>; close: () => Promise<void>; theme?: string };
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

    if (launchers.length === 0) {
      console.warn(
        "SigmondWidget: no [data-sigmond-launcher] element found on this page — the card will render but do nothing.",
      );
    }

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
          const theme = document.documentElement.classList.contains("dark") ? "dark" : "light";
          if (!widget) {
            const host = document.createElement("div");
            host.className = "sigmond-widget-host";
            document.body.appendChild(host);
            widget = global.mount(host, {
              token,
              destination: el.dataset.destination || DEFAULT_DESTINATION,
              label: el.dataset.label || DEFAULT_LABEL,
              poster: el.dataset.poster || DEFAULT_POSTER,
              theme,
              layout: "stacked",
              video: true,
              audio: true,
              autoGainControl: false,
              inputVolume: 125,
              userVariables: { page_slug: pageSlug() },
              mode: "both",
              defaultMode: "ask",
              typeToTalk: true,
              ...CHAT,
            });
            const mounted = widget;
            teardown.push(() => {
              const unmount = window.SignalWireAddressWidget?.unmount;
              const done = unmount
                ? Promise.resolve(unmount(mounted)).catch((e) =>
                    console.error("SigmondWidget: unmount failed:", e),
                  )
                : Promise.resolve();
              void done.then(() => host.remove());
            });
          }
          widget.theme = theme;
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
