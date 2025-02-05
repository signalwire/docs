import React from "react";
import { Helmet } from "react-helmet-async";

export default function OgImage({ img }: { img: string }) {
  return (
    <Helmet>
      <meta property="og:image" content={img} data-rh="true" />
    </Helmet>
  );
}
