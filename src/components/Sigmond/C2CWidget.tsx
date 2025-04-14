import BrowserOnly from "@docusaurus/BrowserOnly";
import C2CWidgetInternal from "./C2CWidgetInternal";
import useIsBrowser from "@docusaurus/useIsBrowser";
import { useState } from "react";

export default function C2CWidget({
  destination,
  supportsVideo,
  supportsAudio,
  token,
  children,
}: {
  destination: string;
  supportsVideo: boolean;
  supportsAudio: boolean;
  token: string;
  children: React.ReactNode;
}) {
  const isBrowser = useIsBrowser();
  const [randomId, setRandomId] = useState(Math.random().toString(36).substring(2, 15));
  if (!isBrowser) {
    return null;
  }
  return (
    <BrowserOnly>
      {() => (
        <>
          <button
            id={`callButton-${randomId}`}
            className="button button--primary button--lg demo-button-disabled"
            style={{
              margin: "10px 0px",
            }}
          >
            {children}
          </button>
          <C2CWidgetInternal
            buttonId={`callButton-${randomId}`}
            destination={destination}
            supportsVideo={supportsVideo}
            supportsAudio={supportsAudio}
            token={token}
          />
        </>
      )}
    </BrowserOnly>
  );
}
