import React from "react";
import { useColorMode } from "@docusaurus/theme-common";
import { mapLibraryToStyle, ReleaseCardStyle } from "./imagesConfig";

interface ReleaseCardProps {
  library: string;
  version: string;
  releaseType: "major" | "minor" | "patch";
}

const getImageWithText = (
  library: string,
  version: string,
  releaseType: "major" | "minor" | "patch",
  style: ReleaseCardStyle,
) => {
  const canvas = document.createElement("canvas");
  const img = new Image();
  img.src = style[releaseType];

  return new Promise<string>((resolve) => {
    img.onload = () => {
      canvas.width = img.width;
      canvas.height = img.height;
      const ctx = canvas.getContext("2d");

      if (!ctx) {
        throw new Error("Could not get canvas context");
      }

      ctx.drawImage(img, 0, 0);

      ctx.fillStyle = "#f72a72";
      ctx.font = `bold ${img.width * 0.05}px ${getComputedStyle(document.documentElement).getPropertyValue("--ifm-font-family-base")}`;
      ctx.textAlign = "center";

      const text = `${library.trim()} ${version.trim()}`.trim();
      const textMetrics = ctx.measureText(text);
      const textWidth = textMetrics.width;
      ctx.fillText(
        text,
        (canvas.width - textWidth) / 2 + textWidth / 2,
        canvas.height * 0.5,
      );

      resolve(canvas.toDataURL());
    };
  });
};

export default function ReleaseCard({ library, version, releaseType }: ReleaseCardProps) {
  const { colorMode } = useColorMode();
  const [combinedImage, setCombinedImage] = React.useState<string>("");

  React.useEffect(() => {
    const style = mapLibraryToStyle(library, colorMode);
    getImageWithText(library, version, releaseType, style).then((image) =>
      setCombinedImage(image),
    );
  }, [version, library, colorMode]);

  return (
    <div style={{ position: "relative" }}>
      <img src={combinedImage} alt={`${library} ${version} release`} />
    </div>
  );
}
