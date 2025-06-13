import React from "react";

export function GetListOfAvailableEventsDescription({ url, label }: { url?: string | false; label?: string }) {
  if (url === false) {
    return "";
  }

  if (!url) {
    return (
      <>
        See <a href="#events">Events</a> for the list of available events.
      </>
    );
  }

  return (
    <>
      See <a href={url}>{label}</a> for the list of available events.
    </>
  );
}
