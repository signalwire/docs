import { useRef, useEffect } from "react";
import BrowserOnly from "@docusaurus/BrowserOnly";

export default function C2CWidgetInternal({
  buttonId,
  destination,
  supportsVideo,
  supportsAudio,
  token,
}: {
  buttonId: string;
  destination: string;
  supportsVideo: boolean;
  supportsAudio: boolean;
  token: string;
}) {
  const rootRef = useRef<HTMLDivElement>(null);

  // react doesn't like other scripts controlling the DOM,
  // we create an empty div and inject things via js
  // note: when component unmounts, we're clearing the div
  // so react doesn't get confused and break things
  useEffect(() => {
    if (rootRef.current) {
      rootRef.current.innerHTML = "";
      const widget = document.createElement("c2c-widget");

      widget.setAttribute("buttonId", buttonId);
      widget.setAttribute(
        "callDetails",
        JSON.stringify({
          destination,
          supportsVideo,
          supportsAudio,
        })
      );
      widget.setAttribute("token", token);
      rootRef.current.appendChild(widget);
    }
    return () => {
      if (rootRef.current) {
        rootRef.current.innerHTML = "";
      }
    };
  }, [buttonId, destination, supportsVideo, supportsAudio]);

  return <BrowserOnly>{() => <div ref={rootRef} />}</BrowserOnly>;
}
