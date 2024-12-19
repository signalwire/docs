import React from "react";
import clsx from "clsx";

export default function HomepageHeader({
  title = "SignalWire Developer Portal",
  subtitle = "Subtitle",
  buttonLabel = "Guides Showcase",
  buttonLink = "/guides",
  isRealHeader = false,
  hasButton = true,
}) {
  return (
    <>
      {/* Make the breadcrumbs and the title disappear for any page with this header included */}
      {isRealHeader && <style>{`header,.theme-doc-breadcrumbs{display:none};`}</style>}
      <div
        style={{
          width: "100%",
          minHeight: hasButton ? "205px" : undefined,
          padding: "30px",
          background: "#333 url('/landing-assets/images/gradient.png') no-repeat",
          borderRadius: "10px",
          marginTop: 10,
        }}
      >
        <h1 style={{ color: "black" }}>{title}</h1>
        <h3 style={{ color: "black", fontWeight: "500" }}>{subtitle}</h3>

        {/*
        {hasButton && (
          <a
            href={buttonLink}
            style={{
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              padding: 15,
              backgroundColor: "#044EF4",
              color: "white",
              boxShadow: "none",
              border: "none",
              fontSize: "18px",
              borderRadius: "10px",
              height: 54,
              width: 200,
            }}
          >
            {buttonLabel}
          </a>
        )}
        */}
      </div>
    </>
  );
}
