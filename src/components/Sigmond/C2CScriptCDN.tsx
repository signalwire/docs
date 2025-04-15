import React, { useEffect } from "react";

export default function C2CScriptCDN() {
  useEffect(() => {
    if (document.getElementById("c2c-widget")) return;

    const script = document.createElement("script");
    script.src = "https://assets.swrooms.com/c2c-widget.js";
    script.defer = true;
    script.id = "c2c-widget";
    script.nonce = "SIGNALWIRE_DOCS_CSP_NONCE";
    document.head.appendChild(script);
  }, []);

  return <></>;
}
