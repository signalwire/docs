import React from "react";

interface ReleaseCardProps {
  library: string;
  version: string;
  releaseType: "major" | "minor" | "patch";
}

export default function ReleaseCard({ library, version, releaseType }: ReleaseCardProps) {
  const getImageWithText = () => {
    const canvas = document.createElement("canvas");
    const img = new Image();
    const imagePath = `./${releaseType.toLowerCase()}.png`;
    const imageModule = require(`./${releaseType.toLowerCase()}.png`);
    img.src = imageModule.default;

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

  const [combinedImage, setCombinedImage] = React.useState<string>("");

  React.useEffect(() => {
    getImageWithText().then((image) => setCombinedImage(image));
  }, [version]);

  return (
    <div style={{ position: "relative" }}>
      <img
        src={combinedImage || require(`./${releaseType.toLowerCase()}.png`).default}
        alt={`${library} ${version} release`}
      />
    </div>
  );
}
