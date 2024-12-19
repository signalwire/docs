export default function ReleaseCard({ version, releaseType }) {
  return (
    <div style={{ position: "relative" }}>
      <img src={require("./img.png").default} />
      <div
        style={{
          position: "absolute",
          top: "36%",
          left: "50%",
          transform: "translate(-50%)",
          fontSize: "3vw",
          fontWeight: 800,
          textWrap: "nowrap",
          color: "#f72a72",
        }}
      >
        {version}
      </div>
    </div>
  );
}
